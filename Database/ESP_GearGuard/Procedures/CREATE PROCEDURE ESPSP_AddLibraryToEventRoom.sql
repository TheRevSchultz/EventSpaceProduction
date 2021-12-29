USE [ESP_GearGuard]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_AddLibraryToEventRoom]    Script Date: 12/29/2021 4:47:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Assign Library to Event and Room>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddLibraryToEventRoom]
	
	@LibraryName VARCHAR(200),
	@EventName VARCHAR(200),
	@RoomName VARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @LibraryId INT = (SELECT LibraryId FROM Libraries WHERE [Library Name] = @LibraryName)
	DECLARE @EventId INT = (SELECT EventId FROM ESP_Events.dbo.Events WHERE [Event Name] = @EventName)
	DECLARE @RoomId INT = (SELECT RoomId FROM ESP_Events.dbo.Rooms WHERE [Room Name] = @RoomName)

	DECLARE @IsAssigned INT = dbo.ESPFN_IsLibraryAssignedARoom(@LibraryId, @EventId)

	IF @IsAssigned = 0
	BEGIN
		INSERT INTO LibraryRooms(LibraryId, EventId, RoomId)
		VALUES(@LibraryId, @EventId, @RoomId)
	END
END
GO

