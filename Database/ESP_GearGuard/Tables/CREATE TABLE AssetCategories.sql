USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[AssetCategories]    Script Date: 12/28/2021 3:23:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AssetCategories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Category Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_AssetCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
