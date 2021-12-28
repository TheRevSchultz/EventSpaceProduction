USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesCategoryExist]    Script Date: 12/28/2021 3:53:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/21>
-- Description:	<Does Category Already Exist>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesCategoryExist]
(
	@Category VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM AssetCategories WHERE [Category Name] = @Category)

	RETURN @Result

END
GO

