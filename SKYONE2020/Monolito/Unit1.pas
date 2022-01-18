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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnBuscarCEPClick(Sender: TObject);
begin
  qryCEP.Open('select * from CEPS where CEP = :CEP',
              [edtCEP.Text],
              [ftString]);
  try
    if not qryCEP.IsEmpty then
      memEndereco.Lines.Add(
        qryCEP.FieldByName('logradouro').AsString + sLineBreak +
        qryCEP.FieldByName('bairro').AsString + sLineBreak +
        qryCEP.FieldByName('cidade').AsString + '/' +
        qryCEP.FieldByName('uf').AsString + sLineBreak)
    else
      ShowMessage('CEP n�o encontrado');
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
