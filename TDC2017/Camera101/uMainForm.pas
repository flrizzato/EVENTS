unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MediaLibrary.Actions, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.Objects;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ImageContainer: TImage;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    StyleBook1: TStyleBook;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.iPad.fmx IOS}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TMainForm.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction1.Bitmap.Assign(ImageContainer.Bitmap);
end;

procedure TMainForm.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  ImageContainer.Bitmap.Assign(Image);
end;

procedure TMainForm.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  ImageContainer.Bitmap.Assign(Image);
end;

end.
