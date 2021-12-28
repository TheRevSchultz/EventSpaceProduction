USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[AssetGroupMembership]    Script Date: 12/28/2021 3:25:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AssetGroupMembership](
	[AssetGroupMembershipId] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[NSCId] [int] NOT NULL,
	[AssetGroupId] [int] NOT NULL,
 CONSTRAINT [PK_AssetGroupMembership] PRIMARY KEY CLUSTERED 
(
	[AssetGroupMembershipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

