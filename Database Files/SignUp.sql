
USE DBProject
GO

/*----------------------------------------------------------------*/
/*-----------------------------SignUp-----------------------------*/
/*----------------------------------------------------------------*/

----------------------------(1)-------------------------------

/*
returns status = 0 if successful
		status = 1 if email not found
		status = 2 if password is wrong


returns ID of person and type of person i.e patient, doctor, admin on success
returns ID = 0, type = 0 on failure
--Type: 1 -- Patient
--Type: 2 -- Doctor
--Type: 3 -- Admin
*/

create procedure Login

@email varchar(30),
@password varchar(20),
@status int output,
@ID int output,
@type int output

as
begin
	if exists(select * from LoginTable where email=@email)
	BEGIN
		if @password = (select password from LoginTable where email=@email)
		BEGIN
			select @ID = LoginID, @type = [type] from LoginTable where email=@email
			set @status = 0
		END

		else
		BEGIN
			set @status = 2
			set @ID = 0
			set @type = 0
		END
	END

	else
	BEGIN
		set @status = 1
		set @ID = 0
		set @type = 0
	END
end



----------------------------(2)-------------------------------
/*
Signups new patient

returns status = 1 on success
returns status = 0 if patient already exists
*/
GO
create procedure PatientSignup

@name varchar(20),
@phone char(15),
@address varchar(40),
@date Date,
@gender char(1),
@password varchar(20),
@email varchar(30),

@status int output,
@ID int output

as
begin

	if not exists(select * from LoginTable where email=@email)
	begin
		insert into LoginTable values(@password, @email, 1)

		select @id = LoginID from LoginTable where email=@email

		insert into Patient values(@id, @name, @phone, @address, @date, @gender)
		set @status = 1
	end
	
	else
	begin
		set @status = 0
	end

end


