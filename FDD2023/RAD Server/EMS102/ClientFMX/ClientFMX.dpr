program ClientFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  uMainForm in 'uMainForm.pas' {MainForm},
  uJSONHelper in '..\Common\uJSONHelper.pas' {JSONHelperDM: TDataModule},
  uJSONUtil in '..\Common\uJSONUtil.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
