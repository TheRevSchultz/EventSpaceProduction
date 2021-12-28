USE [GearGuard_System]
GO

/****** Object:  UserDefinedFunction [dbo].[GGFN_CheckUserRoleMembership]    Script Date: 12/22/2021 4:08:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021>
-- Description:	<Check to see if User/Role combination already exists>
-- =============================================
CREATE FUNCTION [dbo].[GGFN_CheckUserRoleMembership]
(
	@UserId INT,
	@RoleId INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM UserRoleMembership WHERE UserId = @UserId AND RoleId = @RoleId)

	-- Return the result of the function
	RETURN @Result

END
GO

