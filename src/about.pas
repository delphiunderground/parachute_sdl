(*
 * This file is part of the parachute_sdl program.
 * https://github.com/delphiunderground/parachute_sdl
 * Copyright (C) 2019 DelphiUnderground <delphiunderground@outlook.be>.
 *
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version
 * 3.0 as published by the Free Software Foundation.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; if not, see <https://www.gnu.org/licenses/>.
 *)

unit about;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls
  {$IFNDEF FPC},jpeg{$ENDIF}
  ;

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
