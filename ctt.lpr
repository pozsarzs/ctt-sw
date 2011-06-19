{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010-2011 Pozsar Zsolt <info@pozsarzs.hu>                  | }
{ | ctt.lpt                                                                  | }
{ | Project file                                                [RN: CTT/28] | }
{ +--------------------------------------------------------------------------+ }

program ctt;
{$MODE OBJFPC}{$H+}
uses
  Interfaces, Forms, frmmain, LResources, DefaultTranslator, frmabout, frmserial,
  commonproc, frmpref, frmdetails;

{$IFDEF WINDOWS}{$R ctt.rc}{$ENDIF}

begin
  if (paramstr(1)='-v') or (paramstr(1)='--version') then
  begin
    writeln('v0.1 (shareware)');
    halt(0);
  end;
  Application.Title:='CTT Transistor tester';
  {$I ctt.lrs}
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.

