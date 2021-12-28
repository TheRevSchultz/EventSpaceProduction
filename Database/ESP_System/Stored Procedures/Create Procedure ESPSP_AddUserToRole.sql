USE [ESP_System]
GO

/****** Object:  StoredProcedure [dbo].[GGSP_AddUserToRole]    Script Date: 12/22/2021 4:19:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021>
-- Description:	<Procedure to add a User to an Existing Role>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddUserToRole]
	@UserName VARCHAR(200),
	@RoleName VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @RoleId INT = (SELECT RoleId FROM Roles WHERE [Role Name] = @RoleName)
	DECLARE @UserId INT = (SELECT UserId FROm Users WHERE Username = @UserName)

	IF @RoleId IS NULL OR @RoleId < 1
	BEGIN
		RETURN 'Error: Role ' + @RoleName + ' does not exist or is invalid.'
	END
	ELSE IF @UserId IS NULL OR @UserId < 1
	BEGIN
		RETURN 'Error: User ' + @Username + ' does not exist, is inactive, or is invalid.'
	END
	ELSE
	BEGIN
		DECLARE @DoesRoleContainUser INT = dbo.GGFN_CheckUserRoleMembership(@UserId, @RoleId)

		IF @DoesRoleContainUser < 1
		BEGIN
			INSERT INTO UserRoleMembership(UserId, RoleId)
			VALUES(@UserId, @RoleId)

			RETURN 'Success'
		END
		ELSE
		BEGIN
			RETURN 'Error: User already a memeber of this role.'
		END
	END
END
GO

