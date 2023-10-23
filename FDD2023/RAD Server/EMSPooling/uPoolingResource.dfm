object EmployeePooledResource1: TEmployeePooledResource1
  Height = 375
  Width = 750
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=EmployeeFDB_pooled')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 100
    Top = 20
  end
  object qryCUSTOMER: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PHONE_LIST '
      'WHERE LOCATION LIKE '#39'M%'#39' '
      'ORDER BY PHONE_NO')
    Left = 240
    Top = 30
    object qryCUSTOMEREMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Origin = 'EMP_NO'
    end
    object qryCUSTOMERFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Size = 15
    end
    object qryCUSTOMERLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
    end
    object qryCUSTOMERPHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Origin = 'PHONE_EXT'
      Size = 4
    end
    object qryCUSTOMERLOCATION: TStringField
      FieldName = 'LOCATION'
      Origin = 'LOCATION'
      Size = 15
    end
    object qryCUSTOMERPHONE_NO: TStringField
      FieldName = 'PHONE_NO'
      Origin = 'PHONE_NO'
    end
  end
  object dsrCUSTOMER: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryCUSTOMER
    KeyFields = 'EMP_NO'
    Left = 240
    Top = 100
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    ScreenCursor = gcrHourGlass
    Left = 100
    Top = 180
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 96
    Top = 104
  end
end
