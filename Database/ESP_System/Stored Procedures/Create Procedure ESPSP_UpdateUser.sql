USE [ESP_System]
GO

/****** Object:  StoredProcedure [dbo].[GGSP_UpdateUser]    Script Date: 12/22/2021 4:20:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ESPSP_UpdateUser]
@Username VARCHAR(200),
@FirstName VARCHAR(100),
@LastName VARCHAR(100),
@Title VARCHAR(125),
@Department VARCHAR(125),
@Email VARCHAR(250),
@Phone VARCHAR(15),
@Active VARCHAR(1),
@License VARCHAR(2),
@Password NVARCHAR(MAX),
@UserId VARCHAR(50)

AS
SET NOCOUNT ON

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/16/2021>
-- Description:	<Update an existing user in Gear Guard>
-- =============================================


/*
DATA CHECKS
*/
DECLARE @IsUniqueUser INT  = dbo.GGFN_IsUsernameUnique(@Username)

IF @IsUniqueUser = 0 --User Does Not Exists
BEGIN
	RETURN 'Error: Username ' + @Username + ' does not exist.'
END
ELSE
BEGIN

	DECLARE @UpdateUserId INT = (SELECT UserId FROM Users WHERE Username = @Username)

	--Only Update Data that Changes
	DECLARE @ShouldUpdateFN INT = dbo.GGFN_HasUserDataChanged(@UpdateUserId, '[First Name]', @FirstName)
	DECLARE @ShouldUpdateLN INT = dbo.GGFN_HasUserDataChanged(@UpdateUserId, '[Last Name]', @LastName)
	DECLARE @ShouldUpdateTitle INT = dbo.GGFN_HasUserDataChanged(@UpdateUserId, 'Title', @Title)
	DECLARE @ShouldUpdateDEPT INT = dbo.GGFN_HasUserDataChanged(@UpdateUserId, 'Department', @Department)
	DECLARE @ShouldUpdateEMAIL INT = dbo.GGFN_HasUserDataChanged(@UpdateUserId, 'Email', @Email)
	DECLARE @ShouldUpdatePhone INT = dbo.GGFN_HasUserDataChanged(@UpdateUserId, 'Phone', @Phone)
	DECLARE @ShouldUpdateActive INT = dbo.GGFN_HasUserDataChanged(@UpdateUserId, 'Active', @Active)
	DECLARE @ShouldUpdateLicense INT = dbo.GGFN_HasUserDataChanged(@UpdateUserId, 'License', @License)

	DECLARE @SQL NVARCHAR(4000)

	SET @SQL = 'UPDATE Users
	SET '

	IF @ShouldUpdateFN = 0
	BEGIN
		SET @SQL = @SQL + '[First Name] = ' + '''' + @FirstName + ''''
	END
	IF @ShouldUpdateLN = 0
	BEGIN
		SET @SQL = @SQL + ', [Last Name] = ' + '''' + @LastName + ''''
	END
	IF @ShouldUpdateTitle = 0
	BEGIN
		SET @SQL = @SQL + ', [Title] = ' + '''' + @Title + ''''
	END
		IF @ShouldUpdateDEPT = 0
	BEGIN
		SET @SQL = @SQL + ', [Department] = ' + '''' + @Department + ''''
	END
		IF @ShouldUpdateEMAIL = 0
	BEGIN
		SET @SQL = @SQL + ', [Email] = ' + '''' + @Email + ''''
	END
		IF @ShouldUpdatePhone = 0
	BEGIN
		SET @SQL = @SQL + ', [Phone] = ' + '''' + @Phone + ''''
	END
		IF @ShouldUpdateActive = 0
	BEGIN
		SET @SQL = @SQL + ', [Active] = ' + '''' + CAST(@Active AS VARCHAR(1)) + '''' 
	END
		IF @ShouldUpdateLicense = 0
	BEGIN
		SET @SQL = @SQL +  ', [License] = ' + '''' + CAST(@License AS VARCHAR(10)) + ''''
	END

	SET @SQL = @SQL + '	WHERE UserId = ' + CAST(@UpdateUserId AS VARCHAR(50))

	IF SUBSTRING(@SQL, 14, 4) = 'SET ,'
	BEGIN
		SET @SQL = REPLACE(@SQL, 'SET ,', 'SET ')
	END

	EXEC sp_executesql @SQL

	DECLARE @CurrentPasswordId INT = (SELECT MAX(Id) FROM UserPasswords WHERE UserId = @UpdateUserId)

	IF @Password != (SELECT Password FROM UserPasswords where Id = @CurrentPasswordId) --Update password only if needed
	BEGIN
		DECLARE @PasswordExpirationDate DATETIME = (DATEADD(dd, dbo.GGFN_GetPasswordExipirationPolicy(), GETDATE()))
	   
		UPDATE UserPasswords
		SET ExpirationDate = GETDATE()
		WHERE Id = @CurrentPasswordId

		INSERT INTO UserPasswords(UserId, Password, SetDate, ExpirationDate)
		VALUES(@UpdateUserId, @Password, GETDATE(), @PasswordExpirationDate)
	END

	RETURN 'Success'
END
GO

