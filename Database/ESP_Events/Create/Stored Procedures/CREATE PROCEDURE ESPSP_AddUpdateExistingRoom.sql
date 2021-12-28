USE [ESP_Events]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_AddUpdateExistingRoom]    Script Date: 12/28/2021 1:16:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/2021>
-- Description:	<Add/Update Room>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddUpdateExistingRoom] 
	@RoomName VARCHAR(200),
	@OperationsStart TIME,
	@OperationsEnd TIME,
	@Active BIT,
	@Image INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @RoomExists INT = dbo.ESPFN_DoesRoomExist(@RoomName)

	IF @RoomExists = 1
	BEGIN
		UPDATE [Rooms]
		SET [Room Name] = @RoomName,
		[Operations Start] = @OperationsStart,
		[Operations End] = @OperationsEnd,
		[Active] = @Active,
		[Image] = @Image
		WHERE [Room Name] = @RoomName
	END
	
	IF @RoomExists = 0
	BEGIN
		INSERT INTO [Rooms]([Room Name], [Operations Start], [Operations End], [Active], [Image])
		VALUES(@RoomName, @OperationsStart, @OperationsEnd, @Active, @Image)
	END

END
GO

