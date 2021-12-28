USE [ESP_System]
GO

/****** Object:  StoredProcedure [dbo].[GGSP_AddUpdateEmailSetting]    Script Date: 12/22/2021 4:18:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021>
-- Description:	<Add or Update Email Setting>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddUpdateEmailSetting]
	@EmailType VARCHAR(50),
	@EmailServer VARCHAR(200),
	@Port VARCHAR(20),
	@EmailLogin VARCHAR(200),
	@EmailPassword VARCHAR(MAX),
	@EmailSecurity VARCHAR(20),
	@Enabled BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @EmailSettingPresent INT = dbo.GGFN_ValidateEmailConfiguration(@EmailType, @EmailLogin)

	IF @EmailSettingPresent IS NOT NULL OR @EmailSettingPresent > 0
	BEGIN
		UPDATE EmailSettings
		SET 
		EmailServer = @EmailServer,
		Port = @Port,
		EmailPassword = @EmailPassword,
		EmailSecurity = @EmailSecurity,
		Enabled = @Enabled
		WHERE EmailType = @EmailType AND EmailLogin = @EmailLogin
	END
	ELSE
	BEGIN
		INSERT INTO EmailSettings(EmailType, EmailServer, Port, EmailLogin, EmailPassword, EmailSecurity, Enabled)
		VALUES(@EmailType, @EmailServer, @Port, @EmailLogin, @EmailPassword, @EmailSecurity, @Enabled)
	END
END
GO

