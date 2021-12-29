SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Check if Asset is in a group>
-- =============================================
CREATE FUNCTION ESPFN_IsAssetInGroup 
(
	@AssetId INT,
	@GroupId INT = 0
)
RETURNS INT
AS
BEGIN
	
	DECLARE @Result INT

	IF @GroupId = 0
	BEGIN
		SET @Result = (SELECT COUNT(*) FROM AssetGroupMembership WHERE AssetId = @AssetId)
	END
	ELSE
	BEGIN
		SET @Result = (SELECT COUNT(*) FROM AssetGroupMembership WHERE AssetId = @AssetId AND AssetGroupId = @GroupId)
	END
	

	RETURN @Result

END
GO

