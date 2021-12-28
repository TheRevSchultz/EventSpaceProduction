USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesAssetExist]    Script Date: 12/28/2021 3:52:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/21>
-- Description:	<Does Asset Already Exist>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesAssetExist]
(
	@AssetSerial VARCHAR(100),
	@AssetTag VARCHAR(100)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM Assets WHERE [Asset Tag] = @AssetTag OR [Serial Number] = @AssetSerial)

	RETURN @Result

END
GO

