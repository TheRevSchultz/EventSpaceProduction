USE [ESP_GearGuard]
GO

/****** Object:  Table [dbo].[DepreciationSchedules]    Script Date: 12/28/2021 3:41:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DepreciationSchedules](
	[DepreciationScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[Schedule Name] [varchar](100) NOT NULL,
	[Duration] [int] NOT NULL,
	[Unit of Time] [varchar](50) NOT NULL,
	[Value Reduction Per Year] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_DepreciationSchedules] PRIMARY KEY CLUSTERED 
(
	[DepreciationScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DepreciationSchedules] ADD  CONSTRAINT [DF_DepreciationSchedules_Value Reduction Per Year]  DEFAULT ((0.00)) FOR [Value Reduction Per Year]
GO

