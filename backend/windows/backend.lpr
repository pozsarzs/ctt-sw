{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010 Pozsar Zsolt <info@pozsarzs.hu>                       | }
{ | ctt-backend.pp                                                           | }
{ | Backend for windows                                         [RN: CTT/26] | }
{ +--------------------------------------------------------------------------+ }
program backend;
{$mode objfpc}{$H+}
uses
  Interfaces, Forms, LResources, frmmain;

{$IFDEF WINDOWS}{$R backend.rc}{$ENDIF}

begin
  {$I backend.lrs}
  Application.Title:='CTT';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

