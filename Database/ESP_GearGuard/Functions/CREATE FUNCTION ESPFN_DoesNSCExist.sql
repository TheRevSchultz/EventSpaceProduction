USE [ESP_GearGuard]
GO

/****** Object:  UserDefinedFunction [dbo].[ESPFN_DoesNSCExist]    Script Date: 12/28/2021 3:57:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/28/21>
-- Description:	<Does NSC Already Exist>
-- =============================================
CREATE FUNCTION [dbo].[ESPFN_DoesNSCExist]
(
	@ItemDescription VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM NonSerializedConsumables WHERE [Item Description] = @ItemDescription)

	RETURN @Result

END
GO

