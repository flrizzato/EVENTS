program FMXMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainForm in 'uMainForm.pas' {Form2},
  untDmCep in '..\MonolitoChamandoServicoCEPs\untDmCep.pas' {dmCep: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmCep, dmCep);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
