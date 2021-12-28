USE [ESP_Events]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesEventExist]    Script Date: 12/28/2021 1:05:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/2021>
-- Description:	<Validate if Event Exists>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesEventExist] 
(
	@EventName VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM Events WHERE [Event Name] = @EventName)

	-- Return the result of the function
	RETURN @Result

END
GO

