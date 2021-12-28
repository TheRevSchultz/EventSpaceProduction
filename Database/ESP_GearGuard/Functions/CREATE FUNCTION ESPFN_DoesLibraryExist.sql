USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesLibraryExist]    Script Date: 12/28/2021 3:55:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/21>
-- Description:	<Does Library Already Exist>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesLibraryExist]
(
	@LibraryName VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM Libraries WHERE [Library Name] = @LibraryName)

	RETURN @Result

END
GO

