unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, Vcl.ExtCtrls,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uJsonMapping, System.JSON;

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTRequest1.Execute;

  TJSONMapper<Users>.SetDefaultLibrary('System.JSON.Serializers');
  var LUsers := Users.FromJSON(RESTResponse1.JSONText);

  Memo1.Clear;
  for var i: integer := Low(LUsers.Dataset) to High(LUsers.Dataset) do
  begin
    Memo1.Lines.Add(LUsers.Dataset[i].name);
    Memo1.Lines.Add(LUsers.Dataset[i].username);
    Memo1.Lines.Add(LUsers.Dataset[i].email);
    Memo1.Lines.Add(LUsers.Dataset[i].address.street);
    Memo1.Lines.Add(LUsers.Dataset[i].address.suite);
    Memo1.Lines.Add(LUsers.Dataset[i].address.city);
    Memo1.Lines.Add(LUsers.Dataset[i].address.zipcode);
    Memo1.Lines.Add(LUsers.Dataset[i].address.geo.lat.ToString);
    Memo1.Lines.Add(LUsers.Dataset[i].address.geo.lat.ToString);
    Memo1.Lines.Add(LUsers.Dataset[i].phone);
    Memo1.Lines.Add(LUsers.Dataset[i].website);
    Memo1.Lines.Add(LUsers.Dataset[i].company.name);
    Memo1.Lines.Add('------------------------------');
  end;
end;

end.
