const API = 'api.php';
let pendingDeleteId = null;
let searchTimer = null;

document.addEventListener('DOMContentLoaded', () => {
  loadStats();
  loadTickets();
  loadCustomers();
  loadLocations();
  wireCharCount();
});

async function loadStats() {
  const res = await apiFetch(`${API}?action=stats`);
  if (!res.success) return;
  const d = res.data;
  document.getElementById('stat-total').textContent    = d.total;
  document.getElementById('stat-pending').textContent  = d.pending;
  document.getElementById('stat-active').textContent   = d.active;
  document.getElementById('stat-resolved').textContent = d.resolved;
}

async function loadTickets() {
  const search   = document.getElementById('search-input').value.trim();
  const category = document.getElementById('filter-category').value;
  const status   = document.getElementById('filter-status').value;
  const priority = document.getElementById('filter-priority').value;

  const params = new URLSearchParams({ action: 'tickets', search, category, status, priority });
  const res    = await apiFetch(`${API}?${params}`);

  const tbody = document.getElementById('ticket-body');
  const count = document.getElementById('result-count');

  if (!res.success) {
    tbody.innerHTML = `<tr><td colspan="9" class="table-empty">Failed to load tickets.</td></tr>`;
    return;
  }

  const tickets = res.data;
  count.textContent = `${tickets.length} result${tickets.length !== 1 ? 's' : ''}`;

  if (tickets.length === 0) {
    tbody.innerHTML = `<tr><td colspan="9" class="table-empty">No tickets match the current filters.</td></tr>`;
    return;
  }

  tbody.innerHTML = tickets.map(t => `
    <tr onclick="openViewModal('${esc(t.ticket_id)}')">
      <td><span class="tid">${esc(t.ticket_id)}</span></td>
      <td><span class="cat-cell">${esc(t.p_category)}</span></td>
      <td><span class="t-desc" title="${esc(t.p_desc)}">${esc(t.p_desc)}</span></td>
      <td>${t.p_priority ? badge(t.p_priority) : '<span style="color:#888">-</span>'}</td>
      <td>${badge(t.status)}</td>
      <td>${esc(t.customer_name)} ${badge(t.cust_type)}</td>
      <td style="font-size:12.5px;color:#555">${t.room_name ? esc(t.room_name) : '-'}</td>
      <td style="font-size:12.5px;color:#555;white-space:nowrap">${(t.date_reported ?? '-').slice(0, 10)}</td>
      <td class="action-cell" onclick="event.stopPropagation()">
        <button class="action-btn view"   title="View"   onclick="openViewModal('${esc(t.ticket_id)}')">View</button>
        <button class="action-btn edit"   title="Edit"   onclick="openEditModal('${esc(t.ticket_id)}')">Edit</button>
        <button class="action-btn delete" title="Delete" onclick="openDeleteConfirm('${esc(t.ticket_id)}')">Delete</button>
      </td>
    </tr>
  `).join('');
}

async function openViewModal(ticketId) {
  const res = await apiFetch(`${API}?action=ticket&id=${encodeURIComponent(ticketId)}`);
  if (!res.success) { showToast('Could not load ticket.', 'error'); return; }

  const t = res.data;

  document.getElementById('view-id').textContent = t.ticket_id;
  document.getElementById('view-badges').innerHTML =
    badge(t.status) + (t.p_priority ? ' ' + badge(t.p_priority) : '');

  document.getElementById('view-body').innerHTML = [
    ['Category',      esc(t.p_category)],
    ['Reported By',   `${esc(t.customer_name)} ${badge(t.cust_type)}`],
    ['Location',      t.room_name ? `${esc(t.room_name)} <span style="color:#666;font-size:12px">(${esc(t.building_name ?? '')})</span>` : '-'],
    ['Date Reported', esc(t.date_reported ?? '-')],
    ['Date Resolved', esc(t.date_resolved ?? '-')],
  ].map(([k, v]) => `
    <div class="view-row">
      <span class="view-key">${k}</span>
      <span class="view-val">${v}</span>
    </div>
  `).join('') + `
    <div class="view-row">
      <span class="view-key">Description</span>
      <span class="view-val view-desc">${esc(t.p_desc)}</span>
    </div>
  `;

  document.getElementById('view-delete-btn').onclick = () => {
    closeModalById('view-modal');
    openDeleteConfirm(t.ticket_id);
  };
  document.getElementById('view-edit-btn').onclick = () => {
    closeModalById('view-modal');
    openEditModal(t.ticket_id);
  };

  openModalById('view-modal');
}

function openCreateModal() {
  document.getElementById('modal-title').textContent = 'New Support Ticket';
  document.getElementById('submit-btn').textContent  = 'Create Ticket';
  document.getElementById('ticket-form').reset();
  document.getElementById('f-ticket-id').value = '';
  document.getElementById('char-count').textContent  = '0 chars';
  clearFormErrors();
  openModalById('form-modal');
}

async function openEditModal(ticketId) {
  const res = await apiFetch(`${API}?action=ticket&id=${encodeURIComponent(ticketId)}`);
  if (!res.success) { showToast('Could not load ticket.', 'error'); return; }

  const t = res.data;
  document.getElementById('modal-title').textContent = `Edit ${t.ticket_id}`;
  document.getElementById('submit-btn').textContent  = 'Save Changes';

  document.getElementById('f-ticket-id').value = t.ticket_id;
  document.getElementById('f-customer').value  = t.customer_id;
  document.getElementById('f-category').value  = t.p_category;
  document.getElementById('f-priority').value  = t.p_priority ?? '';
  document.getElementById('f-status').value    = t.status;
  document.getElementById('f-location').value  = t.loc_id ?? '';
  document.getElementById('f-desc').value      = t.p_desc;
  document.getElementById('char-count').textContent = `${t.p_desc.length} chars`;

  clearFormErrors();
  openModalById('form-modal');
}

async function submitForm(e) {
  e.preventDefault();
  clearFormErrors();

  const ticketId = document.getElementById('f-ticket-id').value;
  const isEdit   = !!ticketId;

  const payload = {
    ticket_id:   ticketId,
    customer_id: document.getElementById('f-customer').value,
    p_category:  document.getElementById('f-category').value,
    p_priority:  document.getElementById('f-priority').value,
    status:      document.getElementById('f-status').value,
    loc_id:      document.getElementById('f-location').value,
    p_desc:      document.getElementById('f-desc').value.trim(),
  };

  let hasError = false;
  if (!payload.customer_id) { showFieldError('err-customer', 'Customer is required.'); hasError = true; }
  if (!payload.p_category)  { showFieldError('err-category', 'Category is required.');  hasError = true; }
  if (payload.p_desc.length < 10) {
    showFieldError('err-desc', 'Description must be at least 10 characters.');
    hasError = true;
  }
  if (hasError) return;

  const method = isEdit ? 'PUT' : 'POST';
  const action = isEdit ? 'update' : 'create';
  const btn    = document.getElementById('submit-btn');

  btn.disabled    = true;
  btn.textContent = 'Saving...';

  const res = await apiFetch(`${API}?action=${action}`, { method, body: JSON.stringify(payload) });

  btn.disabled    = false;
  btn.textContent = isEdit ? 'Save Changes' : 'Create Ticket';

  if (!res.success) {
    showToast(res.message || 'Something went wrong.', 'error');
    return;
  }

  closeModalById('form-modal');
  showToast(res.message, 'success');
  loadTickets();
  loadStats();
}

function openDeleteConfirm(ticketId) {
  pendingDeleteId = ticketId;
  document.getElementById('del-id').textContent = ticketId;

  document.getElementById('confirm-delete-btn').onclick = async () => {
    const res = await apiFetch(`${API}?action=delete`, {
      method: 'DELETE',
      body: JSON.stringify({ ticket_id: pendingDeleteId }),
    });

    closeModalById('delete-modal');

    if (!res.success) { showToast(res.message || 'Delete failed.', 'error'); return; }

    showToast(res.message, 'error');
    loadTickets();
    loadStats();
    pendingDeleteId = null;
  };

  openModalById('delete-modal');
}

async function loadCustomers() {
  const res = await apiFetch(`${API}?action=customers`);
  if (!res.success) return;
  const sel = document.getElementById('f-customer');
  res.data.forEach(c => {
    const opt    = document.createElement('option');
    opt.value    = c.customer_id;
    opt.textContent = `${c.name} (${c.cust_type})`;
    sel.appendChild(opt);
  });
}

async function loadLocations() {
  const res = await apiFetch(`${API}?action=locations`);
  if (!res.success) return;
  const sel = document.getElementById('f-location');
  res.data.forEach(l => {
    const opt    = document.createElement('option');
    opt.value    = l.loc_id;
    opt.textContent = l.room_name
      ? `${l.room_name} - ${l.building_name ?? ''}`
      : l.loc_id;
    sel.appendChild(opt);
  });
}

function badge(val) {
  return `<span class="badge badge-${val}">${val}</span>`;
}

function esc(str) {
  if (str == null) return '';
  return String(str)
    .replace(/&/g, '&amp;').replace(/</g, '&lt;')
    .replace(/>/g, '&gt;').replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

async function apiFetch(url, options = {}) {
  try {

    if (options.body && !options.headers) {
      options.headers = { 'Content-Type': 'application/json' };
    }
    const r = await fetch(url, options);
    const text = await r.text();

    return JSON.parse(text);
  } catch (e) {
    console.error("API error:", e);
    return { success: false, message: "Server error" };
  }
}

function clearFilters() {
  document.getElementById('search-input').value   = '';
  document.getElementById('filter-category').value = '';
  document.getElementById('filter-status').value   = '';
  document.getElementById('filter-priority').value = '';
  loadTickets();
}

function debouncedLoad() {
  clearTimeout(searchTimer);
  searchTimer = setTimeout(loadTickets, 300);
}

function wireCharCount() {
  const ta    = document.getElementById('f-desc');
  const count = document.getElementById('char-count');
  ta.addEventListener('input', () => {
    count.textContent = `${ta.value.length} chars`;
    if (ta.value.length >= 10) clearFieldError('err-desc');
  });
}

function openModalById(id) {
  document.getElementById(id).classList.add('open');
}
function closeModalById(id) {
  document.getElementById(id).classList.remove('open');
}
function closeModal(event, id) {
  if (event.target.id === id) closeModalById(id);
}
function clearFormErrors() {
  ['err-customer', 'err-category', 'err-desc'].forEach(clearFieldError);
  ['f-customer', 'f-category', 'f-desc'].forEach(id => {
    document.getElementById(id)?.classList.remove('invalid');
  });
}
function showFieldError(errId, msg) {
  const el = document.getElementById(errId);
  if (el) el.textContent = msg;
  const fieldMap = { 'err-customer': 'f-customer', 'err-category': 'f-category', 'err-desc': 'f-desc' };
  const fi = fieldMap[errId];
  if (fi) document.getElementById(fi)?.classList.add('invalid');
}
function clearFieldError(errId) {
  const el = document.getElementById(errId);
  if (el) el.textContent = '';
}

let toastTimer = null;
function showToast(msg, type = 'success') {
  const el = document.getElementById('toast');
  el.textContent = msg;
  el.className   = `toast ${type} show`;
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => el.classList.remove('show'), 3400);
}