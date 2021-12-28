USE [ESP_System]
GO

/****** Object:  Table [dbo].[Policies]    Script Date: 12/22/2021 3:57:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Policies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PolicyName] [varchar](100) NOT NULL,
	[PolicyType] [varchar](100) NOT NULL,
	[PolicyEstablishedDate] [varchar](100) NOT NULL,
	[PolicyEstablishedByUserId] [int] NOT NULL,
	[policyValue] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Policies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

