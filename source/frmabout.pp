{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * transistor tester and characteristic curve plotter            | }
{ | Copyright (C) 2010-2022 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | frmabout.pp                                                              | }
{ | About form                                                               | }
{ +--------------------------------------------------------------------------+ }

//   This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.

//   This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

unit frmabout;

{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, commonproc;

type
  { TForm2 }
  TForm2 = class(TForm)
    Bevel2: TBevel;
    Button1: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
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

implementation

{ TForm2 }

// OnShow event
procedure TForm2.FormShow(Sender: TObject);
begin
  Label1.Caption := commonproc.APPNAME + ' v' + commonproc.VERSION;
  Label4.Caption := commonproc.HOMEPAGE;
  Label4.Enabled := not commonproc.offline;
  Label5.Enabled := not commonproc.offline;
  Label8.Font.Color := clRed;
  Label10.Font.Color := clRed;
end;

// Open homepage
procedure TForm2.Label4MouseEnter(Sender: TObject);
begin
  Label4.Font.Color := clRed;
end;

procedure TForm2.Label4MouseLeave(Sender: TObject);
begin
  Label4.Font.Color := clBlue;
end;

procedure TForm2.Label4Click(Sender: TObject);
begin
  runbrowser(Label4.Caption);
end;

// Send e-mail
procedure TForm2.Label5Click(Sender: TObject);
begin
  runmailer(Label5.Caption);
end;

procedure TForm2.Label5MouseEnter(Sender: TObject);
begin
  Label5.Font.Color := clRed;
end;

procedure TForm2.Label5MouseLeave(Sender: TObject);
begin
  Label5.Font.Color := clBlue;
end;

// Close about
procedure TForm2.Button1Click(Sender: TObject);
begin
  Close;
end;

initialization
  {$I frmabout.lrs}

end.
