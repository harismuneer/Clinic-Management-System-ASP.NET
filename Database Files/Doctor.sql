

USE DBProject
GO


---------------------------------------------------------------------------------
--								STORED PROCEDURES							   --
---------------------------------------------------------------------------------



----------------------------(1)-------------------------------

---------------------Returns the Pending Appointments of Today------------ 
create PROCEDURE PENDING_APPOINTMENTS2
@DOCTOR_ID INT
AS
BEGIN
	SELECT A.AppointID, P.Name as [Patient's Name], A.[Date],Appointment_Status FROM Appointment A
	JOIN Patient P ON A.PatientID = P.PatientID
	WHERE A.DoctorID = @DOCTOR_ID AND A.Appointment_Status = 2 and DATEDIFF(DAY, A.Date, GETDATE()) = 0
END




----------------------------(2)-------------------------------
GO
-------------Approves a Particular Appointment----------------
create PROCEDURE APPROVE_APPOINTMENT
@APPOINT_ID INT
AS
BEGIN
	UPDATE Appointment
	SET Appointment_Status = 1, PatientNotification = 2
	WHERE AppointID = @APPOINT_ID
END




----------------------------(3)-------------------------------

-------------Returns the Approved Appointments of Today----------------
GO
create PROCEDURE TODAYS_APPOINTMENTS
@DOC_ID INT
AS
BEGIN
	SELECT A.AppointID, P.Name as [Patient's Name], A.[Date], isnull( convert( varchar(2),Bill_Amount) ,  'NA') as [Bill Amount], isnull( convert( varchar(2),Bill_Status),  'NA')  as [Bill Status] , isnull( convert( varchar(2),Disease) ,  'NA') as [Disease], isnull( convert( varchar(2),Progress) ,  'NA') as [Progress], isnull( convert( varchar(2),Prescription) ,  'NA') as [Prescription], Appointment_Status  FROM Appointment A
	JOIN Patient P ON A.PatientID = P.PatientID
	WHERE A.DoctorID = @DOC_ID AND A.Appointment_Status = 1 and DATEDIFF(DAY, A.Date, GETDATE()) = 0
END




----------------------------(4)-------------------------------

-------------Generates the Bill----------------
GO
create procedure generate_bill
@did int
as 
begin
	select Charges_per_Visit as [Charges] from doctor 
	where DoctorID=@did
end




----------------------------(5)-------------------------------

-------------When the Appointment is Completed and Bill is not Paid----------------

GO
create procedure finishedUnpaid
@docId int,
@appointid  int 
as 
begin
	update Appointment
	set Bill_Status='Unpaid',Appointment_Status=3,PatientNotification=2, Bill_Amount = (select Charges_Per_Visit from doctor where DoctorID=@docId),FeedbackStatus = 2
	where AppointID=@appointid

	update Doctor
	set Patients_Treated = Patients_Treated + 1
	where DoctorID = @docId
end



----------------------------(6)-------------------------------

-------------When the Appointment is Completed and Bill is Paid----------------


GO
create procedure finishedPaid
@docId int,
@appointid  int
as 
begin
	update Appointment
	set Bill_Status='paid',Appointment_Status=3,PatientNotification=2,Bill_Amount=(select Charges_Per_Visit from doctor where DoctorID=@docId),FeedbackStatus = 2
	where AppointID=@appointid

		update Doctor
	set Patients_Treated = Patients_Treated + 1
	where DoctorID = @docId

end




----------------------------(7)-------------------------------

-------------When an Appointment is Rejected----------------

GO
create procedure delete_APPOINTMENT
@APPOINT_ID int
as 
begin
	update Appointment
	set Appointment_Status=4, PatientNotification = 2
	where AppointID=@APPOINT_ID
end





----------------------------(8)-------------------------------

------------Display Doctor's Info----------------

GO
create procedure Doctor_Information_By_ID1
@Id int
as 
begin 
	select * from doctor where doctorid=@id
end




----------------------------(9)-------------------------------

------------Update the Prescription when the Appointment is Completed----------------

GO
create procedure UpdatePrescription
@docId int ,
@appointid int,
@Disease varchar(30),
@Progress varchar(50),
@Prescription varchar(60)
as 

begin
	update Appointment 
	set Disease=@disease,Progress=@progress,Prescription=@prescription,Appointment_Status=3,PatientNotification=2,FeedbackStatus = 2
	where Appointid=@appointid
end




----------------------------(10)-------------------------------

------------To get the information about an appointment----------------
GO
create PROCEDURE get_appointment
@APPOINT_ID INT
AS
BEGIN
	select Appointid,Date,Appointment_Status,Bill_Amount,Bill_Status,Disease,Progress,Prescription  from Appointment
	WHERE AppointID = @APPOINT_ID
END




----------------------------(11)-------------------------------
GO
create PROCEDURE retrievePHistory
@dID INT
AS
BEGIN
		select P.Name as [Name], Disease, Progress, Prescription
		from Appointment A join Patient P on A.PatientID = P.PatientID
		where DoctorID = @dId and Appointment_Status = 3
END


