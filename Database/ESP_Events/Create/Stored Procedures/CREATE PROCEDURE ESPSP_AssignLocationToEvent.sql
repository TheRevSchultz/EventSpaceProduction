USE [ESP_Events]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_AssignLocationToEvent]    Script Date: 12/28/2021 1:07:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ESPSP_AssignLocationToEvent]
	@EventName VARCHAR(200),
	@LocationName VARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @LocationId INT = (SELECT LocationId FROM Locations WHERE [Location Name] = @LocationName)
	DECLARE @EventId INT = (SELECT EventId FROM [Events] WHERE [Event Name] = @EventName)
	
	IF (SELECT COUNT(*) FROM EventLocations WHERE EventId = @EventId AND LocationId = @LocationId) = 0
	BEGIN
		INSERT INTO EventLocations(EventId, LocationId)
		VALUES(@EventId, @LocationId)
	END

END
GO

