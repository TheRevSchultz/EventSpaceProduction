USE [ESP_GearGuard]
GO

/****** Object:  View [dbo].[ESPVW_CheckedOutLibraryAssets]    Script Date: 12/29/2021 9:21:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ESPVW_CheckedOutLibraryAssets]
AS
SELECT        TOP (100) PERCENT dbo.Libraries.[Library Name], dbo.Libraries.[Library Description], dbo.Assets.[Asset Description], dbo.AssetManufacturers.[Manufacturer Name], dbo.AssetModel.[Model Name], 
                         dbo.AssetCategories.[Category Name], ESP_System.dbo.Users.Username AS [Checked out By (Usernasme)], ESP_System.dbo.Users.[First Name] AS [Checked out By (First Name)], 
                         ESP_System.dbo.Users.[Last Name] AS [Checked out By (Last Name)], dbo.LibraryCheckout.CheckedOutTime AS [Checked Out Time], dbo.LibraryCheckout.CheckedOutTo AS [Checked out To]
FROM            dbo.Assets INNER JOIN
                         dbo.Libraries INNER JOIN
                         dbo.LibraryCheckout ON dbo.Libraries.LibraryId = dbo.LibraryCheckout.LibraryId ON dbo.Assets.AssetID = dbo.LibraryCheckout.AssetId INNER JOIN
                         dbo.AssetCategories ON dbo.Assets.CategoryId = dbo.AssetCategories.CategoryId INNER JOIN
                         dbo.AssetManufacturers ON dbo.Assets.ManufacturerId = dbo.AssetManufacturers.ManufacturerId INNER JOIN
                         dbo.AssetModel ON dbo.Assets.ModelId = dbo.AssetModel.ModelId INNER JOIN
                         ESP_System.dbo.Users ON ESP_System.dbo.Users.UserId = dbo.LibraryCheckout.CheckedoutByUserId
WHERE        (dbo.LibraryCheckout.ReturnedByUserId = 0)
ORDER BY [Checked Out Time]
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
         Begin Table = "Assets"
            Begin Extent = 
               Top = 157
               Left = 39
               Bottom = 287
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Libraries"
            Begin Extent = 
               Top = 6
               Left = 40
               Bottom = 119
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LibraryCheckout"
            Begin Extent = 
               Top = 3
               Left = 292
               Bottom = 133
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "AssetCategories"
            Begin Extent = 
               Top = 6
               Left = 602
               Bottom = 102
               Right = 774
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetManufacturers"
            Begin Extent = 
               Top = 6
               Left = 812
               Bottom = 102
               Right = 1008
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssetModel"
            Begin Extent = 
               Top = 6
               Left = 1046
               Bottom = 119
               Right = 1217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users (ESP_System.dbo)"
            Begin Extent = 
               Top = 6
               Left = 1255
               Bottom = 136
               Right = 1425
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_CheckedOutLibraryAssets'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        End
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_CheckedOutLibraryAssets'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_CheckedOutLibraryAssets'
GO

