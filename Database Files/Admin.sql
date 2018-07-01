use DBProject
GO


---------------------------------------------------------------------------------
--								STORED PROCEDURES							   --
---------------------------------------------------------------------------------


------------------------------------------(1)---------------------------------------

/*GIVES INFORMAION OF STAFF*/
create PROCEDURE GET_STAFF
@id int ,

@name varchar(20) output,
@phone char(15) output,
@gender varchar(2) output,
@address varchar(100) output,
@desig varchar(100) output,
@sal int output
AS

BEGIN

SELECT @name = Name , @phone = OtherStaff.Phone , @gender = OtherStaff.Gender , @gender = OtherStaff.Gender , @address = OtherStaff.Address , @desig = OtherStaff.Designation ,
@sal = OtherStaff.Salary FROM OtherStaff  where OtherStaff.StaffID = @id

END



---------------------------------------------------------------------


------------------------------------------(2)---------------------------------------
GO
/*THIS PROCEDURE WILL RETURN INFO OF DOCTOR*/
create procedure GET_DOCTOR_PROFILE


@dID int,

@name varchar(20) output,
@phone char(15) output,
@gender varchar(2) output,
@charges float output,
@RI float output,
@PTreated int output,
@qualification varchar(100) output,
@specialization varchar(50) output,
@workE int output,
@age int output

as
begin
	select @name=Name, @phone=Phone, @gender=Gender,@charges = charges_per_visit, @RI = ReputeIndex, @PTreated = Patients_Treated, @qualification = qualification, @specialization = specialization, @workE = Work_Experience, @age=DATEDIFF(YEAR, BirthDate, GETDATE()) from Doctor where DoctorID = @dID
end



------------------------------------------------------------------------------------------------

select * from OtherStaff



------------------------------------------(3)---------------------------------------
--this procedure checks the email of doctor in login table and return true if it exists--
GO
CREATE procedure CheckDoctorEmail
@Email varchar(30),
@status int output
AS
BEGIN
SET @status = 0

	IF EXISTS( select * from LoginTable where Email = @Email )
	BEGIN
	
	SET @status = 1
	
	END

END

--EXECUTION---
DECLARE @r int 
EXEC CheckDoctorEmail  'hassaan.elahi@hotmail.com'  , @r output
select @r





------------------------------------------(4)---------------------------------------
----------------------------------------------------------------------------

/*this funciton will Add doctor to the database */
GO
CREATE procedure AddDoctor
@Name varchar(50) ,
@Email varchar(50),
@Password varchar(50),
@BirthDate Date,
@dept int , 
@gender char(1),
@Address varchar(50),
@Exp int , 
@Salary int,
@spec varchar(50) , 
@phone varchar(50) ,
@charges int , 
@qual varchar(50)

AS
BEGIN
DECLARE @id int
		
		insert into LoginTable values(@password, @email, 2)
		select @id = LoginID from LoginTable where email=@email	
		insert into Doctor values(@id, @name, @phone, @address, @BirthDate, @gender , @dept , @charges , @Salary , 0 , 0 , @qual , @spec ,@Exp , -1)
	
END




------------------------------------------(5)---------------------------------------
-------------------------------------------------------------------------------------

GO
/*THIS PROCEDURE WILL ADD STAFF TO OTHERSTAFF TABLE*/
create procedure AddStaff
@Name varchar(50),  
@BirthDate Date,
@phone varchar(30),
@gender varchar(1),
@designation varchar(30),
@Address varchar(50),
@Salary int,
@Qualification varchar(50)
AS
BEGIN

INSERT INTO OtherStaff VALUES(@Name , @phone , @Address ,@designation ,@gender ,@BirthDate , @Qualification ,@Salary)

END

------------------------------------------------------------------------------------


------------------------------------------(6)---------------------------------------
GO
CREATE PROCEDURE DeleteDoctor
@id int 
AS
BEGIN

delete from Doctor where DoctorID = @id

END 


----------------------------------------------------------------------

------------------------------------------(7)---------------------------------------
GO
CREATE PROCEDURE DELETESTAFF
@id int 
AS
BEGIN

delete from OtherStaff where StaffID = @id

END 




---------------------------------------------------------------------------------
--									TRIGGERS								   --
---------------------------------------------------------------------------------



------------------------------------------(1)---------------------------------------
GO
/*THIS TRIGGER WILL CHANGE THE STATUS OF THE DOCTOR TO  '1'  WHEN  INSERTED*/
CREATE TRIGGER UpdateStatusOfDoctorToCurrent
ON Doctor AFTER INSERT
AS
BEGIN

UPDATE Doctor
SET [status] = 1 where DoctorID = (SELECT DoctorID FROM inserted)

END



---------------------------------------------------------------------------------------------

GO
------------------------------------------(2)---------------------------------------
/*THIS TRIGGER WILL UPDATE THE STATUS OF THE DOCTOR TO '0' WHEN ADMIN ATTEMPTS TO DELETE */
CREATE TRIGGER UpdateStatusOfDoctorToPast
ON Doctor INSTEAD OF DELETE
AS
BEGIN

UPDATE Doctor
SET [status] = 0 where DoctorID = (SELECT DoctorID FROM deleted)
delete from LoginTable where LoginID = (SELECT DoctorID FROM deleted)

END


---------------------------------------------------------------------------
GO
------------------------------------------(3)---------------------------------------
/*THIS TRIGEGER WILL CHANGE THE CASE OF DATA OF STAFF TO UPPER/LOWER WHEN INSERTED  */

CREATE TRIGGER ON_OTHERSTAFF
ON OtherStaff
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE OtherStaff
	SET Name=UPPER(Name), Address=LOWER(Address), Designation=UPPER(Designation), Gender=UPPER(Gender), Highest_Qualification=UPPER(Highest_Qualification)
	WHERE StaffID IN (SELECT StaffID FROM inserted)
END


-----------------------------------------------------------------------------------------------------------------------------
GO
------------------------------------------(4)---------------------------------------
/*CHECKS IF DELETING PERSON IS DOCTOR OR DOCTOR IS REMOVED FROM DOCTOR TABLE*/
CREATE TRIGGER CheckIfDoctorRemoved
ON LoginTable
INSTEAD OF DELETE
AS
BEGIN
	IF (SELECT Type FROM deleted) != 2 OR (SELECT D.status FROM Doctor D WHERE DoctorID IN (SELECT LoginID FROM deleted)) = 0
	BEGIN
		DELETE FROM LoginTable WHERE LoginID IN (SELECT LoginID FROM deleted)
	END
END



-------------------------------------------------------------------------------------------------------------------------------------

GO
------------------------------------------(5)---------------------------------------
/*THIS TRIGGER RESTRICTS TABLE DELETE*/
CREATE TRIGGER DontDeleteTable
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
	PRINT('Table Deletion Not Allowed.')
END




------------------------------------------(6)---------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
GO
/*THIS TRIGGER RESTRICS PROCEDURE DELETE*/
CREATE TRIGGER DontDeleteProcedure
ON DATABASE
FOR DROP_PROCEDURE
AS
BEGIN
	PRINT('Procedure Deletion Not Allowed.')
END



------------------------------------------(7)---------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
GO
/*THIS TRIGGER RESTRICTS VEIW DELETE*/
CREATE TRIGGER DontDeleteView
ON DATABASE
FOR DROP_VIEW
AS
BEGIN
	PRINT('View Deletion Not Allowed.')
END

-----------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------(8)---------------------------------------
GO
/*THIS TRIGGER RESTRICTS FUNCTION DELETE*/
CREATE TRIGGER DontDeleteFunction
ON DATABASE
FOR DROP_FUNCTION
AS
BEGIN
	PRINT('Function Deletion is Not Allowed')
END








--------------------------------------------------------------------------------
--								VIEWS										 --
--------------------------------------------------------------------------------



------------------------------------------(1)---------------------------------------

GO
/*THIS VIEW WILL RETURN TOTAL PATIENTS FROM THE DATABASE */
create View  Total_Patient
AS
select COUNT(patientID) as 'Total Patients' from Patient


----------------------------------------------------------------------------------
------------------------------------------(2)---------------------------------------
GO
/*THIS VIEW WILL RETURN TOTAL DOCTOR FROM THE DATABASE */
create VIEW Total_Doctors
AS
select COUNT(Doctor.DoctorID) as 'Total Doctors' from Doctor where Doctor.status != 0

----------------------------------------------------------------------------------

GO
------------------------------------------(3)---------------------------------------
/*THIS FUNCTION WILL RETURN THE INCOME OF CURRENT MONTH*/
create VIEW Income
AS
SELECT SUM(Bill_Amount) as Income FROM Appointment
WHERE Appointment.Bill_Status = 'Paid'
AND 
DATEDIFF(MONTH, Appointment.Date, GETDATE())  = 0



---------------------------------------------------------------------------------
------------------------------------------(4)---------------------------------------

GO
/*THIS FUNCITON WILL RETURN LIST OF DEPRARTMENTS */
create VIEW Department_View
AS
SELECT TOP 20  Department.DeptNo as ID , Department.DeptName as [Name] ,Department.Description, count(department.deptno) as [Number of Doctors] 
FROM Department join Doctor on Department.DeptNo = Doctor.DeptNo
where Doctor.status != 0
GROUP BY Department.DeptNo , Department.DeptNo , Department .DeptName , Department.Description
ORDER BY Department.DeptNo

--------------------------------------------------------------------------------


GO
------------------------------------------(5)---------------------------------------
/*THIS VIEW WILL RETURN THE APPOINTMENT VIEW CONTAINING PATIENT NAM AND DOCTOR NAME*/
create VIEW Appointment_view
AS
SELECT A.AppointID , Doctor.Name , Patient.PatientID, A.Date  FROM Appointment A JOIN Patient ON Patient.PatientID = A.PatientID
JOIN Doctor ON Doctor.DoctorID = A.DoctorID
WHERE DATEDIFF(MONTH, A.Date, GETDATE()) = 0

------------------------------------------------------------------------------------

GO
------------------------------------------(6)---------------------------------------
create VIEW STAFF_VIEW
AS
SELECT StaffID as ID , Name , Designation from OtherStaff



--------------------------------------------------------------------------------------
GO
------------------------------------------(7)---------------------------------------
CREATE VIEW PATIENT_VIEW
AS
SELECT Patient.PatientID as ID , Patient.Name , Patient.Phone from Patient

-----------------------------------------------------------------------------------------
