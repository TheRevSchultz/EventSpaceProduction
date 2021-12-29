USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[Assets]    Script Date: 12/29/2021 8:32:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Assets](
	[AssetID] [int] IDENTITY(1,1) NOT NULL,
	[Asset Description] [varchar](250) NOT NULL,
	[Asset Tag] [varchar](100) NOT NULL,
	[Serial Number] [varchar](200) NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[ModelId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Purchase Cost] [money] NOT NULL,
	[Status] [varchar](100) NOT NULL,
	[Image] [int] NOT NULL,
	[DepreciationScheduleId] [int] NOT NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Assets] ADD  CONSTRAINT [DF_Assets_Image]  DEFAULT ((0)) FOR [Image]
GO

ALTER TABLE [dbo].[Assets] ADD  CONSTRAINT [DF_Assets_DepreciationScheduleId]  DEFAULT ((0)) FOR [DepreciationScheduleId]
GO

