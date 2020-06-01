object dmCep: TdmCep
  OldCreateOrder = False
  Height = 238
  Width = 329
  object qryCEP: TFDQuery
    Connection = FDConnection
    Left = 40
    Top = 72
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\EVENTS\SKYONE2020\Data\BANCO.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=IB')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
end
