{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010-2011 Pozsar Zsolt <info@pozsarzs.hu>                  | }
{ | frmpref.pp                                                               | }
{ | Preferences form                                            [RN: CTT/28] | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit frmpref;
{$MODE OBJFPC}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, commonproc;
type
  { TForm4 }
  TForm4 = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
var
  Form4: TForm4;
const
  colors: array[0..5] of string=('white','yellow','red','green','blue','black');

Resourcestring
  MESSAGE01='Select browser application';
  MESSAGE02='Select mailer application';
  MESSAGE03='executables|*.exe|all files|*.*';
  MESSAGE04='all files|*.*';
  MESSAGE05='white';
  MESSAGE06='yellow';
  MESSAGE07='red';
  MESSAGE08='green';
  MESSAGE09='blue';
  MESSAGE10='black';

implementation

{ TForm4 }
//  on show event
procedure TForm4.FormShow(Sender: TObject);
var
  count: byte;
begin
  Edit1.Text:=browserapp;
  Edit2.Text:=mailerapp;
  CheckBox1.Checked:=offline;
  case commonproc.baseaddress of
    '1': ComboBox1.ItemIndex:=0;
    '2': ComboBox1.ItemIndex:=1;
    '3': ComboBox1.ItemIndex:=2;
  end;
  RadioGroup1.Items.Clear;
  RadioGroup1.Items.Add(MESSAGE05);
  RadioGroup1.Items.Add(MESSAGE06);
  RadioGroup1.Items.Add(MESSAGE07);
  RadioGroup1.Items.Add(MESSAGE08);
  RadioGroup1.Items.Add(MESSAGE09);
  RadioGroup1.Items.Add(MESSAGE10);
  for count:=0 to 5 do
    if commonproc.displaycolor=colors[count] then RadioGroup1.ItemIndex:=count;
end;

// cancel button
procedure TForm4.Button2Click(Sender: TObject);
begin
  Close;
end;

// browse buttons
procedure TForm4.Button4Click(Sender: TObject);
begin
  OpenDialog1.Title:=MESSAGE01;
  {$IFDEF LINUX}
  OpenDialog1.InitialDir:='/';
  Opendialog1.Filter:=MESSAGE03;
  {$ENDIF}
  {$IFDEF WINDOWS}
  OpenDialog1.InitialDir:='\';
  Opendialog1.Filter:=MESSAGE04;
  {$ENDIF}
  if OpenDialog1.Execute=false then exit;
  Edit1.Text:=OpenDialog1.FileName;
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  OpenDialog1.Title:=MESSAGE02;
  {$IFDEF LINUX}
  OpenDialog1.InitialDir:='/';
  Opendialog1.Filter:=MESSAGE03;
  {$ENDIF}
  {$IFDEF WINDOWS}
  OpenDialog1.InitialDir:='\';
  Opendialog1.Filter:=MESSAGE04;
  {$ENDIF}
  if OpenDialog1.Execute=false then exit;
  Edit2.Text:=OpenDialog1.FileName;
end;

// set button
procedure TForm4.Button1Click(Sender: TObject);
begin
  commonproc.browserapp:=Edit1.Text;
  commonproc.mailerapp:=Edit2.Text;
  commonproc.offline:=CheckBox1.Checked;
  case ComboBox1.ItemIndex of
    0: baseaddress:='1';
    1: baseaddress:='2';
    2: baseaddress:='3';
  end;
  case ComboBox1.ItemIndex of
    0: baseaddress:='1';
    1: baseaddress:='2';
    2: baseaddress:='3';
  end;
  commonproc.displaycolor:=colors[RadioGroup1.ItemIndex];
  setdisplaycolors;
  savecfg;
  Close;
end;

initialization
  {$I frmpref.lrs}
end.
