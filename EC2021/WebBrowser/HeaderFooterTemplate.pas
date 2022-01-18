unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Colors, FMX.WebBrowser, System.Actions,
  FMX.ActnList, FMX.ListBox;

type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    FooterLabel: TLabel;
    WebBrowser1: TWebBrowser;
    StyleBook1: TStyleBook;
    cmbURL: TComboBox;
    procedure cmbURLClosePopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;

implementation

{$R *.fmx}

procedure THeaderFooterForm.cmbURLClosePopup(Sender: TObject);
begin
  WebBrowser1.Navigate(cmbURL.Selected.Text);
end;

end.
