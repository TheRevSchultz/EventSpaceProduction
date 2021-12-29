USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_CalculateDepreciationDate]    Script Date: 12/29/2021 8:50:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Calculate Depreciation Date>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_CalculateDepreciationDate]
(
	@AssetId INT
)
RETURNS DATE
AS
BEGIN
	
	DECLARE @Result DATE

	DECLARE @DepreciationDuration INT = (SELECT Duration FROM [dbo].[DepreciationSchedules] WHERE DepreciationScheduleId IN (SELECT DepreciationScheduleId FROM Assets where AssetId = @AssetId))
	DECLARE @DepreciationUnit VARCHAR(50) = (SELECT [Unit of Time] FROM [dbo].[DepreciationSchedules] WHERE DepreciationScheduleId IN (SELECT DepreciationScheduleId FROM Assets where AssetId = @AssetId))
	DECLARE @AssetPurchaseDate DATE = (SELECT [Purchase Date] FROM Assets WHERE AssetId = @AssetId)

	IF (SELECT DepreciationScheduleId FROM Assets WHERE AssetId = @AssetId) = 0
	BEGIN
		SET @Result = '9999-12-31'
	END
	ELSE
	BEGIN
		IF @DepreciationUnit = 'Years'
		BEGIN
			SET @Result = (SELECT DATEADD(yy, @DepreciationDuration, @AssetPurchaseDate))
		END
		ELSE IF @DepreciationUnit = 'Months'
			BEGIN
			SET @Result = (SELECT DATEADD(mm, @DepreciationDuration, @AssetPurchaseDate))
		END
		ELSE IF @DepreciationUnit = 'Weeks'
		BEGIN
			SET @Result = (SELECT DATEADD(ww, @DepreciationDuration, @AssetPurchaseDate))
		END
		ELSE IF @DepreciationUnit = 'Days'
		BEGIN
			SET @Result = (SELECT DATEADD(dd, @DepreciationDuration, @AssetPurchaseDate))
		END
		ELSE
		BEGIN
			SET @Result = '9999-12-31'
		END
	END

	RETURN @Result

END
GO

