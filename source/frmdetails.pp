{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * transistor tester and characteristic curve plotter            | }
{ | Copyright (C) 2010-2022 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | frmdetails.pp                                                            | }
{ | Details window                                                           | }
{ +--------------------------------------------------------------------------+ }

//   This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.

//   This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

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

resourcestring
  MESSAGE01 = 'Minimum value is 4 uA for "Auto value"';

implementation

{ TForm5 }

// OnChange event
procedure TForm5.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked = False then
  begin
    FloatSpinEdit5.Enabled := True;
    FloatSpinEdit6.Enabled := True;
    FloatSpinEdit7.Enabled := True;
  end
  else
  if FloatSpinEdit3.Value >= 4 then
  begin
    FloatSpinEdit7.Value := FloatSpinEdit3.Value / 4;
    FloatSpinEdit6.Value := (FloatSpinEdit3.Value / 4) * 2;
    FloatSpinEdit5.Value := (FloatSpinEdit3.Value / 4) * 3;
    FloatSpinEdit5.Enabled := False;
    FloatSpinEdit6.Enabled := False;
    FloatSpinEdit7.Enabled := False;
  end
  else
  begin
    ShowMessage(MESSAGE01);
    CheckBox1.Checked := False;
  end;
end;

initialization
  {$I frmdetails.lrs}
end.
