

/*
delete from Appointment
delete from Doctor
delete from Patient
delete from Department
delete from OtherStaff
delete from LoginTable
*/

USE DBProject
GO


INSERT INTO LoginTable VALUES ('admin@clinic.com' ,'admin' ,   3)


--DEPARTMENT INSERTION
insert into department values(1 , 'Cardiology' , 'We have the best heart specialists in town .Each one of them is very competent and experienced.')
insert into department values(2 , 'Orthopaedics' , 'Orthopedic surgeons use surgical means to treat musculoskeletal trauma, infections, tumors. We believe in the best.')
insert into department values(3 , 'Ears Nose Throat' , 'They are gentle. And are trained to handle kids as well as adults.')
insert into department values(4 , 'Physiotherapy ',' Physiotherapists work through physical therapies such as exercise, and manipulation of bones, joints and muscle tissues.' )
insert into department values(5 , 'Neurology', 'A medical speciality dealing with disorders of the nervous system. It deals with the diagnosis and treatment of all categories of disease.')



--LOGIN TABLE INSERTIION
INSERT INTO LoginTable(Email, Password, Type) VALUES('farhan@gmail.com', 'abc', 2)
INSERT INTO LoginTable(Email, Password, Type) VALUES('kashan@gmail.com', 'abc', 2)
INSERT INTO LoginTable(Email, Password, Type) VALUES('hassaan@gmail.com', 'abc',2)
INSERT INTO LoginTable(Email, Password, Type) VALUES('haris@gmail.com', 'abc', 2)
INSERT INTO LoginTable(Email, Password, Type) VALUES('alvi@gmail.com', 'abc', 2)
INSERT INTO LoginTable(Email, Password, Type) VALUES('talha@gmail.com', 'abc', 2)
INSERT INTO LoginTable(Email, Password, Type) VALUES('shariq@gmail.com', 'abc', 2)
INSERT INTO LoginTable(Email, Password, Type) VALUES('awais@gmail.com', 'abc', 2)
INSERT INTO LoginTable(Email, Password, Type) VALUES('saifi@gmail.com', 'abc', 2)
INSERT INTO LoginTable(Email, Password, Type) VALUES('mansha@gmail.com', 'abc', 2)

INSERT INTO LoginTable(Email, Password, Type) VALUES('ABC@gmail.com', 'abc', 1)
INSERT INTO LoginTable(Email, Password, Type) VALUES('DEF@gmail.com', 'abc', 1)
INSERT INTO LoginTable(Email, Password, Type) VALUES('XYZ@gmail.com', 'abc', 1)



--DOCTOR INSERTIONS
DECLARE @ID INT
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'farhan@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'Farhan Shoukat', '156133213', 'Enjoy, Lahore', '4-12-1996', 'M', 1, 2500, 30000, 4, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'kashan@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'KASHAN', '156133213', 'Enjoy, Lahore', '12-12-1996', 'M', 1, 3000, 25000, 3.5, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'hassaan@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'HASSAAN', '156133213', 'Enjoy, Lahore', '12-12-1996', 'M', 1, 1500, 20000, 5, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'haris@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'HARIS MUNEER', '156133213', 'Enjoy, Lahore', '05-04-1990', 'M', 1, 1000, 15000, 4.5, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'talha@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'Talha MUNEER', '156133213', 'Enjoy, Lahore', '05-04-1990', 'M', 2, 1000, 15000, 4.5, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'shariq@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'Shariq MUNEER', '156133213', 'Enjoy, Lahore', '05-04-1990', 'M', 2, 1000, 15000, 4.5, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'awais@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'Awais MUNEER', '156133213', 'Enjoy, Lahore', '05-04-1990', 'M', 3, 1000, 15000, 4.5, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'alvi@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'Alvi', '156133213', 'Enjoy, Lahore', '05-04-1990', 'M', 3, 1000, 15000, 4.5, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'saifi@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'Saifi', '156133213', 'Enjoy, Lahore', '05-04-1990', 'M', 4, 1000, 15000, 4.5, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)
SELECT @ID = LoginID FROM LoginTable WHERE Email = 'mansha@gmail.com'
INSERT INTO Doctor VALUES(@ID, 'Mansha', '156133213', 'Enjoy, Lahore', '05-04-1990', 'M', 5, 1000, 15000, 4.5, 0, 'PHD IN EVERY FIELD KNOWN TO MAN', 'ENJOY', 10, 1)


--PATIENT INSERTIONS
DECLARE @P_ID INT
SELECT @P_ID = LoginID FROM LoginTable WHERE Email='ABC@gmail.com'
INSERT INTO Patient VALUES(@P_ID, 'ABC', '61536516', 'ENJOY, LAHORE', '4-4-1996', 'M')
SELECT @P_ID = LoginID FROM LoginTable WHERE Email='DEF@gmail.com'
INSERT INTO Patient VALUES(@P_ID, 'DEF', '61536516', 'ENJOY, LAHORE', '4-4-1996', 'M')
SELECT @P_ID = LoginID FROM LoginTable WHERE Email='XYZ@gmail.com'
INSERT INTO Patient VALUES(@P_ID, 'XYZ', '61536516', 'ENJOY, LAHORE', '4-4-1996', 'M')


select * from OtherStaff

insert into OtherStaff values ('Javed', '03227561002','Iqbal Town, Lhr', 'Guard', 'M', '05-04-1990', 'Matric',5000)
insert into OtherStaff values ('Hamza', '03227561002','Iqbal Town, Lhr', 'Sweeper', 'M', '05-04-1990', 'Matric',5000)
insert into OtherStaff values ('Kashan', '03227561002','Iqbal Town, Lhr', 'Security', 'M', '05-04-1990', 'Matric',5000)
insert into OtherStaff values ('Alio', '03227561002','Iqbal Town, Lhr', 'Guard', 'M', '05-04-1990', 'Matric',5000)
insert into OtherStaff values ('Kaleem', '03227561002','Iqbal Town, Lhr', 'Guard', 'M', '05-04-1990', 'Matric',5000)
insert into OtherStaff values ('Ali', '03227561002','Iqbal Town, Lhr', 'Guard', 'M', '05-04-1990', 'Matric',5000)






--Because I have inserted the date and time in a particular format in the appointment table and that format has to be maintained
--for proper working

/*
--APPOINTMENT INSERTIONS 
DECLARE @DOCTOR_ID INT
DECLARE @PATIENT_ID INT
SELECT @DOCTOR_ID = LoginID FROM LoginTable WHERE Email='farhan@gmail.com'
SELECT @PATIENT_ID = LoginID FROM LoginTable WHERE Email='ABC@gmail.com'
INSERT INTO Appointment(DoctorID, PatientID, Date, Appointment_Status) VALUES(@DOCTOR_ID, @PATIENT_ID, '2017-5-4 10:00:00', 3)
SELECT @DOCTOR_ID = LoginID FROM LoginTable WHERE Email='farhan@gmail.com'
SELECT @PATIENT_ID = LoginID FROM LoginTable WHERE Email='DEF@gmail.com'
INSERT INTO Appointment(DoctorID, PatientID, Date, Appointment_Status) VALUES(@DOCTOR_ID, @PATIENT_ID, '2017-5-4 12:00:00', 1)
SELECT @DOCTOR_ID = LoginID FROM LoginTable WHERE Email='hassaan@gmail.com'
SELECT @PATIENT_ID = LoginID FROM LoginTable WHERE Email='DEF@gmail.com'
INSERT INTO Appointment(DoctorID, PatientID, Date, Appointment_Status) VALUES(@DOCTOR_ID, @PATIENT_ID, '2017-5-4 16:00:00', 3)
*/

