USE [ESP_GearGuard]
GO

/****** Object:  StoredProcedure [dbo].[ESPSP_LibraryAssetCheckInOrOut]    Script Date: 12/29/2021 4:47:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Check In/Out an Asset from Library>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_LibraryAssetCheckInOrOut] 
	@LibraryName VARCHAR(200),
	@AssetDescription VARCHAR(200),
	@EventName VARCHAR(200),
	@CheckedoutTo VARCHAR(200),
	@CheckedoutBy VARCHAR(200),
	@CheckedoutTimestamp DATETIME,
	@ReturnedByUser VARCHAR(200) = '',
	@ReturnedTimestamp DATETIME = '9999-12-31'
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @LibraryId INT = (SELECT LibraryId FROM Libraries WHERE [Library Name] = @LibraryName)
	DECLARE @EventId INT = (SELECT EventId FROM ESP_Events.dbo.Events WHERE [Event Name] = @EventName)
	DECLARE @UserId INT = (SELECT UserId FROM ESP_System.dbo.Users WHERE Username = @CheckedoutBy)
	DECLARE @AssetId INT = (SELECT AssetId FROM Assets WHERE [Asset Description] = @AssetDescription)
	DECLARE @ReturningUserId INT

	IF @ReturnedByUser = ''
	BEGIN
		SET @ReturningUserId = 0
	END
	ELSE
	BEGIN
		SET @ReturningUserId = (SELECT UserId FROM ESP_System.dbo.Users WHERE Username = @ReturnedByUser)
	END

	DECLARE @IsCheckedOut INT = [dbo].[ESPFN_IsAssetCheckedOut](@LibraryId, @AssetId, @EventId)

	IF @IsCheckedOut = 0
	BEGIN
		INSERT INTO LibraryCheckout(LibraryId, AssetId, EventId, CheckedOutByUserId, CheckedOutTime, CheckedoutTo, ReturnedByUserId, ReturnedTime)
		VALUES(@LibraryId, @AssetId, @EventId, @UserId, @CheckedoutTimestamp, @CheckedOutTo, @ReturningUserId, @ReturnedTimestamp)
	END
	ELSE
	BEGIN
		UPDATE LibraryCheckout
		SET ReturnedByUserId = @ReturningUserId,
		@ReturnedTimestamp = @ReturnedTimestamp
		WHERE
		LibraryId = @LibraryId
		AND AssetId = @AssetId
		AND EventId = @EventId
		AND ReturnedByUserId = 0
	END
END
GO

