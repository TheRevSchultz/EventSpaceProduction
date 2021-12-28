USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[AssetReturnException]    Script Date: 12/28/2021 3:37:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AssetReturnException](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetAssignmentId] [int] NOT NULL,
	[Damaged] [bit] NOT NULL,
	[Stolen] [bit] NOT NULL,
	[ReportedByUserId] [int] NOT NULL,
	[ReportDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AssetReturnException] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

