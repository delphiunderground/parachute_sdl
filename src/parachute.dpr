program parachute;

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  {$IFDEF FPC}
  Interfaces, // this includes the LCL widgetset
  {$ENDIF}
  Forms, Unit1, splash, about, Manual,
  sdl2 in '..\SDL2\sdl2.pas',
  sdl2_mixer in '..\SDL2\sdl2_mixer.pas';

{$R *.res}

begin
  Application.Title:='Parachute Simulator';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSplashForm, SplashForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TManualForm, ManualForm);
  Application.Run;
end.
