unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Edit, FMX.ListBox, FMX.Layouts;

type
  TForm2 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    edtCEP: TEdit;
    btnBuscarCEP: TButton;
    ListBox2: TListBox;
    lbiCEP: TListBoxItem;
    ToolBar2: TToolBar;
    Label2: TLabel;
    lbiLogradouro: TListBoxItem;
    lbiCidade: TListBoxItem;
    lbiBairro: TListBoxItem;
    Button1: TButton;
    procedure btnBuscarCEPClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses untDmCep, System.Threading;

{$R *.iPhone55in.fmx IOS}

procedure TForm2.btnBuscarCEPClick(Sender: TObject);
var
  Logradouro, Bairro, Cidade, UF: String;
begin
  TTask.Run(
    procedure
    begin
      if dmCep.PesquisarCEP(edtCEP.Text, Logradouro, Bairro, Cidade, UF) then
      begin
        TThread.Synchronize( nil,
          procedure
          begin
            lbiCEP.Text := edtCEP.Text;
            lbiLogradouro.Text := Logradouro;
            lbiBairro.Text := Bairro;
            lbiCidade.Text := Cidade + '/' + UF;
            TabControl1.Next;
          end);
      end
      else
        TThread.Synchronize( nil,
          procedure
          begin
            ShowMessage('CEP não encontrado');
          end);
    end);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  TabControl1.Previous;
end;

end.
