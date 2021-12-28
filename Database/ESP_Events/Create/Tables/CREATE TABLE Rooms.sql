USE [ESP_Events]
GO

/****** Object:  Table [dbo].[Rooms]    Script Date: 12/28/2021 10:30:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[Room Name] [varchar](200) NOT NULL,
	[Operations Start] [time](7) NOT NULL,
	[Operations End] [time](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[Image] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF_Rooms_Image]  DEFAULT ((0)) FOR [Image]
GO

