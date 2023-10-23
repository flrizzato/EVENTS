unit uCustomerResource;

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
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  [ResourceName('ems101')]
  TMyfirstemspackageResource1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryCUSTOMER: TFDQuery;
    [ResourceSuffix('customer')]
    dsrCUSTOMER: TEMSDataSetResource;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryCUSTOMERCUST_NO: TIntegerField;
    qryCUSTOMERCUSTOMER: TStringField;
    qryCUSTOMERCONTACT_FIRST: TStringField;
    qryCUSTOMERCONTACT_LAST: TStringField;
    qryCUSTOMERPHONE_NO: TStringField;
    qryCUSTOMERADDRESS_LINE1: TStringField;
    qryCUSTOMERADDRESS_LINE2: TStringField;
    qryCUSTOMERCITY: TStringField;
    qryCUSTOMERSTATE_PROVINCE: TStringField;
    qryCUSTOMERCOUNTRY: TStringField;
    qryCUSTOMERPOSTAL_CODE: TStringField;
    qryCUSTOMERON_HOLD: TStringField;

  published
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure Register;
begin
  RegisterResource(TypeInfo(TMyfirstemspackageResource1));
end;

initialization
  Register;
end.


