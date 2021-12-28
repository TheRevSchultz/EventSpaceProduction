USE [ESP_System]
GO

/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 12/22/2021 3:51:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompanyInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [varchar](10) NOT NULL,
	[CompanyName] [varchar](250) NOT NULL,
	[Address1] [varchar](150) NOT NULL,
	[Address2] [varchar](150) NOT NULL,
	[Address3] [varchar](150) NOT NULL,
	[City] [varchar](150) NOT NULL,
	[State] [varchar](10) NOT NULL,
	[PostalCode] [varchar](25) NOT NULL,
	[Country] [varchar](10) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[CallingId] [varchar](max) NOT NULL
) ON [PRIMARY]
GO


