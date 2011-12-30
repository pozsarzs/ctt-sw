{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010-2011 Pozsar Zsolt <info@pozsarzs.hu>                  | }
{ | ctt.lpt                                                                  | }
{ | Project file                                                [RN: CTT/28] | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }
{
 Mode	Operation	Output data		Input data
 -----------------------------------------------------------------------------
 Mode0	Stand-by	-			-
 Mode1	BUce		N/P;Pwr			BUce
 Mode2	BBcb		N/P;Pwr			BUcb
 Mode3	Ieb0		N/P;Pwr			Ieb0
 Mode4	Icb0		N/P;Pwr			Icb0
 Mode5	Ice0		N/P;Pwr			Ice0
 Mode6	Charact.	N/P;Pwr;Uce;Ubem	20xIb,Ube
 Mode7	Charact.	N/P;Pwr;Uce;5xIb	20xIb,Ube; 5x20xIc,Uce
 Mode8	Selection	N/P;Pwr;?

 Halt codes:
 ~~~~~~~~~~~
    1: missing file
    2: cannot read/write temporary file
}

program ctt;
{$MODE OBJFPC}{$H+}
uses
  Interfaces, Forms, DefaultTranslator, printer4lazarus,
  // my forms
  frmabout,  frmmain, frmserial, frmpref, frmdetails,
  // my units
  untcommonproc, untcheckregkey;

{$R *.res}

begin
  if (paramstr(1)='-v') or (paramstr(1)='--version') then
  begin
    writeln('CTT v'+untcommonproc.VERSION); 
    halt(0);
  end;
  Application.Title:='CTT Transistor tester';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.

