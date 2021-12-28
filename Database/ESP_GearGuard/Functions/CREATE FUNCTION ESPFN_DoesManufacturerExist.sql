USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesManufacturerExist]    Script Date: 12/28/2021 3:56:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/21>
-- Description:	<Does Manufacturer Already Exist>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesManufacturerExist]
(
	@Manufacturer VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM AssetManufacturers WHERE [Manufacturer Name] = @Manufacturer)

	RETURN @Result

END
GO

