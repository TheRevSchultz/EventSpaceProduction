USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesDepreciationScheduleExist]    Script Date: 12/28/2021 3:55:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/21>
-- Description:	<Does Depreciation Schedule Already Exist>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesDepreciationScheduleExist]
(
	@ScheduleName VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM DepreciationSchedules WHERE [Schedule Name] = @ScheduleName)

	RETURN @Result

END
GO

