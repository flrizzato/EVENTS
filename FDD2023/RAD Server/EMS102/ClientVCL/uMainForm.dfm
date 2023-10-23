object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Client VCL'
  ClientHeight = 574
  ClientWidth = 983
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  PixelsPerInch = 120
  TextHeight = 17
  object DBGrid1: TDBGrid
    Left = 0
    Top = 31
    Width = 983
    Height = 480
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUST_NO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACT_FIRST'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACT_LAST'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE_NO'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDRESS_LINE1'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDRESS_LINE2'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CITY'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE_PROVINCE'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNTRY'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTAL_CODE'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ON_HOLD'
        Width = 65
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 983
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataSource = DataSource1
    Align = alTop
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 511
    Width = 983
    Height = 63
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      AlignWithMargins = True
      Left = 7
      Top = 7
      Width = 93
      Height = 49
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alLeft
      Caption = 'GET'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://localhost:8080/ems101'
    Params = <>
    RaiseExceptionOn500 = False
    SynchronizedEvents = False
    Left = 72
    Top = 64
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Resource = 'customer/'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 72
    Top = 120
  end
  object RESTResponse1: TRESTResponse
    Left = 72
    Top = 176
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    ResponseJSON = RESTResponse1
    Left = 72
    Top = 232
  end
  object FDMemTable1: TFDMemTable
    BeforePost = FDMemTable1BeforePost
    AfterPost = FDMemTable1AfterPost
    AfterDelete = FDMemTable1AfterDelete
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 72
    Top = 288
    object FDMemTable1CUST_NO: TFDAutoIncField
      FieldName = 'CUST_NO'
      Origin = 'CUST_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object FDMemTable1CUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      Origin = 'CUSTOMER'
      Required = True
      Size = 25
    end
    object FDMemTable1CONTACT_FIRST: TStringField
      FieldName = 'CONTACT_FIRST'
      Origin = 'CONTACT_FIRST'
      Size = 15
    end
    object FDMemTable1CONTACT_LAST: TStringField
      FieldName = 'CONTACT_LAST'
      Origin = 'CONTACT_LAST'
    end
    object FDMemTable1PHONE_NO: TStringField
      FieldName = 'PHONE_NO'
      Origin = 'PHONE_NO'
    end
    object FDMemTable1ADDRESS_LINE1: TStringField
      FieldName = 'ADDRESS_LINE1'
      Origin = 'ADDRESS_LINE1'
      Size = 30
    end
    object FDMemTable1ADDRESS_LINE2: TStringField
      FieldName = 'ADDRESS_LINE2'
      Origin = 'ADDRESS_LINE2'
      Size = 30
    end
    object FDMemTable1CITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 25
    end
    object FDMemTable1STATE_PROVINCE: TStringField
      FieldName = 'STATE_PROVINCE'
      Origin = 'STATE_PROVINCE'
      Size = 15
    end
    object FDMemTable1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 15
    end
    object FDMemTable1POSTAL_CODE: TStringField
      FieldName = 'POSTAL_CODE'
      Origin = 'POSTAL_CODE'
      Size = 12
    end
    object FDMemTable1ON_HOLD: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ON_HOLD'
      Origin = 'ON_HOLD'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 72
    Top = 336
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 688
    Top = 72
  end
  object RESTMethods: TRESTRequest
    Client = RESTClient1
    Method = rmPUT
    Params = <>
    Resource = 'customer'
    Response = RESTMethodsResponse
    SynchronizedEvents = False
    Left = 184
    Top = 120
  end
  object RESTMethodsResponse: TRESTResponse
    Left = 184
    Top = 176
  end
end
