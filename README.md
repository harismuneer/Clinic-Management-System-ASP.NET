# Clinic Management System - Made using C#, ASP.net


[](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017)

## Project Overview:
We will be making a clinic management system that will help the patients to get in contact with the doctors and to see their clinical history. It will eliminate all the efforts that were required to get appointments manually and the patients will no longer have to keep their records with them. They will be available at one place. The patients will have their accounts on our website where all their clinical records will be kept safe. There will be a separate interface for Doctors and Patients along with their separate logins. The registration forms for the patients will be provided which will register the patients for the database. Also, the Admin of the Clinic will be able to search the patients through their names, Patient ID etc. The website will have the information regarding different departments of the clinic. It will also help the doctors to keep track of their current appointments given to patients. The patient after knowing about the clinic would be able to make appointment. Moreover, the doctor will be able to see the clinical history of his patient. After all the treatment, the patient would also be able to give feedback about the doctor.



Patient:

Functionalities Implemented:

1.	Patient Home – Patient can view his profile
2.	Current Appointment – Patient can view if he has some pending or approved appointment with a doctor 
3.	Bills History – Patient can view the bill history of appointments that have been completed
4.	Treatment History – Patient can view the treatment history of appointments which have been completed
5.	Take Appointment – Patient can view all the departments, and then can select one dept. Then the doctors of that dept are shown. Then patient selects one doctor and the doctor’s profile is then shown along with a ‘take appointment’ button. When the button is clicked, the free slots of that particular doctor are shown. Patient selects a free slot of his choice and then sends request for that free slot to the doctor. The doctor will then approve/reject it.
6.	Notifications – In this tab, a notification is shown whenever the doctor accepts/rejects the requested appointment.
7.	Feedback – After a appointment is completed, patient can give feedback about that appointment by rating it from 1 – 5
8.	A patient can request for only one appointment at a time and will not be allowed to take more than one appointments until the last appointment has been completed.
Doctor

1.	DoctorProfile: Doctor can see his own profile
2.	PendingAppointments: Doctor can see all the pending appointments against his doctor ID.
3.	TodaysAppointmemts: the appointments for current day will be shown.The doctor then can select/reject any appointment of that day
4.	HistoryUpdate: He can update prescription,disease and progress of patient 
5.	GenerateBill: He will then generate the bill
6.	PatientHistory: Doctor will be able to see the treatment history of all his treated patients. 
administrator:

Functionalities Implemented:

1.	Admin Home
Admin can view Clinic stats which includes weekly appointments, income of the Clinic. No of registered patients and doctors along with the list of departments 





2.	view of doctors
Admin can view the list of doctors currently registered along with their departments and other information. Complete profile will be shown when clicked.
3.	view of patients
admin can view the list of patients currently registered along with their phone numbers and ids. complete profile will be shown when clicked.
4.	view of other staff member
Admin can view other staff members along with their designations.
5.	Search box 
Admin can search for a specific employ within the company by name
6.	Add/remove 
Admin can Add/remove doctors patients and other staff members form the clinic.

total procedures : 31
triggers : 9
function:1
views :8 



