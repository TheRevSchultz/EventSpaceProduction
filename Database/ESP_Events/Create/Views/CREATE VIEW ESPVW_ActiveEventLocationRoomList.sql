USE [ESP_Events]
GO

/****** Object:  View [dbo].[ESPVW_ActiveEventLocationRoomList]    Script Date: 12/29/2021 9:07:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ESPVW_ActiveEventLocationRoomList]
AS
SELECT        dbo.Events.[Event Name], dbo.Events.[Event Description], dbo.Events.[Event Start Date], dbo.Events.[Event End Date], dbo.Locations.[Location Name], dbo.Rooms.[Room Name], dbo.Rooms.[Operations Start], 
                         dbo.Rooms.[Operations End], dbo.Rooms.Active
FROM            dbo.EventLocations INNER JOIN
                         dbo.Rooms INNER JOIN
                         dbo.LocationRooms ON dbo.Rooms.RoomId = dbo.LocationRooms.RoomId INNER JOIN
                         dbo.Locations ON dbo.LocationRooms.LocationId = dbo.Locations.LocationID ON dbo.EventLocations.LocationId = dbo.Locations.LocationID INNER JOIN
                         dbo.Events ON dbo.EventLocations.EventId = dbo.Events.EventId
						 WHERE dbo.[Events].[Closed Out] = 0
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
         Begin Table = "EventLocations"
            Begin Extent = 
               Top = 179
               Left = 183
               Bottom = 292
               Right = 353
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Events"
            Begin Extent = 
               Top = 12
               Left = 5
               Bottom = 142
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LocationRooms"
            Begin Extent = 
               Top = 187
               Left = 596
               Bottom = 300
               Right = 774
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Locations"
            Begin Extent = 
               Top = 7
               Left = 379
               Bottom = 120
               Right = 549
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rooms"
            Begin Extent = 
               Top = 15
               Left = 836
               Bottom = 145
               Right = 1010
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
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_ActiveEventLocationRoomList'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_ActiveEventLocationRoomList'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ESPVW_ActiveEventLocationRoomList'
GO

