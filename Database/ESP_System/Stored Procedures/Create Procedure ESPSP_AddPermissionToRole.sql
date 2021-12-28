USE [ESP_System]
GO

/****** Object:  StoredProcedure [dbo].[GGSP_AddPermissionToRole]    Script Date: 12/22/2021 4:18:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021>
-- Description:	<Add a Permission to an existing Role>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddPermissionToRole]
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

		IF @DoesPermissionAlreadyExist = 0
		BEGIN
			INSERT INTO RolePermissions([Role ID], [Permission ID], Granted)
			VALUES(@RoleId, @PermissionId, @Granted)
		END
		ELSE
		BEGIN
			RETURN 'Error: Permission is already assigned to this Role.'
		END

	END

END
GO

