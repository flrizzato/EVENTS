object EmployeeResource1: TEmployeeResource1
  Height = 300
  Width = 600
  PixelsPerInch = 96
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\data\employee.gdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'DriverID=IB')
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 30
    Top = 16
  end
  object qryEMPLOYEE: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evUnidirectional, evCursorKind, evLiveWindowParanoic]
    FetchOptions.CursorKind = ckForwardOnly
    FetchOptions.Unidirectional = True
    FetchOptions.LiveWindowParanoic = False
    SQL.Strings = (
      'select * from EMPLOYEE')
    Left = 130
    Top = 16
  end
  object dsrEMPLOYEE: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryEMPLOYEE
    Left = 130
    Top = 64
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 272
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 272
    Top = 72
  end
end
