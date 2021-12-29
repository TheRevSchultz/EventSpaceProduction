USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_IsAssetCheckedOut]    Script Date: 12/29/2021 4:44:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Check if an Asset is checked out of a Library>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_IsAssetCheckedOut]
(
	@LibraryId INT,
	@AssetId INT,
	@EventId INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM LibraryCheckout WHERE LibraryId = @LibraryId AND AssetId = @AssetId AND EventId = @EventId AND ReturnedByUserId = 0)

	RETURN @Result

END
GO

