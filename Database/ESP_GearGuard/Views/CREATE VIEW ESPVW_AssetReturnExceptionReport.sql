USE [ESP_GearGuard]
GO

/****** Object:  View [dbo].[ESPVW_AssetReturnExceptionReport]    Script Date: 12/29/2021 9:20:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ESPVW_AssetReturnExceptionReport]
AS
SELECT        TOP (100) PERCENT ESP_Events.dbo.Events.[Event Name], ESP_Events.dbo.Events.[Closed Out], dbo.Assets.[Asset Description], dbo.AssetManufacturers.[Manufacturer Name], dbo.AssetModel.[Model Name], 
                         dbo.AssetCategories.[Category Name], dbo.Assets.[Asset Tag], dbo.Assets.[Serial Number], dbo.AssetReturnException.Damaged, dbo.AssetReturnException.Stolen, dbo.AssetReturnException.ReportDate AS [Reported Date], 
                         ESP_System.dbo.Users.Username AS [Reported By (Username)], ESP_System.dbo.Users.[First Name] AS [Reported By (First Name)], ESP_System.dbo.Users.[Last Name] AS [Reported By (Last Name)]
FROM            dbo.AssetCategories INNER JOIN
                         dbo.AssetModel INNER JOIN
                         dbo.AssetAssignment INNER JOIN
                         dbo.AssetReturnException ON dbo.AssetAssignment.AssetAssignmentId = dbo.AssetReturnException.AssetAssignmentId INNER JOIN
                         dbo.Assets ON dbo.AssetAssignment.AssetId = dbo.Assets.AssetID INNER JOIN
                         dbo.AssetManufacturers ON dbo.Assets.ManufacturerId = dbo.AssetManufacturers.ManufacturerId ON dbo.AssetModel.ModelId = dbo.Assets.ModelId ON dbo.AssetCategories.CategoryId = dbo.Assets.CategoryId INNER JOIN
                         ESP_Events.dbo.Events ON ESP_Events.dbo.Events.EventId = dbo.AssetAssignment.EventId INNER JOIN
                         ESP_System.dbo.Users ON ESP_System.dbo.Users.UserId = dbo.AssetReturnException.ReportedByUserId
ORDER BY [Reported Date]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AssetAssignment"
            Begin Extent = 
               Top = 198
               Left = 225
               Bottom = 328
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetCategories"
            Begin Extent = 
               Top = 234
               Left = 569
               Bottom = 330
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetManufacturers"
            Begin Extent = 
               Top = 10
               Left = 566
               Bottom = 106
               Right = 762
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetModel"
            Begin Extent = 
               Top = 116
               Left = 572
               Bottom = 229
               Right = 743
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetReturnException"
            Begin Extent = 
               Top = 4
               Left = 3
               Bottom = 134
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Assets"
            Begin Extent = 
               Top = 7
               Left = 226
               Bottom = 137
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Events (ESP_Events.dbo)"
            Begin Extent = 
               Top = 6
               Left = 781
               Bottom = 136
               Right' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_AssetReturnExceptionReport'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 962
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users (ESP_System.dbo)"
            Begin Extent = 
               Top = 6
               Left = 1000
               Bottom = 136
               Right = 1170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_AssetReturnExceptionReport'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_AssetReturnExceptionReport'
GO

