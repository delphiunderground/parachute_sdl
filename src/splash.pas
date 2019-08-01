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

unit splash;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  {$ifdef linux}LCLIntf,{$ENDIF}
  {$IFNDEF FPC}jpeg,{$ENDIF}
  sdl2, sdl2_mixer;

type

  { TSplashForm }

  TSplashForm = class(TForm)
    btn_play: TButton;
    im_box_picture: TImage;
    la_game_title: TLabel;
    la_http: TLabel;
    la_ported1: TLabel;
    la_release_date: TLabel;
    la_ported: TLabel;
    la_version: TLabel;
    la_ported2: TLabel;
    procedure btn_playClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure la_httpClick(Sender: TObject);
   private
    { private declarations }
  public
    { public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

uses
  {$IFDEF FPC}
  LCLType,
  {$ELSE}
  shellapi,
  {$ENDIF}
  Windows,
  unit1;

const
  DirSound='../Sound/';

{ TSplashForm }

{$R *.dfm}

procedure TSplashForm.la_httpClick(Sender: TObject);
begin
  {$IFNDEF LINUX}
  ShellExecute(Handle,'open','https://github.com/delphiunderground',nil,'',SW_SHOWNORMAL);
  {$ELSE}
  OpenURL('https://github.com/delphiunderground');
  {$ENDIF}
end;

procedure TSplashForm.btn_playClick(Sender:TObject);
begin
  //There is sound (I supposse!)
  bSound:=true;
  //Initialize SDL...
  if (SDL_Init(SDL_INIT_AUDIO)<>0) then begin
    bSound:=false;
  end else begin
      //Open Audio...
      if (Mix_OpenAudio(44100, AUDIO_S16, 1, 4096)<>0) then begin
        SDL_Quit();
        bSound:=false;
      end;
  end;
  //samples initialization
  if bSound then begin
      //Load Samples..
      pf_chance:=Mix_LoadWAV(DirSound+'Chance.wav');
      pf_got:=   Mix_LoadWAV(DirSound+'Got.wav');
      pf_miss1:= Mix_LoadWAV(DirSound+'Miss1.wav');
      pf_miss2:= Mix_LoadWAV(DirSound+'Miss2.wav');
      pf_miss3:= Mix_LoadWAV(DirSound+'Miss3.wav');
      pf_tick:=  Mix_LoadWAV(DirSound+'Tick.wav');
      pf_alarm:= Mix_LoadWAV(DirSound+'Alarm.wav');
      if ((pf_chance=nil) or (pf_got=nil) or (pf_miss1=nil) or (pf_miss2=nil) or (pf_miss3=nil) or (pf_tick=nil) or (pf_alarm=nil)) then begin
          MessageDlg('Sound folder unproperly installed. Please read instructions, changed to ''No Sound''.', mtError, [mbOK], 0);
          bSound:=false;
          Mix_CloseAudio();
          SDL_Quit();
        end;
    end;
  // shows game form and closes the splash screen
  // centers main form
  Form1.Position:=poScreenCenter;
  form1.show;
  splashform.close;
end;

procedure TSplashForm.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  //'1' or 'ENTER' keys
  if ((key=$31) or (key=VK_RETURN)) and btn_Play.enabled then btn_playClick(Sender);
  // 'ESC' key
  if key=VK_ESCAPE then Application.Terminate;
end;

procedure TSplashForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:=caFree;
end;

end.
