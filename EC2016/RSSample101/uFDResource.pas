unit uFDResource;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Stan.StorageJSON, FireDAC.VCLUI.Wait;

type

  [ResourceName('FDResource')]
  TFDResourceResource1 = class(TDataModule)
    EmployeeConnection: TFDConnection;
    CustomerTable: TFDQuery;
    FDSchemaAdapter1: TFDSchemaAdapter;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    CustomerTableCUST_NO: TFDAutoIncField;
    CustomerTableCUSTOMER: TStringField;
    CustomerTableCONTACT_FIRST: TStringField;
    CustomerTableCONTACT_LAST: TStringField;
    CustomerTablePHONE_NO: TStringField;
    CustomerTableADDRESS_LINE1: TStringField;
    CustomerTableADDRESS_LINE2: TStringField;
    CustomerTableCITY: TStringField;
    CustomerTableSTATE_PROVINCE: TStringField;
    CustomerTableCOUNTRY: TStringField;
    CustomerTablePOSTAL_CODE: TStringField;
    CustomerTableON_HOLD: TStringField;
  published
    procedure Get(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    procedure Post(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{ %CLASSGROUP 'System.Classes.TPersistent' }

{$R *.dfm}

procedure TFDResourceResource1.Get(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  fMem: TMemoryStream;
begin
  fMem := TMemoryStream.Create;
  try
    CustomerTable.Open;
    FDSchemaAdapter1.SaveToStream(fMem, TFDStorageFormat.sfJSON);
    AResponse.Body.SetStream(fMem, 'application/json', True);
  except
    on E: Exception do
    begin
      fMem.Free;
      raise;
    end;
  end;
end;

procedure TFDResourceResource1.Post(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var fMem: TStream;
begin
  if not ARequest.Body.TryGetStream(fMem) then
    raise Exception.Create('Nada para atualizar...');
  fMem.Position := 0;
  FDSchemaAdapter1.LoadFromStream(fMem, TFDStorageFormat.sfJSON);
  FDSchemaAdapter1.ApplyUpdates;
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TFDResourceResource1));
end;

initialization

Register;

end.
