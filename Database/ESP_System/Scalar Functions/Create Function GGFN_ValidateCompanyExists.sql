USE [GearGuard_System]
GO

/****** Object:  UserDefinedFunction [dbo].[GGFN_ValidateCompanyExists]    Script Date: 12/22/2021 4:15:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021>
-- Description:	<Validate if a Company is already registered>
-- =============================================
CREATE FUNCTION [dbo].[GGFN_ValidateCompanyExists]
(
	@CompanyId VARCHAR(10)
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM CompanyInfo WHERE CompanyId = @CompanyId)

	-- Return the result of the function
	RETURN @Result

END
GO

