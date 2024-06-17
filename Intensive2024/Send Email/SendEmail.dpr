program SendEmail;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uMainDM in 'uMainDM.pas' {MainDM: TDataModule},
  uMailData in 'uMailData.pas';

begin
  try
    var MainDM := TMainDM.Create(nil);
    MainDM.SendEmailAPI('your tenant id',
                        'your user id',
                        'your client id',
                        'your client secret');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
