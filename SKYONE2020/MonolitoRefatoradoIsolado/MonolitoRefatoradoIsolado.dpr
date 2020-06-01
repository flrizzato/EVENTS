program MonolitoRefatoradoIsolado;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  untDmCep in 'untDmCep.pas' {dmCep: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmCep, dmCep);
  Application.Run;
end.
