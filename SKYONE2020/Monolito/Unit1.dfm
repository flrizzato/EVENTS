object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 296
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtNome: TLabeledEdit
    Left = 16
    Top = 32
    Width = 265
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 0
  end
  object edtCPF: TLabeledEdit
    Left = 16
    Top = 80
    Width = 121
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF'
    TabOrder = 1
  end
  object edtLimite: TLabeledEdit
    Left = 160
    Top = 80
    Width = 121
    Height = 21
    EditLabel.Width = 80
    EditLabel.Height = 13
    EditLabel.Caption = 'Limite de Cr'#233'dito'
    TabOrder = 2
  end
  object edtCEP: TLabeledEdit
    Left = 16
    Top = 128
    Width = 121
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'CEP'
    TabOrder = 3
  end
  object btnBuscarCEP: TButton
    Left = 143
    Top = 126
    Width = 75
    Height = 25
    Caption = 'Buscar CEP'
    TabOrder = 4
    OnClick = btnBuscarCEPClick
  end
  object memEndereco: TMemo
    Left = 16
    Top = 155
    Width = 265
    Height = 89
    TabOrder = 5
  end
  object btnGravar: TButton
    Left = 160
    Top = 256
    Width = 121
    Height = 25
    Caption = 'Gravar'
    TabOrder = 6
    OnClick = btnGravarClick
  end
  object qryCEP: TFDQuery
    Connection = FDConnection
    Left = 120
    Top = 168
  end
  object qryGravaCliente: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from clientes where CPF is null')
    Left = 184
    Top = 168
    object qryGravaClienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object qryGravaClienteCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object qryGravaClienteLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Origin = 'LIMITE'
      Precision = 18
      Size = 2
    end
    object qryGravaClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 15
    end
    object qryGravaClienteENDERECO: TMemoField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      BlobType = ftMemo
    end
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
    Left = 56
    Top = 168
  end
end
