USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[NonSerializedConsumables]    Script Date: 12/28/2021 3:49:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NonSerializedConsumables](
	[NSCId] [int] NOT NULL,
	[Item Description] [varchar](250) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Last Time Purchased] [datetime] NOT NULL,
	[Last Purchased Cost] [money] NOT NULL,
 CONSTRAINT [PK_NonSerializedConsumables] PRIMARY KEY CLUSTERED 
(
	[NSCId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

