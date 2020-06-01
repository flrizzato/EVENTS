unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  REST.Backend.ServiceTypes, REST.Backend.MetaTypes, System.JSON,
  REST.Backend.EMSServices, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.Controls.Presentation, FMX.StdCtrls,
  Data.Bind.Components, Data.Bind.DBScope, REST.Response.Adapter, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListView,
  Data.Bind.ObjectScope, REST.Backend.BindSource,
  REST.Backend.ServiceComponents, REST.Backend.EMSProvider,
  REST.Backend.Providers, FMX.Edit, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    EMSProvider1: TEMSProvider;
    BackendQuery1: TBackendQuery;
    ListView1: TListView;
    FDMemTable1: TFDMemTable;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Button1: TButton;
    EditName: TEdit;
    EditValue: TEdit;
    ButtonUpdate: TButton;
    LinkListControlToField1: TLinkListControlToField;
    BackendUsers1: TBackendUsers;
    EditId: TEdit;
    LinkControlToField1: TLinkControlToField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonGet: TButton;
    ButtonDelete: TButton;
    ClearEditButton1: TClearEditButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonGetClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  BackendQuery1.Execute;
end;

procedure TForm1.ButtonUpdateClick(Sender: TObject);
var
  LValue: TJSONObject;
  LResult: TBackendEntityValue;
begin
  LValue := TJSONObject.Create;
  try
    LValue.AddPair(EditName.Text, EditValue.Text);
    BackendUsers1.Users.UpdateUser(
      EditID.Text, LValue, LResult );
  finally
    LValue.Free;
  end;
end;

procedure TForm1.ButtonGetClick(Sender: TObject);
begin
  BackendUsers1.Users.FindUser(EditId.Text,
    procedure(const AObject: TBackendEntityValue; const AJSON: TJSONObject)
    var
      LValue: string;
    begin
      if AJSON.TryGetValue(EditName.Text, LValue) then
        EditValue.Text := LValue
      else
        ShowMessage(Format('%s not found', [EditName.Text]));
    end
  )
end;

procedure TForm1.ButtonDeleteClick(Sender: TObject);
var
  LValue: TJSONObject;
  LResult: TBackendEntityValue;
begin
  LValue := TJSONObject.Create;
  try
    LValue.AddPair(EditName.Text, TJSONNull.Create);
    BackendUsers1.Users.UpdateUser(
      EditID.Text, LValue, LResult );
  finally
    LValue.Free;
  end;
end;

end.
