USE [ESP_GearGuard]
GO

/****** Object:  View [dbo].[ESPVW_CurrentlyAssignedAssets]    Script Date: 12/29/2021 9:21:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ESPVW_CurrentlyAssignedAssets]
AS
SELECT        TOP (100) PERCENT ESP_Events.dbo.Rooms.[Room Name], dbo.AssetGroups.[Asset Group Name], dbo.Assets.[Asset Description], dbo.AssetManufacturers.[Manufacturer Name], dbo.AssetModel.[Model Name], 
                         dbo.AssetCategories.[Category Name], dbo.Assets.[Asset Tag], dbo.Assets.[Serial Number], dbo.Assets.[Purchase Cost], ESP_System.dbo.Users.Username AS [Assigned By (Username)], 
                         ESP_System.dbo.Users.[First Name] AS [Assigned By (First Name)], ESP_System.dbo.Users.[Last Name] AS [Assigned By (Last Name)], dbo.AssetAssignment.AssignmentTime AS [Assigned Time]
FROM            dbo.AssetCategories INNER JOIN
                         dbo.AssetAssignment INNER JOIN
                         dbo.AssetGroups ON dbo.AssetAssignment.AssetGroupId = dbo.AssetGroups.AssetGroupId INNER JOIN
                         dbo.Assets ON dbo.AssetAssignment.AssetId = dbo.Assets.AssetID INNER JOIN
                         dbo.AssetManufacturers ON dbo.Assets.ManufacturerId = dbo.AssetManufacturers.ManufacturerId INNER JOIN
                         dbo.AssetModel ON dbo.Assets.ModelId = dbo.AssetModel.ModelId ON dbo.AssetCategories.CategoryId = dbo.Assets.CategoryId INNER JOIN
                         ESP_Events.dbo.Rooms ON ESP_Events.dbo.Rooms.RoomId = dbo.AssetAssignment.RoomId INNER JOIN
                         ESP_System.dbo.Users ON dbo.AssetAssignment.AssigningUserId = ESP_System.dbo.Users.UserId
ORDER BY [Assigned Time]
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
         Begin Table = "AssetCategories"
            Begin Extent = 
               Top = 227
               Left = 636
               Bottom = 323
               Right = 808
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetAssignment"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "AssetGroups"
            Begin Extent = 
               Top = 139
               Left = 266
               Bottom = 235
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Assets"
            Begin Extent = 
               Top = 2
               Left = 269
               Bottom = 132
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "AssetManufacturers"
            Begin Extent = 
               Top = 1
               Left = 632
               Bottom = 97
               Right = 828
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetModel"
            Begin Extent = 
               Top = 105
               Left = 632
               Bottom = 218
               Right = 803
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rooms (ESP_Events.dbo)"
            Begin Extent = 
               Top = 189
               Left = 20
               Bottom = 319
               Right = 194
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_CurrentlyAssignedAssets'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'          End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users (ESP_System.dbo)"
            Begin Extent = 
               Top = 241
               Left = 281
               Bottom = 371
               Right = 451
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_CurrentlyAssignedAssets'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_CurrentlyAssignedAssets'
GO

