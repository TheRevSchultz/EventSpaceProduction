USE [ESP_System]
GO

/****** Object:  StoredProcedure [dbo].[GGSP_DeleteEmailSetting]    Script Date: 12/22/2021 4:19:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021>
-- Description:	<Remove an Email Setting>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_DeleteEmailSetting]
	@EmailType VARCHAR(50),
	@EmailServer VARCHAR(200),
	@Port VARCHAR(20),
	@EmailLogin VARCHAR(200),
	@EmailPassword VARCHAR(MAX),
	@EmailSecurity VARCHAR(20),
	@Enabled VARCHAR(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @EmailSettingPresent INT = dbo.GGFN_ValidateEmailConfiguration(@EmailType, @EmailLogin)

	IF @EmailSettingPresent IS NOT NULL OR @EmailSettingPresent > 0
	BEGIN
		DELETE FROM EmailSettings
		WHERE EmailType = @EmailType AND EmailLogin = @EmailLogin
	END
	ELSE
	BEGIN
		RETURN 'Error: Email Setting does not exist.'
	END
END
GO

