USE [ESP_System]
GO

/****** Object:  StoredProcedure [dbo].[GGSP_RemovePermissionFromRole]    Script Date: 12/22/2021 4:19:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021>
-- Description:	<Remove a Permission From an existing Role>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_RemovePermissionFromRole]
	@RoleName VARCHAR(100),
	@PermissionName VARCHAR(100),
	@Granted VARCHAR(1)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @RoleID INT = (SELECT RoleId FROM Roles WHERE [Role Name] = @RoleName)
	DECLARE @PermissionId INT = (SELECT PermissionId FROM Permissions WHERE [Permission Name] = @PermissionName)

	IF @RoleID IS NULL OR @RoleID < 1 OR @PermissionId IS NULL OR @PermissionId < 1
	BEGIN
		RETURN 'Error: Role or Permission is not valid'
	END
	ELSE
	BEGIN

		DECLARE @DoesPermissionAlreadyExist INT = dbo.GGFN_CheckRolePermissionMemebership(@RoleId, @PermissionId)

		IF @DoesPermissionAlreadyExist = 1
		BEGIN
			DELETE FROM RolePermissions
			WHERE [Role ID] = @RoleId
			AND
			[Permission ID] = @PermissionId
		END
		ELSE
		BEGIN
			RETURN 'Error: Permission is not assigned to this Role.'
		END

	END

END
GO

