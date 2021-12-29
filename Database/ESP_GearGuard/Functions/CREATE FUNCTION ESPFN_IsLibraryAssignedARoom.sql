SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/29/2021>
-- Description:	<Is Library Assigned to a Room for the supplied Event>
-- =============================================
CREATE FUNCTION ESPFN_IsLibraryAssignedARoom
(
	@LibraryId INT,
	@EventId INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	SET @Result = (SELECT COUNT(*) FROM LibraryRooms WHERE LibraryId = @LibraryId AND EventId = @EventId)

	RETURN @Result

END
GO

