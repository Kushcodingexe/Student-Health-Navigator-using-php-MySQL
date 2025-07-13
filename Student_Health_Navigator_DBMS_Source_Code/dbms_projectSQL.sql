

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `myhmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admintb`
--

CREATE TABLE `employee` (
  `emp_id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `role` ENUM('Doctor', 'Admin') NOT NULL,
  `specialty` VARCHAR(50)
  
)  ;



CREATE TABLE `admintb` (
  `email` VARCHAR(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `emp_id` INT, -- Assuming `emp_id` is the foreign key column
  FOREIGN KEY (`emp_id`) REFERENCES `employee`(`emp_id`)
)  ;

--
-- Dumping data for table `admintb`
--



-- --------------------------------------------------------

--
-- Table structure for table `appointmenttb`
--

CREATE TABLE `appointmenttb` (
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `doctor` varchar(30) NOT NULL,
  `docFees` int(5) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `userStatus` int(5) NOT NULL,
  `doctorStatus` int(5) NOT NULL
)  ;
ALTER TABLE `appointmenttb`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `appointmenttb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Dumping data for table `appointmenttb`
--

INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `apptime`, `userStatus`, `doctorStatus`) VALUES
(1, 1001, 'Amit', 'Mehra', 'Male', 'amitmehra@gmail.com', '1234567890', 'Aarav Patel', 50.00, '2024-04-21', '10:00 AM', 1, 1),
(2, 1002, 'Kush', 'Kapoor', 'Male', 'kushkapoor@gmail.com', '9876543210', 'Rohan Singh', 60.00, '2024-04-22', '11:30 AM', 1, 1),
(3, 1003, 'Shan', 'Tagore', 'Male', 'shantagore@gmail.com', '5556667777', 'Arjun Joshi', 65.00, '2024-04-24', '09:00 AM', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(10) NOT NULL,
  `message` varchar(200) NOT NULL
)  ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `contact`, `message`) VALUES
('Ram Mishra', 'ram@patient.com', '1234567890', 'Would like to inquire about the doctor availability'),
('Aditya Desai', 'ad@example.com', '9876543210', 'Hello, this is Bob. I have a question regarding your services.'),
('Arjun Joshi', 'ajoshi@example.com', '1112223333', 'I would like to inquire about booking an appointment.'),
('Sneha Iyer', 'snehaiyer@example.com', '5556667777', 'Feedback: Your website is user-friendly and informative.');

-- --------------------------------------------------------

--
-- Table structure for table `doctb`
--

CREATE TABLE `doctb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `spec` varchar(50) NOT NULL,
  `docFees` int(10) NOT NULL,
    `emp_id` INT, -- Assuming `emp_id` is the foreign key column
  FOREIGN KEY (`emp_id`) REFERENCES `employee`(`emp_id`)
)  ;
DELIMITER //

-- Trigger for Doctor Fees exceeding 1000

CREATE TRIGGER check_doc_fees
BEFORE INSERT ON doctb
FOR EACH ROW
BEGIN
    IF NEW.docFees > 1000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Doctor fees cannot exceed 1000';
    END IF;
END //

DELIMITER ;

-- Procedure for Displaying Tables
DELIMITER //
CREATE PROCEDURE disp_table(IN tableName VARCHAR(255))
BEGIN
    SET @sql = CONCAT('SELECT * FROM ', tableName);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

DELIMITER //
CREATE Trigger doctor_to_employee BEFORE INSERT ON doctb FOR EACH ROW
BEGIN
INSERT INTO employee(emp_id,username,specialty,email,password,role) VALUES(NEW.emp_id,new.username,new.spec,new.email,new.password,'Doctor');
END //
DELIMITER ;
-- Active: 1713535342314@@127.0.0.1@3306@project
DELIMITER //
CREATE Trigger receptionist_to_employee BEFORE INSERT ON admintb FOR EACH ROW
BEGIN
INSERT INTO employee(emp_id,username,specialty,email,password,role) VALUES(NEW.emp_id,new.username,"Receptionist",new.email,new.password,'Admin');
END //
DELIMITER ;
-- Active: 1713535342314@@127.0.0.1@3306@project
DELIMITER //
CREATE Trigger delete_doctor_to_employee AFTER DELETE ON doctb FOR EACH ROW
BEGIN
delete from employee where emp_id=OLD.emp_id;
END //
DELIMITER ;

-- Active: 1713535342314@@127.0.0.1@3306@project
DELIMITER //
CREATE Trigger delete_receptionist_to_employee AFTER DELETE ON admintb FOR EACH ROW
BEGIN
delete from employee where emp_id=OLD.emp_id;
END //
DELIMITER ;
--
-- Dumping data for table `doctb`
--

INSERT INTO `doctb` (`username`, `password`, `email`, `spec`, `docFees`,`emp_id`) VALUES
('AaravPatel', 'aarav12', 'aarav.patel@hospital.com', 'Dermatologist', 850,1),
('RohanSingh', 'rs1985', 'rohan.singh@hospital.com', 'Psychiatrist', 950,2),
('ArjunJoshi', 'arjun_singh', 'arjun.joshi@hospital.com', 'Neurologist', 900,3);
INSERT INTO `admintb` (`email`,`username`, `password`,`emp_id`) VALUES
('admin@hospital.com','admin', 'admin123','201');

-- --------------------------------------------------------

--
-- Table structure for table `patreg`
--

CREATE TABLE `patreg` (
  `pid` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cpassword` varchar(30) NOT NULL
)  ;
ALTER TABLE `patreg`
  ADD PRIMARY KEY (`pid`);
ALTER TABLE `patreg`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Dumping data for table `patreg`
--

INSERT INTO `patreg` (`pid`, `fname`, `lname`, `gender`, `email`, `contact`, `password`, `cpassword`) VALUES
(101, 'Kush', 'Sahni', 'Male', 'kush@gmail.com', '9876543210', 'kush123', 'kush123'),
(102, 'Shantanu', 'Mishra', 'Male', 'shantanu@gmail.com', '8765432109', 'shantanu123', 'shantanu123'),
(103, 'Keshav', 'Bararia', 'Male', 'keshav@gmail.com', '7654321098', 'keshav123', 'keshav123');

-- --------------------------------------------------------

--
-- Table structure for table `prestb`
--

CREATE TABLE `prestb` (
  `doctor` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `disease` varchar(250) NOT NULL,
  `allergy` varchar(250) NOT NULL,
  `prescription` varchar(1000) NOT NULL
)  ;

--
-- Dumping data for table `prestb`
--

INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `apptime`, `disease`, `allergy`, `prescription`) VALUES
('Aarav Patel', 106, 1, 'Manish', 'Jain', '2024-04-20', '09:00:00', 'Fever', 'None', 'Prescribed Paracetamol for 3 days'),
('Rohan Singh', 107, 2, 'Arhaan', 'Saeed', '2024-04-21', '10:30:00', 'Headache', 'None', 'Prescribed rest and hydration'),
('Arjun Joshi', 108, 3, 'Ranak', 'Sharma', '2024-04-22', '11:00:00', 'Stomachache', 'None', 'Prescribed antacids and light diet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointmenttb`
--


--
-- Indexes for table `patreg`
--


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointmenttb`
--


--
-- AUTO_INCREMENT for table `patreg`
--

COMMIT;


