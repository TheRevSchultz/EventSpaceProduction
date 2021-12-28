USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesAssetGroupExist]    Script Date: 12/28/2021 3:53:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/21>
-- Description:	<Does Asset Group Already Exist>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesAssetGroupExist]
(
	@GroupName VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM AssetGroups WHERE [Asset Group Name] = @GroupName)

	RETURN @Result

END
GO

