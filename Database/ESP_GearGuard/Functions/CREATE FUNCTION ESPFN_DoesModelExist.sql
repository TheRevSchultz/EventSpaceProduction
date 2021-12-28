USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesModelExist]    Script Date: 12/28/2021 3:57:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/21>
-- Description:	<Does Model Already Exist>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesModelExist]
(
	@Model VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM AssetModel WHERE [Model Name] = @Model)

	RETURN @Result

END
GO

