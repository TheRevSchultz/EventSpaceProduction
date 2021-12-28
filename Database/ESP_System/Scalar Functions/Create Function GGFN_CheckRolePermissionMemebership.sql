USE [GearGuard_System]
GO

/****** Object:  UserDefinedFunction [dbo].[GGFN_CheckRolePermissionMemebership]    Script Date: 12/22/2021 4:01:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021>
-- Description:	<Validate if a Permission is already assigned to a Role>
-- =============================================
CREATE FUNCTION [dbo].[GGFN_CheckRolePermissionMemebership]
(
	@RoleId INT,
	@PermissionId INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM RolePermissions WHERE [Role ID] = @RoleId AND [Permission ID] = @PermissionId)

	RETURN @Result

END
GO

