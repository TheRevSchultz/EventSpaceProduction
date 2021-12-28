USE [GearGuard_System]
GO

/****** Object:  UserDefinedFunction [dbo].[GGFN_HasUserDataChanged]    Script Date: 12/22/2021 4:15:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/16/2021>
-- Description:	<Compare User Data For Update>
-- =============================================
CREATE FUNCTION [dbo].[GGFN_HasUserDataChanged]
(
	@UserId int,
	@FieldName VARCHAR(100),
	@FieldValue VARCHAR(200)
)
RETURNS INT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ReturnParameter NVARCHAR(4000) = N'@SQLReturn INT';
	DECLARE @Return INT
	DECLARE @SQL NVARCHAR(4000) = 'SELECT @NoUpdate = COUNT(*) FROM Users WHERE ' + @FieldName + ' = ' + '''' + @FieldValue + '''' + ' AND UserId = ' + @UserId

	-- Add the T-SQL statements to compute the return value here
	EXEC sp_ExecuteSQL @SQL, @NoUpdate = @Return

	-- Return the result of the function
	RETURN @Return

END
GO

