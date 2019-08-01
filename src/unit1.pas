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

unit Unit1;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  {$IFNDEF FPC}jpeg,{$ENDIF}
  Menus, Registry, sdl2, sdl2_mixer;

type

  { TForm1 }

  TForm1 = class(TForm)
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    pm_0_menu: TPopupMenu;
    btn_acl: TImage;
    btn_alarm: TImage;
    btn_game_a: TImage;
    btn_game_a_top: TImage;
    btn_game_b: TImage;
    btn_game_b_top: TImage;
    btn_left: TImage;
    btn_left_top: TImage;
    btn_right: TImage;
    btn_right_top: TImage;
    btn_time: TImage;
    btn_time_top: TImage;
    im_alarm0: TImage;
    im_alarm1: TImage;
    im_alarm2: TImage;
    im_alarm3: TImage;
    im_base: TImage;
    im_base_top: TImage;
    im_boat_x1: TImage;
    im_boat_x2: TImage;
    im_boat_x3: TImage;
    im_digit_0: TImage;
    im_digit_1: TImage;
    im_digit_2: TImage;
    im_digit_3: TImage;
    im_digit_4: TImage;
    im_digit_5: TImage;
    im_digit_6: TImage;
    im_digit_7: TImage;
    im_digit_8: TImage;
    im_digit_9: TImage;
    im_digit_pos1: TImage;
    im_digit_pos2: TImage;
    im_digit_pos3: TImage;
    im_digit_pos4: TImage;
    im_drown_1: TImage;
    im_drown_2: TImage;
    im_drown_3: TImage;
    im_drown_4: TImage;
    im_drown_5: TImage;
    im_drown_6: TImage;
    im_game_a: TImage;
    im_game_b: TImage;
    im_heli0: TImage;
    im_heli1: TImage;
    im_heli2: TImage;
    im_miss0: TImage;
    im_miss1: TImage;
    im_miss2: TImage;
    im_miss3: TImage;
    im_para_x1y1: TImage;
    im_para_x1y2: TImage;
    im_para_x1y3: TImage;
    im_para_x1y4: TImage;
    im_para_x1y5: TImage;
    im_para_x1y6: TImage;
    im_para_x1y7: TImage;
    im_para_x2y2: TImage;
    im_para_x2y3: TImage;
    im_para_x2y4: TImage;
    im_para_x2y5: TImage;
    im_para_x2y6: TImage;
    im_para_x2y7: TImage;
    im_para_x3y3: TImage;
    im_para_x3y4: TImage;
    im_para_x3y5: TImage;
    im_para_x3y5a: TImage;
    im_para_x3y5b: TImage;
    im_para_x3y6: TImage;
    im_para_x3y7: TImage;
    im_shark_2: TImage;
    im_shark_3: TImage;
    im_shark_4: TImage;
    im_shark_5: TImage;
    im_shark_6: TImage;
    im_time_am: TImage;
    im_time_pm: TImage;
    im_time_semicolon: TImage;
    Timer_alarm_clock: TTimer;
    Timer_alarm_ring: TTimer;
    Timer_Chance_Time: TTimer;
    timer_clock: TTimer;
    timer_game: TTimer;
    timer_game_over: TTimer;
    timer_miss: TTimer;
    { * POPUP MENU                                                               * }
    procedure pm_1_aboutClick(Sender:   TObject);
    procedure pm_3_readmeClick(Sender:  TObject);
    procedure pm_4_whatsnewClick(Sender:TObject);
    procedure pm_6_manualClick(Sender:  TObject);
    procedure pm_8_hiscoreClick(Sender: TObject);
    procedure pm_10_exitClick(Sender:   TObject);
    procedure pm_12_muteaudioClick(Sender:TObject);
    { * PROCEDURES: INITIALIZE & SHUT DOWN                                       * }
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    { * DISPLAY MANAGEMENT                                                       * }
    procedure Vid_Display_All_Sprites;
    procedure Vid_Hide_All_Sprites;
    procedure Vid_Display_Score(p:integer; b:boolean);
    procedure Vid_Vid_Display_Heli(p:integer);
    procedure Vid_Vid_Display_Miss(p:integer);
    { * AUDIO MANAGEMENT                                                         * }
    procedure Snd_Play(pf:pMix_chunk);
    procedure Snd_Silence;
    { * PROCEDURES: INPUT MANAGEMENT - EVENTS                                    * }
    procedure im_baseMouseDown       (Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure im_baseMouseMove       (Sender:TObject;                      Shift:TShiftState; X,Y:Integer);
    procedure btn_game_a_topMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure btn_game_a_topMouseUp  (Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure btn_game_b_topMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure btn_game_b_topMouseUp  (Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure btn_time_topMouseDown  (Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure btn_time_topMouseUp    (Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure btn_aclMouseDown       (Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure btn_aclMouseUp         (Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown            (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp              (Sender: TObject; var Key: Word; Shift: TShiftState);
    { * PROCEDURES: INPUT MANAGEMENT - ACTIONS                                   * }
    procedure inp_game_a_down;
    procedure inp_game_a_up;
    procedure inp_game_b_down;
    procedure inp_game_b_up;
    procedure inp_time_down;
    procedure inp_time_up;
    procedure inp_acl_down;
    procedure inp_acl_up;
    procedure inp_left_down;
    procedure inp_left_up;
    procedure inp_right_down;
    procedure inp_right_up;
    { * GAME ROUTINES           }
    procedure Gam_Stop_All_Timers;
    procedure Gam_Set_Mode;
    procedure Gam_Move_Shark;
    procedure Gam_Move_Drowning_Para;
    procedure Gam_Set_Difficulty;
    { * TIMERS                                                                   * }
    procedure Timer_Chance_TimeTimer      (Sender: TObject);
    procedure Timer_ClockTimer            (Sender: TObject);
    procedure Timer_GameTimer             (Sender: TObject);
    procedure Timer_Game_OverTimer        (Sender: TObject);
    procedure Timer_MissTimer             (Sender: TObject);
    procedure Timer_Alarm_clockTimer      (Sender: TObject);
    procedure Timer_alarm_ringTimer (Sender: TObject);
    //MIS MODIFICACIONES
    procedure Show_Time(hour,min:integer);
    procedure Vid_Show_Demo_Mode;
    { * ALARM * }
    procedure btn_alarmMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
  public
    { public declarations }
  end;

const
      // milliseconds between two skydivers moves
      iGameSpeedNormal=200;
      // milliseconds between a rescue and next skydiver move
      iGameSpeedDelayed=320;

var
  Form1             :TForm1;
  // system registry (to save high-scores)
  RIF_registry      :TRegIniFile;
  // cursor coordinates (to drag main form)
  iMouseX, iMouseY  :integer;
  { * sound management * }
  pf_chance,pf_got,pf_miss1,pf_miss2,pf_miss3,pf_tick,pf_alarm:pMix_chunk;
  // sound enabled or disabled
  bSound:boolean;
  bSoundMute:boolean;
  { * arrays of images * }
  // containers for time/score digits
  aIm_Panel_Score         : array[1..4]       of TImage;
  // digits for time/score display
  aIm_Panel_Numbers       : array[0..9]       of TImage;
  // "misses" counter sprites
  aIm_Miss                : array[0..3]       of TImage;
  // helicopter sprites
  aIm_Heli                : array[0..2]       of TImage;
  // X=1-3 (x=4 for hanging parachuter on palm tree); Y=1-7
  aIm_Para                : array[1..4, 1..7] of TImage;
  // boat sprites
  aIm_Boat                : array[1..3]       of TImage;
  // drowning parachuters sprites
  aIm_Drown               : array[1..6]       of TImage;
  // sharks sprites
  aIm_Shark               : array[2..6]       of TImage;

{ * arrays of numbers *}
  // content: 0=empty; 1=flying parachuter; 2=just rescued parachuter
  aPara                   : array[1..4, 1..7] of integer;

{ * integers and booleans * }
  // 0/1=ACL 1/2, 2=time, 3=alarm, 4=hiscore A, 5=hiscore B, 6=game A, 7=game B, 8=game over
  iMode,
  // score=0-999
  iScore,
  // hiscore for Game A=0-999
  iHiscoreA,
  // hiscore for Game B=0-999
  iHiscoreB               : integer;
  // X coordinate of boat
  iBoatPos                : integer;
  // number of misses: 0-3
  iMiss                   : integer;
  // maximum amount of parachuters on screen (depending on value of iScore)
  aMaxPara                : integer;

  // Game variables: loops
  // active parachuter column
  iLoopPara,
  // sharks move at every 30 game ticks (10 iLoopPara loops)
  iLoopSharks,
  // used in Vid_Vid_Display_Heli procedure
  iLoopHeli,
  // used in Timer_Miss procedure
  iLoopMiss,
  // used in Timer_Chance_Time procedure
  iLoopChance,
  // which score to reach to get bonus (at every 200 and 500)
  iNextChance             : integer;
  // true if left/right arrow keys are kept pressed
  bKeyPressed             : boolean;
  //Alarm
  iAlarmH,iAlarmM,iAlarmLoop:integer;
  bAlarmRing,bAlarmEnabled:boolean;
  iDemoPosMan:array[1..4] of integer;

implementation

uses
  {$IFDEF FPC}
  LCLType,
  {$ELSE}
  shellapi,
  {$ENDIF}
  Windows,
  about, manual;

const
  DirDoc='.\';

{$R *.dfm}

{ **************************************************************************** }
{ * POPUP MENU                                                               * }
{ **************************************************************************** }

procedure TForm1.pm_1_aboutClick(Sender:TObject);
begin
  AboutForm.Show;
end;

procedure TForm1.pm_3_readmeClick(Sender:TObject);
begin
  {$IFNDEF LINUX}
  ShellExecute(Handle,'open',DirDoc+'readme_legacy.txt',nil,'',SW_SHOWNORMAL);
  {$ENDIF}
end;

procedure TForm1.pm_4_whatsnewClick(Sender:TObject);
begin
  {$IFNDEF LINUX}
  ShellExecute(Handle,'open',DirDoc+'whatsnew_legacy.txt',nil,'',SW_SHOWNORMAL);
  {$ENDIF}
end;

procedure TForm1.pm_6_manualClick(Sender:TObject);
begin
  ManualForm.Show;
end;

procedure TForm1.pm_8_hiscoreClick(Sender:TObject);
begin
  iHiscoreA:=0;
  RIF_Registry.WriteInteger('', 'HiscoreA_E', iHiscoreA);
  iHiscoreB:=0;
  RIF_Registry.WriteInteger('', 'HiscoreB_E', iHiscoreB);
  //Beep;
end;

procedure TForm1.pm_12_muteaudioClick(Sender:TObject);
begin
  bSoundMute:=not(bSoundMute);
  if not(bSoundMute) then Snd_Silence;
end;

procedure TForm1.pm_10_exitClick(Sender:TObject);
begin
  close;
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * INITIALIZE & SHUT DOWN                                                   * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TForm1.FormCreate(Sender:TObject);
{ sprites on form are associated to arrays of images, needed to "index" them   }
{ variables are initialized: system registry, randomize, game mode, etc.       }
begin
  // ARRAY OF IMAGES: score panel (blank sprites)
  aIm_Panel_Score[1] := im_digit_pos1;
  aIm_Panel_Score[2] := im_digit_pos2;
  aIm_Panel_Score[3] := im_digit_pos3;
  aIm_Panel_Score[4] := im_digit_pos4;
  // ARRAY OF IMAGES: digits for score panel
  aIm_Panel_Numbers[0] := im_digit_0;
  aIm_Panel_Numbers[1] := im_digit_1;
  aIm_Panel_Numbers[2] := im_digit_2;
  aIm_Panel_Numbers[3] := im_digit_3;
  aIm_Panel_Numbers[4] := im_digit_4;
  aIm_Panel_Numbers[5] := im_digit_5;
  aIm_Panel_Numbers[6] := im_digit_6;
  aIm_Panel_Numbers[7] := im_digit_7;
  aIm_Panel_Numbers[8] := im_digit_8;
  aIm_Panel_Numbers[9] := im_digit_9;
  // ARRAY OF IMAGES: parachuters
  aIm_Para[1, 1] := im_para_x1y1;
  aIm_Para[1, 2] := im_para_x1y2;
  aIm_Para[1, 3] := im_para_x1y3;
  aIm_Para[1, 4] := im_para_x1y4;
  aIm_Para[1, 5] := im_para_x1y5;
  aIm_Para[1, 6] := im_para_x1y6;
  aIm_Para[1, 7] := im_para_x1y7;
  aIm_Para[2, 1] := nil;
  aIm_Para[2, 2] := im_para_x2y2;
  aIm_Para[2, 3] := im_para_x2y3;
  aIm_Para[2, 4] := im_para_x2y4;
  aIm_Para[2, 5] := im_para_x2y5;
  aIm_Para[2, 6] := im_para_x2y6;
  aIm_Para[2, 7] := im_para_x2y7;
  aIm_Para[3, 1] := nil;
  aIm_Para[3, 2] := nil;
  aIm_Para[3, 3] := im_para_x3y3;
  aIm_Para[3, 4] := im_para_x3y4;
  aIm_Para[3, 5] := im_para_x3y5;
  aIm_Para[3, 6] := im_para_x3y6;
  aIm_Para[3, 7] := im_para_x3y7;

  aIm_Para[4, 1] := im_para_x3y5a;
  aIm_Para[4, 2] := im_para_x3y5b;
  // ARRAY OF IMAGES: boat
  aIm_Boat[1] := im_boat_x1;
  aIm_Boat[2] := im_boat_x2;
  aIm_Boat[3] := im_boat_x3;
  // ARRAY OF IMAGES: drowning parachuters
  aIm_Drown[3] := im_drown_3;
  aIm_Drown[2] := im_drown_2;
  aIm_Drown[1] := im_drown_1;
  aIm_Drown[4] := im_drown_4;
  aIm_Drown[5] := im_drown_5;
  aIm_Drown[6] := im_drown_6;
  // ARRAY OF IMAGES: sharks
  aIm_Shark[3] := im_shark_3;
  aIm_Shark[2] := im_shark_2;
  aIm_Shark[4] := im_shark_4;
  aIm_Shark[5] := im_shark_5;
  aIm_Shark[6] := im_shark_6;
  // ARRAY OF IMAGES: helicopter
  aIm_Heli[0] := im_heli0;
  aIm_Heli[1] := im_heli1;
  aIm_Heli[2] := im_heli2;
  // ARRAY OF IMAGES: misses counter panel
  aIm_Miss[0] := im_miss0;
  aIm_Miss[1] := im_miss1;
  aIm_Miss[2] := im_miss2;
  aIm_Miss[3] := im_miss3;
  // variables init
  DoubleBuffered:=true;
  Left:=-Width - 100;
  Top:=-Height-100;
  // system registry init
  RIF_registry := TregIniFile.Create('Software\MADrigal\ParachWS');
  // loads values from system registry to hiscore A
  iHiscoreA:=(RIF_Registry.ReadInteger('', 'HiscoreA_E', iHiscoreA)) mod 1000;
  // loads values from system registry to hiscore B
  iHiscoreB:=(RIF_Registry.ReadInteger('', 'HiscoreB_E', iHiscoreB)) mod 1000;
  // loads values from system registry to Alarm
  iAlarmH:=RIF_Registry.ReadInteger('','AlarmH',iAlarmH);
  iAlarmM:=RIF_Registry.ReadInteger('','AlarmM',iAlarmM);
  //Standarize Alarm time
  if ((iAlarmH<0) or (iAlarmH>=24)) then iAlarmH:=0;
  if ((iAlarmM<0) or (iAlarmM>=60)) then iAlarmM:=0;
   // sets handheld to "ACL/2" mode
  iMode := 1;
  Gam_Set_Mode;
  // no key is currently pressed
  bKeypressed := false;
  //Sound is enabled
  bSoundMute:=false;
  Randomize;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  //Save Alarm
  RIF_Registry.WriteInteger('', 'AlarmH', iAlarmH);
  RIF_Registry.WriteInteger('', 'AlarmM', iAlarmM);
  //Silent all samples
  Snd_Silence;
  //Free samples
  Mix_FreeChunk(pf_chance);
  pf_chance:=nil;
  Mix_FreeChunk(pf_got);
  pf_got:=nil;
  Mix_FreeChunk(pf_miss1);
  pf_miss1:=nil;
  Mix_FreeChunk(pf_miss2);
  pf_miss2:=nil;
  Mix_FreeChunk(pf_miss3);
  pf_miss3:=nil;
  Mix_FreeChunk(pf_tick);
  pf_tick:=nil;
  //Close sound system
  Mix_CloseAudio();
  SDL_Quit();
  //Close application
  CloseAction:=caFree;
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * PROCEDURES: DISPLAY MANAGEMENT                                           * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TForm1.Vid_Display_All_Sprites;
{ displays screen in ACL mode: all sprites visible, time=12:00 AM, etc...      }
  var i:integer;
begin
  // time is 12:00 AM
  Show_time(0,0);
  im_time_semicolon.Visible := true;
  // monkey (alarm) is visible
  im_alarm0.Visible := true;
  im_alarm1.Visible := true;
  im_alarm2.Visible := true;
  im_alarm3.Visible := true;
  // Game A and Game B are visible
  im_game_a.Visible := true;
  im_game_b.Visible := true;
  // all sprites are visible
  for i := 1 to 7 do aIm_Para[1, i].Visible := true;
  for i := 2 to 7 do aIm_Para[2, i].Visible := true;
  for i := 3 to 7 do aIm_Para[3, i].Visible := true;
  for i := 1 to 2 do aIm_Para[4, i].Visible := true;
  for i := 1 to 3 do aIm_Boat[i].Visible    := true;
  for i := 1 to 6 do aIm_Drown[i].Visible   := true;
  for i := 2 to 6 do aIm_Shark[i].Visible   := true;
  Vid_Vid_Display_Heli(4);
  Vid_Vid_Display_Miss(3);
end;

procedure TForm1.Vid_Hide_All_Sprites;
{ makes all sprites invisible, plus part of the control panel.                 }
  var i:integer;
begin
  // monkey (alarm) is hidden
  im_alarm0.Visible := false;
  im_alarm1.Visible := false;
  im_alarm2.Visible := false;
  im_alarm3.Visible := bAlarmEnabled;
  // Game A and Game B are hidden
  im_game_a.Visible := false;
  im_game_b.Visible := false;
  // all sprites are hidden
  for i := 1 to 7 do aIm_Para[1, i].Visible := false;
  for i := 2 to 7 do aIm_Para[2, i].Visible := false;
  for i := 3 to 7 do aIm_Para[3, i].Visible := false;
  for i := 1 to 2 do aIm_Para[4, i].Visible := false;
  for i := 1 to 3 do aIm_Boat[i].Visible    := false;
  for i := 1 to 6 do aIm_Drown[i].Visible   := false;
  for i := 2 to 6 do aIm_Shark[i].Visible   := false;
  Vid_Vid_Display_Heli(0);
end;

procedure TForm1.Vid_Display_Score(p: integer; b: boolean);
{ transforms score/high-score into sprites, and displays/hides them            }
  var i:integer;
begin
  // prevents from displaying 4-digits score
  //p:=p mod 1000; --> No need because every time the iScore y increased, it's tested...
  // display or hide score/high-score?
  if b then begin // display
      // thousands (always hidden)
      aIm_Panel_Score[1].Picture := nil;
      // hundreds
      if p>99 then aIm_Panel_Score[2].Picture := aIm_Panel_Numbers[p div 100].Picture
         else aIm_Panel_Score[2].Picture := nil;
      // tens
      if p>9 then aIm_Panel_Score[3].Picture := aIm_Panel_Numbers[(p div 10) mod 10].Picture
         else aIm_Panel_Score[3].Picture := nil;
      // units
      if p>=0 then aIm_Panel_Score[4].Picture := aIm_Panel_Numbers[p mod 10].Picture
         else aIm_Panel_Score[4].Picture := nil;
  end else    // hide
    for i:=1 to 4 do
      aIm_Panel_Score[i].Picture := nil;
end;

procedure TForm1.Vid_Vid_Display_Heli(p: integer);
{ displays helicopter in various configurations                                }
  var i:integer;
begin
  case p of
    0:for i:= 0 to 2 do aIm_Heli[i].Visible:= false; // nothing visible
    1:begin  // helicopter only
         aIm_Heli[0].Visible := true;
         aIm_Heli[1].Visible := false;
         aIm_Heli[2].Visible := false;
      end;
    2:begin // helicopter + right wing
         aIm_Heli[0].Visible := true;
         aIm_Heli[1].Visible := false;
         aIm_Heli[2].Visible := true;
      end;
    3:begin // helicopter + left wing
         aIm_Heli[0].Visible := true;
         aIm_Heli[1].Visible := true;
         aIm_Heli[2].Visible := false;
      end;
    4:for i := 0 to 2 do aIm_Heli[i].Visible := true;  // everything visible
  end; // case..of
end;

procedure TForm1.Vid_Vid_Display_Miss(p: integer);
{ displays misses panel in various configurations                              }
  var i:integer;
begin
  // displays/hides item 0
  aIm_Miss[0].Visible := p > 0;
  // displays items 1 to p, hides the remaining ones
  for i:=1 to 3 do aIm_Miss[i].Visible:=(i<=p);
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * AUDIO MANAGEMENT                                                         * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TForm1.Snd_Play(pf:pMix_chunk);
{ plays a certain sound sample                                                 }
begin
  if (bSound and not(bSoundMute) and (pf<>nil)) then Mix_PlayChannel(-1, pf, 0);
end;

procedure TForm1.Snd_Silence;
{ stops any currently playing sound sample                                     }
begin
  if bSound then Mix_HaltChannel(-1);
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * PROCEDURES: INPUT MANAGEMENT - EVENTS                                    * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TForm1.im_baseMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
{ used to drag the main form                                                   }
begin
  iMouseX:=X;
  iMouseY:=Y;
end;

procedure TForm1.im_baseMouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);
{ used to drag the main form                                                   }
begin
  if ssLeft in Shift then begin
      Top  := Top  + Y - iMouseY;
      Left := Left + X - iMouseX;
  end;
end;

procedure TForm1.btn_game_a_topMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
{ "Game A" button is being pressed                                             }
begin
  if Button=mbLeft then inp_game_a_down;
end;

procedure TForm1.btn_game_a_topMouseUp(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
{ "Game A" button is being released                                            }
begin
  if Button=mbLeft then inp_game_a_up;
end;

procedure TForm1.btn_game_b_topMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
{ "Game B" button is being pressed                                             }
begin
  if Button=mbLeft then inp_game_b_down;
end;

procedure TForm1.btn_game_b_topMouseUp(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
{ "Game B" button is being released                                            }
begin
  if Button=mbLeft then inp_game_b_up;
end;

procedure TForm1.btn_time_topMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
{ "Time" button is being pressed                                               }
begin
  if Button=mbLeft then inp_time_down;
end;

procedure TForm1.btn_time_topMouseUp(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
{ "Time" button is being released                                              }
begin
  if Button=mbLeft then inp_time_up;
end;

procedure TForm1.btn_aclMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
{ "ACL" button is being pressed                                                }
begin
  if Button=mbLeft then inp_acl_down;
end;

procedure TForm1.btn_aclMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
{ "ACL" button is being released                                               }
begin
  if Button=mbLeft then inp_acl_up;
  //Resets alarm to 12:00pm
  iAlarmH:=12;
  iAlarmM:=0;
end;

procedure TForm1.FormKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
{ any key is being pressed                                                     }
begin
  // '1' key -> hiscore A
  if key=$31 then inp_game_a_down;
  // '2' key -> hiscore B
  if key=$32 then inp_game_b_down;
  // '3' key -> alarm
  if key=$33 then inp_time_down;
  // '5' key -> ACL
  if key=$35 then inp_acl_down;
  // "left arrow key" is pressed
  if key=VK_LEFT then begin
      // button animation
      btn_left.visible:=true;
      //key not yet pressed
      if not(bKeypressed) then begin
          // OK, key is now pressed (used to prevent automatic keypresses)
          bKeypressed:=true;
          case iMode of
            // if mode is hiscore/game/game over
            3..8:inp_left_down;
            20:begin //Update alarm hour
                 iAlarmH:=(iAlarmH+1) mod 24;
                 Show_time(iAlarmH,iAlarmM);
                 Vid_Show_Demo_Mode;
              end;
          end;
  end;
  end;
  // "right arrow key" is pressed
  if key=VK_RIGHT then begin
      // button animation
      btn_right.visible:=true;
      //key not yet pressed
      if not(bKeypressed) then begin
         // OK, key is now pressed (used to prevent automatic keypresses)
         bKeypressed:=true;
         case iMode of
           //if mode is hiscore/game/game over
           3..8:inp_right_down;
           20:begin //Changing Alarm Minutes
                  iAlarmM:=(iAlarmM+1) mod 60;
                  Show_time(iAlarmH,iAlarmM);
                  Vid_Show_Demo_Mode;
              end;
         end;
      end;
  end;
end;

procedure TForm1.FormKeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
{ any key is being released                                                    }
begin
  // '1' key -> game B
  if key=$31 then inp_game_a_up;
  // '2' key -> game B
  if key=$32 then inp_game_b_up;
  // '3' key -> time
  if key=$33 then inp_time_up;

  // "left arrow key" is released
  if key=VK_LEFT then inp_left_up;
  // "right arrow key" is released
  if key=VK_RIGHT then inp_right_up;
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * PROCEDURES: INPUT MANAGEMENT - ACTIONS                                   * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TForm1.inp_game_a_down;
{ Game A: DOWN                                                                 }
begin
  // button animation
  btn_game_a.Visible := true;
  // ACL/2 or time or game over ->
  if (iMode=1) or (iMode=2) or (iMode=8) then begin
      // hiscore A
      iMode:=4;
      Gam_Set_Mode;
  end;
end;

procedure TForm1.inp_game_a_up;
{ Game A: UP                                                                   }
begin
   // button animation
  btn_game_a.Visible := false;
  // hiscore A ->
  if (iMode=4) then begin
      // game A
      iMode := 6;
      Gam_Set_Mode;
  end;
  //If the alarm is active remove it!!
  if Timer_alarm_ring.Enabled then begin
     Timer_alarm_ring.Enabled:=false;
     Timer_alarm_clock.Enabled:=true;
     im_alarm0.visible:=false;
     im_alarm1.visible:=false;
     im_alarm2.visible:=false;
     im_alarm3.visible:=true;
  end;
end;

procedure TForm1.inp_game_b_down;
{ Game B: DOWN                                                                 }
begin
  // button animation
  btn_game_b.Visible:=true;
  // ACL/2 or time or game over ->
  if (iMode=1) or (iMode=2) or (iMode = 8) then begin
      // hiscore B
      iMode:=5;
      Gam_Set_Mode;
  end;
  //If the alarm is active remove it!!
  if Timer_alarm_ring.Enabled then begin
     Timer_alarm_ring.Enabled:=false;
     Timer_alarm_clock.Enabled:=true;
     im_alarm0.visible:=false;
     im_alarm1.visible:=false;
     im_alarm2.visible:=false;
     im_alarm3.visible:=true;
  end;
end;

procedure TForm1.inp_game_b_up;
{ Game B: UP                                                                   }
begin
  // button animation
  btn_game_b.Visible := false;
  // hiscore B ->
  if (iMode=5) then begin
      // game B
      iMode:=7;
      Gam_Set_Mode;
  end;
end;

procedure TForm1.inp_time_down;
{ Time: DOWN                                                                   }
begin
   // button animation
  btn_time.Visible := true;
  // ACL/2 or time or game over ->
  case iMode of
    1:begin //Alarm cleaning sprites
         Vid_Hide_All_Sprites;
         iMode:=3;
         Gam_Set_Mode;
      end;
  2,8:begin  //Alarm without clear sprites
         iMode:=3;
         Gam_Set_Mode;
      end;
  end;
end;

procedure TForm1.inp_time_up;
{ Time: UP                                                                     }
begin
  // button animation
  btn_time.Visible := false;
  // alarm ->
  case iMode of
     3:begin //time
         // hides parachuters, heli, monkey, sharks
         Vid_Hide_All_Sprites;
         //Starts Demo Mode
         iDemoPosMan[1]:=0;
         iDemoPosMan[2]:=0;
         iDemoPosMan[3]:=0;
         iDemoPosMan[4]:=0;
         //Show boat on pos 2
         aIm_Boat[1].visible:=false;
         aIm_Boat[2].visible:=true;
         aIm_Boat[3].visible:=false;
         iMode:=2;
         Gam_Set_Mode;
       end;
    20:begin //exit from alarm set time
        iMode:=2;
        Gam_Set_Mode;
        Timer_Alarm_clock.Enabled:=bAlarmEnabled;
      end;
  end;
  //If the alarm is active remove it!!
  if Timer_alarm_ring.Enabled then begin
     Timer_alarm_ring.Enabled:=false;
     Timer_alarm_clock.Enabled:=true;
     im_alarm0.visible:=false;
     im_alarm1.visible:=false;
     im_alarm2.visible:=false;
     im_alarm3.visible:=true;
  end;
end;

procedure TForm1.inp_acl_down;
{ ACL: DOWN                                                                    }
begin
  if Timer_alarm_ring.Enabled then Timer_alarm_ring.Enabled:=false;
  // any mode -> ACL/1
  iMode:=0;
  Gam_Set_Mode;
  //If the alarm is active remove it!!
end;

procedure TForm1.inp_acl_up;
{ ACL: DOWN                                                                    }
begin
  // ACL/1 -> ACL/2
  iMode:=1;
  Gam_Set_Mode;
end;

procedure TForm1.inp_left_down;
{ Left: DOWN                                                                   }
begin
  // button animation
  btn_left.Visible := true;
  // key is now pressed (used to prevent automatic keypresses)
  bKeypressed := true;
  // if boat is not yet on the leftmost side
  if iBoatPos > 1 then begin
     // hides currently visible boat
     aIm_Boat[iBoatPos].Visible := false;
     // updates boat coordinates
     iBoatPos:=iBoatPos-1;
     // displays boat in new position
     aIm_Boat[iBoatPos].Visible := true;
  end;
end;

procedure TForm1.inp_left_up;
{ Left: UP                                                                     }
begin
  // button animation
  btn_left.Visible := false;
  // key is now released, controller enabled
  bKeypressed := false;
end;

procedure TForm1.inp_right_down;
{ Right: DOWN                                                                  }
begin
  // button animation
  btn_right.Visible := true;
  // key is now pressed (used to prevent automatic keypresses)
  bKeypressed := true;
   // if boat is not yet on the rightmost side
  if iBoatPos < 3 then begin
     // hides currently visible boat
     aIm_Boat[iBoatPos].Visible := false;
     // updates boat coordinates
     iBoatPos:=iBoatPos+1;
     // shows boat in new position
     aIm_Boat[iBoatPos].Visible := true;
  end;
end;

procedure TForm1.inp_right_up;
{ Right: UP                                                                    }
begin
  // button animation
  btn_right.Visible := false;
  // key is now released, controller enabled
  bKeypressed := false;
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * PROCEDURES: GAME                                                         * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TForm1.Gam_Stop_All_Timers;
{ stops all currently enabled timers                                           }
begin
  Timer_Clock.Enabled:=false;
  Timer_Game_Over.Enabled:=false;
  Timer_Game.Enabled:=false;
  Timer_Miss.Enabled:=false;
  Timer_Chance_Time.Enabled:=false;
end;

procedure TForm1.Gam_Set_Mode;
{ sets game/time/alarm/ACL mode, depending on the value of the iMode variable  }
  var
    i ,
    j : integer;
begin
  case iMode of
    0:begin // ACL/1 mode
         // stops all timers
         Gam_Stop_All_Timers;
         // hides all sprites
         Vid_Hide_All_Sprites;
         // hides heli
         Vid_Vid_Display_Heli(0);
         // hides misses sprites
         Vid_Vid_Display_Miss(0);
         // hides time/score
         Vid_Display_Score(0, false);
         // hides AM
         im_time_am.Visible := false;
         // hides PM
         im_time_pm.Visible := false;
         // hides semicolon
         im_time_semicolon.Visible := false;
       end;
    1:begin // ACL/2 mode
         // displays all sprites (time is 12:00, AM is hidden)
         Vid_Display_All_Sprites;
      end;
    2:begin // time mode
         // stops all timers
         Gam_Stop_All_Timers;
         // displays whole heli
         Vid_Vid_Display_Heli(4);
         Timer_Clock.Interval:=1;
         // clock starts ticking...
         Timer_Clock.Enabled:=true;
       end;
    3:begin // alarm mode
         // stops all timers
         Gam_Stop_All_Timers;
         // displays whole heli
         Vid_Vid_Display_Heli(4);
         // hides misses sprites
         Vid_Vid_Display_Miss(0);
         // displays semicolon
         im_time_semicolon.Visible := true;
         show_time(iAlarmH,iAlarmM);
         // displays monkey's body and upper arm
         im_alarm0.Visible := true;
         im_alarm2.Visible := true;
       end;
   4,5:begin // hiscore A
         // stops all timers
         Gam_Stop_All_Timers;
         // hides parachuters, boat, heli, monkey, sharks
         Vid_Hide_All_Sprites;
         // hides misses sprites
         Vid_Vid_Display_Miss(0);
         // hides AM and PM
         im_time_am.Visible := false;
         im_time_pm.Visible := false;
         // hides semicolon
         im_time_semicolon.Visible := false;
         //Shows hide game A/B HiScore A/B
         case iMode of
              4:begin
                   // displays 'Game A', hides 'Game B'
                   im_game_a.Visible := true;
                   im_game_b.Visible := false;
                   // displays current hiscore for game A
                   Vid_Display_Score(iHiscoreA, true);
                end;
              5:begin
                   // displays 'Game B', hides 'Game A'
                   im_game_a.Visible := false;
                   im_game_b.Visible := true;
                   // displays current hiscore for game B
                   Vid_Display_Score(iHiscoreB,true);
                end;
         end;
         // initializes boat and enables controller
         iBoatPos := 2;
         aIm_Boat[iBoatPos].Visible := true;
       end;
  6,7:begin // game A/B
         // stops all timers
         Gam_Stop_All_Timers;
         // initializes score
         iScore := 0;
         Vid_Display_Score(iScore, true);
         // sets next bonus score at 200 points
         iNextChance := 200;
         // resets misses counter
         iMiss := 0;
         // resets on-screen parachuters to zero
         for i := 1 to 4 do
           for j := 1 to 7 do
             aPara[i, j] := 0;
         // initializes helicopter
         iLoopHeli := 4;
         Vid_Vid_Display_Heli(iLoopHeli);
         // initializes shark generation
         iLoopSharks := 1;
         // max 1 parachuter on screen as game begins
         aMaxPara := 1;
         // initializes first parachuter in x=1 or x=2
         iLoopPara := Random(2) + 1;
         Timer_Game.Interval := iGameSpeedNormal;
         // game action starts
         Timer_Game.Enabled := true;
       end;
    8:begin // game over
         // stops all timers
         Gam_Stop_All_Timers;
         Timer_Game_Over.Interval:=300000;
         // goes back into mode 1 (time) after 5 minutes
         Timer_Game_Over.Enabled:=true;
       end;
    20:begin //Set alarm time
         Gam_Stop_All_Timers;
         Show_time(iAlarmH,iAlarmM);
       end;
    end; // case..of
end;

procedure TForm1.Gam_Move_Shark;
{ sharks animation, entering, moving, exiting from where he came from          }
  var
    i: integer;
begin
  // loops sharks animation
  for i:=6 downto 3 do
    aIm_Shark[i].Visible := aIm_Shark[i - 1].Visible;
  // new shark appears 10 ticks after the previous one has gone
  aIm_Shark[2].Visible := iLoopSharks = 10;
  iLoopSharks:=iLoopSharks+1;
  // loops sharks animation, shark is generated at every 15 ticks
  if iLoopSharks>15 then iLoopSharks:=1;
end;

procedure TForm1.Gam_Move_Drowning_Para;
{ drowning men animation moving, exiting from the right side                   }
  var
    i: integer;
begin
  // loops drowning para animation
  for i := 6 downto 2 do
    aIm_Drown[i].Visible := aIm_Drown[i - 1].Visible;
  // hides drowning para in position 1
  aIm_Drown[1].Visible := false;
end;

procedure TForm1.Gam_Set_Difficulty;
{ calculates difficulty increase, depending on current score                   }
  var
    i         ,
    iHundreds ,
    iTens     : integer;
begin
  i         := iScore mod 10;
  iHundreds :=iScore div 100;
  iTens     :=(iScore div 100) mod 10;
  // number of parachuters increases at 4, 14, 24, etc. and resets at 104, 204, etc.
  if i=4 then begin
      case iTens of
        0:aMaxPara:=2;
        1:aMaxPara:=3;
        2:aMaxPara:=3;
        3:aMaxPara:=4;
        4:aMaxPara:=4;
        5:aMaxPara:=4;
        6:aMaxPara:=5;
        7:aMaxPara:=5;
        8:aMaxPara:=5;
        9:aMaxPara:=6;
      end; // case..of
      // number of overall parachuters increases at 104, 204, 304, etc.
      case IHundreds of
        1:aMaxPara:=aMaxPara+1;
        2:aMaxPara:=aMaxPara+1;
        3:aMaxPara:=aMaxPara+2;
        4:aMaxPara:=aMaxPara+2;
        5:aMaxPara:=aMaxPara+3;
        6:aMaxPara:=aMaxPara+3;
        7:aMaxPara:=aMaxPara+4;
        8:aMaxPara:=aMaxPara+4;
        9:aMaxPara:=aMaxPara+5;
      end; // case..of
    end;
  if aMaxPara>10 then aMaxPara:=10;
end;

{ **************************************************************************** }
{ *                                                                          * }
{ * TIMERS                                                                   * }
{ *                                                                          * }
{ **************************************************************************** }

procedure TForm1.Timer_Chance_TimeTimer(Sender: TObject);
{ bonus score animation                                                        }
  var
    i: integer;
begin
  // misses blink 10 times, then game continues
  if iLoopChance < 20 then begin
      // 1 loop out of 2 (odd)
      if (iLoopChance and 1)<>0 then begin
          Snd_play(pf_chance);
          // displays number of current misses
          Vid_Vid_Display_Miss(iMiss);
          // makes them disappear in 225 milliseconds
          Timer_Chance_Time.Interval := 225;
        end else begin // 1 loop out of 2 (even)
          // displays zero misses
          i := 0; Vid_Vid_Display_Miss(i);
          // makes them appear in 275 milliseconds
          Timer_Chance_Time.Interval := 275;
        end;
    end else begin // game continues
      // all misses are canceled
      iMiss := 0;
      Vid_Vid_Display_Miss(iMiss);
      // game proceeds
      Timer_Game.Enabled := true;
      // disables this timer
      Timer_Chance_Time.Enabled := false;
    end;
  iLoopChance:=iLoopChance+1;
end;

procedure TForm1.Timer_ClockTimer(Sender: TObject);
{ displays current time                                                        }
var
    hour,min,sec,msec:Word;
begin
  // get system time & split system time into local variables
  DecodeTime(Now, hour, min, sec, msec);
  // changes mode from 0/24 to 12 AM/12 PM
  Show_Time(hour,min);
  // next tick in 1000 m.seconds
  Timer_Clock.Interval := 1000;
  //Show Demo mode
  //Activate parachute man
  Vid_Show_Demo_Mode;
end;

procedure TForm1.Timer_GameTimer(Sender: TObject);
{ main game timer! this routine includes almost the whole game implementation  }
  var
    i             ,
    j             ,
    iOnscreenPara ,
    iSound        : integer;
    bError        : boolean;
begin
  // parachuters rescued in previous loop must now disappear
  for i := 1 to 3 do
    if aPara[i, 7] = 2 then aPara[i, 7] := 0;
  // timer interval goes back to normal
  Timer_Game.Interval := iGameSpeedNormal;
  // initializes variables to be used soon...
  // becomes true if any miss is occuring
  bError := false;
  // might become 1, 2 or 3, depending on what happens below...
  iSound := 0;
  // checks for misses
  if (aPara[1, 7] = 1) and (iBoatPos<>1) then begin
    aPara[1, 7] := 0;
    aIm_Drown[3].Visible := true;
    aIm_Shark[3].Visible := true;
    iLoopMiss := 3;
    bError := true;
  end;
  if (aPara[2, 7] = 1) and (iBoatPos <> 2) then begin
    aPara[2, 7] := 0;
    aIm_Drown[2].Visible := true;
    aIm_Shark[2].Visible := true;
    iLoopMiss := 2;
    bError := true;
  end;
  if (aPara[3, 7] = 1) and (iBoatPos <> 3) then begin
    aPara[3, 7] := 0;
    aIm_Drown[1].Visible := true;
    iLoopMiss := 1;
    bError := true;
  end;

  // if no miss has occured, move parachuters, sharks, helicopter, etc...
  if not bError then begin
      // heli and shark animations
      Vid_Vid_Display_Heli(iLoopHeli);
      if iLoopPara = 1 then Gam_Move_Shark;
      // checks collisions for parachuters rescue (1st time)
      // checks for parachuter to rescue
      if aPara[iBoatPos, 7] = 1 then begin
          // got him, make it disappear with next loop
          aPara[iBoatPos, 7] := 2;
          // increases score
          iScore:=(iScore+1) mod 1000;
          // display current score
          Vid_Display_Score(iScore, true);
          // calculates game difficulty
          Gam_Set_Difficulty;
          // get ready to play "got" sound
          iSound := 2;
          // little pause before next parachuters move
          Timer_Game.Interval := iGameSpeedDelayed;
        end;

      // GAME B: parachuter on column 3 might end on the palm, etc...
      if (iMode = 7) and (iLoopPara = 3) then
        if aPara[4, 1] = 1 then begin
            aPara[4, 1] := 0;
            iSound := 1;
            if (Random(3) = 0) and (aPara[3, 4] = 0) and (aPara[3, 6] = 0) then
              aPara[3, 5] := 1
            else // becomes immediately [3, 5] := 0 and [3, 6] := 1
              aPara[4, 2] := 1;
        end else
          if aPara[4, 2] = 1 then begin
              iSound := 1;
              aPara[4, 2] := 0;
              aPara[4, 1] := 1;
            end else
            if (aPara[3, 5] = 1) and (aPara[4, 1] = 0) and (aPara[4, 2] = 0) then
              if Random(3) = 0 then begin
                  iSound := 1;
                  aPara[3, 5] := 0;
                  aPara[4, 1] := 1;
              end;

      // on-screen parachuters movement
      for i := 7 downto (iLoopPara + 1) do
        aPara[iLoopPara, i] := aPara[iLoopPara, i - 1];

      aPara[iLoopPara,iLoopPara] := 0;

      // parachuters generation
      iOnscreenPara := 0;
      // counts how many parachuters are on screen
      for i := 1 to 4 do
        for j := 1 to 7 do
        if aPara[i, j] > 0 then iOnscreenPara:=iOnscreenPara+1;
      // if there's "room" for more parachuters
      if iOnScreenPara < aMaxPara then
        if Random(5) < 2 then // 2 chances out of 5 to generate new parachuter
          aPara[iLoopPara, iLoopPara] := 1;
      // forces parachuter generation in case screen is empty
      if iOnscreenPara = 0 then
        aPara[iLoopPara, iLoopPara] := 1;
      // avoids generation in case just generated a para on that same column
      if aPara[iLoopPara, iLoopPara + 1] > 0 then
        aPara[iLoopPara, iLoopPara] := 0;

      // checks collisions for parachuter rescue (2nd time)
      // checks for parachuter to rescue
      if aPara[iBoatPos, 7] = 1 then begin
          // got him, make it disappear with next loop
          aPara[iBoatPos, 7] := 2;
          // increases score
          iScore:=(iScore+1) mod 1000;
          // displays current score
          Vid_Display_Score(iScore, true);
          // calculates game difficulty
          Gam_Set_Difficulty;
          // get ready to play "got" sound
          iSound := 2;
          // little pause before next parachuters move
          Timer_Game.Interval := iGameSpeedDelayed;
        end;

      // scans current column in search for existing parachuter (needed for sound)
      iOnscreenPara := 0;

      for i := 1 to 7 do
        if aPara[iLoopPara, i] > 0 then iOnscreenPara:=iOnscreenPara+1;

      if (iOnscreenPara>0) and (iSound<>2) then iSound:=1;

      // loops parachuters and heli animation
      iLoopPara:=iLoopPara+1;

      if iLoopPara>3 then iLoopPara:=1;

      iLoopHeli:=iLoopHeli+1;

      if iLoopHeli>4 then iLoopHeli:=2;
    end else begin // miss occurs!
      Gam_Stop_All_Timers;
      iSound:=3;
      Timer_Miss.Interval := 620;
      Timer_Miss.Enabled := true;
    end;

  // on-screen parachuters visualization
  for i := 1 to 7 do if aPara[1, i] > 0 then aIm_Para[1, i].Visible := true
      else aIm_Para[1, i].Visible := false;
  for i := 2 to 7 do if aPara[2, i] > 0 then aIm_Para[2, i].Visible := true
      else aIm_Para[2, i].Visible := false;
  for i := 3 to 7 do if aPara[3, i] > 0 then aIm_Para[3, i].Visible := true
      else aIm_Para[3, i].Visible := false;
  for i := 1 to 2 do if aPara[4, i] > 0 then aIm_Para[4, i].Visible := true
      else aIm_Para[4, i].Visible := false;

  // plays sound depending on what's happened above
  case iSound of
    1: Snd_Play(pf_tick);
    2: Snd_Play(pf_got);
    3: Snd_Play(pf_miss1);
  end; // case..of

  // check for bonus score - just in case there are any misses
  if (iMiss > 0) and (iScore = iNextChance) then begin
      Gam_Stop_All_Timers;
      // loops next bonus score between 200 and 500 points
      if iNextChance = 200 then iNextChance := 500
         else iNextChance := 200;
      // bonus animation begins
      iLoopChance := 1;
      Timer_Chance_Time.Interval := 440;
      Timer_Chance_Time.Enabled := true;
    end;
end;

procedure TForm1.Timer_Game_OverTimer(Sender: TObject);
{ when game is over, this timer is enabled to make the game turn back into     }
{ "Time" mode, after 5 minutes                                                 }
begin
  iMode := 2;
  // goes back to mode 2 (time), 5 minutes after game is over
  Gam_Set_Mode;
  im_time_semicolon.visible:=true;
end;

procedure TForm1.Timer_MissTimer(Sender: TObject);
{ a miss has occured. this timer manages shark and drowning man animation      }
begin
  iLoopHeli:=iLoopHeli+1;
  if iLoopHeli > 4 then iLoopHeli := 2;
  Vid_Vid_Display_Heli(iLoopHeli);

  case iLoopMiss of
    1: begin
         Gam_Move_Drowning_Para;
         Gam_Move_Shark;
         // forces shark to appear in position 2 (in case it's not yet there)
         aIm_Shark[2].Visible := true;
         Snd_Play(pf_miss2);
         // needs to be declared in every case, since we're not sure in which column the miss has occured
         Timer_Miss.Interval := 330;
       end;
    2: begin
         Gam_Move_Drowning_Para;
         Gam_Move_Shark;
         Snd_Play(pf_miss2);
         Timer_Miss.Interval := 330;
       end;
    3: begin
         Gam_Move_Drowning_Para;
         Gam_Move_Shark;
         Snd_Play(pf_miss2);
         Timer_Miss.Interval := 330;
       end;
    4: begin
         Gam_Move_Drowning_Para;
         Gam_Move_Shark;
         Snd_Play(pf_miss2);
         Timer_Miss.Interval := 330;
       end;
    5: begin
         Snd_Play(pf_miss3);
         Gam_Move_Drowning_Para;
         Gam_Move_Shark;
         // longer sound to play, then game continues
         Timer_Miss.Interval := 570;
       end;
    6: begin
         Gam_Move_Drowning_Para;
         Gam_Move_Shark;
         // number of misses increases
         iMiss:=iMiss+1;
         Vid_Vid_Display_Miss(iMiss);
         // checks number of misses
         if iMiss < 3 then Timer_Game.Enabled := true // game continues if misses below 3
         else begin // game is over, sets mode to "game over"
             // records high score to system registry (game A)
             if (iMode = 6) and (iScore > iHiscoreA) then begin
                 iHiScoreA := iScore;
                 RIF_Registry.WriteInteger('', 'HiScoreA_E', iHiscoreA);
               end;
             // records high score to system registry (game B)
             if (iMode = 7) and (iScore > iHiscoreB) then begin
                 iHiScoreB := iScore;
                 RIF_Registry.WriteInteger('', 'HiScoreB_E', iHiscoreB);
               end;
             iMode := 8;
             Gam_Set_Mode;                                              // game is over, go back to "time" mode in 5 minutes
          end;
         Timer_Miss.Enabled := false;                                             // disables this timer
       end;
  end; // case..of
  iLoopMiss:=iLoopMiss+1;
end;


// MIS RUTINAS
procedure TForm1.Timer_Alarm_clockTimer(Sender: TObject);
var
    hour,min,sec,msec:Word;
begin
  //If it's not in timer, alarm or game over mode then exit
  if (iMode<2) then exit;
  // get system time, compare with alarm...
  DecodeTime(Now,hour,min,sec,msec);
  if hour=iAlarmH then
     if min=iAlarmM then
        if sec=0 then begin
          //Show Monkey
          im_alarm0.visible:=true;
          im_alarm1.visible:=false;
          im_alarm2.visible:=true;
          im_alarm3.Visible:=true;
          //Enable alarm ring timer
          Timer_Alarm_Ring.enabled:=true;
          iAlarmLoop:=0;
          //Disable alarm timer...
          Timer_Alarm_clock.enabled:=false;
        end;
end;

procedure TForm1.Timer_alarm_ringTimer(Sender: TObject);
begin
case (iAlarmLoop mod 4) of
  0,1,2:begin  //Up bell
          im_alarm2.visible:=true;
          im_alarm3.Visible:=true;
          im_alarm1.visible:=false;
        end;
  3:begin
      im_alarm2.visible:=false;
      im_alarm3.Visible:=false;
      im_alarm1.visible:=true;
      if ((iMode<>6) and (iMode<>7)) then Snd_Play(pf_Alarm);
    end;
end;
iAlarmLoop:=iAlarmLoop+1;
if iAlarmLoop=240 then begin //After 1 minute --> Stop
   Timer_alarm_ring.Enabled:=false;
   //Hide monkey
   im_alarm0.visible:=false;
   im_alarm1.visible:=false;
   im_alarm2.Visible:=false;
   im_alarm3.visible:=true;
   //Enable Alarm clock tic
   Timer_Alarm_clock.enabled:=true;
end;
end;

procedure TForm1.Show_Time(hour, min: integer);
begin
if hour>11 then begin
   hour:=hour-12;
   im_time_am.Visible := false;
   im_time_pm.Visible := true;
end else begin
    im_time_am.Visible := true;
    im_time_pm.Visible := false;
end;
// changes mode from 0/24 to 12 AM/12 PM
if hour=0 then hour:=12;
// hour: tens
if hour > 9 then aIm_Panel_Score[1].picture := aIm_Panel_Numbers[hour div 10].picture
   else aIm_Panel_Score[1].picture := nil;
// hour: units
aIm_Panel_Score[2].picture := aIm_Panel_Numbers[hour mod 10].picture;
// minute: tens
aIm_Panel_Score[3].picture := aIm_Panel_Numbers[min div 10].picture;
// minute: units
aIm_Panel_Score[4].picture := aIm_Panel_Numbers[min mod 10].picture;
end;

procedure TForm1.btn_alarmMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
begin
case iMode of
  1:begin //it's in ACL/2 change to Alarm Mode but clean screen
       Vid_Hide_All_Sprites;
       Vid_Vid_Display_Miss(0);
       Vid_Vid_Display_Heli(4);
       //Starts Demo Mode
       iDemoPosMan[1]:=0;
       iDemoPosMan[2]:=0;
       iDemoPosMan[3]:=0;
       iDemoPosMan[4]:=0;
       //Show boat on pos 2
       aIm_Boat[1].visible:=false;
       aIm_Boat[2].visible:=true;
       aIm_Boat[3].visible:=false;
       iMode:=20;
       Gam_Set_Mode;
       im_alarm3.Visible:=not(im_alarm3.Visible);
       //Stop Alarm Clock!!
       Timer_alarm_clock.Enabled:=false;
    end;
  2:begin //Time mode change to Alarm Mode
       iMode:=20;
       Gam_Set_Mode;
       im_alarm3.Visible:=not(im_alarm3.Visible);
       //Stop Alarm Clock!!
       Timer_alarm_clock.Enabled:=false;
     end;
  20:begin //Enable/disable Alarm
       im_alarm3.Visible:=not(im_alarm3.Visible);
    end;
end;
bAlarmEnabled:=im_alarm3.Visible;
end;

procedure Tform1.Vid_Show_Demo_Mode;
var
  RandomMan,ManNumber,i:integer;
begin
  ManNumber:=0;
  for i:=1 to 3 do if iDemoPosMan[i]<>0 then ManNumber:=ManNumber+1;
  if iDemoPosMan[1]>7 then ManNumber:=ManNumber-1;
  if ((iDemoPosMan[3]>6) and (iDemoPosMan[3]<13)) then ManNumber:=ManNumber-1;
  RandomMan:=random(255);
  //Man 1
  if (RanDomMan and 1)<>0 then begin
     if ((ManNumber<2) and (iDemoPosMan[1]=0)) then begin
        iDemoPosMan[1]:=1;
        ManNumber:=ManNumber+1;
     end;
  end;
  //Man 2
  if (RanDomMan and $10)<>0 then begin
     if ((ManNumber<2) and (iDemoPosMan[2]=0)) then begin
        iDemoPosMan[2]:=1;
        ManNumber:=ManNumber+1;
     end;
  end;
  //Man 3
  if (RanDomMan and $80)<>0 then begin
     if ((ManNumber<2) and (iDemoPosMan[3]=0)) then begin
        iDemoPosMan[3]:=1;
        ManNumber:=ManNumber+1;
     end;
  end;
  //Shark
  if Random(7)=1 then begin
     if iDemoPosMan[4]=0 then iDemoPosMan[4]:=1;
  end;
  if ManNumber=0 then iDemoPosMan[random(3)+1]:=1;
  //Man 1
  if iDemoPosMan[1]<>0 then begin
     case iDemoPosMan[1] of
         1..7:begin
                 for i:=1 to 7 do aIm_Para[1,i].visible:=false;
                 aIm_Para[1,iDemoPosMan[1]].visible:=true;
                 if ((iDemoPosMan[1]=5) and (iDemoPosMan[3]<>6)) then begin
                     aIm_Boat[2].visible:=true;
                     aIm_Boat[3].visible:=false;
                 end;
                 iDemoPosMan[1]:=iDemoPosMan[1]+1;
               end;
            //Shark sequence...(allways die!)
            8:begin
                 aIm_Para[1,7].visible:=false;
                 aIm_Drown[3].Visible:=true;
                 aIm_Shark[3].Visible:=true;
                 iDemoPosMan[1]:=iDemoPosMan[1]+1;
              end;
      9,10,11:begin
                 aIm_Drown[iDemoPosMan[1]-6].visible:=false;
                 aIm_Drown[iDemoPosMan[1]-5].visible:=true;
                 aIm_Shark[iDemoPosMan[1]-6].visible:=false;
                 aIm_Shark[iDemoPosMan[1]-5].visible:=true;
                 iDemoPosMan[1]:=iDemoPosMan[1]+1;
              end;
           12:begin
                 aIm_Drown[6].visible:=false;
                 aIm_Shark[6].visible:=false;
                 iDemoPosMan[1]:=0;
              end;
         end;  //Case
  end;
  //Man 2
  if iDemoPosMan[2]<>0 then begin
     case iDemoPosMan[2] of
         1..6:begin
                   for i:=2 to 7 do aIm_Para[2,i].visible:=false;
                   aIm_Para[2,iDemoPosMan[2]+1].visible:=true;
                   if ((iDemoPosMan[2]>4) and (iDemoPosMan[3]<>6)) then begin
                       aIm_Boat[2].visible:=true;
                       aIm_Boat[3].visible:=false;
                   end;
                   iDemoPosMan[2]:=iDemoPosMan[2]+1;
              end;
            7:begin  //Allways get saved!
                 iDemoPosMan[2]:=0;
                 aIm_Para[2,7].visible:=false;
              end;
     end;
  end;
  //Man 3
  if iDemoPosMan[3]<>0 then begin
     case iDemoPosMan[3] of
       1..3,5:begin
               for i:=3 to 7 do aIm_Para[3,i].visible:=false;
               aIm_Para[3,iDemoPosMan[3]+2].visible:=true;
               aIm_Para[4,2].visible:=false;
               iDemoPosMan[3]:=iDemoPosMan[3]+1;
            end;
          4:begin
               aIm_Para[3,5].visible:=false;
               if (iDemoPosMan[2]<>7) then begin
                   aIm_Boat[2].visible:=false;
                   aIm_Boat[3].visible:=true;
               end;
               if (random(2)=1) then begin //Hangs on palm
                      iDemoPosMan[3]:=13;
                      aIm_Para[4,1].visible:=true;
                  end else begin
                      aIm_Para[3,6].visible:=true;
                      iDemoPosMan[3]:=iDemoPosMan[3]+1;
                  end;
            end;
          6:begin
               aIm_Para[3,7].visible:=false;
               //The boat is there so save him
               if aIm_Boat[3].visible then iDemoPosMan[3]:=0
                  //The Boat is not there so shark begins
                  else begin
                     aIm_Drown[1].Visible:=true;
                     iDemoPosMan[3]:=iDemoPosMan[3]+1;
                  end;
            end;
          7:begin
               aIm_Drown[1].Visible:=false;
               aIm_Drown[2].Visible:=true;
               aIm_Shark[2].visible:=true;
               iDemoPosMan[3]:=iDemoPosMan[3]+1;
            end;
      8..11:begin
               aIm_Drown[iDemoPosMan[3]-6].Visible:=false;
               aIm_Drown[iDemoPosMan[3]-5].Visible:=true;
               aIm_Shark[iDemoPosMan[3]-6].Visible:=false;
               aIm_Shark[iDemoPosMan[3]-5].visible:=true;
               iDemoPosMan[3]:=iDemoPosMan[3]+1;
            end;
         12:begin
               aIm_Drown[6].visible:=false;
               aIm_Shark[6].visible:=false;
               iDemoPosMan[3]:=0;
            end;
         13:begin  //Hanged
               aIm_Para[4,2].visible:=true;
               aIm_Para[4,1].visible:=false;
               if random(3)=1 then iDemoPosMan[3]:=5
                 else iDemoPosMan[3]:=14;
            end;
         14:begin  //Hanged
               aIm_Para[4,2].visible:=false;
               aIm_Para[4,1].visible:=true;
               iDemoPosMan[3]:=13;
            end;
     end; //Case
  end;
  //Shark
  if iDemoPosMan[4]<>0 then begin
     case iDemoPosMan[4] of
        1:begin
              aIm_Shark[2].visible:=true;
              iDemoPosMan[4]:=iDemoPosMan[4]+1;
          end;
     2..5:begin
              aIm_Shark[iDemoPosMan[4]].visible:=false;
              aIm_Shark[iDemoPosMan[4]+1].visible:=true;
              iDemoPosMan[4]:=iDemoPosMan[4]+1;
          end;
        6:begin
              aIm_Shark[6].visible:=false;
              iDemoPosMan[4]:=0;
          end;
     end;
  end;
end;

initialization
  bAlarmEnabled:=false;

end.
