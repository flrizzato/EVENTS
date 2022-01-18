program console101;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

begin
  try
    Writeln('Hello from Delphi Linux!');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
