USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[AssetManufacturers]    Script Date: 12/28/2021 3:28:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AssetManufacturers](
	[ManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_AssetManufacturers] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

