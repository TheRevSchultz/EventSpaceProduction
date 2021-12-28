USE [ESP_Events]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_AddUpdateExistingLocation]    Script Date: 12/28/2021 1:07:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/2021>
-- Description:	<Add/Update Location>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddUpdateExistingLocation] 
	@LocationName VARCHAR(200),
	@Image INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @LocationExists INT = dbo.ESPFN_DoesLocationExist(@LocationName)

	IF @LocationExists = 0
	BEGIN
		INSERT INTO [Locations]([Location Name], [Image])
		VALUES(@LocationName, @Image)
	END

END
GO

