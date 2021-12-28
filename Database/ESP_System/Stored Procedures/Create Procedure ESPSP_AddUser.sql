USE [ESP_System]
GO

/****** Object:  StoredProcedure [dbo].[GGSP_AddUser]    Script Date: 12/22/2021 4:19:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ESPSP_AddUser]
@Username VARCHAR(200) = '',
@FirstName VARCHAR(100) = '',
@LastName VARCHAR(100) = '',
@Title VARCHAR(125) = '',
@Department VARCHAR(125) = '',
@Email VARCHAR(250)  = '',
@Phone VARCHAR(15)  = '',
@Active VARCHAR(1)  = 0,
@License VARCHAR(1)  = 0,
@Password NVARCHAR(MAX)  = ''

AS
SET NOCOUNT ON

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/16/2021>
-- Description:	<Add a new user to Gear Guard>
-- =============================================


/*
DATA CHECKS
*/
DECLARE @IsUniqueUser INT  = dbo.GGFN_IsUsernameUnique(@Username)

IF @IsUniqueUser != 0 --User Already Exists
BEGIN
	RETURN 'Error: Username ' + @Username + ' already exists.'
END
ELSE
BEGIN


	DECLARE @UserId AS TABLE (
	UserId INT
	)

	INSERT INTO Users(Username, [First Name], [Last Name], Title, Department, Email, Phone, Active, License)
	OUTPUT Inserted.UserId INTO @UserId
	VALUES(@Username, @FirstName, @LastName, @Title, @Department, @Email, @Phone, @Active, @License)	
	
	DECLARE @CreatedUserId INT = (SELECT TOP 1 UserId FROM @UserId)
	DECLARE @PasswordExpirationDate DATETIME = (DATEADD(dd, dbo.GGFN_GetPasswordExipirationPolicy(), GETDATE()))

	INSERT INTO UserPasswords(UserId, Password, SetDate, ExpirationDate)
	VALUES(@CreatedUserId, @Password, GETDATE(), @PasswordExpirationDate)

	RETURN 'Success'
END
GO

