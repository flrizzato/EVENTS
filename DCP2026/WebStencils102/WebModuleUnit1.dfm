object WebModule1: TWebModule1
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 288
  Width = 519
  PixelsPerInch = 120
  object WebStencilsEngine1: TWebStencilsEngine
    PathTemplates = <
      item
        Template = '/{filename}'
      end>
    RootDirectory = '..\..\html\'
    Left = 96
    Top = 32
  end
  object WebStencilsProcessor1: TWebStencilsProcessor
    Engine = WebStencilsEngine1
    InputFileName = '..\..\html\index.html'
    Left = 96
    Top = 120
  end
  object NorthwindConnection: TFDConnection
    Params.Strings = (
      'Database=C:\data\NORTHWIND.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 28
  end
  object ProductsTable: TFDQuery
    Connection = NorthwindConnection
    SQL.Strings = (
      'SELECT * FROM PRODUCTS ORDER BY PRODUCTID')
    Left = 304
    Top = 116
    object ProductsTablePRODUCTID: TIntegerField
      FieldName = 'PRODUCTID'
      Origin = 'PRODUCTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ProductsTablePRODUCTNAME: TStringField
      FieldName = 'PRODUCTNAME'
      Origin = 'PRODUCTNAME'
      Required = True
      Size = 40
    end
    object ProductsTableSUPPLIERID: TIntegerField
      FieldName = 'SUPPLIERID'
      Origin = 'SUPPLIERID'
    end
    object ProductsTableCATEGORYID: TIntegerField
      FieldName = 'CATEGORYID'
      Origin = 'CATEGORYID'
    end
    object ProductsTableQUANTITYPERUNIT: TStringField
      FieldName = 'QUANTITYPERUNIT'
      Origin = 'QUANTITYPERUNIT'
    end
    object ProductsTableUNITPRICE: TBCDField
      FieldName = 'UNITPRICE'
      Origin = 'UNITPRICE'
      Precision = 18
    end
    object ProductsTableUNITSINSTOCK: TSmallintField
      FieldName = 'UNITSINSTOCK'
      Origin = 'UNITSINSTOCK'
    end
    object ProductsTableUNITSONORDER: TSmallintField
      FieldName = 'UNITSONORDER'
      Origin = 'UNITSONORDER'
    end
    object ProductsTableREORDERLEVEL: TSmallintField
      FieldName = 'REORDERLEVEL'
      Origin = 'REORDERLEVEL'
    end
    object ProductsTableDISCONTINUED: TStringField
      FieldName = 'DISCONTINUED'
      Origin = 'DISCONTINUED'
      Required = True
      Size = 25
    end
    object ProductsTableELEMENTS1: TFloatField
      FieldName = 'ELEMENTS1'
      Origin = 'ELEMENTS1'
    end
    object ProductsTableELEMENTS2: TStringField
      FieldName = 'ELEMENTS2'
      Origin = 'ELEMENTS2'
      Size = 30
    end
  end
  object WebFileDispatcher: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/html'
        Extensions = 'html;htm'
      end
      item
        MimeType = 'application/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpeg;jpg'
      end
      item
        MimeType = 'image/png'
        Extensions = 'png'
      end
      item
        MimeType = 'image/svg+xml'
        Extensions = 'svg;svgz'
      end
      item
        MimeType = 'image/x-icon'
        Extensions = 'ico'
      end>
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '../../html/'
    VirtualPath = '/'
    Left = 96
    Top = 198
  end
end
