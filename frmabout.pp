{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010-2011 Pozsar Zsolt <info@pozsarzs.hu>                  | }
{ | frmabout.pp                                                              | }
{ | About form                                                  [RN: CTT/28] | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit frmabout;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, commonproc;
type
  { TForm2 }
  TForm2 = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Button1: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
var
  Form2: TForm2;

Resourcestring
  MESSAGE01='Demo mode,';
  MESSAGE02='registration required!';

implementation

{ TForm2 }

// on show event
procedure TForm2.FormShow(Sender: TObject);
begin
  Label1.Caption:='CTT v'+commonproc.VERSION;
  Label4.Caption:=commonproc.HOMEPAGE;
  Label4.Enabled:=not commonproc.offline;
  Label5.Enabled:=not commonproc.offline;
  Label8.Font.Color:=clRed;
  Label10.Font.Color:=clRed;
  Label8.Caption:=MESSAGE01;
  Label10.Caption:=MESSAGE02;
  if (commonproc.username<>'!') and (commonproc.username<>'')
  then
  begin
    Label8.Font.Color:=clWindowText;
    Label10.Font.Color:=clWindowText;
    Label8.Caption:=commonproc.username;
    Label10.Caption:=commonproc.serialnumber;
  end;
end;

// homepage
procedure TForm2.Label4MouseEnter(Sender: TObject);
begin
  Label4.Font.Color:=clRed;
end;

procedure TForm2.Label4MouseLeave(Sender: TObject);
begin
  Label4.Font.Color:=clBlue;
end;

procedure TForm2.Label4Click(Sender: TObject);
begin
  runbrowser(Label4.Caption);
end;

// e-mail
procedure TForm2.Label5Click(Sender: TObject);
begin
  runmailer(Label5.Caption);
end;

procedure TForm2.Label5MouseEnter(Sender: TObject);
begin
  Label5.Font.Color:=clRed;
end;

procedure TForm2.Label5MouseLeave(Sender: TObject);
begin
  Label5.Font.Color:=clBlue;
end;

// close about
procedure TForm2.Button1Click(Sender: TObject);
begin
  Close;
end;

initialization
  {$I frmabout.lrs}

end.

