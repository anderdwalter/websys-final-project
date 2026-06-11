<?php
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

require_once 'config.php';
$action = $_GET['action'] ?? '';
$method = $_SERVER['REQUEST_METHOD'];

match (true) {
    $action === 'tickets'   && $method === 'GET'    => getTickets(),
    $action === 'ticket'    && $method === 'GET'    => getTicket(),
    $action === 'create'    && $method === 'POST'   => createTicket(),
    $action === 'update'    && $method === 'PUT'    => updateTicket(),
    $action === 'delete'    && $method === 'DELETE' => deleteTicket(),
    $action === 'customers' && $method === 'GET'    => getCustomers(),
    $action === 'locations' && $method === 'GET'    => getLocations(),
    $action === 'stats'     && $method === 'GET'    => getStats(),
    default => respond(false, null, 'Invalid endpoint')
};

function getTickets(): void {
    $pdo = getDB();
    $search = $_GET['search'] ?? '';
    $category = $_GET['category'] ?? '';
    $status = $_GET['status'] ?? '';
    $priority = $_GET['priority'] ?? '';
    
    $sql = "SELECT t.*, 
        CONCAT(c.c_fname,' ',c.c_lname) AS customer_name,
        c.cust_type,
        l.room_name,
        b.building_name
        FROM ticket t
        JOIN customer c ON t.customer_id = c.customer_id
        LEFT JOIN location l ON t.loc_id = l.loc_id
        LEFT JOIN building b ON l.building_id = b.building_id
        WHERE 1=1";
        
    $params = [];
    
    if ($search) {
        $sql .= " AND (t.ticket_id LIKE :s OR t.p_desc LIKE :s2 OR CONCAT(c.c_fname,' ',c.c_lname) LIKE :s3)";
        $like = "%$search%";
        $params[':s'] = $like;
        $params[':s2'] = $like;
        $params[':s3'] = $like;
    }
    
    if ($category) {
        $sql .= " AND t.p_category = :category";
        $params[':category'] = $category;
    }
    if ($status) {
        $sql .= " AND t.status = :status";
        $params[':status'] = $status;
    }
    if ($priority) {
        $sql .= " AND t.p_priority = :priority";
        $params[':priority'] = $priority;
    }
    
    $sql .= " ORDER BY t.date_reported DESC";
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    respond(true, $stmt->fetchAll());
}

function getTicket(): void {
    $pdo = getDB();
    $id = $_GET['id'] ?? '';
    $stmt = $pdo->prepare("SELECT t.*, 
        CONCAT(c.c_fname,' ',c.c_lname) AS customer_name,
        c.cust_type,
        l.room_name,
        b.building_name
        FROM ticket t
        JOIN customer c ON t.customer_id = c.customer_id
        LEFT JOIN location l ON t.loc_id = l.loc_id
        LEFT JOIN building b ON l.building_id = b.building_id
        WHERE t.ticket_id = :id");
    $stmt->execute([':id' => $id]);
    $data = $stmt->fetch();
    respond($data ? true : false, $data, $data ? '' : 'Not found');
}

function createTicket(): void {
    $d = jsonBody();
    if (!$d['customer_id'] || !$d['p_category'] || strlen(trim($d['p_desc'])) < 10) {
        respond(false, null, 'Invalid input');
    }
    $pdo = getDB();
    $last = $pdo->query("SELECT ticket_id FROM ticket ORDER BY ticket_id DESC LIMIT 1")->fetchColumn();
    $num = $last ? intval(substr($last, 3)) + 1 : 1;
    $id = "TKT" . str_pad($num, 3, "0", STR_PAD_LEFT);
    $stmt = $pdo->prepare("INSERT INTO ticket
        (ticket_id, p_category, p_desc, p_priority, status, date_reported, customer_id, loc_id)
        VALUES (:id,:cat,:desc,:pri,'pending',NOW(),:cust,:loc)");
    $stmt->execute([
        ':id' => $id,
        ':cat' => $d['p_category'],
        ':desc' => trim($d['p_desc']),
        ':pri' => $d['p_priority'] ?? null,
        ':cust' => $d['customer_id'],
        ':loc' => $d['loc_id'] ?? null,
    ]);
    respond(true, ['ticket_id' => $id], 'Created');
}

function updateTicket(): void {
    $d = jsonBody();
    if (!$d['ticket_id']) respond(false, null, 'Missing ID');
    $pdo = getDB();
    $stmt = $pdo->prepare("UPDATE ticket SET
        p_category=:cat,
        p_desc=:desc,
        p_priority=:pri,
        status=:status,
        loc_id=:loc,
        customer_id=:cust
        WHERE ticket_id=:id");
    $stmt->execute([
        ':cat' => $d['p_category'],
        ':desc' => trim($d['p_desc']),
        ':pri' => $d['p_priority'],
        ':status' => $d['status'],
        ':loc' => $d['loc_id'],
        ':cust' => $d['customer_id'],
        ':id' => $d['ticket_id'],
    ]);
    respond(true, null, 'Updated');
}

function deleteTicket(): void {
    $d = jsonBody();
    $pdo = getDB();
    $stmt = $pdo->prepare("DELETE FROM ticket WHERE ticket_id=:id");
    $stmt->execute([':id' => $d['ticket_id']]);
    respond(true, null, 'Deleted');
}

function getCustomers(): void {
    $stmt = getDB()->query("SELECT customer_id, CONCAT(c_fname,' ',c_lname) AS name, cust_type FROM customer");
    respond(true, $stmt->fetchAll());
}

function getLocations(): void {
    $stmt = getDB()->query("SELECT * FROM location");
    respond(true, $stmt->fetchAll());
}

function getStats(): void {
    $rows = getDB()->query("SELECT status, COUNT(*) cnt FROM ticket GROUP BY status")->fetchAll();
    $stats = ['total'=>0,'pending'=>0,'active'=>0,'resolved'=>0];
    foreach ($rows as $r) {
        $stats['total'] += $r['cnt'];
        if ($r['status'] === 'pending') $stats['pending'] += $r['cnt'];
        if (in_array($r['status'], ['assigned','ongoing'])) $stats['active'] += $r['cnt'];
        if (in_array($r['status'], ['resolved','closed'])) $stats['resolved'] += $r['cnt'];
    }
    respond(true, $stats);
}

function jsonBody(): array {
    return json_decode(file_get_contents("php://input"), true) ?? [];
}

function respond(bool $ok, $data = null, string $msg = ''): void {
    echo json_encode([
        'success' => $ok,
        'message' => $msg,
        'data' => $data
    ]);
    exit;
}