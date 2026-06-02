unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Web.Stencils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TWebModule1 = class(TWebModule)
    WebStencilsEngine1: TWebStencilsEngine;
    WebStencilsProcessor1: TWebStencilsProcessor;
    NorthwindConnection: TFDConnection;
    ProductsTable: TFDQuery;
    WebFileDispatcher: TWebFileDispatcher;
    ProductsTablePRODUCTID: TIntegerField;
    ProductsTablePRODUCTNAME: TStringField;
    ProductsTableSUPPLIERID: TIntegerField;
    ProductsTableCATEGORYID: TIntegerField;
    ProductsTableQUANTITYPERUNIT: TStringField;
    ProductsTableUNITPRICE: TBCDField;
    ProductsTableUNITSINSTOCK: TSmallintField;
    ProductsTableUNITSONORDER: TSmallintField;
    ProductsTableREORDERLEVEL: TSmallintField;
    ProductsTableDISCONTINUED: TStringField;
    ProductsTableELEMENTS1: TFloatField;
    ProductsTableELEMENTS2: TStringField;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  ProductsTable.Open;
  WebStencilsProcessor1.AddVar('dataset', ProductsTable, False);
  Response.Content := WebStencilsProcessor1.Content;
  ProductsTable.Close;
  Handled := True;
end;

end.
