USE [ESP_Events]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_AssignRoomToLocation]    Script Date: 12/28/2021 1:07:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ESPSP_AssignRoomToLocation]
	@LocationName VARCHAR(200),
	@RoomName VARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @LocationId INT = (SELECT LocationId FROM Locations WHERE [Location Name] = @LocationName)
	DECLARE @RoomId INT = (SELECT RoomId FROM [Rooms] WHERE [Room Name] = @RoomName)
	
	IF (SELECT COUNT(*) FROM LocationRooms WHERE RoomId = @RoomId AND LocationId = @LocationId) = 0
	BEGIN
		INSERT INTO LocationRooms(LocationId, RoomId)
		VALUES(@LocationId, @RoomId)
	END

END
GO

