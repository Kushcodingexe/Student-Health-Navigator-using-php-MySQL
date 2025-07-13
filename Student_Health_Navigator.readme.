
Student Health Navigator:


Backend SQL file(dbms_projectSQL.sql):

It creates tables for employees including the doctors and administrators with different roles.
Other tables manage patient registrations, track appointments, link patients with their respective doctors and captures details of prescribed treatments. 
Triggers are also used to apply constraints like the doctor fees not exceeding 1000.

SQL Commands Used in the Backend code:

CREATE TABLE: Used to create new tables with specified fields.
ALTER TABLE: Used to add constraints like the primary key and auto-increment.
INSERT INTO: Used to add data into tables.
CREATE TRIGGER: Used to create triggers for automatic actions on table changes.
CREATE PROCEDURE: Used to define stored procedures for custom functionalities.
SET: Used to set SQL modes and configurations.

Tables Details:

1. employee
Purpose:
To manage and store information about all employees in the healthcare system including doctors and receptionists.
Fields:
emp_id: It is the unique identifier for the employee.
username: Username for login authentication.
password: Password for login authentication.
email: Email address for communication.
role: Role of the employee (so Doctor or Admin).
specialty: Specialization of the employee (just for doctors).
Role:
It acts as the primary table for storing the general employee information and it is a reference for other employee-related tables.

2. admintb
Purpose:
To manage the administrator accounts.
Fields:
email: Email address for communication.
username: Username for login authentication.
password: Password for login authentication.
emp_id: Foreign key which links to employee table for the corresponding employee.
Role:
Provides a specific table to manage and authenticate administrators within the system.

3. appointmenttb
Purpose:
To track and manage appointments between the patients and doctors.
Fields:
pid: Patient ID for identification.
ID: Unique appointment identifier.
fname: First name of the patient.
lname: Last name of the patient.
gender: Gender of the patient.
email: Email address of the patient.
contact: Contact number of the patient.
doctor: Doctor assigned to the appointment.
docFees: Fees charged by the doctor for the appointment.
appdate: Date of the appointment.
apptime: Time of the appointment.
userStatus: Status indicator for the patient's presence.
doctorStatus: Status indicator for the doctor's presence.
Role:
Manages appointment scheduling, tracks patient-doctor interactions and captures appointment details.

4. contact
Purpose:
To store messages or inquiries which are sent through a contact form.
Fields:
name: Name of the person sending the message.
email: Email address of the person sending the message.
contact: Contact number of the person sending the message.
message: Content of the message or inquiry.
Role:
Receives and stores communication sent through the contact form for reference or follow-up.

5. doctb
Purpose:
To store details about the registered doctors.
Fields:
username: Username for login authentication.
password: Password for login authentication.
email: Email address for communication.
spec: Specialization of the doctor.
docFees: Fees charged by the doctor for consultation.
emp_id: Foreign key linking to employee table for the corresponding employee.
Role:
Manages doctor-specific details and serves as a reference for doctor-related operations.

6. patreg
Purpose:
To manage patient registration details.
Fields:
pid: Unique patient identifier.
fname: First name of the patient.
lname: Last name of the patient.
gender: Gender of the patient.
email: Email address of the patient.
contact: Contact number of the patient.
password: Password for patient portal access.
cpassword: Confirm password for verification.
Role:
Stores information about registered patients and manages patient-related operations.

7. prestb
Purpose:
To store all the prescription details provided by doctors to patients.
Fields:
doctor: Doctor providing the prescription.
pid: Patient ID for identification.
ID: Unique prescription identifier.
fname: First name of the patient.
lname: Last name of the patient.
appdate: Date of the appointment.
apptime: Time of the appointment.
disease: It is the diagnosed disease or condition.
allergy: Any known allergies.
prescription: Medication or treatment prescribed.
Role:
Records the medication and treatment information prescribed by doctors to patients.

Triggers:

check_doc_fees:
Ensures that the doctor fees do not exceed 1000 before inserting into the doctb table.

doctor_to_employee:
Automatically inserts the employee details when a new doctor is added to the doctb table.

receptionist_to_employee:
Automatically inserts employee details when a new receptionist is added to to the admintb table.

delete_doctor_to_employee:
Deletes the corresponding employee details when a doctor is removed from the doctb table.

delete_receptionist_to_employee:
Deletes corresponding employee details when a receptionist is removed from the admintb table.

Stored Procedure:

disp_table: Allows the table display by accepting table names as input and then executes a SELECT query to retrieve the table content.


Frontend (HTML, php, CSS):

Improvements that can be made for Future Scope:

Doctor Appointment Acceptance: Enabling doctors to accept appointments, providing patients with acknowledgment of approved appointments.
Email ID Duplication Check: Ensuring users cannot register with an email ID that's already registered in the system.
Password Encryption: Encrypting passwords for security, with the password field hidden in the admin panel for confidentiality.
Pagination Across Lists: Implementing pagination for all list views within the application for easier navigation and improved user experience.
Bug Fix - Bill Payment Receipts: Resolving a bug where bill payment receipts contain multiple records if a patient has multiple associations with the same doctor.
Enhanced Prescription Statement: Adding more fields to the prescription statement for greater specificity and comprehensive medical records.
Detailed Payment Information: Including additional details in payment records such as payment date, amount paid, and other relevant information.
Export Functionality: Adding an export button in the admin module to export all details to an Excel sheet for easier data management and analysis.


Prerequisites and Software Used:

XAMPP installed on an Ubuntu 19.04 machine, utilizing Apache2 Server and MySQL within the opt/lampp/htdocs/myhmsp directory.
Text editor: Sublime Text 3.2
Web browser: Google Chrome (Version 77.0.3865.90)


Steps to Run the Project:

Download and install XAMPP.
Clone or download the project repository.
Extract files to the 'htdocs' folder in your XAMPP directory.
Start Apache and MySQL in the XAMPP Control Panel.
Access phpMyAdmin to create a new database named 'myhmsdb' and import 'myhmsdb.sql'.
Open a browser tab and navigate to 'localhost/foldername'.
