program ClientVCL;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uJSONHelper in '..\Common\uJSONHelper.pas' {JSONHelperDM: TDataModule},
  uJSONUtil in '..\Common\uJSONUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
