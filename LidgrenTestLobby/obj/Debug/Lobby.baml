   M S B A M L   `   `   `  ����K  GLidgrenTestLobby, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:LidgrenTestLobbyLidgrenTestLobby  5   	   O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem 5   	       LidgrenTestLobby.Lobby   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:LidgrenTestLobby     5   	   9system&clr-namespace:System;assembly=mscorlib     5   	     � Title$  Lobby��5	   	   $	��800��6   $
��1200��6$    � 	Resources 5
         b2v��%   &	        �� 5   
   6'   5      .��5      �  � ColumnDefinitions 5   
   �� 5      $��2* �6   �� 5      $��* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��0.25* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   �� $��0��6   $��0��6%    �� Orientation$ 
Horizontal=�62   .+�5      �� -   5         ��Name$ StartServerButton��5      $��Start Server��60   $��10q�6G   6S   �� 5       -   5        $ StopServerButton��5       $y�	Collapsed=�6/   $��Stop Server��6F   $��10q�6\   6h   �� 5!      -   5        $ ClearConsoleLogButton��5!      $��Clear Console��64   $��10q�6L   6X   �� 5"      -   5        $ ClearRoomLogButton��5"      {�.  $��
Clear Room��6C   $��10q�6X   6d   �� 5#      -   5        $ AddRoomButton��5#      {�.  $��Add Room��6>   $��10q�6Q   6]   5$      �� 5'   
   $��1��6   $��0��6%   $ Vertical=�62   .+�5(      �� -   5        $ RefreshRoomsButton��5(      {�.  $��Refresh Rooms��6C   $��20q�6[   6g   5)      �� 5+   
   $��2��6   $��0��6%   $ Vertical=�62   .+�5,      �� -   5        $ RefreshClientsButton��5,      {�.  $��Refresh Clients��6E   $��20q�6_   6k   5-      R� 50   
   -   5        $��
ClientTree��50   A   $��2��6   $��1��6#   $��4��60   ��51      �� 52       �� DataType" m�6+    �� ItemsSource 6H   �� *Items+.R�53      �� ��6    �� *Title+54      56      �� 59   
   -	   5        $��RoomList��59   A   $��1��6   $��1��6#   $��4��60   5<      ]� 5A   
   $��0��6   $��1��6$   $��2��61   .+�5B      �� $	��Top=�6   $ 
Horizontal=�6.   
�������.+�5C      ��  �� Padding$ 10q�6   
Room Info:65   �� 5D      -
   5        	 ��Name$	 playerCount��5D   )   $ 10q�6   6)   5E      �� 5H      .��5I      �� -   5        
 ��Name$
 RoomLog��5I   �   $
��Auto=�6   $
��Auto=�6L   $��10q�6|   6�   5J      5K      ]� 5N   
   $��0��6   $��3��6$   $��2��61   .+�5O      �� $	��Top=�6   $ 10q�6-   
������� �� TextAlignment$ Center=�6L   Console Log6p   �� 5P      .��5Q      �� -   5        $
 
ConsoleLog��5Q   �   $
��Auto=�6   $
��Auto=�6L   $��10q�6|   6�   5R      5S      5T      5Y      