{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * transistor tester and characteristic curve plotter            | }
{ | Copyright (C) 2010-2022 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | ctt.lpt                                                                  | }
{ | Project file                                                             | }
{ +--------------------------------------------------------------------------+ }

//   This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.

//   This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

program ctt;

{$MODE OBJFPC}{$H+}
uses
  Interfaces,
  Forms,
  LResources,
  DefaultTranslator,
  frmmain,
  frmabout,
  commonproc,
  frmpref,
  frmdetails;

begin
  if (ParamStr(1) = '-v') or (ParamStr(1) = '--version') then
  begin
    writeln(APPNAME + ' v' + VERSION);
    halt(0);
  end;
  Application.Title := 'CTT * Transistor tester and characteristic curve ' + 'plotter';
  {$I ctt.lrs}
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
