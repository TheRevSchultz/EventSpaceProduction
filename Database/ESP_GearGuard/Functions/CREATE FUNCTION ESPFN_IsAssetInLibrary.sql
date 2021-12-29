SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Is Asset Assigned to a Library>
-- =============================================
CREATE FUNCTION ESPFN_IsAssetInLibrary
(
	@LibraryId INT = 0,
	@AssetId INT
)
RETURNS INT
AS
BEGIN
	
	DECLARE @Result int

	IF @LibraryId = 0
	BEGIN
		SET @Result = (SELECT COUNT(*) FROM LibraryAssets WHERE AssetId = @AssetId)
	END
	ELSE
	BEGIN
		SET @Result = (SELECT COUNT(*) FROM LibraryAssets WHERE AssetId = @AssetId AND LibraryId = @LibraryId)
	END
		
	RETURN @Result

END
GO

