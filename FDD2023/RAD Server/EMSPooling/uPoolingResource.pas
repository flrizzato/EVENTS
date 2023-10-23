unit uPoolingResource;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  EMS.DataSetResource, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  [ResourceName('ems101_pooled')]
  TEmployeePooledResource1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryCUSTOMER: TFDQuery;
    [ResourceSuffix('agenda')]
    dsrCUSTOMER: TEMSDataSetResource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryCUSTOMEREMP_NO: TSmallintField;
    qryCUSTOMERFIRST_NAME: TStringField;
    qryCUSTOMERLAST_NAME: TStringField;
    qryCUSTOMERPHONE_EXT: TStringField;
    qryCUSTOMERLOCATION: TStringField;
    qryCUSTOMERPHONE_NO: TStringField;
    procedure FDConnection1BeforeConnect(Sender: TObject);

  published
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure Register;
begin
  RegisterResource(TypeInfo(TEmployeePooledResource1));
end;

procedure SetupFDManager;
var
  oParams: TStrings;
begin
  oParams := TStringList.Create;
  oParams.Add('DriverID=FB');
  oParams.Add('Pooled=True');
  oParams.Add('POOL_MaximumItems=3');
  oParams.Add('Protocol=TCPIP');
  oParams.Add('Database=C:\data\employee.fdb');
  oParams.Add('Server=127.0.0.1');
  oParams.Add('Port=3060');
  oParams.Add('User_Name=firedac');
  oParams.Add('Password=123');
  oParams.Add('CharacterSet=win1252');
  oParams.Add('ExtendedMetadata=True');
  FDManager.AddConnectionDef('EMPLOYEE_POOLED', 'FB', oParams);
end;

procedure TEmployeePooledResource1.FDConnection1BeforeConnect(Sender: TObject);
begin
  FDConnection1.ConnectionDefName := 'EMPLOYEE_POOLED';
end;

initialization
  Register;
  SetupFDManager;
end.


