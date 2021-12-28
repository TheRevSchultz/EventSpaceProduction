USE [ESP_Events]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesRoomExist]    Script Date: 12/28/2021 1:06:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/2021>
-- Description:	<Validate if Room Exists>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesRoomExist] 
(
	@RoomName VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM Rooms WHERE [Room Name] = @RoomName)

	-- Return the result of the function
	RETURN @Result

END
GO

