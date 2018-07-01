# Clinic Management System - Made using C#, ASP.net
A fully featured Clinic Management System having a well designed Database Schema made as a final project for the course "Database Systems CS203". 

## Technologies Used:

For Frontend: HTML, CSS, BootStrap, JavaScript
For Backend: C#, ASP.NET
For Database: SQL

### Tools:
[Microsoft Visual Studio](https://visualstudio.microsoft.com/vs/community/)

[Microsoft SQL Server Management Studio (SSMS)](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017)

## Functionalities Implemented:
Our project revolves around three major classes of users. Characteristics of each class is listed below

### 1. Patient:

**1.	Patient Home** – Patient can view his profile

**2.	Current Appointment** – Patient can view if he has some pending or approved appointment with a doctor 

**3.	Bills History** – Patient can view the bill history of appointments that have been completed

**4.	Treatment History** – Patient can view the treatment history of appointments which have been completed

**5.	Take Appointment** – Patient can view all the departments, and then can select one dept. Then the doctors of that dept are shown. Then patient selects one doctor and the doctor’s profile is then shown along with a ‘take appointment’ button. When the button is clicked, the free slots of that particular doctor are shown. Patient selects a free slot of his choice and then sends request for that free slot to the doctor. The doctor will then approve/reject it.

**6.	Notifications** – In this tab, a notification is shown whenever the doctor accepts/rejects the requested appointment.

**7.	Feedback** – After a appointment is completed, patient can give feedback about that appointment by rating it from 1 – 5

**8.**	A patient can request for only one appointment at a time and will not be allowed to take more than one appointments until the last appointment has been completed.

### 2. Doctor:

**1.	DoctorProfile**: Doctor can see his own profile

**2.	PendingAppointments**: Doctor can see all the pending appointments against his doctor ID.

**3.	TodaysAppointmemts**: the appointments for current day will be shown.The doctor then can select/reject any appointment of that day

**4.	HistoryUpdate**: He can update prescription,disease and progress of patient 

**5.	GenerateBill**: He will then generate the bill

**6.	PatientHistory**: Doctor will be able to see the treatment history of all his treated patients. 

### 3. Administrator:

**1. Admin Home**: Admin can view Clinic stats which includes weekly appointments, income of the Clinic. No of registered patients and doctors along with the list of departments 

**2.	View Doctors**: Admin can view the list of doctors currently registered along with their departments and other information. Complete profile will be shown when clicked.

**3.	View Patients**: Admin can view the list of patients currently registered along with their phone numbers and ids. Complete profile will be shown when clicked.

**4.	View Other Staff**: Admin can view other staff members along with their designations.

**5.	Search Box**: Admin can search for a specific employ within the company by name

**6.	Add/Remove**: Admin can Add/remove doctors patients and other staff members form the clinic.


## How to Run

## Interface

<p float="left">
  <img src="/img1.png" width="100" />
  <img src="/img2.png" width="100" /> 
  <img src="/img3.png" width="100" />
</p>





