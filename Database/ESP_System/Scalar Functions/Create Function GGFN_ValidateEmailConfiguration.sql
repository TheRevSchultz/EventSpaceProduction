USE [GearGuard_System]
GO

/****** Object:  UserDefinedFunction [dbo].[GGFN_ValidateEmailConfiguration]    Script Date: 12/22/2021 4:16:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021	>
-- Description:	<Verify if an Email Setting is present>
-- =============================================
CREATE FUNCTION [dbo].[GGFN_ValidateEmailConfiguration]
(
	@EmailType VARCHAR(50),
	@EmailLogin VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM EmailSettings WHERE EmailType = @EmailType AND EmailLogin = @EmailLogin)

	RETURN @Result

END
GO

