USE [ESP_GearGuard]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_AddUpdateLibrary]    Script Date: 12/29/2021 4:47:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Add or Update Library>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddUpdateLibrary] 
	@LibraryName VARCHAR(200),
	@LibraryDescription VARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @LibraryExists INT = dbo.ESPFN_DoesLibraryExist(@LibraryName)

	IF @LibraryExists = 0
	BEGIN
		INSERT INTO Libraries([Library Name], [Library Description])
		VALUES(@LibraryName, @LibraryDescription)
	END
	ELSE
	BEGIN
		UPDATE Libraries
		SET [Library Name] = @LibraryName,
		[Library Description] = @LibraryDescription
		WHERE [Library Name] = @LibraryName
	END
END
GO

