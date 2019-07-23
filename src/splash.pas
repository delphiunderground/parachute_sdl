unit splash;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Menus,StdCtrls,
  {$ifdef linux}LCLIntf,{$ENDIF}
  {$IFDEF WINDOWS}windows,{$ENDIF}about,sdl,sdl_mixer,manual;

type

  { TSplashForm }

  TSplashForm = class(TForm)
    btn_play: TButton;
    im_box_picture: TImage;
    la_email: TLabel;
    la_game_title: TLabel;
    la_http: TLabel;
    la_ported1: TLabel;
    la_release_date: TLabel;
    la_ported: TLabel;
    la_version: TLabel;
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
    { * POPUP MENU                                                               * }
    procedure btn_playClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure la_emailClick(Sender: TObject);
    procedure la_httpClick(Sender: TObject);
    procedure pm_1_aboutClick(Sender:   TObject);
    procedure pm_3_readmeClick(Sender:  TObject);
    procedure pm_4_whatsnewClick(Sender:TObject);
    procedure pm_6_manualClick(Sender:  TObject);
    procedure pm_8_hiscoreClick(Sender: TObject);
    procedure pm_10_exitClick(Sender:   TObject);
    procedure pm_12_muteaudioClick(Sender:TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation
uses unit1;

{ TSplashForm }

{$R *.lfm}

procedure TSplashForm.la_emailClick(Sender:TObject);
begin
  {$IFDEF WINDOWS}
  ShellExecute(Handle,'open','mailto:lucantignano@gmail.com',nil,'',SW_SHOWNORMAL);
  {$ENDIF}
  {$IFDEF LINUX}
  OpenURL('mailto:lucantignano@gmail.com');
  {$ENDIF}
end;

procedure TSplashForm.la_httpClick(Sender: TObject);
begin
  {$IFDEF WINDOWS}
  ShellExecute(Handle,'open','http://www.madrigaldesign.it/sim/',nil,'',SW_SHOWNORMAL);
  {$ENDIF}
  {$IFDEF LINUX}
  OpenURL('http://www.madrigaldesign.it/sim/');
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
      if (Mix_OpenAudio(44100, AUDIO_S16SYS, 1, 4096)<>0) then begin
        SDL_Quit();
        bSound:=false;
      end;
  end;
  //samples initialization
  if bSound then begin
      //Load Samples..
      pf_chance:=Mix_LoadWAV('Sound/Chance.wav');
      pf_got:=   Mix_LoadWAV('Sound/Got.wav');
      pf_miss1:= Mix_LoadWAV('Sound/Miss1.wav');
      pf_miss2:= Mix_LoadWAV('Sound/Miss2.wav');
      pf_miss3:= Mix_LoadWAV('Sound/Miss3.wav');
      pf_tick:=  Mix_LoadWAV('Sound/Tick.wav');
      pf_alarm:= Mix_LoadWAV('Sound/Alarm.wav');
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
  if ((key=$31) or (key=VK_RETURN)) and btn_Play.enabled then btn_playClick(Splashform);
  // 'ESC' key
  if key=VK_ESCAPE then Application.Terminate;
end;

{ **************************************************************************** }
{ * POPUP MENU                                                               * }
{ **************************************************************************** }
procedure TSplashForm.pm_1_aboutClick(Sender:TObject);
begin
  AboutForm.Show;
end;

procedure TSplashForm.pm_3_readmeClick(Sender:TObject);
begin
  {$IFDEF WINDOWS}
  ShellExecute(Handle,'open','./Readme.txt',nil,'',SW_SHOWNORMAL);
  {$ENDIF}
end;

procedure TSplashForm.pm_4_whatsnewClick(Sender:TObject);
begin
  {$IFDEF WINDOWS}
  ShellExecute(Handle,'open','./Whatsnew.txt',nil,'',SW_SHOWNORMAL);
  {$ENDIF}
end;

procedure TSplashForm.pm_6_manualClick(Sender:TObject);
begin
  ManualForm.Show;
end;

procedure TSplashForm.pm_8_hiscoreClick(Sender:TObject);
begin
  iHiscoreA:=0;
  RIF_Registry.WriteInteger('', 'HiscoreA_E', iHiscoreA);
  iHiscoreB:=0;
  RIF_Registry.WriteInteger('', 'HiscoreB_E', iHiscoreB);
  //Beep;
end;

procedure TSplashForm.pm_12_muteaudioClick(Sender:TObject);
begin
  bSoundMute:=not(bSoundMute);
  if not(bSoundMute) then form1.Snd_Silence;
end;

procedure TSplashForm.pm_10_exitClick(Sender:TObject);
begin
  form1.close;
  Application.Terminate;
end;

end.


