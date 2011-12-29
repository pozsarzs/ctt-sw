{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010-2011 Pozsar Zsolt <info@pozsarzs.hu>                  | }
{ | frmserial.pp                                                             | }
{ | Set serial form                                             [RN: CTT/28] | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit frmserial;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls,
  // my units
  untcommonproc;
type
  { TForm3 }
  TForm3 = class(TForm)
    Bevel1: TBevel;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form3: TForm3; 

Resourcestring
  MESSAGE01='Wrong serial number!';

implementation

{ TForm3 }

// clear all field
procedure TForm3.Button3Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  untcommonproc.username:='!';
  Close;
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
  if length(Edit1.Text)+length(Edit2.Text)+length(Edit3.Text)=18
  then Button1.Enabled:=true
  else Button1.Enabled:=false;
end;

// check and close
procedure TForm3.Button1Click(Sender: TObject);
begin
  serialnumber:=Edit1.Text+'-'+Edit2.Text+'-'+Edit3.Text;
  crk;
  if (username='!') or (username='') then
  begin
    showmessage(MESSAGE01);
    serialnumber:='';
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
  end;
  Close;
end;


initialization
  {$I frmserial.lrs}

end.
