USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[LibraryCheckout]    Script Date: 12/29/2021 9:11:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LibraryCheckout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LibraryId] [int] NOT NULL,
	[AssetId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[CheckedoutByUserId] [int] NOT NULL,
	[CheckedOutTime] [datetime] NOT NULL,
	[CheckedOutTo] [varchar](200) NOT NULL,
	[ReturnedByUserId] [int] NOT NULL,
	[ReturnedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LibraryCheckout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

