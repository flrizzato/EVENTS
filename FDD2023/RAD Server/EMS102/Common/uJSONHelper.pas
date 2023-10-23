unit uJSONHelper;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.Generics.Collections,
  FireDAC.Comp.BatchMove, FireDAC.DApt, FireDAC.Stan.StorageBin,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Stan.Intf,
  FireDAC.Comp.BatchMove.JSON, REST.Response.Adapter, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB;

type
  TJSONHelperDM = class(TDataModule)
    FDBatchMoveJSONWriter1: TFDBatchMoveJSONWriter;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    FDBatchMove1: TFDBatchMove;
    JsonData: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDataSetJSONHelper = class helper for TDataSet
  private
    procedure JsonToDataset(aJSON: TJSONObject; aDataset: TDataSet);
  public
    function AsJSONString: string;
    function AsJSONArray: TJSONArray;
    function AsJSONObject: TJSONObject;
    function AsJSONStream: TStream;
    procedure InsertFromJSON(aJSON: TJSONObject);
    procedure UpdateFromJSON(aJSON: TJSONObject);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataSetJSONHelper }

function TDataSetJSONHelper.AsJSONString: string;
begin
  var lDM: TJSONHelperDM := TJSONHelperDM.Create(nil);
  var lSTR: TStringStream := TStringStream.Create;
  try
    Self.DisableControls;
    if not Self.Active then
      Self.Active := True;
    lDM.FDBatchMoveDataSetReader1.DataSet := Self;
    lDM.FDBatchMoveJSONWriter1.Stream := lSTR;
    lDM.FDBatchMove1.Execute;
    Result := lSTR.DataString;
  finally
    lDM.Free;
    lSTR.Free;
    Self.EnableControls;
  end;
end;

function TDataSetJSONHelper.AsJSONArray: TJSONArray;
begin
  var lDM: TJSONHelperDM := TJSONHelperDM.Create(nil);
  Result := TJSONArray.Create;
  try
    Self.DisableControls;
    if not Self.Active then
      Self.Active := True;
    lDM.FDBatchMoveDataSetReader1.DataSet := Self;
    lDM.FDBatchMoveJSONWriter1.JsonArray := Result;
    lDM.FDBatchMove1.Execute;
  finally
    lDM.Free;
    Self.EnableControls;
  end;
end;

function TDataSetJSONHelper.AsJSONObject: TJSONObject;
begin
  Result := AsJSONArray.Items[0] as TJSONObject;
end;

function TDataSetJSONHelper.AsJSONStream: TStream;
begin
  var lDM: TJSONHelperDM := TJSONHelperDM.Create(nil);
  Result := TStringStream.Create;
  try
    Self.DisableControls;
    if not Self.Active then
      Self.Active := True;
    lDM.FDBatchMoveDataSetReader1.DataSet := Self;
    lDM.FDBatchMoveJSONWriter1.Stream := Result;
    lDM.FDBatchMove1.Execute;
  finally
    lDM.Free;
    Self.EnableControls;
  end;
end;

procedure TDataSetJSONHelper.JsonToDataset(aJSON: TJSONObject;
  aDataset: TDataSet);
var
  vConv: TCustomJSONDataSetAdapter;
begin
  vConv := TCustomJSONDataSetAdapter.Create(Nil);
  try
    vConv.DataSet := aDataset;
    vConv.UpdateDataSet(aJSON);
  finally
    vConv.Free;
  end;
end;

procedure TDataSetJSONHelper.InsertFromJSON(aJSON: TJSONObject);
begin
  var lDM: TJSONHelperDM := TJSONHelperDM.Create(nil);
  Self.DisableControls;
  try
    JsonToDataset(aJSON, lDM.JsonData);
    Self.Append;
    for var i: integer := 0 to lDM.JsonData.FieldCount - 1 do
      Self.FieldByName(lDM.JsonData.Fields[i].FieldName).Value :=
        lDM.JsonData.Fields[i].Value;
    Self.Post;
  finally
    lDM.Free;
    Self.EnableControls;
  end;
end;

procedure TDataSetJSONHelper.UpdateFromJSON(aJSON: TJSONObject);
begin
  var lDM: TJSONHelperDM := TJSONHelperDM.Create(nil);
  Self.DisableControls;
  try
    JsonToDataset(aJSON, lDM.JsonData);
    Self.Edit;
    for var i: integer := 0 to lDM.JsonData.FieldCount - 1 do
      Self.FieldByName(lDM.JsonData.Fields[i].FieldName).Value :=
        lDM.JsonData.Fields[i].Value;
    Self.Post;
  finally
    lDM.Free;
    Self.EnableControls;
  end;
end;

end.
