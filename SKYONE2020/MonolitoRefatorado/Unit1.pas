unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait;

type
  TForm1 = class(TForm)
    edtNome: TLabeledEdit;
    edtCPF: TLabeledEdit;
    edtLimite: TLabeledEdit;
    edtCEP: TLabeledEdit;
    btnBuscarCEP: TButton;
    memEndereco: TMemo;
    btnGravar: TButton;
    qryCEP: TFDQuery;
    qryGravaCliente: TFDQuery;
    FDConnection: TFDConnection;
    qryGravaClienteNOME: TStringField;
    qryGravaClienteCPF: TStringField;
    qryGravaClienteLIMITE: TFMTBCDField;
    qryGravaClienteCEP: TStringField;
    qryGravaClienteENDERECO: TMemoField;
    procedure btnBuscarCEPClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    function PesquisarCEP(var Logradouro: string; var Bairro: string; var Cidade: string; var UF: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnBuscarCEPClick(Sender: TObject);
var
  Logradouro, Bairro, Cidade, UF: String;
begin
  if PesquisarCEP(Logradouro, Bairro, Cidade, UF) then
    memEndereco.Lines.Add(Trim(
      Logradouro + sLineBreak +
      Bairro + sLineBreak +
      Cidade + '/' +
      UF))
  else
    ShowMessage('CEP n�o encontrado');
end;

function TForm1.PesquisarCEP(var Logradouro: string; var Bairro: string; var Cidade: string; var UF: string): Boolean;
begin
  result := False;
  qryCEP.Open('select * from CEPS where CEP = :CEP', [edtCEP.Text], [ftString]);
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


procedure TForm1.btnGravarClick(Sender: TObject);
var
  LimiteMaximo: Real;
begin
  if Trim(edtCPF.Text).Length <= 3 then
  begin
    ShowMessage('CPF Inv�lido!');
    edtCPF.SetFocus;
    abort;
  end;

  LimiteMaximo := StrToInt(edtCPF.Text[1])*100;
  if StrToFloatDef(edtLimite.Text, 0) > LimiteMaximo then
  begin
    ShowMessage('Limite inv�lido. Valor m�ximo: ' +
                FormatSettings.CurrencyString +
                FormatFloat('#,##0.00', LimiteMaximo));
    edtLimite.SetFocus;
    abort;
  end;

  try
    qryGravaCliente.Open;
    qryGravaCliente.Append;
    qryGravaClienteNOME.AsString := edtNome.Text;
    qryGravaClienteCPF.AsString := edtCPF.Text;
    qryGravaClienteLIMITE.AsFloat := StrToFloatDef(edtLimite.Text, 0);
    qryGravaClienteCEP.AsString := edtCEP.Text;
    qryGravaClienteENDERECO.Text := memEndereco.Text;
    qryGravaCliente.Post;
    qryGravaCliente.Close;

    ShowMessage('Cliente cadastrado com sucesso!');
  except
    on E: Exception do
    begin
      ShowMessage('Falha ao cadastrar cliente: ' + E.Message);
      abort;
    end;
  end;

  edtNome.Clear;
  edtCPF.Clear;
  edtLimite.Clear;
  edtCEP.Clear;
  memEndereco.Clear;
  edtNome.SetFocus;
end;

end.
