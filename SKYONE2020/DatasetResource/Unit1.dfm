object ClientesResource1: TClientesResource1
  OldCreateOrder = False
  Height = 300
  Width = 600
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=CodeRage2020Br')
    Connected = True
    LoginPrompt = False
    Left = 30
    Top = 16
  end
  object qryCLIENTES: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from CLIENTES')
    Left = 130
    Top = 16
  end
  object dsrCLIENTES: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryCLIENTES
    KeyFields = 'CPF'
    ValueFields = 'CEP;CPF;ENDERECO;LIMITE;NOME'
    Left = 130
    Top = 64
  end
end
