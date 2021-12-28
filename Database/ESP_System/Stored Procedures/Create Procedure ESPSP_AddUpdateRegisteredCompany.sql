USE [ESP_System]
GO

/****** Object:  StoredProcedure [dbo].[GGSP_AddUpdateRegisteredCompany]    Script Date: 12/22/2021 4:18:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Chris D. Schultz>
-- Create date: <12/17/2021>
-- Description:	<Add or Update a Registered Company Data>
-- =============================================
CREATE PROCEDURE [dbo].[ESPSP_AddUpdateRegisteredCompany] 
	@CompanyId VARCHAR(10),
	@CompanyName VARCHAR(250),
	@Address1 VARCHAR(150),
	@Address2 VARCHAR(150),
	@Address3 VARCHAR(150),
	@City VARCHAR(150),
	@State VARCHAR(10),
	@PostalCode VARCHAR(25),
	@Country VARCHAR(10),
	@Phone VARCHAR(15)

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CompanyExists INT = dbo.GGFN_ValidateCompanyExists(@CompanyId)

	IF @CompanyExists IS NOT NULL OR @CompanyExists < 0
	BEGIN
		UPDATE CompanyInfo
		SET
		CompanyName = @CompanyName,
		Address1 = @Address1,
		Address2 = @Address2,
		Address3 = @Address3,
		City = @City,
		[State] = @State,
		PostalCode = @PostalCode,
		Country = @Country,
		Phone = @Phone
		WHERE CompanyId = @CompanyId
	END
	ELSE
	BEGIN
		INSERT INTO CompanyInfo(CompanyId, CompanyName, Address1, Address2, Address3, City, State, PostalCode, Country, Phone)
		VALUES(@CompanyId, @CompanyName, @Address1, @Address2, @Address3, @City, @State, @PostalCode, @Country, @Phone)
	END
END
GO

