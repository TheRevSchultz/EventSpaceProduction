USE [ESP_GearGuard]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_RemoveLibraryFromEventRoom]    Script Date: 12/29/2021 4:48:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Remove Library From Event and Room>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_RemoveLibraryFromEventRoom]
	
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

	IF @IsAssigned = 1
	BEGIN
		DELETE FROM LibraryRooms
		WHERE 
		LibraryId = @LibraryId
		AND EventId = @EventId
		AND RoomId = @RoomId
	END
END
GO

