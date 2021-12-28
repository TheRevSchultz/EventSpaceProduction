USE [ESP_System]
GO

/****** Object:  Table [dbo].[EmailSettings]    Script Date: 12/22/2021 3:52:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmailSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailType] [varchar](50) NOT NULL,
	[EmailServer] [varchar](200) NOT NULL,
	[Port] [varchar](20) NOT NULL,
	[EmailLogin] [varchar](200) NOT NULL,
	[EmailPassword] [varchar](max) NOT NULL,
	[EmailSecurity] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_EmailSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


