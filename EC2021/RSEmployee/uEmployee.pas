unit uEmployee;

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
  FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  [ResourceName('myapp')]
  TEmployeeResource1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryEMPLOYEE: TFDQuery;
    [ResourceSuffix('employee')]
    dsrEMPLOYEE: TEMSDataSetResource;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure FDConnection1BeforeConnect(Sender: TObject);

  published
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure Register;
begin
  RegisterResource(TypeInfo(TEmployeeResource1));
end;

procedure TEmployeeResource1.FDConnection1BeforeConnect(Sender: TObject);
begin
  {$IFDEF LINUX}
  FDConnection1.Params.Database := '/home/rizzato/data/employee.gdb';
  {$ENDIF}
end;

initialization
  Register;
end.


