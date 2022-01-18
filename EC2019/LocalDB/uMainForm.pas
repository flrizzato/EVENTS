unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.ConsoleUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, FMX.StdCtrls;

type
  TMainForm = class(TForm)
    EmployeeConnection: TFDConnection;
    EmployeeTable: TFDQuery;
    EmployeeTableEMP_NO: TSmallintField;
    EmployeeTableFIRST_NAME: TStringField;
    EmployeeTableLAST_NAME: TStringField;
    EmployeeTablePHONE_EXT: TStringField;
    EmployeeTableHIRE_DATE: TSQLTimeStampField;
    EmployeeTableDEPT_NO: TStringField;
    EmployeeTableJOB_CODE: TStringField;
    EmployeeTableJOB_GRADE: TSmallintField;
    EmployeeTableJOB_COUNTRY: TStringField;
    EmployeeTableSALARY: TFMTBCDField;
    EmployeeTableFULL_NAME: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    updEmployee: TFDUpdateSQL;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    StyleBook1: TStyleBook;
    CornerButton1: TCornerButton;
    procedure EmployeeConnectionBeforeConnect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.CornerButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.EmployeeConnectionBeforeConnect(Sender: TObject);
begin
{$IFDEF LINUX}
  EmployeeConnection.Params.Database := '/opt/interbasedev/examples/employee.gdb';
{$ENDIF}
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  EmployeeTable.Open;
end;

end.
