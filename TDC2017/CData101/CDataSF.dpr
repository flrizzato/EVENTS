program CDataSF;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormMain in 'uFormMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
