GO
create database DBProject

GO
use DBProject

go



/*
drop table Appointment
drop table OtherStaff
drop table Patient
drop table LoginTable
drop table Doctor
drop table Department
*/

--------------------------------------------------------
-------------------Creating Tables----------------------

--Type: 1 -- Patient
--Type: 2 -- Doctor
--Type: 3 -- Admin

--Status of Doctor
--  1 -- Present
--  0 -- Left

--Status of Bill
--Paid
--Unpaid

--Status of Appointment
--1-- Approved
--2-- Pending
--3-- Completed
--4-- Rejected

--DoctorNotification
--1--Seen	(Dekh Lya)
--2--Unseen	(Nahi Dekha)

--PatientNotification
--1--Seen	(Dekh Lya)
--2--Unseen	(Nahi Dekha)

--FeedbackStatus
--1--Given	
--2--Pending	

--------------------------------------------------------


create table LoginTable
(
	LoginID int identity(1,1) primary key,
	Password varchar(20) not null,
	Email varchar(30) not null unique,
	Type int not null,
)



create table Patient
(
	PatientID int primary key,
	Name varchar(30) not null,
	Phone char(11),
	Address varchar(40),
	BirthDate Date not null,
	Gender char(1) not null

	foreign key(PatientID) references LoginTable(LoginID)
)



create table Department
(
	DeptNo int primary key,
	DeptName varchar(30) not null unique,
	Description varchar(1000)
)




create table Doctor
(
	DoctorID int primary key,
	Name varchar(30) not null,
	Phone char(11),
	Address varchar(40),
	BirthDate Date not null,
	Gender char(1) not null,

	DeptNo int not null,
	Charges_Per_Visit float not null,
	MonthlySalary float,
	ReputeIndex float,
	Patients_Treated int DEFAULT 0 not null,

	Qualification varchar(100) not null,
	Specialization varchar(100),
	Work_Experience int,

	status int not null   --(Present = 1 or Left = 0)

	foreign key (DeptNo) references Department(DeptNo)
)


create table OtherStaff
(
	StaffID int identity(1,1) primary key,
	Name varchar(30) not null,
	Phone char(11),
	Address varchar(30),
	Designation varchar(15) not null,
	Gender char(1) not null,
	BirthDate Date,
	Highest_Qualification varchar(50),
	Salary float
)


create table Appointment
(
	AppointID int identity(1,1) primary key,
	DoctorID int,
	PatientID int,
	Date Datetime,
	Appointment_Status int,

	Bill_Amount float,
	Bill_Status varchar(10),

	DoctorNotification int,
	PatientNotification int,
	FeedbackStatus int,


	Disease varchar(100),
	Progress varchar(100),
	Prescription varchar(100)

	foreign key (DoctorID) references Doctor(DoctorID) on delete set null,
	foreign key (PatientID) references Patient(PatientID)
)

