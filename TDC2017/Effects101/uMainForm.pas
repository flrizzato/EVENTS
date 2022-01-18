unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Filter.Effects, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Image1: TImage;
    Switch1: TSwitch;
    RippleEffect1: TRippleEffect;
    procedure Switch1Switch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  RippleEffect1.Enabled := not RippleEffect1.Enabled;
end;

end.
