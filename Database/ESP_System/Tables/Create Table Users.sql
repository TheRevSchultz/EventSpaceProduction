USE [ESP_System]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 12/22/2021 3:58:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](200) NOT NULL,
	[First Name] [varchar](100) NOT NULL,
	[Last Name] [varchar](100) NOT NULL,
	[Title] [varchar](125) NOT NULL,
	[Department] [varchar](100) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Active] [bit] NOT NULL,
	[License] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_License]  DEFAULT ((0)) FOR [License]
GO

