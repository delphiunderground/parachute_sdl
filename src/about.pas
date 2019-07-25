unit about;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    be_picture: TBevel;
    im_picture: TImage;
    la_mybirthdate1: TLabel;
    la_mybirthdate2: TLabel;
    la_mybirthplace1: TLabel;
    la_mybirthplace2: TLabel;
    la_myhobby1: TLabel;
    la_myhobby2: TLabel;
    la_myjob1: TLabel;
    la_myjob2: TLabel;
    la_myname1: TLabel;
    la_myname2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  AboutForm: TAboutForm;

implementation

uses
  {$IFDEF FPC}
  LCLType;
  {$ELSE}
  Windows;
  {$ENDIF}

{$R *.dfm}

{ TAboutForm }

procedure TAboutForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then Close;
end;

end.
