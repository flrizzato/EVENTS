object dmCep: TdmCep
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 310
  Width = 373
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    AutoCreateParams = False
    BaseURL = 'http://localhost:8080'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 32
    Top = 8
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'num'
        Options = [poAutoCreated]
        Value = '15700000'
      end>
    Resource = 'cep/{num}'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 64
    Top = 56
  end
  object RESTResponse1: TRESTResponse
    Left = 96
    Top = 104
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 128
    Top = 152
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 160
    Top = 200
    object FDMemTable1logradouro: TWideStringField
      FieldName = 'logradouro'
      Size = 255
    end
    object FDMemTable1bairro: TWideStringField
      FieldName = 'bairro'
      Size = 255
    end
    object FDMemTable1cidade: TWideStringField
      FieldName = 'cidade'
      Size = 255
    end
    object FDMemTable1estado: TWideStringField
      FieldName = 'estado'
      Size = 255
    end
  end
end
