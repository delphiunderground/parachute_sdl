program parachute;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, splash, about, Manual,
  sdl2 in '..\SDL2\sdl2.pas',
  sdl2_mixer in '..\SDL2\sdl2_mixer.pas';

{$R *.res}

begin
  Application.Title:='Parachute Simulator';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSplashForm, SplashForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TManualForm, ManualForm);
  Application.Run;
end.

