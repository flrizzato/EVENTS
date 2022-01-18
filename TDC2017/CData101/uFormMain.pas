unit uFormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.CData.Salesforce, FireDAC.Phys.CData.SalesforceDef,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.ListView, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    RizzatoConnection: TFDConnection;
    ContactTable: TFDQuery;
    ContactTableId: TWideStringField;
    ContactTableIsDeleted: TBooleanField;
    ContactTableMasterRecordId: TWideStringField;
    ContactTableAccountId: TWideStringField;
    ContactTableLastName: TWideStringField;
    ContactTableFirstName: TWideStringField;
    ContactTableSalutation: TWideStringField;
    ContactTableName: TWideStringField;
    ContactTableOtherStreet: TWideStringField;
    ContactTableOtherCity: TWideStringField;
    ContactTableOtherState: TWideStringField;
    ContactTableOtherPostalCode: TWideStringField;
    ContactTableOtherCountry: TWideStringField;
    ContactTableOtherLatitude: TFloatField;
    ContactTableOtherLongitude: TFloatField;
    ContactTableMailingStreet: TWideStringField;
    ContactTableMailingCity: TWideStringField;
    ContactTableMailingState: TWideStringField;
    ContactTableMailingPostalCode: TWideStringField;
    ContactTableMailingCountry: TWideStringField;
    ContactTableMailingLatitude: TFloatField;
    ContactTableMailingLongitude: TFloatField;
    ContactTablePhone: TWideStringField;
    ContactTableFax: TWideStringField;
    ContactTableMobilePhone: TWideStringField;
    ContactTableHomePhone: TWideStringField;
    ContactTableOtherPhone: TWideStringField;
    ContactTableAssistantPhone: TWideStringField;
    ContactTableReportsToId: TWideStringField;
    ContactTableEmail: TWideStringField;
    ContactTableTitle: TWideStringField;
    ContactTableDepartment: TWideStringField;
    ContactTableAssistantName: TWideStringField;
    ContactTableLeadSource: TWideStringField;
    ContactTableBirthdate: TSQLTimeStampField;
    ContactTableDescription: TWideMemoField;
    ContactTableOwnerId: TWideStringField;
    ContactTableCreatedDate: TSQLTimeStampField;
    ContactTableCreatedById: TWideStringField;
    ContactTableLastModifiedDate: TSQLTimeStampField;
    ContactTableLastModifiedById: TWideStringField;
    ContactTableSystemModstamp: TSQLTimeStampField;
    ContactTableLastActivityDate: TSQLTimeStampField;
    ContactTableLastCURequestDate: TSQLTimeStampField;
    ContactTableLastCUUpdateDate: TSQLTimeStampField;
    ContactTableLastViewedDate: TSQLTimeStampField;
    ContactTableLastReferencedDate: TSQLTimeStampField;
    ContactTableEmailBouncedReason: TWideStringField;
    ContactTableEmailBouncedDate: TSQLTimeStampField;
    ContactTableIsEmailBounced: TBooleanField;
    ContactTablePhotoUrl: TWideStringField;
    ContactTableJigsaw: TWideStringField;
    ContactTableJigsawContactId: TWideStringField;
    ContactTableCleanStatus: TWideStringField;
    ContactTableLevel__c: TWideStringField;
    ContactTableLanguages__c: TWideStringField;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
