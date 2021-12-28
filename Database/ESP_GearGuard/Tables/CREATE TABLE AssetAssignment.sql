USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[AssetAssignment]    Script Date: 12/28/2021 3:17:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AssetAssignment](
	[AssetAssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[AssetGroupId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[AssignmentTime] [datetime] NOT NULL,
	[AssigningUserId] [int] NOT NULL,
	[ReturnTime] [datetime] NOT NULL,
	[ReturningUserId] [int] NOT NULL,
 CONSTRAINT [PK_AssetAssignment] PRIMARY KEY CLUSTERED 
(
	[AssetAssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

