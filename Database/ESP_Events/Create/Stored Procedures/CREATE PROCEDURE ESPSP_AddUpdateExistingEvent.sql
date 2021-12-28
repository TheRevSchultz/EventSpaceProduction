USE [ESP_Events]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_AddUpdateExistingEvent]    Script Date: 12/28/2021 1:06:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/2021>
-- Description:	<Add/Update Event>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddUpdateExistingEvent] 
	@EventName VARCHAR(200),
	@EventDescription VARCHAR(250),
	@EventStartDate DATETIME,
	@EventEndDate DATETIME
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @EventExists INT = dbo.ESPFN_DoesEventExist(@EventName)

	IF @EventExists = 1
	BEGIN
		UPDATE [Events]
		SET [Event Description] = @EventDescription,
		[Event Start Date] = @EventStartDate,
		[Event End Date] = @EventEndDate
		WHERE [Event Name] = @EventName
	END
	ELSE IF @EventExists = 0
	BEGIN
		INSERT INTO [Events]([Event Name], [Event Description], [Event Start Date], [Event End Date])
		VALUES(@EventName, @EventDescription, @EventStartDate, @EventEndDate)
	END

END
GO

