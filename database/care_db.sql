-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2026 at 03:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `care_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `building_id` varchar(6) NOT NULL,
  `building_name` varchar(80) NOT NULL,
  `campus_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`building_id`, `building_name`, `campus_id`) VALUES
('BLD001', 'CSSP Building 1', 'CAM001'),
('BLD002', 'CSSP Building 2', 'CAM001'),
('BLD003', 'CBEM Building 1', 'CAM001'),
('BLD004', 'CBEM Building 2', 'CAM001'),
('BLD005', 'College of Education Building', 'CAM001'),
('BLD006', 'BU Administration Building', 'CAM001'),
('BLD007', 'Daraga Campus Library', 'CAM001'),
('BLD008', 'Daraga Student Center', 'CAM001'),
('BLD009', 'Daraga Gymnasium', 'CAM001'),
('BLD010', 'College of Science Building 1', 'CAM002'),
('BLD011', 'College of Science Building 2', 'CAM002'),
('BLD012', 'College of Science Building 3', 'CAM002'),
('BLD013', 'College of Science Building 4', 'CAM002'),
('BLD014', 'College of Arts and Letters Building', 'CAM002'),
('BLD015', 'College of Nursing Building', 'CAM002'),
('BLD016', 'IPESR Building', 'CAM002'),
('BLD017', 'JMRIGD Building', 'CAM002'),
('BLD018', 'College of Dental Medicine Building', 'CAM002'),
('BLD019', 'Legazpi West Administration Building', 'CAM002'),
('BLD020', 'Legazpi West Library', 'CAM002'),
('BLD021', 'College of Engineering Building 1', 'CAM003'),
('BLD022', 'College of Engineering Building 2', 'CAM003'),
('BLD023', 'IDeA Building', 'CAM003'),
('BLD024', 'College of Industrial Technology Building', 'CAM003'),
('BLD025', 'Legazpi East Administration Building', 'CAM003'),
('BLD026', 'Guinobatan Main Building', 'CAM004'),
('BLD027', 'Tabaco Main Building', 'CAM005'),
('BLD028', 'Gubat Main Building', 'CAM006'),
('BLD029', 'Polangui Main Building', 'CAM007'),
('BLD030', 'Legazpi East Library', 'CAM003');

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

CREATE TABLE `campus` (
  `campus_id` varchar(6) NOT NULL,
  `campus_name` varchar(80) NOT NULL,
  `campus_type` enum('central','satellite') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campus`
--

INSERT INTO `campus` (`campus_id`, `campus_name`, `campus_type`) VALUES
('CAM001', 'Bicol University Daraga', 'central'),
('CAM002', 'Bicol University Legazpi – West', 'central'),
('CAM003', 'Bicol University Legazpi – East', 'central'),
('CAM004', 'Bicol University Guinobatan', 'satellite'),
('CAM005', 'Bicol University Tabaco', 'satellite'),
('CAM006', 'Bicol University Gubat', 'satellite'),
('CAM007', 'Bicol University Polangui', 'satellite');

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `college_id` varchar(6) NOT NULL,
  `college_name` varchar(120) NOT NULL,
  `campus_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`college_id`, `college_name`, `campus_id`) VALUES
('COL001', 'College of Social Sciences and Philosophy', 'CAM001'),
('COL002', 'College of Business, Economics and Management', 'CAM001'),
('COL003', 'College of Education', 'CAM001'),
('COL004', 'College of Arts and Letters', 'CAM002'),
('COL005', 'College of Nursing', 'CAM002'),
('COL006', 'College of Science', 'CAM002'),
('COL007', 'Institute of Physical Education, Sports, and Recreation', 'CAM002'),
('COL008', 'Jesse M. Robredo Institute of Governance and Development', 'CAM002'),
('COL009', 'College of Dental Medicine', 'CAM002'),
('COL010', 'College of Engineering', 'CAM003'),
('COL011', 'Institute of Design and Architecture', 'CAM003'),
('COL012', 'College of Industrial Technology', 'CAM003'),
('COL013', 'Bicol University Guinobatan', 'CAM004'),
('COL014', 'Bicol University Tabaco', 'CAM005'),
('COL015', 'Bicol University Gubat', 'CAM006'),
('COL016', 'Bicol University Polangui', 'CAM007');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(6) NOT NULL,
  `c_lname` varchar(50) NOT NULL,
  `c_fname` varchar(50) NOT NULL,
  `c_mname` varchar(50) DEFAULT NULL,
  `c_email` varchar(100) NOT NULL,
  `c_mobile` varchar(15) NOT NULL,
  `c_username` varchar(50) NOT NULL,
  `c_password` varchar(255) NOT NULL,
  `cust_type` enum('student','faculty') NOT NULL,
  `dept_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `c_lname`, `c_fname`, `c_mname`, `c_email`, `c_mobile`, `c_username`, `c_password`, `cust_type`, `dept_id`) VALUES
('CUS001', 'Abella', 'Jose', 'Ramon', 'j.abella@bicol-u.edu.ph', '09171110001', 'jabella01', 'hashed_pw_c001', 'student', 'DEP003'),
('CUS002', 'Bacarro', 'Maria', 'Luz', 'm.bacarro@bicol-u.edu.ph', '09181110002', 'mbacarro02', 'hashed_pw_c002', 'student', 'DEP005'),
('CUS003', 'Cadiz', 'Fernando', 'Cruz', 'f.cadiz@bicol-u.edu.ph', '09191110003', 'fcadiz03', 'hashed_pw_c003', 'student', 'DEP004'),
('CUS004', 'Delos Reyes', 'Ana', 'Marie', 'a.delosreyes@bicol-u.edu.ph', '09171110004', 'adelosreyes', 'hashed_pw_c004', 'student', 'DEP001'),
('CUS005', 'Escoto', 'Ramon', 'Bautista', 'r.escoto@bicol-u.edu.ph', '09181110005', 'rescoto05', 'hashed_pw_c005', 'student', 'DEP026'),
('CUS006', 'Fajardo', 'Cristina', 'Salazar', 'c.fajardo@bicol-u.edu.ph', '09191110006', 'cfajardo06', 'hashed_pw_c006', 'student', 'DEP010'),
('CUS007', 'Gaceta', 'Miguel', 'Panganiban', 'm.gaceta@bicol-u.edu.ph', '09171110007', 'mgaceta07', 'hashed_pw_c007', 'student', 'DEP003'),
('CUS008', 'Hernandez', 'Sophia', 'Reyes', 's.hernandez@bicol-u.edu.ph', '09181110008', 'shernandez', 'hashed_pw_c008', 'student', 'DEP021'),
('CUS009', 'Ilagan', 'Patrick', 'Domingo', 'p.ilagan@bicol-u.edu.ph', '09191110009', 'pilagan09', 'hashed_pw_c009', 'student', 'DEP027'),
('CUS010', 'Javellana', 'Corazon', 'Tan', 'c.javellana@bicol-u.edu.ph', '09171110010', 'cjavellana', 'hashed_pw_c010', 'student', 'DEP014'),
('CUS011', 'Katigbak', 'Renato', 'Villena', 'r.katigbak@bicol-u.edu.ph', '09181110011', 'rkatigbak', 'hashed_pw_c011', 'student', 'DEP005'),
('CUS012', 'Laurel', 'Jasmine', 'Bello', 'j.laurel@bicol-u.edu.ph', '09191110012', 'jlaurel12', 'hashed_pw_c012', 'student', 'DEP033'),
('CUS013', 'Magno', 'Eduardo', 'Soriano', 'e.magno@bicol-u.edu.ph', '09171110013', 'emagno13', 'hashed_pw_c013', 'student', 'DEP003'),
('CUS014', 'Nacion', 'Liza', 'Villanueva', 'l.nacion@bicol-u.edu.ph', '09181110014', 'lnacion14', 'hashed_pw_c014', 'student', 'DEP028'),
('CUS015', 'Ocana', 'Anthony', 'Macaraeg', 'a.ocana@bicol-u.edu.ph', '09191110015', 'aocana15', 'hashed_pw_c015', 'student', 'DEP022'),
('CUS016', 'Pacis', 'Rosario', 'Hidalgo', 'r.pacis@bicol-u.edu.ph', '09171110016', 'rpacis16', 'hashed_pw_c016', 'student', 'DEP019'),
('CUS017', 'Quinto', 'Jerome', 'Magpayo', 'j.quinto@bicol-u.edu.ph', '09181110017', 'jquinto17', 'hashed_pw_c017', 'student', 'DEP005'),
('CUS018', 'Ramos', 'Theresa', 'Alcantara', 't.ramos@bicol-u.edu.ph', '09191110018', 'tramos18', 'hashed_pw_c018', 'student', 'DEP034'),
('CUS019', 'Salcedo', 'Dennis', 'Aguilar', 'd.salcedo@bicol-u.edu.ph', '09171110019', 'dsalcedo19', 'hashed_pw_c019', 'student', 'DEP003'),
('CUS020', 'Tuazon', 'Maricel', 'Peralta', 'm.tuazon@bicol-u.edu.ph', '09181110020', 'mtuazon20', 'hashed_pw_c020', 'student', 'DEP008'),
('CUS021', 'Umali', 'Gilbert', 'Padilla', 'g.umali@bicol-u.edu.ph', '09191110021', 'gumali21', 'hashed_pw_c021', 'student', 'DEP004'),
('CUS022', 'Velasco', 'Norma', 'Santos', 'n.velasco@bicol-u.edu.ph', '09171110022', 'nvelasco22', 'hashed_pw_c022', 'student', 'DEP015'),
('CUS023', 'Wenceslao', 'Romeo', 'Ignacio', 'r.wenceslao@bicol-u.edu.ph', '09181110023', 'rwenceslao', 'hashed_pw_c023', 'student', 'DEP041'),
('CUS024', 'Yambao', 'Patricia', 'Navarro', 'p.yambao@bicol-u.edu.ph', '09191110024', 'pyambao24', 'hashed_pw_c024', 'student', 'DEP029'),
('CUS025', 'Zapanta', 'Harold', 'Tolentino', 'h.zapanta@bicol-u.edu.ph', '09171110025', 'hzapanta25', 'hashed_pw_c025', 'student', 'DEP003'),
('CUS026', 'Alcazar', 'Cristine', 'Mercado', 'c.alcazar@bicol-u.edu.ph', '09181110026', 'calcazar26', 'hashed_pw_c026', 'student', 'DEP007'),
('CUS027', 'Burgos', 'Marco', 'Castillo', 'm.burgos@bicol-u.edu.ph', '09191110027', 'mburgos27', 'hashed_pw_c027', 'student', 'DEP036'),
('CUS028', 'Claveria', 'Sheila', 'Reyes', 's.claveria@bicol-u.edu.ph', '09171110028', 'sclaveria28', 'hashed_pw_c028', 'student', 'DEP005'),
('CUS029', 'Dionisio', 'Rodel', 'Bautista', 'r.dionisio@bicol-u.edu.ph', '09181110029', 'rdionisio29', 'hashed_pw_c029', 'student', 'DEP017'),
('CUS030', 'Espiritu', 'Annabelle', 'Cruz', 'a.espiritu@bicol-u.edu.ph', '09191110030', 'aespiritu30', 'hashed_pw_c030', 'student', 'DEP039'),
('CUS031', 'Fronda', 'Armando', 'Villena', 'a.fronda@bicol-u.edu.ph', '09171110031', 'afronda31', 'hashed_pw_c031', 'faculty', 'DEP003'),
('CUS032', 'Gomez', 'Pilita', 'Dela Cruz', 'p.gomez@bicol-u.edu.ph', '09181110032', 'pgomez32', 'hashed_pw_c032', 'faculty', 'DEP005'),
('CUS033', 'Hermosa', 'Cornelio', 'Reyes', 'c.hermosa@bicol-u.edu.ph', '09191110033', 'chermosa33', 'hashed_pw_c033', 'faculty', 'DEP026'),
('CUS034', 'Ilustre', 'Natividad', 'Santos', 'n.ilustre@bicol-u.edu.ph', '09171110034', 'nilustre34', 'hashed_pw_c034', 'faculty', 'DEP014'),
('CUS035', 'Jimenez', 'Celestino', 'Tan', 'c.jimenez@bicol-u.edu.ph', '09181110035', 'cjimenez35', 'hashed_pw_c035', 'faculty', 'DEP021'),
('CUS036', 'Katipunan', 'Dolores', 'Buenaventura', 'd.katipunan@bicol-u.edu.ph', '09191110036', 'dkatipunan', 'hashed_pw_c036', 'faculty', 'DEP010'),
('CUS037', 'Larrazabal', 'Francisco', 'Magpayo', 'f.larrazabal@bicol-u.edu.ph', '09171110037', 'flarrazabal', 'hashed_pw_c037', 'faculty', 'DEP004'),
('CUS038', 'Malaluan', 'Remedios', 'Hidalgo', 'r.malaluan@bicol-u.edu.ph', '09181110038', 'rmalaluan38', 'hashed_pw_c038', 'faculty', 'DEP001'),
('CUS039', 'Navarrete', 'Proceso', 'Alcantara', 'p.navarrete@bicol-u.edu.ph', '09191110039', 'pnavarrete', 'hashed_pw_c039', 'faculty', 'DEP028'),
('CUS040', 'Obligacion', 'Soledad', 'Ignacio', 's.obligacion@bicol-u.edu.ph', '09171110040', 'sobligacion', 'hashed_pw_c040', 'faculty', 'DEP015'),
('CUS041', 'Pimentel', 'Victorino', 'Padilla', 'v.pimentel@bicol-u.edu.ph', '09181110041', 'vpimentel41', 'hashed_pw_c041', 'faculty', 'DEP003'),
('CUS042', 'Quevedo', 'Asuncion', 'Soriano', 'a.quevedo@bicol-u.edu.ph', '09191110042', 'aquevedo42', 'hashed_pw_c042', 'faculty', 'DEP027'),
('CUS043', 'Rosario', 'Metodio', 'Navarro', 'm.rosario@bicol-u.edu.ph', '09171110043', 'mrosario43', 'hashed_pw_c043', 'faculty', 'DEP022'),
('CUS044', 'Samson', 'Florencia', 'Macaraeg', 'f.samson@bicol-u.edu.ph', '09181110044', 'fsamson44', 'hashed_pw_c044', 'faculty', 'DEP033'),
('CUS045', 'Tayag', 'Crisostomo', 'Villanueva', 'c.tayag@bicol-u.edu.ph', '09191110045', 'ctayag45', 'hashed_pw_c045', 'faculty', 'DEP005'),
('CUS046', 'Umali', 'Perfecta', 'Peralta', 'p.umali@bicol-u.edu.ph', '09171110046', 'pumali46', 'hashed_pw_c046', 'faculty', 'DEP019'),
('CUS047', 'Viernes', 'Gaudencio', 'Bello', 'g.viernes@bicol-u.edu.ph', '09181110047', 'gviernes47', 'hashed_pw_c047', 'faculty', 'DEP034'),
('CUS048', 'Wagas', 'Presentacion', 'Cruz', 'p.wagas@bicol-u.edu.ph', '09191110048', 'pwagas48', 'hashed_pw_c048', 'faculty', 'DEP008'),
('CUS049', 'Yap', 'Abundio', 'Reyes', 'a.yap@bicol-u.edu.ph', '09171110049', 'ayap49', 'hashed_pw_c049', 'faculty', 'DEP029'),
('CUS050', 'Zorilla', 'Concepcion', 'Tan', 'c.zorilla@bicol-u.edu.ph', '09181110050', 'czorilla50', 'hashed_pw_c050', 'faculty', 'DEP036'),
('CUS051', 'Aldaba', 'Restituto', 'Domingo', 'r.aldaba@bicol-u.edu.ph', '09191110051', 'raldaba51', 'hashed_pw_c051', 'faculty', 'DEP041'),
('CUS052', 'Benitez', 'Salvacion', 'Tolentino', 's.benitez@bicol-u.edu.ph', '09171110052', 'sbenitez52', 'hashed_pw_c052', 'faculty', 'DEP007'),
('CUS053', 'Caringal', 'Perpetuo', 'Aguilar', 'p.caringal@bicol-u.edu.ph', '09181110053', 'pcaringal53', 'hashed_pw_c053', 'faculty', 'DEP017'),
('CUS054', 'Dalisay', 'Resurreccion', 'Santos', 'r.dalisay@bicol-u.edu.ph', '09191110054', 'rdalisay54', 'hashed_pw_c054', 'faculty', 'DEP016'),
('CUS055', 'Engracia', 'Tranquilino', 'Hidalgo', 't.engracia@bicol-u.edu.ph', '09171110055', 'tengracia55', 'hashed_pw_c055', 'faculty', 'DEP039'),
('CUS056', 'Fabian', 'Esperanza', 'Mercado', 'e.fabian@bicol-u.edu.ph', '09181110056', 'efabian56', 'hashed_pw_c056', 'faculty', 'DEP040'),
('CUS057', 'Gaerlan', 'Prudencio', 'Castillo', 'p.gaerlan@bicol-u.edu.ph', '09191110057', 'pgaerlan57', 'hashed_pw_c057', 'faculty', 'DEP003'),
('CUS058', 'Habana', 'Presentacion', 'Reyes', 'p.habana@bicol-u.edu.ph', '09171110058', 'phabana58', 'hashed_pw_c058', 'faculty', 'DEP042'),
('CUS059', 'Ibarra', 'Tiburcio', 'Navarro', 't.ibarra@bicol-u.edu.ph', '09181110059', 'tibarra59', 'hashed_pw_c059', 'faculty', 'DEP005'),
('CUS060', 'Jacinto', 'Milagros', 'Bautista', 'm.jacinto@bicol-u.edu.ph', '09191110060', 'mjacinto60', 'hashed_pw_c060', 'faculty', 'DEP026');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` varchar(6) NOT NULL,
  `dept_name` varchar(120) NOT NULL,
  `college_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `college_id`) VALUES
('DEP001', 'Chemistry Department', 'COL006'),
('DEP002', 'Physics and Meteorology Department', 'COL006'),
('DEP003', 'Computer Science Department', 'COL006'),
('DEP004', 'Mathematics Department', 'COL006'),
('DEP005', 'Information Technology Department', 'COL006'),
('DEP006', 'English Department', 'COL004'),
('DEP007', 'Broadcasting Department', 'COL004'),
('DEP008', 'Communication Department', 'COL004'),
('DEP009', 'Journalism Department', 'COL004'),
('DEP010', 'Literature Department', 'COL004'),
('DEP011', 'Performing Arts and Theater Department', 'COL004'),
('DEP012', 'Filipino Department', 'COL004'),
('DEP013', 'Humanities Department', 'COL004'),
('DEP014', 'Philosophy Department', 'COL001'),
('DEP015', 'Sociology Department', 'COL001'),
('DEP016', 'Peace Studies Department', 'COL001'),
('DEP017', 'Political Science Department', 'COL001'),
('DEP018', 'Social Work Department', 'COL001'),
('DEP019', 'Psychology Department', 'COL001'),
('DEP020', 'General Education Department', 'COL001'),
('DEP021', 'Department of Accountancy', 'COL002'),
('DEP022', 'Department of Management', 'COL002'),
('DEP023', 'Department of Entrepreneurship', 'COL002'),
('DEP024', 'Department of Economics', 'COL002'),
('DEP025', 'BUCE Faculty', 'COL003'),
('DEP026', 'Civil Engineering Department', 'COL010'),
('DEP027', 'Mechanical Engineering Department', 'COL010'),
('DEP028', 'Electrical Engineering Department', 'COL010'),
('DEP029', 'Chemical Engineering Department', 'COL010'),
('DEP030', 'Mining Engineering Department', 'COL010'),
('DEP031', 'Geodetic Engineering Department', 'COL010'),
('DEP032', 'Geothermal Engineering Department', 'COL010'),
('DEP033', 'Department of Food Technology', 'COL012'),
('DEP034', 'Department of Automotive Technology', 'COL012'),
('DEP035', 'Department of Electronics Technology', 'COL012'),
('DEP036', 'Department of Electrical Technology', 'COL012'),
('DEP037', 'Department of Civil Technology', 'COL012'),
('DEP038', 'Department of Mechanical Technology', 'COL012'),
('DEP039', 'Fisheries and Aquaculture Department', 'COL014'),
('DEP040', 'Department of Agricultural Sciences and Forestry', 'COL013'),
('DEP041', 'Computer and Engineering Studies Department (Polangui)', 'COL016'),
('DEP042', 'Computer and Engineering Studies Department (Gubat)', 'COL015');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `device_id` varchar(6) NOT NULL,
  `ownership_type` enum('personal','institutional') NOT NULL,
  `current_condition` enum('excellent','good','poor','broken') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`device_id`, `ownership_type`, `current_condition`) VALUES
('DEV001', 'personal', 'good'),
('DEV002', 'personal', 'excellent'),
('DEV003', 'personal', 'good'),
('DEV004', 'personal', 'poor'),
('DEV005', 'personal', 'excellent'),
('DEV006', 'personal', 'good'),
('DEV007', 'personal', 'good'),
('DEV008', 'personal', 'poor'),
('DEV009', 'personal', 'excellent'),
('DEV010', 'personal', 'good'),
('DEV011', 'personal', 'excellent'),
('DEV012', 'personal', 'broken'),
('DEV013', 'personal', 'good'),
('DEV014', 'personal', 'good'),
('DEV015', 'personal', 'excellent'),
('DEV016', 'personal', 'good'),
('DEV017', 'personal', 'poor'),
('DEV018', 'personal', 'excellent'),
('DEV019', 'personal', 'good'),
('DEV020', 'personal', 'good'),
('DEV021', 'personal', 'excellent'),
('DEV022', 'personal', 'poor'),
('DEV023', 'personal', 'good'),
('DEV024', 'personal', 'excellent'),
('DEV025', 'personal', 'good'),
('DEV026', 'institutional', 'excellent'),
('DEV027', 'institutional', 'excellent'),
('DEV028', 'institutional', 'good'),
('DEV029', 'institutional', 'good'),
('DEV030', 'institutional', 'excellent'),
('DEV031', 'institutional', 'good'),
('DEV032', 'institutional', 'good'),
('DEV033', 'institutional', 'excellent'),
('DEV034', 'institutional', 'good'),
('DEV035', 'institutional', 'good'),
('DEV036', 'institutional', 'good'),
('DEV037', 'institutional', 'excellent'),
('DEV038', 'institutional', 'excellent'),
('DEV039', 'institutional', 'excellent'),
('DEV040', 'institutional', 'excellent'),
('DEV041', 'institutional', 'good'),
('DEV042', 'institutional', 'poor'),
('DEV043', 'institutional', 'broken'),
('DEV044', 'institutional', 'good'),
('DEV045', 'institutional', 'good'),
('DEV046', 'institutional', 'excellent'),
('DEV047', 'institutional', 'excellent'),
('DEV048', 'institutional', 'good'),
('DEV049', 'institutional', 'broken'),
('DEV050', 'institutional', 'excellent');

-- --------------------------------------------------------

--
-- Table structure for table `device_history`
--

CREATE TABLE `device_history` (
  `history_id` varchar(6) NOT NULL,
  `device_id` varchar(6) NOT NULL,
  `tech_id` varchar(6) NOT NULL,
  `ticket_id` varchar(6) NOT NULL,
  `log_id` varchar(6) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `cond_before` enum('excellent','good','poor','broken') NOT NULL,
  `cond_after` enum('excellent','good','poor','broken') NOT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device_history`
--

INSERT INTO `device_history` (`history_id`, `device_id`, `tech_id`, `ticket_id`, `log_id`, `timestamp`, `cond_before`, `cond_after`, `remarks`) VALUES
('HST001', 'DEV026', 'TEC008', 'TKT001', 'LOG002', '2025-01-09 14:30:00', 'poor', 'good', 'Screen glass matrix replaced'),
('HST002', 'DEV027', 'TEC008', 'TKT001', 'LOG002', '2025-01-09 14:30:00', 'good', 'excellent', 'Auxiliary panel framework calibrated'),
('HST003', 'DEV028', 'TEC010', 'TKT005', 'LOG018', '2025-01-16 17:00:00', 'excellent', 'excellent', 'Core system reset after switch failure'),
('HST004', 'DEV029', 'TEC010', 'TKT005', 'LOG018', '2025-01-16 17:00:00', 'good', 'excellent', 'Network interface card reseated'),
('HST005', 'DEV031', 'TEC012', 'TKT010', 'LOG004', '2025-01-21 11:30:00', 'broken', 'good', 'Burned projection module bulb swapped'),
('HST006', 'DEV032', 'TEC012', 'TKT010', 'LOG004', '2025-01-21 11:30:00', 'good', 'excellent', 'Internal lens element cleaned'),
('HST007', 'DEV033', 'TEC025', 'TKT012', 'LOG024', '2025-01-23 10:00:00', 'good', 'good', 'Port jack pin re-terminated in lab frame'),
('HST008', 'DEV035', 'TEC018', 'TKT014', 'LOG012', '2025-01-23 12:00:00', 'poor', 'excellent', 'Faulty RAM pulled; upgraded memory module installed'),
('HST009', 'DEV036', 'TEC016', 'TKT015', 'LOG032', '2025-01-26 14:00:00', 'good', 'good', 'Antenna frequency adjusted to clear dropouts'),
('HST014', 'DEV044', 'TEC008', 'TKT043', 'LOG041', '2025-02-24 11:30:00', 'good', 'good', 'Pin structural alignment re-formed');

-- --------------------------------------------------------

--
-- Table structure for table `device_model`
--

CREATE TABLE `device_model` (
  `model_id` varchar(6) NOT NULL,
  `device_type` enum('desktop','laptop','switch','projector','printer') NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device_model`
--

INSERT INTO `device_model` (`model_id`, `device_type`, `brand`, `model_name`) VALUES
('MDL001', 'desktop', 'Lenovo', 'ThinkCentre M720q'),
('MDL002', 'desktop', 'HP', 'ProDesk 400 G6'),
('MDL003', 'laptop', 'Lenovo', 'IdeaPad 3 15IML05'),
('MDL004', 'laptop', 'Acer', 'Aspire 5 A515-56'),
('MDL005', 'laptop', 'HP', 'Pavilion 15-eg0xxx'),
('MDL006', 'laptop', 'Dell', 'Inspiron 15 3511'),
('MDL007', 'laptop', 'ASUS', 'VivoBook 15 X512FA'),
('MDL008', 'laptop', 'Lenovo', 'ThinkPad E14 Gen 2'),
('MDL009', 'laptop', 'HP', 'EliteBook 840 G7'),
('MDL010', 'laptop', 'Dell', 'Latitude 5410'),
('MDL011', 'switch', 'Cisco', 'Catalyst 2960-X'),
('MDL012', 'switch', 'Cisco', 'SG350-28'),
('MDL013', 'projector', 'Epson', 'EB-X51'),
('MDL014', 'projector', 'BenQ', 'MX611'),
('MDL015', 'laptop', 'Acer', 'Nitro 5 AN515-55'),
('MDL016', 'switch', 'TP-Link', 'TL-SG1024'),
('MDL017', 'printer', 'HP', 'LaserJet Pro M404n'),
('MDL018', 'desktop', 'Dell', 'OptiPlex 7080'),
('MDL019', 'laptop', 'ASUS', 'ZenBook 14 UX425EA'),
('MDL020', 'laptop', 'MSI', 'Modern 14 B11MO'),
('MDL021', 'laptop', 'HP', 'ProBook 450 G8'),
('MDL022', 'laptop', 'Lenovo', 'ThinkPad L14 Gen 1'),
('MDL023', 'desktop', 'Acer', 'Veriton M4680G'),
('MDL024', 'projector', 'Optoma', 'EH412'),
('MDL025', 'switch', 'Cisco', 'SG250-26'),
('MDL026', 'desktop', 'HP', 'EliteDesk 800 G6'),
('MDL027', 'printer', 'Epson', 'EcoTank L5190'),
('MDL028', 'desktop', 'Lenovo', 'ThinkCentre M90n');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `customer_id` varchar(6) NOT NULL,
  `position` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`customer_id`, `position`) VALUES
('CUS031', 'Instructor I'),
('CUS032', 'Associate Professor II'),
('CUS033', 'Assistant Professor I'),
('CUS034', 'Instructor II'),
('CUS035', 'Associate Professor I'),
('CUS036', 'Professor I'),
('CUS037', 'Instructor I'),
('CUS038', 'Assistant Professor II'),
('CUS039', 'Associate Professor III'),
('CUS040', 'Instructor II'),
('CUS041', 'Professor II'),
('CUS042', 'Assistant Professor I'),
('CUS043', 'Associate Professor I'),
('CUS044', 'Instructor I'),
('CUS045', 'Professor I'),
('CUS046', 'Associate Professor II'),
('CUS047', 'Instructor III'),
('CUS048', 'Assistant Professor III'),
('CUS049', 'Associate Professor I'),
('CUS050', 'Instructor II'),
('CUS051', 'Professor I'),
('CUS052', 'Assistant Professor I'),
('CUS053', 'Associate Professor II'),
('CUS054', 'Instructor I'),
('CUS055', 'Professor III'),
('CUS056', 'Assistant Professor II'),
('CUS057', 'Associate Professor I'),
('CUS058', 'Instructor II'),
('CUS059', 'Professor I'),
('CUS060', 'Associate Professor III');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` varchar(6) NOT NULL,
  `rate_resolution` int(11) NOT NULL CHECK (`rate_resolution` between 1 and 5),
  `rate_service` int(11) NOT NULL CHECK (`rate_service` between 1 and 5),
  `comments` text DEFAULT NULL,
  `submitted_at` datetime NOT NULL,
  `ticket_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `rate_resolution`, `rate_service`, `comments`, `submitted_at`, `ticket_id`) VALUES
('FBK001', 4, 5, 'Optimized memory footprint during background execution.', '2025-01-08 12:30:00', 'TKT001'),
('FBK002', 4, 5, 'Blue screening on lab desktop stopped after testing.', '2025-01-09 15:00:00', 'TKT002'),
('FBK003', 3, 3, 'Connection stabilized but drops during peak hours.', '2025-01-10 12:45:00', 'TKT003'),
('FBK004', 5, 4, 'Student portal access restored quickly.', '2025-01-11 12:15:00', 'TKT004'),
('FBK005', 4, 5, 'Video drops stopped after system config tweak.', '2025-01-12 17:00:00', 'TKT005'),
('FBK006', 5, 3, 'Laptop battery replaced safely but sourcing took time.', '2025-01-13 13:45:00', 'TKT006'),
('FBK007', 3, 4, 'Fixed boot loop but lost some app configurations.', '2025-01-14 11:00:00', 'TKT007'),
('FBK008', 5, 5, 'Fixed display projection sync to standard output.', '2025-01-15 17:30:00', 'TKT008'),
('FBK009', 5, 5, 'Quick credential override. Account unlocked.', '2025-01-16 16:45:00', 'TKT009'),
('FBK010', 5, 5, 'Projector bulb fixed in time for morning lectures.', '2025-01-17 16:00:00', 'TKT010'),
('FBK011', 2, 4, 'Malware deleted but browser still slightly sluggish.', '2025-01-18 17:30:00', 'TKT011'),
('FBK012', 5, 4, 'Wall jack works perfectly. Network connections restored.', '2025-01-19 12:30:00', 'TKT012'),
('FBK013', 4, 4, 'Access privileges granted to institutional ledger.', '2025-01-19 16:45:00', 'TKT013'),
('FBK014', 5, 5, 'Faulty RAM identified and swapped fast.', '2025-01-20 08:45:00', 'TKT014'),
('FBK015', 4, 5, 'Rebalanced client lane on lab access point.', '2025-01-21 12:00:00', 'TKT015'),
('FBK016', 4, 4, 'Activation resolved with step-by-step guide.', '2025-01-21 15:30:00', 'TKT016'),
('FBK017', 5, 5, 'ERP portal loaded immediately after cache clear.', '2025-01-22 14:45:00', 'TKT017'),
('FBK018', 5, 5, 'Heat dissipation paths confirmed within thresholds.', '2025-01-22 17:30:00', 'TKT018'),
('FBK019', 4, 4, 'Duplicate network paths cleared, volumes stabilized.', '2025-01-23 10:30:00', 'TKT019'),
('FBK020', 4, 3, 'Tablet loop fixed but technician seemed distracted.', '2025-01-22 18:30:00', 'TKT020');

-- --------------------------------------------------------

--
-- Table structure for table `institutional`
--

CREATE TABLE `institutional` (
  `device_id` varchar(6) NOT NULL,
  `asset_tag` varchar(30) NOT NULL,
  `acquire_date` date NOT NULL,
  `loc_id` varchar(6) NOT NULL,
  `model_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institutional`
--

INSERT INTO `institutional` (`device_id`, `asset_tag`, `acquire_date`, `loc_id`, `model_id`) VALUES
('DEV026', 'BU-CS-2024-001', '2024-01-15', 'LOC001', 'MDL001'),
('DEV027', 'BU-CS-2024-002', '2024-01-15', 'LOC001', 'MDL001'),
('DEV028', 'BU-CS-2024-003', '2024-01-15', 'LOC001', 'MDL001'),
('DEV029', 'BU-CS-2024-004', '2024-01-15', 'LOC001', 'MDL001'),
('DEV030', 'BU-CS-2024-005', '2024-01-15', 'LOC001', 'MDL001'),
('DEV031', 'BU-CS-2024-006', '2024-01-15', 'LOC002', 'MDL002'),
('DEV032', 'BU-CS-2024-007', '2024-01-15', 'LOC002', 'MDL002'),
('DEV033', 'BU-CS-2024-008', '2024-01-15', 'LOC002', 'MDL002'),
('DEV034', 'BU-CS-2024-009', '2024-01-15', 'LOC002', 'MDL002'),
('DEV035', 'BU-CS-2024-010', '2024-01-15', 'LOC002', 'MDL002'),
('DEV036', 'BU-CS-2024-011', '2024-02-10', 'LOC003', 'MDL011'),
('DEV037', 'BU-CS-2024-012', '2024-02-10', 'LOC004', 'MDL012'),
('DEV038', 'BU-CS-2024-013', '2024-03-01', 'LOC005', 'MDL013'),
('DEV039', 'BU-CS-2024-014', '2024-03-01', 'LOC005', 'MDL013'),
('DEV040', 'BU-CS-2024-015', '2024-03-01', 'LOC006', 'MDL014'),
('DEV041', 'BU-CS-2024-016', '2024-03-01', 'LOC006', 'MDL014'),
('DEV042', 'BU-CS-2024-017', '2024-04-18', 'LOC001', 'MDL015'),
('DEV043', 'BU-CS-2024-018', '2024-04-18', 'LOC002', 'MDL016'),
('DEV044', 'BU-CS-2024-019', '2024-05-22', 'LOC007', 'MDL017'),
('DEV045', 'BU-CS-2024-020', '2024-06-11', 'LOC003', 'MDL018'),
('DEV046', 'BU-CS-2024-021', '2024-06-11', 'LOC003', 'MDL018'),
('DEV047', 'BU-CS-2024-022', '2024-07-19', 'LOC008', 'MDL025'),
('DEV048', 'BU-CS-2024-023', '2024-08-05', 'LOC005', 'MDL026'),
('DEV049', 'BU-CS-2024-024', '2024-09-12', 'LOC008', 'MDL027'),
('DEV050', 'BU-CS-2024-025', '2024-10-01', 'LOC002', 'MDL028');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_item`
--

CREATE TABLE `inventory_item` (
  `item_id` varchar(6) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `qty_stock` int(11) NOT NULL DEFAULT 0 CHECK (`qty_stock` >= 0),
  `unit_cost` decimal(10,2) NOT NULL CHECK (`unit_cost` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_item`
--

INSERT INTO `inventory_item` (`item_id`, `item_name`, `qty_stock`, `unit_cost`) VALUES
('ITM001', '8GB DDR4 RAM Desktop Stick', 15, 850.00),
('ITM002', '8GB DDR4 RAM Laptop Stick', 10, 950.00),
('ITM003', '500GB SATA HDD 3.5 inch', 8, 1800.00),
('ITM004', '500GB SATA HDD 2.5 inch', 6, 1950.00),
('ITM005', 'DC Power Jack Replacement', 20, 250.00),
('ITM006', 'LVDS Display Cable 15.6 inch', 12, 380.00),
('ITM007', 'Cat6 RJ45 Connector Pack of 50', 30, 180.00),
('ITM008', 'Cisco SFP Module 1G', 5, 3500.00),
('ITM009', 'Fuse 10A 250V Pack of 10', 25, 90.00),
('ITM010', 'Thermal Paste Syringe 3g', 18, 120.00),
('ITM011', 'Projector Air Filter Replacement', 7, 450.00),
('ITM012', 'UPS Replacement Battery 12V 7AH', 4, 1200.00),
('ITM013', 'Printer Pickup Roller Replacement', 9, 650.00),
('ITM014', 'SATA Power Cable 50cm', 14, 150.00),
('ITM015', 'Anti-Static Wrist Strap', 20, 85.00);

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base`
--

CREATE TABLE `knowledge_base` (
  `article_id` varchar(6) NOT NULL,
  `title` varchar(120) NOT NULL,
  `content` text NOT NULL,
  `category` enum('hardware','software','network','account') NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0 CHECK (`view_count` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `knowledge_base`
--

INSERT INTO `knowledge_base` (`article_id`, `title`, `content`, `category`, `view_count`) VALUES
('KB001', 'Resolving MS Office Activation Failures', 'Step-by-step guide for resolving MS Office activation using volume license keys.', 'software', 142),
('KB002', 'Common Laboratory Projector No-Signal Fixes', 'Troubleshooting steps for projectors showing no signal in laboratory environments.', 'hardware', 89),
('KB003', 'Connecting to Campus Secure Wi-Fi Networks', 'Guide for configuring devices to connect to BU secure campus wireless networks.', 'network', 215),
('KB004', 'Self-Service Portal Password Reset Guides', 'Instructions for resetting university portal passwords through self-service tools.', 'account', 310),
('KB005', 'Standard Desktop BSOD Blue Screen Error Checklist', 'Diagnostic checklist for resolving Blue Screen of Death errors on desktop units.', 'hardware', 64),
('KB006', 'Resetting Local Workstation IP Address Cache', 'Steps to flush DNS and reset IP address configuration on local workstations.', 'network', 112),
('KB007', 'Unlocking Terminated University Email Accounts', 'Procedure for reactivating locked or expired university email accounts.', 'account', 95),
('KB008', 'Mapping Shared Laboratory Network Drive Volumes', 'Guide for mapping shared network drives in laboratory computing environments.', 'network', 78),
('KB009', 'Local Desktop Data Recovery from Crash Events', 'Recovery procedures for retrieving data from desktops after system crashes.', 'hardware', 53),
('KB010', 'Basic Institutional ERP Portal Access Fixes', 'Common fixes for ERP portal access issues including cache clearing and re-enrollment.', 'software', 184);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `loc_id` varchar(6) NOT NULL,
  `floor_no` int(11) NOT NULL,
  `room_no` varchar(10) NOT NULL,
  `room_type` enum('laboratory','lecture_hall','office','server_room') NOT NULL,
  `room_name` varchar(80) DEFAULT NULL,
  `building_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`loc_id`, `floor_no`, `room_no`, `room_type`, `room_name`, `building_id`) VALUES
('LOC001', 1, '101', 'office', 'CSSP Dean\'s Office', 'BLD001'),
('LOC002', 1, '102', 'lecture_hall', 'CSSP Lecture Hall A', 'BLD001'),
('LOC003', 2, '201', 'lecture_hall', 'CSSP Lecture Hall B', 'BLD001'),
('LOC004', 2, '202', 'office', 'Philosophy Faculty Room', 'BLD001'),
('LOC005', 1, '101', 'office', 'CSSP Conference Room', 'BLD002'),
('LOC006', 1, '102', 'laboratory', 'Social Research Lab', 'BLD002'),
('LOC007', 1, '101', 'office', 'CBEM Dean\'s Office', 'BLD003'),
('LOC008', 1, '102', 'lecture_hall', 'CBEM Lecture Hall A', 'BLD003'),
('LOC009', 2, '201', 'laboratory', 'Accounting Lab', 'BLD003'),
('LOC010', 2, '202', 'lecture_hall', 'CBEM Lecture Hall B', 'BLD003'),
('LOC011', 1, '101', 'office', 'CBEM Faculty Room', 'BLD004'),
('LOC012', 1, '102', 'laboratory', 'Business Analytics Lab', 'BLD004'),
('LOC013', 1, '101', 'office', 'CE Dean\'s Office', 'BLD005'),
('LOC014', 1, '102', 'lecture_hall', 'Education Lecture Hall', 'BLD005'),
('LOC015', 1, '101', 'office', 'BU Administration Office', 'BLD006'),
('LOC016', 1, '102', 'office', 'Registrar\'s Office', 'BLD006'),
('LOC017', 2, '201', 'server_room', 'Main Server Room', 'BLD006'),
('LOC018', 1, '101', 'office', 'Library Reference Section', 'BLD007'),
('LOC019', 1, '102', 'laboratory', 'Library Computer Lab', 'BLD007'),
('LOC020', 1, '101', 'office', 'Student Affairs Office', 'BLD008'),
('LOC021', 1, '101', 'laboratory', 'CS Lab 1', 'BLD010'),
('LOC022', 1, '102', 'laboratory', 'CS Lab 2', 'BLD010'),
('LOC023', 2, '201', 'laboratory', 'Physics Lab', 'BLD010'),
('LOC024', 2, '202', 'office', 'CS Dean\'s Office', 'BLD010'),
('LOC025', 1, '101', 'laboratory', 'CS Lab 3', 'BLD011'),
('LOC026', 1, '102', 'laboratory', 'Chemistry Lab 1', 'BLD011'),
('LOC027', 2, '201', 'laboratory', 'Chemistry Lab 2', 'BLD011'),
('LOC028', 1, '101', 'laboratory', 'IT Lab 1', 'BLD012'),
('LOC029', 1, '102', 'laboratory', 'IT Lab 2', 'BLD012'),
('LOC030', 2, '201', 'server_room', 'CS Server Room', 'BLD012'),
('LOC031', 1, '101', 'laboratory', 'Mathematics Lab', 'BLD013'),
('LOC032', 1, '102', 'lecture_hall', 'Science Auditorium', 'BLD013'),
('LOC033', 1, '101', 'office', 'CAL Dean\'s Office', 'BLD014'),
('LOC034', 1, '102', 'lecture_hall', 'CAL Lecture Hall A', 'BLD014'),
('LOC035', 2, '201', 'laboratory', 'Broadcasting Studio', 'BLD014'),
('LOC036', 2, '202', 'laboratory', 'Journalism Lab', 'BLD014'),
('LOC037', 1, '101', 'office', 'Nursing Dean\'s Office', 'BLD015'),
('LOC038', 1, '102', 'laboratory', 'Nursing Skills Lab', 'BLD015'),
('LOC039', 2, '201', 'laboratory', 'Anatomy Lab', 'BLD015'),
('LOC040', 1, '101', 'office', 'IPESR Faculty Room', 'BLD016'),
('LOC041', 1, '101', 'office', 'JMRIGD Faculty Room', 'BLD017'),
('LOC042', 1, '102', 'lecture_hall', 'Governance Lecture Hall', 'BLD017'),
('LOC043', 1, '101', 'office', 'CDM Dean\'s Office', 'BLD018'),
('LOC044', 1, '102', 'laboratory', 'Dental Simulation Lab', 'BLD018'),
('LOC045', 1, '101', 'office', 'Legazpi West Admin Office', 'BLD019'),
('LOC046', 2, '201', 'server_room', 'Legazpi West Server Room', 'BLD019'),
('LOC047', 1, '101', 'office', 'CENG Dean\'s Office', 'BLD021'),
('LOC048', 1, '102', 'laboratory', 'Civil Engineering Lab', 'BLD021'),
('LOC049', 2, '201', 'laboratory', 'Mechanical Engineering Lab', 'BLD021'),
('LOC050', 2, '202', 'laboratory', 'Electrical Engineering Lab', 'BLD021'),
('LOC051', 1, '101', 'laboratory', 'Chemical Engineering Lab', 'BLD022'),
('LOC052', 1, '102', 'laboratory', 'Geothermal Engineering Lab', 'BLD022'),
('LOC053', 2, '201', 'server_room', 'CENG Server Room', 'BLD022'),
('LOC054', 1, '101', 'office', 'IDeA Faculty Room', 'BLD023'),
('LOC055', 1, '102', 'laboratory', 'Design Studio', 'BLD023'),
('LOC056', 1, '101', 'laboratory', 'CIT Workshop 1', 'BLD024'),
('LOC057', 1, '102', 'laboratory', 'CIT Workshop 2', 'BLD024'),
('LOC058', 1, '101', 'office', 'Guinobatan Admin Office', 'BLD026'),
('LOC059', 1, '101', 'office', 'Tabaco Admin Office', 'BLD027'),
('LOC060', 1, '101', 'laboratory', 'Polangui Computer Lab', 'BLD029');

-- --------------------------------------------------------

--
-- Table structure for table `material_used`
--

CREATE TABLE `material_used` (
  `material_id` varchar(6) NOT NULL,
  `qty_used` int(11) NOT NULL CHECK (`qty_used` >= 0),
  `deduct_status` enum('pending','deducted','reversed') NOT NULL DEFAULT 'pending',
  `log_id` varchar(6) NOT NULL,
  `item_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material_used`
--

INSERT INTO `material_used` (`material_id`, `qty_used`, `deduct_status`, `log_id`, `item_id`) VALUES
('MAT001', 1, 'deducted', 'LOG003', 'ITM005'),
('MAT002', 1, 'deducted', 'LOG003', 'ITM010'),
('MAT003', 3, 'deducted', 'LOG024', 'ITM009'),
('MAT006', 1, 'deducted', 'LOG025', 'ITM014'),
('MAT007', 1, 'pending', 'LOG030', 'ITM011'),
('MAT008', 1, 'pending', 'LOG034', 'ITM008'),
('MAT011', 1, 'deducted', 'LOG042', 'ITM006'),
('MAT012', 1, 'deducted', 'LOG042', 'ITM010');

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `device_id` varchar(6) NOT NULL,
  `owner_id` varchar(6) NOT NULL,
  `model_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`device_id`, `owner_id`, `model_id`) VALUES
('DEV001', 'CUS001', 'MDL003'),
('DEV002', 'CUS002', 'MDL004'),
('DEV003', 'CUS003', 'MDL005'),
('DEV004', 'CUS004', 'MDL007'),
('DEV005', 'CUS005', 'MDL008'),
('DEV006', 'CUS006', 'MDL009'),
('DEV007', 'CUS007', 'MDL010'),
('DEV008', 'CUS008', 'MDL019'),
('DEV009', 'CUS009', 'MDL021'),
('DEV010', 'CUS010', 'MDL022'),
('DEV011', 'CUS011', 'MDL003'),
('DEV012', 'CUS012', 'MDL004'),
('DEV013', 'CUS013', 'MDL007'),
('DEV014', 'CUS014', 'MDL008'),
('DEV015', 'CUS015', 'MDL019'),
('DEV016', 'CUS016', 'MDL005'),
('DEV017', 'CUS017', 'MDL009'),
('DEV018', 'CUS018', 'MDL010'),
('DEV019', 'CUS019', 'MDL003'),
('DEV020', 'CUS020', 'MDL004'),
('DEV021', 'CUS021', 'MDL021'),
('DEV022', 'CUS022', 'MDL022'),
('DEV023', 'CUS023', 'MDL007'),
('DEV024', 'CUS024', 'MDL008'),
('DEV025', 'CUS025', 'MDL019');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `sched_id` varchar(6) NOT NULL,
  `sched_date` date NOT NULL,
  `sched_start` time NOT NULL,
  `actual_start` time DEFAULT NULL,
  `actual_end` time DEFAULT NULL,
  `status` enum('scheduled','in_progress','completed','cancelled','rescheduled') NOT NULL,
  `ticket_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`sched_id`, `sched_date`, `sched_start`, `actual_start`, `actual_end`, `status`, `ticket_id`) VALUES
('SCH001', '2025-01-08', '09:00:00', '09:15:00', '12:00:00', 'completed', 'TKT001'),
('SCH002', '2025-01-09', '11:30:00', '11:40:00', '14:30:00', 'completed', 'TKT002'),
('SCH003', '2025-01-10', '10:00:00', '10:05:00', '12:00:00', 'completed', 'TKT003'),
('SCH004', '2025-01-11', '08:30:00', '08:30:00', '11:45:00', 'completed', 'TKT004'),
('SCH005', '2025-01-12', '13:00:00', '13:15:00', '16:30:00', 'completed', 'TKT005'),
('SCH006', '2025-01-13', '08:00:00', '08:10:00', '13:00:00', 'completed', 'TKT006'),
('SCH007', '2025-01-14', '07:30:00', '07:45:00', '10:30:00', 'completed', 'TKT007'),
('SCH008', '2025-01-15', '09:00:00', '09:30:00', '17:00:00', 'completed', 'TKT008'),
('SCH009', '2025-01-16', '10:00:00', '10:15:00', '16:00:00', 'completed', 'TKT009'),
('SCH010', '2025-01-17', '11:00:00', '11:05:00', '15:30:00', 'completed', 'TKT010'),
('SCH043', '2025-02-24', '11:00:00', '11:15:00', NULL, 'in_progress', 'TKT043'),
('SCH044', '2025-02-25', '14:00:00', NULL, NULL, 'scheduled', 'TKT044'),
('SCH045', '2025-02-25', '10:00:00', '10:05:00', NULL, 'in_progress', 'TKT045'),
('SCH047', '2025-02-26', '08:30:00', '08:45:00', '10:00:00', 'completed', 'TKT047'),
('SCH048', '2025-02-26', '10:00:00', '10:15:00', '11:45:00', 'completed', 'TKT048'),
('SCH050', '2025-02-27', '13:30:00', '13:40:00', NULL, 'in_progress', 'TKT050');

-- --------------------------------------------------------

--
-- Table structure for table `sched_assign`
--

CREATE TABLE `sched_assign` (
  `sched_id` varchar(6) NOT NULL,
  `tech_id` varchar(6) NOT NULL,
  `checkin_time` time DEFAULT NULL,
  `assign_status` enum('assigned','present','no_show') NOT NULL DEFAULT 'assigned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sched_assign`
--

INSERT INTO `sched_assign` (`sched_id`, `tech_id`, `checkin_time`, `assign_status`) VALUES
('SCH001', 'TEC008', '08:55:00', 'present'),
('SCH001', 'TEC009', '09:00:00', 'present'),
('SCH002', 'TEC008', '12:58:00', 'present'),
('SCH003', 'TEC012', '10:05:00', 'present'),
('SCH004', 'TEC012', '09:30:00', 'present'),
('SCH005', 'TEC015', '14:10:00', 'present'),
('SCH006', 'TEC015', '09:00:00', 'present'),
('SCH007', 'TEC011', '08:15:00', 'present'),
('SCH007', 'TEC014', '08:12:00', 'present'),
('SCH008', 'TEC022', '09:00:00', 'no_show'),
('SCH009', 'TEC022', '10:00:00', 'present'),
('SCH010', 'TEC018', '11:10:00', 'present'),
('SCH043', 'TEC015', '13:15:00', 'present'),
('SCH044', 'TEC020', '14:02:00', 'present'),
('SCH045', 'TEC011', NULL, 'assigned'),
('SCH047', 'TEC022', NULL, 'assigned'),
('SCH048', 'TEC023', NULL, 'assigned'),
('SCH048', 'TEC024', NULL, 'assigned'),
('SCH050', 'TEC013', NULL, 'assigned'),
('SCH050', 'TEC018', NULL, 'assigned');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` varchar(6) NOT NULL,
  `skill_name` varchar(80) NOT NULL,
  `category` enum('hardware','software','network','infrastructure','account') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skill_id`, `skill_name`, `category`) VALUES
('SKL001', 'Hardware Diagnostics', 'hardware'),
('SKL002', 'RAM and Storage Replacement', 'hardware'),
('SKL003', 'Motherboard and CPU Repair', 'hardware'),
('SKL004', 'Printer and Peripheral Repair', 'hardware'),
('SKL005', 'Projector Maintenance', 'hardware'),
('SKL006', 'OS Installation and Recovery', 'software'),
('SKL007', 'Software Troubleshooting', 'software'),
('SKL008', 'Antivirus and Malware Removal', 'software'),
('SKL009', 'Driver Installation', 'software'),
('SKL010', 'Network Troubleshooting', 'network'),
('SKL011', 'WiFi Configuration', 'network'),
('SKL012', 'LAN and Cable Management', 'network'),
('SKL013', 'Cisco Switch Configuration', 'network'),
('SKL014', 'Server Maintenance', 'infrastructure'),
('SKL015', 'Fiber Optic Cabling', 'infrastructure'),
('SKL016', 'CCTV and Security Systems', 'infrastructure'),
('SKL017', 'UPS and Power Management', 'infrastructure'),
('SKL018', 'Portal Account Recovery', 'account'),
('SKL019', 'Email Configuration', 'account'),
('SKL020', 'University System Access', 'account');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `customer_id` varchar(6) NOT NULL,
  `student_no` varchar(20) NOT NULL,
  `year_level` int(11) NOT NULL CHECK (`year_level` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`customer_id`, `student_no`, `year_level`) VALUES
('CUS001', '2024-01-019251', 1),
('CUS002', '2024-01-028131', 1),
('CUS003', '2023-01-034412', 2),
('CUS004', '2023-01-041022', 2),
('CUS005', '2022-01-056783', 3),
('CUS006', '2022-01-062343', 3),
('CUS007', '2021-01-078904', 4),
('CUS008', '2021-01-083564', 4),
('CUS009', '2024-01-091111', 1),
('CUS010', '2023-01-104222', 2),
('CUS011', '2022-01-116333', 3),
('CUS012', '2021-01-127444', 4),
('CUS013', '2024-01-138551', 1),
('CUS014', '2023-01-149662', 2),
('CUS015', '2022-01-151773', 3),
('CUS016', '2021-01-162884', 4),
('CUS017', '2024-01-173991', 1),
('CUS018', '2023-01-184102', 2),
('CUS019', '2022-01-195213', 3),
('CUS020', '2021-01-206324', 4),
('CUS021', '2024-01-217431', 1),
('CUS022', '2023-01-228542', 2),
('CUS023', '2022-01-239653', 3),
('CUS024', '2021-01-240764', 4),
('CUS025', '2024-01-251871', 1),
('CUS026', '2023-01-262982', 2),
('CUS027', '2022-01-273093', 3),
('CUS028', '2021-01-284104', 4),
('CUS029', '2024-01-295211', 1),
('CUS030', '2023-01-306322', 2);

-- --------------------------------------------------------

--
-- Table structure for table `technical_support`
--

CREATE TABLE `technical_support` (
  `tech_id` varchar(6) NOT NULL,
  `t_lname` varchar(50) NOT NULL,
  `t_fname` varchar(50) NOT NULL,
  `t_mname` varchar(50) DEFAULT NULL,
  `t_email` varchar(100) NOT NULL,
  `t_mobile` varchar(15) NOT NULL,
  `t_username` varchar(50) NOT NULL,
  `t_password` varchar(255) NOT NULL,
  `role` enum('admin','technician') NOT NULL,
  `campus_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technical_support`
--

INSERT INTO `technical_support` (`tech_id`, `t_lname`, `t_fname`, `t_mname`, `t_email`, `t_mobile`, `t_username`, `t_password`, `role`, `campus_id`) VALUES
('TEC001', 'Albano', 'Ricardo', 'Mañago', 'r.albano@bicol-u.edu.ph', '09171234501', 'ralbano', 'hashed_pw_001', 'admin', 'CAM001'),
('TEC002', 'Bautista', 'Lorna', 'Dela Cruz', 'l.bautista@bicol-u.edu.ph', '09181234502', 'lbautista', 'hashed_pw_002', 'admin', 'CAM002'),
('TEC003', 'Castillo', 'Marcos', 'Ignacio', 'm.castillo@bicol-u.edu.ph', '09191234503', 'mcastillo', 'hashed_pw_003', 'admin', 'CAM003'),
('TEC004', 'Domingo', 'Felisa', 'Ramos', 'f.domingo@bicol-u.edu.ph', '09171234504', 'fdomingo', 'hashed_pw_004', 'admin', 'CAM004'),
('TEC005', 'Enriquez', 'Hernando', 'Santos', 'h.enriquez@bicol-u.edu.ph', '09181234505', 'henriquez', 'hashed_pw_005', 'admin', 'CAM005'),
('TEC006', 'Flores', 'Carmelita', 'Viernes', 'c.flores@bicol-u.edu.ph', '09191234506', 'cflores', 'hashed_pw_006', 'admin', 'CAM006'),
('TEC007', 'Garcia', 'Rodolfo', 'Navarro', 'r.garcia@bicol-u.edu.ph', '09171234507', 'rgarcia', 'hashed_pw_007', 'admin', 'CAM007'),
('TEC008', 'Herrera', 'Juan', 'Pascual', 'j.herrera@bicol-u.edu.ph', '09181234508', 'jherrera', 'hashed_pw_008', 'technician', 'CAM001'),
('TEC009', 'Ignacio', 'Maria', 'Tolentino', 'm.ignacio@bicol-u.edu.ph', '09191234509', 'mignacio', 'hashed_pw_009', 'technician', 'CAM001'),
('TEC010', 'Javier', 'Carlos', 'Reyes', 'c.javier@bicol-u.edu.ph', '09171234510', 'cjavier', 'hashed_pw_010', 'technician', 'CAM001'),
('TEC011', 'Lacson', 'Teodora', 'Buenaventura', 't.lacson@bicol-u.edu.ph', '09181234511', 'tlacson', 'hashed_pw_011', 'technician', 'CAM001'),
('TEC012', 'Mendoza', 'Rafael', 'Cruz', 'r.mendoza@bicol-u.edu.ph', '09191234512', 'rmendoza', 'hashed_pw_012', 'technician', 'CAM002'),
('TEC013', 'Navarro', 'Josefina', 'Macaraeg', 'j.navarro@bicol-u.edu.ph', '09171234513', 'jnavarro', 'hashed_pw_013', 'technician', 'CAM002'),
('TEC014', 'Ocampo', 'Bernard', 'Villanueva', 'b.ocampo@bicol-u.edu.ph', '09181234514', 'bocampo', 'hashed_pw_014', 'technician', 'CAM002'),
('TEC015', 'Perez', 'Luzviminda', 'Aguilar', 'l.perez@bicol-u.edu.ph', '09191234515', 'lperez', 'hashed_pw_015', 'technician', 'CAM002'),
('TEC016', 'Quirino', 'Danilo', 'Magpayo', 'd.quirino@bicol-u.edu.ph', '09171234516', 'dquirino', 'hashed_pw_016', 'technician', 'CAM003'),
('TEC017', 'Reyes', 'Estrella', 'Domingo', 'e.reyes@bicol-u.edu.ph', '09181234517', 'ereyes', 'hashed_pw_017', 'technician', 'CAM003'),
('TEC018', 'Santos', 'Virgilio', 'Bello', 'v.santos@bicol-u.edu.ph', '09191234518', 'vsantos', 'hashed_pw_018', 'technician', 'CAM003'),
('TEC019', 'Tan', 'Milagros', 'Soriano', 'm.tan@bicol-u.edu.ph', '09171234519', 'mtan', 'hashed_pw_019', 'technician', 'CAM003'),
('TEC020', 'Umali', 'Gregorio', 'Padilla', 'g.umali@bicol-u.edu.ph', '09181234520', 'gumali', 'hashed_pw_020', 'technician', 'CAM004'),
('TEC021', 'Valdez', 'Resurreccion', 'Hidalgo', 'r.valdez@bicol-u.edu.ph', '09191234521', 'rvaldez', 'hashed_pw_021', 'technician', 'CAM005'),
('TEC022', 'Wenceslao', 'Pacita', 'Mercado', 'p.wenceslao@bicol-u.edu.ph', '09171234522', 'pwenceslao', 'hashed_pw_022', 'technician', 'CAM006'),
('TEC023', 'Xavier', 'Romulo', 'Castillo', 'r.xavier@bicol-u.edu.ph', '09181234523', 'rxavier', 'hashed_pw_023', 'technician', 'CAM007'),
('TEC024', 'Yap', 'Generosa', 'Tolosa', 'g.yap@bicol-u.edu.ph', '09191234524', 'gyap', 'hashed_pw_024', 'technician', 'CAM001'),
('TEC025', 'Zulueta', 'Edmundo', 'Peralta', 'e.zulueta@bicol-u.edu.ph', '09171234525', 'ezulueta', 'hashed_pw_025', 'technician', 'CAM001');

-- --------------------------------------------------------

--
-- Table structure for table `tech_skill`
--

CREATE TABLE `tech_skill` (
  `tech_id` varchar(6) NOT NULL,
  `skill_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tech_skill`
--

INSERT INTO `tech_skill` (`tech_id`, `skill_id`) VALUES
('TEC008', 'SKL001'),
('TEC008', 'SKL002'),
('TEC008', 'SKL003'),
('TEC009', 'SKL006'),
('TEC009', 'SKL007'),
('TEC009', 'SKL008'),
('TEC009', 'SKL009'),
('TEC010', 'SKL010'),
('TEC010', 'SKL011'),
('TEC010', 'SKL012'),
('TEC011', 'SKL001'),
('TEC011', 'SKL004'),
('TEC011', 'SKL005'),
('TEC012', 'SKL014'),
('TEC012', 'SKL015'),
('TEC012', 'SKL017'),
('TEC013', 'SKL006'),
('TEC013', 'SKL007'),
('TEC013', 'SKL018'),
('TEC013', 'SKL019'),
('TEC014', 'SKL010'),
('TEC014', 'SKL012'),
('TEC014', 'SKL013'),
('TEC015', 'SKL001'),
('TEC015', 'SKL002'),
('TEC015', 'SKL004'),
('TEC016', 'SKL014'),
('TEC016', 'SKL015'),
('TEC016', 'SKL016'),
('TEC017', 'SKL006'),
('TEC017', 'SKL007'),
('TEC017', 'SKL009'),
('TEC018', 'SKL010'),
('TEC018', 'SKL011'),
('TEC018', 'SKL013'),
('TEC019', 'SKL001'),
('TEC019', 'SKL003'),
('TEC019', 'SKL005'),
('TEC020', 'SKL001'),
('TEC020', 'SKL002'),
('TEC020', 'SKL006'),
('TEC020', 'SKL007'),
('TEC021', 'SKL010'),
('TEC021', 'SKL011'),
('TEC021', 'SKL018'),
('TEC022', 'SKL001'),
('TEC022', 'SKL004'),
('TEC022', 'SKL009'),
('TEC023', 'SKL006'),
('TEC023', 'SKL007'),
('TEC023', 'SKL019'),
('TEC023', 'SKL020'),
('TEC024', 'SKL014'),
('TEC024', 'SKL015'),
('TEC024', 'SKL016'),
('TEC024', 'SKL017'),
('TEC025', 'SKL001'),
('TEC025', 'SKL002'),
('TEC025', 'SKL003'),
('TEC025', 'SKL008');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` varchar(6) NOT NULL,
  `p_category` enum('hardware','software','network','infrastructure','account') NOT NULL,
  `p_desc` text NOT NULL,
  `p_priority` enum('low','medium','high') DEFAULT NULL,
  `status` enum('pending','assigned','ongoing','resolved','closed') NOT NULL,
  `date_reported` datetime NOT NULL,
  `date_resolved` datetime DEFAULT NULL,
  `customer_id` varchar(6) NOT NULL,
  `loc_id` varchar(6) DEFAULT NULL,
  `model_id` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `p_category`, `p_desc`, `p_priority`, `status`, `date_reported`, `date_resolved`, `customer_id`, `loc_id`, `model_id`) VALUES
('TKT001', 'software', 'Application crashing during file compilation.', 'high', 'resolved', '2025-01-08 08:30:00', '2025-01-08 12:00:00', 'CUS001', 'LOC021', 'MDL003'),
('TKT002', 'hardware', 'Blue screen of death when opening Visual Studio.', 'high', 'resolved', '2025-01-09 11:15:00', '2025-01-09 14:30:00', 'CUS002', 'LOC022', 'MDL004'),
('TKT003', 'network', 'Cannot connect to BU WiFi in CS Building. Gets IP error.', 'medium', 'resolved', '2025-01-10 09:00:00', '2025-01-10 12:00:00', 'CUS003', 'LOC028', 'MDL005'),
('TKT004', 'account', 'Cannot log into university portal. Password reset failing.', 'high', 'resolved', '2025-01-11 08:00:00', '2025-01-11 11:45:00', 'CUS004', 'LOC015', 'MDL007'),
('TKT005', 'network', 'Department shared storage inaccessible from laboratory 3.', 'medium', 'resolved', '2025-01-12 11:40:00', '2025-01-12 16:30:00', 'CUS005', 'LOC025', 'MDL008'),
('TKT006', 'hardware', 'Faculty laptop battery swelling and expanding out of casing.', 'high', 'resolved', '2025-01-13 07:15:00', '2025-01-13 13:00:00', 'CUS006', 'LOC004', 'MDL009'),
('TKT007', 'hardware', 'OS corrupt boot loop after security package update.', 'high', 'resolved', '2025-01-14 06:45:00', '2025-01-14 10:30:00', 'CUS006', 'LOC031', 'MDL011'),
('TKT008', 'hardware', 'Classroom monitor flickering during presentation.', 'medium', 'resolved', '2025-01-15 08:00:00', '2025-01-15 17:00:00', 'CUS007', 'LOC002', 'MDL012'),
('TKT009', 'account', 'Faculty email account locked after expired credentials.', 'medium', 'resolved', '2025-01-16 09:12:00', '2025-01-16 16:00:00', 'CUS009', 'LOC011', 'MDL013'),
('TKT010', 'hardware', 'Projector lamp burned out mid-presentation in auditorium.', 'high', 'resolved', '2025-01-17 10:00:00', '2025-01-17 15:30:00', 'CUS008', 'LOC032', 'MDL014'),
('TKT011', 'software', 'Browser hijacking malware popping up malicious ads.', 'high', 'resolved', '2025-01-18 11:30:00', '2025-01-18 17:00:00', 'CUS010', 'LOC019', 'MDL015'),
('TKT012', 'network', 'Office network ethernet jack wall plate dead.', 'medium', 'resolved', '2025-01-19 08:15:00', '2025-01-19 12:00:00', 'CUS011', 'LOC018', 'MDL016'),
('TKT013', 'account', 'Student portal access denied despite correct credentials.', 'medium', 'resolved', '2025-01-19 13:00:00', '2025-01-19 16:10:00', 'CUS012', 'LOC020', 'MDL017'),
('TKT014', 'hardware', 'RAM on faculty desktop faulty and causing blue screens.', 'high', 'resolved', '2025-01-20 06:00:00', '2025-01-20 08:15:00', 'CUS012', 'LOC029', 'MDL018'),
('TKT015', 'network', 'Persistent slow response and packet drops on lab terminal.', 'low', 'resolved', '2025-01-21 08:10:00', '2025-01-21 11:30:00', 'CUS013', 'LOC022', 'MDL025'),
('TKT016', 'software', 'MS Office activation failing to accept institutional key.', 'medium', 'resolved', '2025-01-21 09:15:00', '2025-01-21 15:00:00', 'CUS014', 'LOC001', 'MDL026'),
('TKT017', 'account', 'ERP account registration blocking semester enrollment.', 'high', 'resolved', '2025-01-22 07:30:00', '2025-01-22 14:00:00', 'CUS015', 'LOC016', 'MDL027'),
('TKT018', 'hardware', 'Processor cooling fans rattling with temperature alerts.', 'low', 'resolved', '2025-01-22 11:00:00', '2025-01-22 17:00:00', 'CUS016', 'LOC017', 'MDL028'),
('TKT019', 'network', 'Lab network path errors preventing printing.', 'low', 'resolved', '2025-01-23 07:45:00', '2025-01-23 10:00:00', 'CUS017', 'LOC026', 'MDL001'),
('TKT020', 'network', 'IP address conflict error blocking connection on tablet.', 'low', 'resolved', '2025-01-22 14:00:00', '2025-01-22 18:00:00', 'CUS019', 'LOC006', 'MDL002'),
('TKT027', 'hardware', 'Patch bay connections scorched in server room.', 'high', 'resolved', '2025-02-07 14:00:00', '2025-02-07 16:30:00', 'CUS005', 'LOC030', 'MDL011'),
('TKT033', 'hardware', 'Video connection strip loose in laboratory display unit.', 'medium', 'resolved', '2025-02-14 13:00:00', '2025-02-14 15:20:00', 'CUS007', 'LOC022', 'MDL012'),
('TKT035', 'infrastructure', 'Node boundaries exposed to rain causing signal issues.', 'high', 'resolved', '2025-02-17 10:00:00', '2025-02-17 14:30:00', 'CUS009', 'LOC030', 'MDL011'),
('TKT039', 'hardware', 'Cooling block fluid levels critically low on server unit.', 'high', 'resolved', '2025-02-20 04:00:00', '2025-02-20 05:30:00', 'CUS011', 'LOC017', 'MDL018'),
('TKT043', 'hardware', 'Lab printer jamming during heavy student volume.', 'medium', 'ongoing', '2025-02-24 10:15:00', NULL, 'CUS003', 'LOC021', 'MDL001'),
('TKT044', 'software', 'CAD software failing to save complex drawing renders.', 'high', 'assigned', '2025-02-24 14:30:00', NULL, 'CUS015', 'LOC055', 'MDL013'),
('TKT045', 'network', 'Wireless drops in the Dean\'s assembly hall.', 'medium', 'ongoing', '2025-02-25 09:00:00', NULL, 'CUS031', 'LOC001', 'MDL002'),
('TKT046', 'account', 'Faculty portal locked due to failed validation checks.', 'low', 'pending', '2025-02-25 11:15:00', NULL, 'CUS032', 'LOC011', NULL),
('TKT047', 'infrastructure', 'Power drop box failure causing laboratory blackout.', 'high', 'closed', '2025-02-26 08:00:00', '2025-02-26 10:00:00', 'CUS014', 'LOC022', 'MDL001'),
('TKT048', 'network', 'Sudden drop in connection speed at library computer center.', 'medium', 'resolved', '2025-02-26 09:30:00', '2025-02-26 11:45:00', 'CUS001', 'LOC019', 'MDL005'),
('TKT049', 'software', 'Missing driver configurations for newly mounted scanners.', 'low', 'pending', '2025-02-27 08:15:00', NULL, 'CUS020', 'LOC007', 'MDL001'),
('TKT050', 'software', 'Security certificate warnings blocking academic dashboard.', 'high', 'ongoing', '2025-02-27 13:00:00', NULL, 'CUS002', 'LOC016', 'MDL002');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_device`
--

CREATE TABLE `ticket_device` (
  `ticket_id` varchar(6) NOT NULL,
  `device_id` varchar(6) NOT NULL,
  `dev_status` enum('pending','repairing','fixed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_device`
--

INSERT INTO `ticket_device` (`ticket_id`, `device_id`, `dev_status`) VALUES
('TKT001', 'DEV026', 'pending'),
('TKT001', 'DEV027', 'pending'),
('TKT005', 'DEV028', 'repairing'),
('TKT005', 'DEV029', 'pending'),
('TKT005', 'DEV030', 'pending'),
('TKT010', 'DEV031', 'fixed'),
('TKT010', 'DEV032', 'fixed'),
('TKT012', 'DEV033', 'fixed'),
('TKT012', 'DEV034', 'fixed'),
('TKT014', 'DEV035', 'fixed'),
('TKT015', 'DEV036', 'fixed'),
('TKT015', 'DEV037', 'fixed'),
('TKT027', 'DEV038', 'fixed'),
('TKT027', 'DEV039', 'fixed'),
('TKT033', 'DEV040', 'fixed'),
('TKT033', 'DEV041', 'fixed'),
('TKT035', 'DEV042', 'repairing'),
('TKT039', 'DEV043', 'fixed'),
('TKT043', 'DEV044', 'fixed');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_kb`
--

CREATE TABLE `ticket_kb` (
  `ticket_id` varchar(6) NOT NULL,
  `article_id` varchar(6) NOT NULL,
  `tech_id` varchar(6) NOT NULL,
  `referenced_at` datetime NOT NULL,
  `was_helpful` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_kb`
--

INSERT INTO `ticket_kb` (`ticket_id`, `article_id`, `tech_id`, `referenced_at`, `was_helpful`) VALUES
('TKT001', 'KB001', 'TEC008', '2025-01-09 09:15:00', 1),
('TKT002', 'KB002', 'TEC009', '2025-01-11 09:30:00', 1),
('TKT003', 'KB003', 'TEC010', '2025-01-13 09:30:00', 1),
('TKT004', 'KB004', 'TEC013', '2025-01-14 09:15:00', 0),
('TKT005', 'KB005', 'TEC008', '2025-01-15 10:30:00', 1),
('TKT006', 'KB006', 'TEC011', '2025-02-04 09:30:00', NULL),
('TKT007', 'KB007', 'TEC014', '2025-02-06 09:00:00', NULL),
('TKT008', 'KB008', 'TEC009', '2025-02-10 14:30:00', NULL),
('TKT009', 'KB009', 'TEC011', '2025-02-11 11:30:00', NULL),
('TKT011', 'KB003', 'TEC015', '2025-02-02 09:30:00', 1),
('TKT012', 'KB009', 'TEC024', '2025-02-13 09:00:00', NULL),
('TKT014', 'KB010', 'TEC016', '2025-01-23 08:30:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_log`
--

CREATE TABLE `ticket_log` (
  `log_id` varchar(6) NOT NULL,
  `timestamp` datetime NOT NULL,
  `action_type` enum('created','assigned','ongoing','resolved','escalated','closed','reopened') NOT NULL,
  `action_desc` text NOT NULL,
  `solution_desc` text DEFAULT NULL,
  `triggered_by` enum('system','technician','customer') NOT NULL,
  `tech_id` varchar(6) DEFAULT NULL,
  `customer_id` varchar(6) DEFAULT NULL,
  `ticket_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_log`
--

INSERT INTO `ticket_log` (`log_id`, `timestamp`, `action_type`, `action_desc`, `solution_desc`, `triggered_by`, `tech_id`, `customer_id`, `ticket_id`) VALUES
('LOG001', '2025-01-08 09:30:00', 'created', 'Ticket created for MS Office activation issue.', NULL, 'technician', 'TEC008', 'CUS014', 'TKT016'),
('LOG002', '2025-01-08 11:45:00', 'resolved', 'Activation key applied successfully.', 'Used volume license key from admin portal.', 'technician', 'TEC008', 'CUS014', 'TKT016'),
('LOG003', '2025-01-09 13:15:00', 'created', 'Ticket created for projector lamp issue.', NULL, 'technician', 'TEC012', 'CUS008', 'TKT010'),
('LOG004', '2025-01-09 14:20:00', 'resolved', 'Projector lamp replaced.', 'Swapped burned bulb with spare unit from inventory.', 'technician', 'TEC012', 'CUS008', 'TKT010'),
('LOG005', '2025-01-10 10:15:00', 'created', 'Ticket created for WiFi connectivity issue.', NULL, 'technician', 'TEC015', 'CUS003', 'TKT003'),
('LOG006', '2025-01-10 11:50:00', 'resolved', 'WiFi issue resolved.', 'Reconfigured DHCP lease on access point.', 'technician', 'TEC015', 'CUS003', 'TKT003'),
('LOG007', '2025-01-11 09:45:00', 'assigned', 'Ticket assigned to technician.', NULL, 'system', 'TEC011', 'CUS004', 'TKT004'),
('LOG008', '2025-01-11 11:30:00', 'resolved', 'Portal login restored.', 'Account password reset via admin override.', 'technician', 'TEC011', 'CUS004', 'TKT004'),
('LOG009', '2025-01-12 14:30:00', 'created', 'Ticket created for BSOD issue.', NULL, 'technician', 'TEC022', 'CUS002', 'TKT002'),
('LOG010', '2025-01-12 16:15:00', 'resolved', 'BSOD resolved after RAM replacement.', 'Faulty RAM stick identified via memtest and replaced.', 'technician', 'TEC022', 'CUS002', 'TKT002'),
('LOG011', '2025-01-13 10:00:00', 'created', 'Ticket created for desktop RAM issue.', NULL, 'technician', 'TEC018', 'CUS012', 'TKT014'),
('LOG012', '2025-01-13 12:45:00', 'resolved', 'RAM replaced on faculty desktop.', 'Upgraded with compatible DDR4 module from stock.', 'technician', 'TEC018', 'CUS012', 'TKT014'),
('LOG013', '2025-01-14 08:30:00', 'created', 'Ticket created for IP conflict issue.', NULL, 'technician', 'TEC020', 'CUS019', 'TKT020'),
('LOG014', '2025-01-14 10:15:00', 'resolved', 'IP conflict cleared.', 'Flushed DNS and released/renewed IP address.', 'technician', 'TEC020', 'CUS019', 'TKT020'),
('LOG015', '2025-01-15 10:00:00', 'created', 'Ticket created for locked email account.', NULL, 'technician', 'TEC009', 'CUS009', 'TKT009'),
('LOG016', '2025-01-15 15:30:00', 'resolved', 'Email account unlocked.', 'Credential expiry extended and account reactivated.', 'technician', 'TEC009', 'CUS009', 'TKT009'),
('LOG017', '2025-01-16 11:00:00', 'created', 'Ticket created for shared storage issue.', NULL, 'technician', 'TEC010', 'CUS005', 'TKT005'),
('LOG018', '2025-01-16 14:45:00', 'resolved', 'Shared storage access restored.', 'Network path remapped and permissions corrected.', 'technician', 'TEC010', 'CUS005', 'TKT005'),
('LOG019', '2025-01-17 12:00:00', 'created', 'Ticket created for OS boot loop.', NULL, 'technician', 'TEC013', 'CUS006', 'TKT007'),
('LOG020', '2025-01-17 14:50:00', 'resolved', 'Boot loop resolved.', 'Performed clean OS reinstall and restored user data.', 'technician', 'TEC013', 'CUS006', 'TKT007'),
('LOG021', '2025-01-18 14:00:00', 'created', 'Ticket created for ERP account issue.', NULL, 'technician', 'TEC017', 'CUS015', 'TKT017'),
('LOG022', '2025-01-18 16:30:00', 'resolved', 'ERP account registration completed.', 'Manually enrolled student in ERP portal.', 'technician', 'TEC017', 'CUS015', 'TKT017'),
('LOG023', '2025-01-19 10:00:00', 'created', 'Ticket created for ethernet jack issue.', NULL, 'technician', 'TEC025', 'CUS011', 'TKT012'),
('LOG024', '2025-01-19 11:45:00', 'resolved', 'Ethernet jack replaced.', 'Re-terminated RJ45 connector on wall plate.', 'technician', 'TEC025', 'CUS011', 'TKT012'),
('LOG025', '2025-01-20 08:00:00', 'created', 'Ticket created for swelling battery.', NULL, 'technician', 'TEC024', 'CUS006', 'TKT006'),
('LOG026', '2025-01-20 08:12:00', 'resolved', 'Battery safely removed and replaced.', 'Swollen battery disposed safely, new unit installed.', 'technician', 'TEC024', 'CUS006', 'TKT006'),
('LOG027', '2025-01-21 10:00:00', 'created', 'Ticket created for malware issue.', NULL, 'technician', 'TEC011', 'CUS010', 'TKT011'),
('LOG028', '2025-01-21 11:15:00', 'resolved', 'Malware removed.', 'Full antivirus scan run, browser extensions cleaned.', 'technician', 'TEC011', 'CUS010', 'TKT011'),
('LOG029', '2025-01-21 14:00:00', 'created', 'Ticket created for flickering monitor.', NULL, 'technician', 'TEC014', 'CUS007', 'TKT008'),
('LOG030', '2025-01-21 14:45:00', 'resolved', 'Monitor flicker fixed.', 'Display cable replaced, signal stabilized.', 'technician', 'TEC014', 'CUS007', 'TKT008'),
('LOG031', '2025-01-22 09:30:00', 'created', 'Ticket created for packet drop issue.', NULL, 'technician', 'TEC016', 'CUS013', 'TKT015'),
('LOG032', '2025-01-22 11:00:00', 'resolved', 'Network drops resolved.', 'Access point antenna rebalanced for coverage.', 'technician', 'TEC016', 'CUS013', 'TKT015'),
('LOG033', '2025-01-22 13:45:00', 'created', 'Ticket created for portal access denial.', NULL, 'technician', 'TEC019', 'CUS012', 'TKT013'),
('LOG034', '2025-01-22 16:30:00', 'resolved', 'Portal access granted.', 'Account permissions updated in admin panel.', 'technician', 'TEC019', 'CUS012', 'TKT013'),
('LOG035', '2025-01-23 09:00:00', 'created', 'Ticket created for application crash.', NULL, 'technician', 'TEC021', 'CUS001', 'TKT001'),
('LOG036', '2025-01-23 09:45:00', 'resolved', 'Application crash resolved.', 'Reinstalled compiler dependencies and updated libraries.', 'technician', 'TEC021', 'CUS001', 'TKT001'),
('LOG037', '2025-01-24 10:00:00', 'created', 'Ticket created for CPU fan rattling.', NULL, 'technician', 'TEC023', 'CUS016', 'TKT018'),
('LOG038', '2025-01-24 11:00:00', 'resolved', 'Cooling fan issue fixed.', 'Reseated heatsink and applied fresh thermal paste.', 'technician', 'TEC023', 'CUS016', 'TKT018'),
('LOG039', '2025-01-25 14:00:00', 'created', 'Ticket created for network printing issue.', NULL, 'technician', 'TEC008', 'CUS017', 'TKT019'),
('LOG040', '2025-01-25 15:15:00', 'resolved', 'Network print path restored.', 'Corrected network path and printer queue flushed.', 'technician', 'TEC008', 'CUS017', 'TKT019'),
('LOG041', '2025-02-24 09:10:00', 'ongoing', 'Technician on-site for printer jam.', NULL, 'technician', 'TEC008', 'CUS038', 'TKT043'),
('LOG042', '2025-02-24 10:45:00', 'ongoing', 'Technician investigating CAD save failure.', NULL, 'technician', 'TEC009', 'CUS039', 'TKT044'),
('LOG043', '2025-02-25 13:30:00', 'ongoing', 'Technician diagnosing wireless drops.', NULL, 'technician', 'TEC012', 'CUS040', 'TKT045'),
('LOG044', '2025-02-25 14:15:00', 'ongoing', 'Technician reviewing portal validation failure.', NULL, 'technician', 'TEC015', 'CUS041', 'TKT046'),
('LOG045', '2025-02-26 09:45:00', 'closed', 'Ticket closed after power restoration confirmed.', NULL, 'system', NULL, 'CUS042', 'TKT047'),
('LOG046', '2025-02-26 11:20:00', 'closed', 'Ticket closed after speed restored.', NULL, 'system', NULL, 'CUS043', 'TKT048'),
('LOG047', '2025-02-27 08:35:00', 'assigned', 'Technician assigned to scanner driver issue.', NULL, 'system', 'TEC020', 'CUS044', 'TKT049'),
('LOG048', '2025-02-27 15:10:00', 'assigned', 'Technician assigned to certificate warning issue.', NULL, 'system', 'TEC011', 'CUS045', 'TKT050');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`building_id`),
  ADD KEY `fk_building_campus` (`campus_id`);

--
-- Indexes for table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`campus_id`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`college_id`),
  ADD KEY `fk_college_campus` (`campus_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `uq_cust_email` (`c_email`),
  ADD UNIQUE KEY `uq_cust_username` (`c_username`),
  ADD KEY `fk_customer_dept` (`dept_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD KEY `fk_dept_college` (`college_id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `device_history`
--
ALTER TABLE `device_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `fk_dh_device` (`device_id`),
  ADD KEY `fk_dh_tech` (`tech_id`),
  ADD KEY `fk_dh_ticket` (`ticket_id`),
  ADD KEY `fk_dh_log` (`log_id`);

--
-- Indexes for table `device_model`
--
ALTER TABLE `device_model`
  ADD PRIMARY KEY (`model_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD UNIQUE KEY `uq_feedback_ticket` (`ticket_id`);

--
-- Indexes for table `institutional`
--
ALTER TABLE `institutional`
  ADD PRIMARY KEY (`device_id`),
  ADD UNIQUE KEY `uq_asset_tag` (`asset_tag`),
  ADD KEY `fk_inst_location` (`loc_id`),
  ADD KEY `fk_inst_model` (`model_id`);

--
-- Indexes for table `inventory_item`
--
ALTER TABLE `inventory_item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `knowledge_base`
--
ALTER TABLE `knowledge_base`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`loc_id`),
  ADD KEY `fk_location_building` (`building_id`);

--
-- Indexes for table `material_used`
--
ALTER TABLE `material_used`
  ADD PRIMARY KEY (`material_id`),
  ADD KEY `fk_mat_log` (`log_id`),
  ADD KEY `fk_mat_item` (`item_id`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`device_id`),
  ADD KEY `fk_personal_owner` (`owner_id`),
  ADD KEY `fk_personal_model` (`model_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`sched_id`),
  ADD KEY `fk_schedule_ticket` (`ticket_id`);

--
-- Indexes for table `sched_assign`
--
ALTER TABLE `sched_assign`
  ADD PRIMARY KEY (`sched_id`,`tech_id`),
  ADD KEY `fk_sa_tech` (`tech_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `uq_student_no` (`student_no`);

--
-- Indexes for table `technical_support`
--
ALTER TABLE `technical_support`
  ADD PRIMARY KEY (`tech_id`),
  ADD UNIQUE KEY `uq_tech_email` (`t_email`),
  ADD UNIQUE KEY `uq_tech_username` (`t_username`),
  ADD KEY `fk_tech_campus` (`campus_id`);

--
-- Indexes for table `tech_skill`
--
ALTER TABLE `tech_skill`
  ADD PRIMARY KEY (`tech_id`,`skill_id`),
  ADD KEY `fk_ts_skill` (`skill_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `fk_ticket_customer` (`customer_id`),
  ADD KEY `fk_ticket_location` (`loc_id`),
  ADD KEY `fk_ticket_model` (`model_id`);

--
-- Indexes for table `ticket_device`
--
ALTER TABLE `ticket_device`
  ADD PRIMARY KEY (`ticket_id`,`device_id`),
  ADD KEY `fk_td_device` (`device_id`);

--
-- Indexes for table `ticket_kb`
--
ALTER TABLE `ticket_kb`
  ADD PRIMARY KEY (`ticket_id`,`article_id`),
  ADD KEY `fk_tkb_article` (`article_id`),
  ADD KEY `fk_tkb_tech` (`tech_id`);

--
-- Indexes for table `ticket_log`
--
ALTER TABLE `ticket_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_log_tech` (`tech_id`),
  ADD KEY `fk_log_customer` (`customer_id`),
  ADD KEY `fk_log_ticket` (`ticket_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `building`
--
ALTER TABLE `building`
  ADD CONSTRAINT `fk_building_campus` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`) ON UPDATE CASCADE;

--
-- Constraints for table `college`
--
ALTER TABLE `college`
  ADD CONSTRAINT `fk_college_campus` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`) ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `fk_dept_college` FOREIGN KEY (`college_id`) REFERENCES `college` (`college_id`) ON UPDATE CASCADE;

--
-- Constraints for table `device_history`
--
ALTER TABLE `device_history`
  ADD CONSTRAINT `fk_dh_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dh_log` FOREIGN KEY (`log_id`) REFERENCES `ticket_log` (`log_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dh_tech` FOREIGN KEY (`tech_id`) REFERENCES `technical_support` (`tech_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dh_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON UPDATE CASCADE;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `fk_faculty_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_feedback_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON UPDATE CASCADE;

--
-- Constraints for table `institutional`
--
ALTER TABLE `institutional`
  ADD CONSTRAINT `fk_inst_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inst_location` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inst_model` FOREIGN KEY (`model_id`) REFERENCES `device_model` (`model_id`) ON UPDATE CASCADE;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk_location_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON UPDATE CASCADE;

--
-- Constraints for table `material_used`
--
ALTER TABLE `material_used`
  ADD CONSTRAINT `fk_mat_item` FOREIGN KEY (`item_id`) REFERENCES `inventory_item` (`item_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mat_log` FOREIGN KEY (`log_id`) REFERENCES `ticket_log` (`log_id`) ON UPDATE CASCADE;

--
-- Constraints for table `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personal_model` FOREIGN KEY (`model_id`) REFERENCES `device_model` (`model_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personal_owner` FOREIGN KEY (`owner_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `fk_schedule_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON UPDATE CASCADE;

--
-- Constraints for table `sched_assign`
--
ALTER TABLE `sched_assign`
  ADD CONSTRAINT `fk_sa_schedule` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sa_tech` FOREIGN KEY (`tech_id`) REFERENCES `technical_support` (`tech_id`) ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technical_support`
--
ALTER TABLE `technical_support`
  ADD CONSTRAINT `fk_tech_campus` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tech_skill`
--
ALTER TABLE `tech_skill`
  ADD CONSTRAINT `fk_ts_skill` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ts_tech` FOREIGN KEY (`tech_id`) REFERENCES `technical_support` (`tech_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ticket_location` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ticket_model` FOREIGN KEY (`model_id`) REFERENCES `device_model` (`model_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ticket_device`
--
ALTER TABLE `ticket_device`
  ADD CONSTRAINT `fk_td_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_td_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_kb`
--
ALTER TABLE `ticket_kb`
  ADD CONSTRAINT `fk_tkb_article` FOREIGN KEY (`article_id`) REFERENCES `knowledge_base` (`article_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tkb_tech` FOREIGN KEY (`tech_id`) REFERENCES `technical_support` (`tech_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tkb_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_log`
--
ALTER TABLE `ticket_log`
  ADD CONSTRAINT `fk_log_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_log_tech` FOREIGN KEY (`tech_id`) REFERENCES `technical_support` (`tech_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_log_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
