USE [ESP_GearGuard]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_AddAssetToLibrary]    Script Date: 12/29/2021 4:46:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Add Asset to Library>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddAssetToLibrary]
	-- Add the parameters for the stored procedure here
	@LibraryName VARCHAR(200),
	@AssetDescription VARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @LibraryId INT = (SELECT LibraryId FROM Libraries WHERE [Library Name] = @LibraryName)
	DECLARE @AssetId INT = (SELECT AssetId FROM Assets WHERE [Asset Description] = @AssetDescription)

	DECLARE @IsInLibrary INT = dbo.ESPFN_IsAssetInLibrary(@LibraryId, @AssetId)

	IF @IsInLibrary = 0
	BEGIN
		INSERT INTO LibraryAssets(LibraryId, AssetId)
		VALUES(@LibraryId, @AssetId)
	END

END
GO

