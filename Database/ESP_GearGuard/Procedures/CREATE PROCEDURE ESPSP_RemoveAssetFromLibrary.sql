USE [ESP_GearGuard]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_RemoveAssetFromLibrary]    Script Date: 12/29/2021 4:48:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Remove Asset From Library>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_RemoveAssetFromLibrary]
	-- Add the parameters for the stored procedure here
	@LibraryName VARCHAR(200),
	@AssetDescription VARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @LibraryId INT = (SELECT LibraryId FROM Libraries WHERE [Library Name] = @LibraryName)
	DECLARE @AssetId INT = (SELECT AssetId FROM Assets WHERE [Asset Description] = @AssetDescription)

	DECLARE @IsInLibrary INT = dbo.ESPFN_IsAssetInLibrary(@LibraryId, @AssetId)

	IF @IsInLibrary != 0
	BEGIN
		DELETE FROM LibraryAssets
		WHERE LibraryId = @LibraryId
		AND AssetId = @AssetId
	END

END
GO

