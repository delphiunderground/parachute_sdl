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
