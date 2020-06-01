unit untDmCep;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TdmCep = class(TDataModule)
    qryCEP: TFDQuery;
    FDConnection: TFDConnection;
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

function TdmCep.PesquisarCEP(const ACEP: string; var Logradouro: string;
  var Bairro: string; var Cidade: string; var UF: string): Boolean;
begin
  result := False;
  qryCEP.Open('select * from CEPS where CEP = :CEP', [ACEP], [ftString]);
  try
    if not qryCEP.IsEmpty then
    begin
      Logradouro := qryCEP.FieldByName('logradouro').AsString;
      Bairro := qryCEP.FieldByName('bairro').AsString;
      Cidade := qryCEP.FieldByName('cidade').AsString;
      UF := qryCEP.FieldByName('uf').AsString;
      result := True;
    end;
  finally
    qryCEP.Close;
  end;
end;

end.
