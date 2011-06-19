{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010-2011 Pozsar Zsolt <info@pozsarzs.hu>                  | }
{ | frmdetails.pp                                                            | }
{ | Details window                                              [RN: CTT/28] | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit frmdetails;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Spin;
type
  { TForm5 }
  TForm5 = class(TForm)
    CheckBox1: TCheckBox;
    FloatSpinEdit1: TFloatSpinEdit;
    FloatSpinEdit2: TFloatSpinEdit;
    FloatSpinEdit3: TFloatSpinEdit;
    FloatSpinEdit5: TFloatSpinEdit;
    FloatSpinEdit6: TFloatSpinEdit;
    FloatSpinEdit7: TFloatSpinEdit;
    FloatSpinEdit8: TFloatSpinEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure CheckBox1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form5: TForm5; 

Resourcestring
  MESSAGE01='Minimum value is 4 uA for "Auto value"';

implementation

{ TForm5 }

procedure TForm5.CheckBox1Change(Sender: TObject);
begin
  If CheckBox1.Checked=False then
  begin
    FloatSpinEdit5.Enabled:=true;
    FloatSpinEdit6.Enabled:=true;
    FloatSpinEdit7.Enabled:=true;
  end
  else
    if FloatSpinEdit3.Value>=4 then
    begin
      FloatSpinEdit7.Value:=FloatSpinEdit3.Value/4;
      FloatSpinEdit6.Value:=(FloatSpinEdit3.Value/4)*2;
      FloatSpinEdit5.Value:=(FloatSpinEdit3.Value/4)*3;
      FloatSpinEdit5.Enabled:=false;
      FloatSpinEdit6.Enabled:=false;
      FloatSpinEdit7.Enabled:=false;
    end else
    begin
      showmessage(MESSAGE01);
      CheckBox1.Checked:=False;
    end;
end;

initialization
  {$I frmdetails.lrs}
end.

