object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  Caption = 'Json Data Mapping Wizard'
  ClientHeight = 553
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 120
  TextHeight = 20
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 5
    Top = 63
    Width = 775
    Height = 485
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitWidth = 769
    ExplicitHeight = 484
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 775
    Height = 48
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 769
    object Button1: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 107
      Height = 40
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Caption = 'Execute'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://jsonplaceholder.typicode.com'
    Params = <>
    SynchronizedEvents = False
    Left = 80
    Top = 100
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Resource = 'users'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 80
    Top = 170
  end
  object RESTResponse1: TRESTResponse
    Left = 80
    Top = 240
  end
end
