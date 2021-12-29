USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[NSCUtilization]    Script Date: 12/29/2021 2:00:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NSCUtilization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NSCId] [int] NOT NULL,
	[ConsumedByUserId] [int] NOT NULL,
	[QuantityUsed] [int] NOT NULL,
	[IsNSCConsumed] [bit] NOT NULL,
	[RoomId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[UsedTimestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_NSCUtilization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

