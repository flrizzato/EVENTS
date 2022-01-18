unit untDmCep;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef {$IFDEF MSWINDOWS}, FireDAC.VCLUI.Wait {$ENDIF}, Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, REST.Types, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TdmCep = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    FDMemTable1logradouro: TWideStringField;
    FDMemTable1bairro: TWideStringField;
    FDMemTable1cidade: TWideStringField;
    FDMemTable1estado: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function PesquisarCEP(const ACEP: string; var Logradouro: string;
      var Bairro: string; var Cidade: string; var UF: string): Boolean;
  end;

var
  dmCep: TdmCep;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmCep.DataModuleCreate(Sender: TObject);
begin
  {$IFNDEF LINUX64}
    RESTClient1.BaseURL := 'https://c112843e.ngrok.io'
  {$ELSE}
    RESTClient1.BaseURL := 'http://c112843e.ngrok.io'
  {$ENDIF}
end;

function TdmCep.PesquisarCEP(const ACEP: string; var Logradouro: string;
  var Bairro: string; var Cidade: string; var UF: string): Boolean;
begin
  result := False;

  RESTResponse1.ResetToDefaults;
  RESTRequest1.Params.ParameterByName('num').Value := ACEP;
  try
    RESTRequest1.Execute;
    if (RESTResponse1.StatusCode = 200) and Assigned(RESTResponse1.JSONValue)
    then
    begin
      Logradouro := RESTResponse1.JSONValue.GetValue<string>('logradouro');
      // FDMemTable1.FieldByName('logradouro').AsString;
      Bairro := FDMemTable1.FieldByName('bairro').AsString;
      Cidade := FDMemTable1.FieldByName('cidade').AsString;
      UF := FDMemTable1.FieldByName('estado').AsString;
      result := True;
    end;
  except
    on E: Exception do
    begin
      // fazer o log da falha na requisição...
    end;
  end;

  // qryCEP.Open('select * from CEPS where CEP = :CEP', [ACEP], [ftString]);
  // try
  // if not qryCEP.IsEmpty then
  // begin
  // Logradouro := qryCEP.FieldByName('logradouro').AsString;
  // Bairro := qryCEP.FieldByName('bairro').AsString;
  // Cidade := qryCEP.FieldByName('cidade').AsString;
  // UF := qryCEP.FieldByName('uf').AsString;
  // result := True;
  // end;
  // finally
  // qryCEP.Close;
  // end;
end;

end.
