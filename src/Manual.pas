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

unit Manual;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TManualForm }

  TManualForm = class(TForm)
    btn_close_down: TImage;
    btn_close_up: TImage;
    btn_left_down: TImage;
    btn_left_up: TImage;
    btn_right_down: TImage;
    btn_right_up: TImage;
    im_page_01: TImage;
    im_page_02: TImage;
    im_page_03: TImage;
    im_page_04: TImage;
    im_page_05: TImage;
    im_page_06: TImage;
    im_page_07: TImage;
    im_page_08: TImage;
    im_page_top: TImage;
    // visualization
    procedure Vid_ShowPage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure im_page_topMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure im_page_topMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure btn_close_upMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btn_close_upMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btn_left_upMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btn_left_upMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btn_right_upMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btn_right_upMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure key_left_down;
    procedure key_left_up;
    procedure key_right_down;
    procedure key_right_up;
    procedure key_esc_down;
    procedure key_esc_up;
  private
    { private declarations }
  public
    { public declarations }
  end;

const
  TOTALPAGES = 8;

var
  ManualForm: TManualForm;
  iMouseX, iMouseY: integer;                                                    // cursor coordinates (to drag main form)
{ * display arrays of images * }
  aIm_pages:        array[1..TOTALPAGES] of TImage;                             // instructions manual pages
{ * integers and booleans * }
  iActivePage:      integer;                                                    // currently displayed page

implementation

uses
  {$IFDEF FPC}
  LCLType;
  {$ELSE}
  Windows;
  {$ENDIF}

{$R *.dfm}

procedure TManualForm.FormCreate(Sender: TObject);
begin
  aIm_pages[1]:=im_page_01;
  aIm_pages[2]:=im_page_02;
  aIm_pages[3]:=im_page_03;
  aIm_pages[4]:=im_page_04;
  aIm_pages[5]:=im_page_05;
  aIm_pages[6]:=im_page_06;
  aIm_pages[7]:=im_page_07;
  aIm_pages[8]:=im_page_08;
  // variables init
  DoubleBuffered:=true;                                                       // enables double buffering for rendering of this form
end;

procedure TManualForm.FormShow(Sender: TObject);
begin
  Vid_ShowPage;
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * PROCEDURES: DISPLAY MANAGEMENT                                           * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TManualForm.Vid_ShowPage;
{ displays active page into the "container" image                              }
begin
  im_page_top.Picture:=aIm_pages[iActivePage].Picture;
  if iActivePage=1 then
    begin
      btn_left_down.visible:=false;
      btn_left_up.visible:=false;
    end
  else
    if iActivePage=TOTALPAGES then
      begin
        btn_right_down.visible:=false;
        btn_right_up.visible:=false;
      end
    else
      begin
        btn_left_down.visible:=true;
        btn_left_up.visible:=true;
        btn_right_down.visible:=true;
        btn_right_up.visible:=true;
      end;
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * PROCEDURES: INPUT MANAGEMENT - EVENTS                                    * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TManualForm.im_page_topMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
{ needed to drag the main form                                                 }
begin
  iMouseX:=X;
  iMouseY:=Y;
end;

procedure TManualForm.im_page_topMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
{ needed to drag the main form                                                 }
begin
  if ssLeft in Shift then begin
      Top:=Top+Y-iMouseY;
      Left:=Left+X-iMouseX;
  end;
end;

{ left button }
procedure TManualForm.btn_left_upMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbLeft then key_left_down;
end;

procedure TManualForm.btn_left_upMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbLeft then key_left_up;
end;

{ right button }
procedure TManualForm.btn_right_upMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbLeft then key_right_down;
end;

procedure TManualForm.btn_right_upMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbLeft then key_right_up
end;

{ close button }
procedure TManualForm.btn_close_upMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbLeft then key_esc_down;
end;

procedure TManualForm.btn_close_upMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbLeft then key_esc_up;
end;

{ keypresses down/up }
procedure TManualForm.FormKeyDown(Sender: TObject; var Key:Word; Shift:TShiftState);
begin
  if (key=VK_LEFT)  and (iActivePage>1) then key_left_down;
  if (key=VK_RIGHT) and (iActivePage<TOTALPAGES) then key_right_down;
  if key=VK_ESCAPE then key_esc_down;
end;

procedure TManualForm.FormKeyUp(Sender: TObject; var Key:Word; Shift:TShiftState);
begin
  if (key=VK_LEFT)  and (iActivePage>1) then key_left_up;
  if (key=VK_RIGHT) and (iActivePage<TOTALPAGES) then key_right_up;
  if key=VK_ESCAPE then key_esc_up;
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * PROCEDURES: INPUT MANAGEMENT - ACTIONS                                   * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TManualForm.key_left_down;
begin
  btn_left_up.visible:=false;
end;

procedure TManualForm.key_left_up;
begin
  Dec(iActivePage);
  Vid_ShowPage;
end;

procedure TManualForm.key_right_down;
begin
  btn_right_up.visible:=false;
end;

procedure TManualForm.key_right_up;
begin
  Inc(iActivePage);
  Vid_ShowPage;
end;

procedure TManualForm.key_esc_down;
begin
  btn_close_up.visible:=false;
end;

procedure TManualForm.key_esc_up;
begin
  btn_close_up.visible:=true;
  Close;
end;

initialization
  iActivePage:=1;

end.
