USE [GearGuard_System]
GO

/****** Object:  UserDefinedFunction [dbo].[GGFN_GetPasswordExipirationPolicy]    Script Date: 12/22/2021 4:15:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/16/2021>
-- Description:	<Get Password Expiration Policy>
-- =============================================
CREATE FUNCTION [dbo].[GGFN_GetPasswordExipirationPolicy]
()
RETURNS INT

AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result INT	
	
	SET @Result = (SELECT CAST(PolicyValue AS INT) FROM Policies WHERE PolicyName = 'PasswordExpirationDays')

	IF @Result IS NULL OR @Result < 1
	BEGIN
		--Default Value is 365 Days
		SET @Result = 365
	END

	-- Return the result of the function
	RETURN @Result

END
GO

