USE [GearGuard_System]
GO

/****** Object:  UserDefinedFunction [dbo].[GGFN_IsUsernameUnique]    Script Date: 12/22/2021 4:15:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/16/2021>
-- Description:	<Determine if Username is unique>
-- =============================================
CREATE FUNCTION [dbo].[GGFN_IsUsernameUnique]
(
	@Username VARCHAR(200)
)
RETURNS int
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(Username) FROM Users WHERE Username = @Username)

	-- Return the result of the function
	RETURN @Result

END
GO

