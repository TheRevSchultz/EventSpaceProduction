USE [ESP_Events]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesLocationExist]    Script Date: 12/28/2021 1:06:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/2021>
-- Description:	<Validate if Event Exists>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesLocationExist] 
(
	@LocationName VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM Locations WHERE [Location Name] = @LocationName)

	-- Return the result of the function
	RETURN @Result

END
GO

