USE [ESP_System]
GO

/****** Object:  Table [dbo].[LicenseData]    Script Date: 12/22/2021 3:53:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LicenseData](
	[LicenseID] [int] IDENTITY(1,1) NOT NULL,
	[License Data] [nvarchar](max) NOT NULL,
	[Expiration Date] [datetime] NOT NULL,
 CONSTRAINT [PK_LicenseData] PRIMARY KEY CLUSTERED 
(
	[LicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[LicenseData] ADD  CONSTRAINT [DF_LicenseData_Expiration Date]  DEFAULT ('9999-12-31 23:59:59') FOR [Expiration Date]
GO


