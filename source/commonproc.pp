{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * transistor tester and characteristic curve plotter            | }
{ | Copyright (C) 2010-2022 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | commonproc.pp                                                            | }
{ | Common procedures and functions                                          | }
{ +--------------------------------------------------------------------------+ }

//   This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.

//   This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

{
 Mode  Operation  Output data    Input data
 -----------------------------------------------------------------------------
 Mode0  Stand-by  -      -
 Mode1  BUce    N/P;Pwr      BUce
 Mode2  BBcb    N/P;Pwr      BUcb
 Mode3  Ieb0    N/P;Pwr      Ieb0
 Mode4  Icb0    N/P;Pwr      Icb0
 Mode5  Ice0    N/P;Pwr      Ice0
 Mode6  Charact.  N/P;Pwr;Uce;5xIb  20xIb,Ube; 5x20xIc,Uce
 Mode7  Charact.  N/P;Pwr;Uce;5xIb  20xIb,Ube; 5x20xIc,Uce
 Mode8  Selection  N/P;Pwr;?
}
unit commonproc;

{$MODE OBJFPC}{$H-}
interface

uses
  Classes, SysUtils, LResources, Dialogs, GraphUtil, Graphics,
  dos, httpsend, convert;

var
  baseaddress: char;                                             // base address
  b: byte;                                              // general byte variable
  browserapp: string;                            // external browser application
  displaycolor: string;                                         // display color
  exepath, p: shortstring;                        // path of the executable file
  fg, d1, d2, bg: TColor;                              // colors of the displays
  g1xdiv, g1ydiv, g2xdiv, g2ydiv: integer;                       // graph. ?/div
  g1xpix, g1ypix, g2xpix, g2ypix: single;                   // graph. resolution
  lang: string[2];                                                   // language
  mailerapp: string;                              // external mailer application
  mdata: array[1..206] of string;                               // measured data
  offline: boolean;                                             // off-line mode
  s: string;                                          // general string variable
  t: Text;                                         // general text file variable
  userdir: string;                                          // users's directory

const
  packages: array[0..4] of string = ('emitter', 'base', 'collector', 'package', 'none');

{$I demodata.pp}
{$I config.pp}

function getexepath: string;
function getlang: string;
function loadprofile(filename: string): boolean;
function measure(m: byte): boolean;
function saveprofile(filename: string): boolean;
function searchupdate: boolean;
procedure cleardisplay(m: byte);
procedure loadcfg;
procedure makeuserdir;
procedure runbrowser(url: string);
procedure runmailer(adr: string);
procedure savecfg;
procedure setdisplaycolors;
procedure writetodisplay;

resourcestring
  MESSAGE01 = 'Missing default configuration file!';
  MESSAGE02 = 'Cannot write the user''s configuration file!';
  MESSAGE03 = 'Please check browser application setting!';
  MESSAGE04 = 'Please check mailer application setting!';
  MESSAGE05 = 'Missing palette file!';

implementation

uses frmmain;

// get executable path
function getexepath: string;
begin
  fsplit(ParamStr(0), exepath, p, p);
end;

// get language
function getlang: string;
begin
  {$IFDEF LINUX}
  s := getenv('LANG');
  {$ENDIF}
  if length(s) = 0 then
    s := 'en';
  lang := lowercase(s);
end;

// load profile
function loadprofile(filename: string): boolean;
var
  Count: byte;
  ty, po, ds, pc, ce, cb, ic, ib, pd, p1, p2, p3, p4, p5, p6, p7: string;
begin
  ty := '';
  po := '';
  ds := '';
  pc := '';
  ce := '';
  cb := '';
  ic := '';
  ib := '';
  pd := '';
  p1 := '';
  p2 := '';
  p3 := '';
  p4 := '';
  p5 := '';
  p6 := '';
  p7 := '';
  assignfile(t, filename);
  try
    reset(t);
    repeat
      readln(t, s);
      if s[1] + s[2] + s[3] = 'TY=' then
        for b := 4 to length(s) do
          ty := ty + s[b];
      if s[1] + s[2] + s[3] = 'PO=' then
        for b := 4 to length(s) do
          po := po + s[b];
      if s[1] + s[2] + s[3] = 'DS=' then
        for b := 4 to length(s) do
          ds := ds + s[b];
      if s[1] + s[2] + s[3] = 'PC=' then
        for b := 4 to length(s) do
          pc := pc + s[b];
      if s[1] + s[2] + s[3] = 'CE=' then
        for b := 4 to length(s) do
          ce := ce + s[b];
      if s[1] + s[2] + s[3] = 'CB=' then
        for b := 4 to length(s) do
          cb := cb + s[b];
      if s[1] + s[2] + s[3] = 'IC=' then
        for b := 4 to length(s) do
          ic := ic + s[b];
      if s[1] + s[2] + s[3] = 'IB=' then
        for b := 4 to length(s) do
          ib := ib + s[b];
      if s[1] + s[2] + s[3] = 'PD=' then
        for b := 4 to length(s) do
          pd := pd + s[b];
      if s[1] + s[2] + s[3] = 'P1=' then
        for b := 4 to length(s) do
          p1 := p1 + s[b];
      if s[1] + s[2] + s[3] = 'P2=' then
        for b := 4 to length(s) do
          p2 := p2 + s[b];
      if s[1] + s[2] + s[3] = 'P3=' then
        for b := 4 to length(s) do
          p3 := p3 + s[b];
      if s[1] + s[2] + s[3] = 'P4=' then
        for b := 4 to length(s) do
          p4 := p4 + s[b];
      if s[1] + s[2] + s[3] = 'P5=' then
        for b := 4 to length(s) do
          p5 := p5 + s[b];
      if s[1] + s[2] + s[3] = 'P6=' then
        for b := 4 to length(s) do
          p6 := p6 + s[b];
      if s[1] + s[2] + s[3] = 'P7=' then
        for b := 4 to length(s) do
          p7 := p7 + s[b];
    until (EOF(t));
    closefile(t);
  except
    loadprofile := False;
    exit;
  end;
  with Form1 do
  begin
    Form1.Edit2.Caption := ty;
    if po = 'NPN' then
      ComboBox1.ItemIndex := 0
    else
      ComboBox1.ItemIndex := 1;
    Edit1.Caption := ds;
    b := 0;
    for Count := 0 to ComboBox2.Items.Count - 1 do
      if uppercase(pc) = uppercase(ComboBox2.Items.ValueFromIndex[Count]) then
      begin
        ComboBox2.ItemIndex := Count;
        b := 1;
      end;
    if b = 0 then
      ComboBox2.ItemIndex := ComboBox2.Items.IndexOf(frmmain.MESSAGE26);
    try
      FloatSpinEdit1.Value := strtofloat(ce);
    except
      FloatSpinEdit1.Value := 0;
    end;
    try
      FloatSpinEdit2.Value := strtofloat(cb);
    except
      FloatSpinEdit2.Value := 0;
    end;
    try
      FloatSpinEdit3.Value := strtofloat(ic);
    except
      FloatSpinEdit3.Value := 0;
    end;
    try
      FloatSpinEdit4.Value := strtofloat(ib);
    except
      FloatSpinEdit4.Value := 0;
    end;
    try
      FloatSpinEdit5.Value := strtofloat(pd);
    except
      FloatSpinEdit5.Value := 0;
    end;
    ComboBox3.ItemIndex := 4;
    ComboBox4.ItemIndex := 4;
    ComboBox5.ItemIndex := 4;
    ComboBox6.ItemIndex := 4;
    ComboBox7.ItemIndex := 4;
    ComboBox8.ItemIndex := 4;
    ComboBox9.ItemIndex := 4;
    for Count := 0 to 4 do
    begin
      if uppercase(p1) = uppercase(packages[Count]) then
        ComboBox3.ItemIndex := Count;
      if uppercase(p2) = uppercase(packages[Count]) then
        ComboBox4.ItemIndex := Count;
      if uppercase(p3) = uppercase(packages[Count]) then
        ComboBox5.ItemIndex := Count;
      if uppercase(p4) = uppercase(packages[Count]) then
        ComboBox6.ItemIndex := Count;
      if uppercase(p5) = uppercase(packages[Count]) then
        ComboBox7.ItemIndex := Count;
      if uppercase(p6) = uppercase(packages[Count]) then
        ComboBox8.ItemIndex := Count;
      if uppercase(p7) = uppercase(packages[Count]) then
        ComboBox9.ItemIndex := Count;
    end;
    s := profilefilename;
    Delete(s, length(s) - 3, 4);
    for b := length(s) downto 1 do
      if (s[b] = '/') or (s[b] = '\') then
        break;
    Delete(s, 1, b);
    profilename := s;
  end;
end;

// measure
function measure(m: byte): boolean;
begin
  randomize;
  measure := True;

  // -- Mode1-Mode5 --
  if m < 6 then
  begin
    str(random(99) + 1, s);
    mdata[m] := s;
  end;

  // -- Mode6 --
  if m = 6 then
  begin
    for b := 7 to 46 do
      mdata[b] := idemo[b - 6]
  end;

  // -- Mode7 --
  if m = 7 then
  begin
    for b := 47 to 86 do
      mdata[b] := o1demo[b - 46];
    for b := 87 to 126 do
      mdata[b] := o2demo[b - 86];
    for b := 127 to 166 do
      mdata[b] := o3demo[b - 126];
    for b := 167 to 206 do
      mdata[b] := o4demo[b - 166];
  end;

  // -- Mode8 --
  if m = 8 then
  begin
    str(random(150) + 25, s);
    mdata[6] := s;
  end;
end;

// save profile
function saveprofile(filename: string): boolean;
begin
  assignfile(t, filename);
  {$I-}
  rewrite(t);
  Write(t, '# +');
  for b := 4 to 79 do
    Write(t, '-');
  writeln(t, '+');
  writeln(t, '# | CTT v0.1 * transistor tester and characteristic curve plotter         |');
  writeln(t, '# | Copyright (C) 2010-2022 Pozsar Zsolt <pozsarzs@gmail.com>                  |');
  writeln(t, '# | *.pro                                                                      |');
  writeln(t, '# | Transistor profile                                                         |');
  Write(t, '# +');
  for b := 4 to 79 do
    Write(t, '-');
  writeln(t, '+');
  writeln(t, 'TY=' + Form1.Edit2.Text);
  writeln(t, 'DS=' + Form1.Edit1.Text);
  writeln(t, 'CE=' + Form1.FloatSpinEdit1.ValueToStr(Form1.FloatSpinEdit1.Value));
  writeln(t, 'CB=' + Form1.FloatSpinEdit2.ValueToStr(Form1.FloatSpinEdit2.Value));
  writeln(t, 'IC=' + Form1.FloatSpinEdit3.ValueToStr(Form1.FloatSpinEdit3.Value));
  writeln(t, 'IB=' + Form1.FloatSpinEdit4.ValueToStr(Form1.FloatSpinEdit4.Value));
  writeln(t, 'PD=' + Form1.FloatSpinEdit5.ValueToStr(Form1.FloatSpinEdit5.Value));
  writeln(t, 'PO=' + Form1.ComboBox1.Items.Strings[Form1.ComboBox1.ItemIndex]);
  writeln(t, 'PC=' + Form1.ComboBox2.Items.Strings[Form1.ComboBox2.ItemIndex]);
  writeln(t, 'P1=' + packages[Form1.ComboBox3.ItemIndex]);
  writeln(t, 'P2=' + packages[Form1.ComboBox4.ItemIndex]);
  writeln(t, 'P3=' + packages[Form1.ComboBox5.ItemIndex]);
  writeln(t, 'P4=' + packages[Form1.ComboBox6.ItemIndex]);
  writeln(t, 'P5=' + packages[Form1.ComboBox7.ItemIndex]);
  writeln(t, 'P6=' + packages[Form1.ComboBox8.ItemIndex]);
  writeln(t, 'P7=' + packages[Form1.ComboBox9.ItemIndex]);
  closefile(t);
  {$I+}
  if ioresult <> 0 then
  begin
    ShowMessage(MESSAGE02);
    saveprofile := False;
  end
  else
  begin
    profilename := tname;
    saveprofile := True;
  end;
end;

// search update
function searchupdate: boolean;
var
  txt: TStringList;
  newversion: string;
begin
  if offline = False then
  begin
    txt := TStringList.Create;
    with THTTPSend.Create do
    begin
      if HttpGetText(HOMEPAGE + '/ctt/update/prog_version.txt', txt) then
        try
          newversion := txt.Strings[0];
          if VERSION <> newversion then
            searchupdate := True
          else
            searchupdate := False;
        except
        end;
      Free;
    end;
    txt.Free;
  end;
end;

// clear display(s)
procedure cleardisplay(m: byte);
var
  rx1, rx2, ry1, ry2: integer;
  i: integer;
begin
  rx1 := 8;
  ry1 := 29;
  rx2 := 508;
  ry2 := 379;
  case m of
    1:
    begin
      mdata[m] := '0';
      Form1.Panel1.Caption := mdata[m] + ' ';
    end;
    2:
    begin
      mdata[m] := '0';
      Form1.Panel2.Caption := mdata[m] + ' ';
    end;
    3:
    begin
      mdata[m] := '0';
      Form1.Panel3.Caption := mdata[m] + ' ';
    end;
    4:
    begin
      mdata[m] := '0';
      Form1.Panel4.Caption := mdata[m] + ' ';
    end;
    5:
    begin
      mdata[m] := '0';
      Form1.Panel5.Caption := mdata[m] + ' ';
    end;
  end;
  if m = 8 then
    mdata[6] := '0';
  if m = 6 then
    for b := 7 to 46 do
      mdata[b] := '0';
  if m = 7 then
    for b := 47 to 206 do
      mdata[b] := '0';
  if (m = 6) or (m = 7) or (m = 99) then
  begin
    with Form1.Image2.Picture.Bitmap do
    begin
      Clear;
      Width := Form1.Image2.Width;
      Height := Form1.Image2.Height;
      Canvas.Brush.Color := bg;
      Canvas.FillRect(0, 0, Form1.Image2.Width, Form1.Image2.Height);
      if header = True then
      begin
        Canvas.Font.Size := 8;
        Canvas.Font.Color := fg;
        Canvas.TextOut(8, 2, MESSAGE36);
        Canvas.TextOut(8, 14, MESSAGE37);
        Canvas.TextOut(23, 2, 'Ube');
        Canvas.TextOut(23, 14, 'Ib');
        Canvas.TextOut(58, 2, MESSAGE38 + IntToStr(g1xdiv) + ' mV/div');
        Canvas.TextOut(58, 14, MESSAGE38 + IntToStr(g1ydiv) + ' uA/div');
        Canvas.TextOut(200, 2, MESSAGE39 + '- mV');
        Canvas.TextOut(200, 14, MESSAGE39 + '- uA');
      end;
      if grid = True then
      begin
        Canvas.Pen.Width := 1;
        // finom
        Canvas.Pen.Color := d2;
        i := ry2;
        repeat
          Canvas.Line(rx1, i, rx2, i);
          i := i - 5;
        until i = ry1 - 5;
        i := rx1;
        repeat
          Canvas.Line(i, ry1, i, ry2);
          i := i + 5;
        until i = rx2 + 5;
        // durva
        Canvas.Pen.Color := d1;
        i := ry2;
        repeat
          Canvas.Line(rx1, i, rx2, i);
          i := i - 25;
        until i = ry1 - 25;
        i := rx1;
        repeat
          Canvas.Line(i, ry1, i, ry2);
          i := i + 25;
        until i = rx2 + 25;
      end;
    end;
    with Form1.Image3.Picture.Bitmap do
    begin
      Width := Form1.Image3.Width;
      Height := Form1.Image3.Height;
      Canvas.Brush.Color := bg;
      Canvas.FillRect(0, 0, Form1.Image3.Width, Form1.Image3.Height);
      if header = True then
      begin
        Canvas.Font.Size := 8;
        Canvas.Font.Color := fg;
        Canvas.TextOut(8, 2, MESSAGE36);
        Canvas.TextOut(8, 14, MESSAGE37);
        Canvas.TextOut(23, 2, 'Uce');
        Canvas.TextOut(23, 14, 'Ic');
        Canvas.TextOut(58, 2, MESSAGE38 + IntToStr(g2xdiv) + ' mV/div');
        Canvas.TextOut(58, 14, MESSAGE38 + IntToStr(g2ydiv) + ' mA/div');
        Canvas.TextOut(216, 2, MESSAGE39 + ': - V');
        Canvas.TextOut(216, 14, MESSAGE39 + ': - mA');
      end;
      if grid = True then
      begin
        Canvas.Pen.Width := 1;
        // finom
        Canvas.Pen.Color := d2;
        i := ry2;
        repeat
          Canvas.Line(rx1, i, rx2, i);
          i := i - 5;
        until i = ry1 - 5;
        i := rx1;
        repeat
          Canvas.Line(i, ry1, i, ry2);
          i := i + 5;
        until i = rx2 + 5;
        // durva
        Canvas.Pen.Color := d1;
        i := ry2;
        repeat
          Canvas.Line(rx1, i, rx2, i);
          i := i - 25;
        until i = ry1 - 25;
        i := rx1;
        repeat
          Canvas.Line(i, ry1, i, ry2);
          i := i + 25;
        until i = rx2 + 25;
      end;
    end;
  end;
end;

// load configuration
procedure loadcfg;
var
  conffile: byte;
begin
  conffile := 0;
  {$IFDEF LINUX}
  if FSearch('ctt.conf', exepath) <> '' then
    conffile := 1;
  if FSearch('cttrc', userdir) <> '' then
    conffile := 2;
  {$ENDIF}
  case conffile of
    1: assignfile(t, exepath + 'ctt.conf');
    2: assignfile(t, userdir + 'cttrc');
    3: assignfile(t, exepath + 'ctt.cfg');
    4: assignfile(t, userdir + 'cttrc');
    else
    begin
      ShowMessage(MESSAGE01);
      halt(1);
    end;
  end;
  try
    reset(t);
    browserapp := '';
    mailerapp := '';
    displaycolor := '';
    repeat
      readln(t, s);
      if s[1] + s[2] + s[3] = 'WB=' then
        for b := 4 to length(s) do
          browserapp := browserapp + s[b];
      if s[1] + s[2] + s[3] = 'MC=' then
        for b := 4 to length(s) do
          mailerapp := mailerapp + s[b];
      if s[1] + s[2] + s[3] = 'DC=' then
        for b := 4 to length(s) do
          displaycolor := displaycolor + s[b];
      if s[1] + s[2] + s[3] = 'BA=' then
        baseaddress := s[4];
      if (baseaddress <> '1') and (baseaddress <> '2') and (baseaddress <> '3') then
        baseaddress := '1';
      if s[1] + s[2] + s[3] = 'OM=' then
        if s[4] = '1' then
          offline := True
        else
          offline := False;
    until (EOF(t));
    closefile(t);
  except
    ShowMessage(MESSAGE01);
    halt(1);
  end;
end;

// make user's directory
procedure makeuserdir;
begin
  {$IFDEF LINUX}
  userdir := getenvironmentvariable('HOME');
  userdir := userdir + '/.ctt/';
  {$I-}
  mkdir(userdir);
  {$I+}
  ioresult;
  {$ENDIF}
end;

// run browser application
procedure runbrowser(url: string);
begin
  Form1.Process1.CommandLine := browserapp + ' ' + url;
  try
    Form1.Process1.Execute;
  except
    ShowMessage(MESSAGE03);
  end;
end;

// run mailer application
procedure runmailer(adr: string);
begin
  Form1.Process2.CommandLine := mailerapp + ' ' + adr;
  try
    Form1.Process2.Execute;
  except
    ShowMessage(MESSAGE04);
  end;
end;

// save configuration
procedure savecfg;
begin
  {$IFDEF LINUX}
  assignfile(t, userdir + '/cttrc');
  {$ENDIF}
  {$I-}
  rewrite(t);
  Write(t, '# +');
  for b := 4 to 79 do
    Write(t, '-');
  writeln(t, '+');
  writeln(t, '# | CTT v0.1 * Transistor tester                                               |');
  writeln(t, '# | Copyright (C) 2010 Pozsar Zsolt <info@pozsarzs.hu>                         |');
  writeln(t, '# | cttrc                                                                      |');
  writeln(t, '# | User''s configuration file                                                  |');
  Write(t, '# +');
  for b := 4 to 79 do
    Write(t, '-');
  writeln(t, '+');
  writeln(t, 'WB=' + browserapp);
  writeln(t, 'MC=' + mailerapp);
  writeln(t, 'BA=' + baseaddress);
  writeln(t, 'DC=' + displaycolor);
  Write(t, 'OM=');
  if offline = True then
    writeln(t, '1')
  else
    writeln(t, '0');
  closefile(t);
  {$I+}
  if ioresult <> 0 then
    ShowMessage(MESSAGE02);
end;

// set display colors
procedure setdisplaycolors;
var
  foreground, dark1, dark2, background: string;
  hu, lu, sa: byte;
begin
  foreground := '';
  background := '';
  dark1 := '';
  dark2 := '';
  {$IFDEF LINUX}
  assignfile(t, exepath + 'palettes/' + displaycolor + '.pal');
  {$ENDIF}
  {$I-}
  reset(t);
  repeat
    readln(t, s);
    s := lowercase(s);
    if s[1] + s[2] + s[3] = 'fg=' then
      for b := 4 to length(s) do
        foreground := foreground + s[b];
    if s[1] + s[2] + s[3] = 'd1=' then
      for b := 4 to length(s) do
        dark1 := dark1 + s[b];
    if s[1] + s[2] + s[3] = 'd2=' then
      for b := 4 to length(s) do
        dark2 := dark2 + s[b];
    if s[1] + s[2] + s[3] = 'bg=' then
      for b := 4 to length(s) do
        background := background + s[b];
  until (EOF(t));
  {$I+}
  if ioresult <> 0 then
  begin
    ShowMessage(MESSAGE05);
    foreground := '$ffffff';
    background := '$000000';
    dark1 := '$cccccc';
    dark2 := '$999999';
  end
  else
    closefile(t);
  RGBtoHLS(StrToInt(hextodez(background[2] + background[3])),
    StrToInt(hextodez(background[4] + background[5])),
    StrToInt(hextodez(background[6] + background[7])),
    hu, lu, sa);
  bg := HLStoColor(hu, lu, sa);
  RGBtoHLS(StrToInt(hextodez(foreground[2] + foreground[3])),
    StrToInt(hextodez(foreground[4] + foreground[5])),
    StrToInt(hextodez(foreground[6] + foreground[7])),
    hu, lu, sa);
  fg := HLStoColor(hu, lu, sa);
  RGBtoHLS(StrToInt(hextodez(dark1[2] + dark1[3])),
    StrToInt(hextodez(dark1[4] + dark1[5])),
    StrToInt(hextodez(dark1[6] + dark1[7])),
    hu, lu, sa);
  d1 := HLStoColor(hu, lu, sa);
  RGBtoHLS(StrToInt(hextodez(dark2[2] + dark2[3])),
    StrToInt(hextodez(dark2[4] + dark2[5])),
    StrToInt(hextodez(dark2[6] + dark2[7])),
    hu, lu, sa);
  d2 := HLStoColor(hu, lu, sa);
  Form1.Panel1.Color := bg;
  Form1.Panel2.Color := bg;
  Form1.Panel3.Color := bg;
  Form1.Panel4.Color := bg;
  Form1.Panel5.Color := bg;
  Form1.Panel1.Font.Color := fg;
  Form1.Panel2.Font.Color := fg;
  Form1.Panel3.Font.Color := fg;
  Form1.Panel4.Font.Color := fg;
  Form1.Panel5.Font.Color := fg;
  cleardisplay(99);
  writetodisplay;
end;

// write and draw data to displays
procedure writetodisplay;
var
  b: byte;

  procedure drawgraph1(xpix, ypix, a1, a2, a3, a4: single);
  var
    xx1, yy1, xx2, yy2: longint;
  begin
    xx1 := trunc(a1 / xpix) + 8;
    yy1 := trunc(((a2 / ypix) - 387) * -1) - 8;
    xx2 := trunc(a3 / xpix) + 8;
    yy2 := trunc(((a4 / ypix) - 387) * -1) - 8;
    Form1.Image2.Canvas.Pen.Color := fg;
    Form1.Image2.Canvas.Pen.Width := 2;
    Form1.Image2.Canvas.Line(xx1, yy1, xx2, yy2);
  end;

  procedure drawgraph2(xpix, ypix, a1, a2, a3, a4: single);
  var
    xx1, yy1, xx2, yy2: longint;
  begin
    xx1 := trunc(a1 / xpix) + 8;
    yy1 := trunc(((a2 / ypix) - 387) * -1) - 8;
    xx2 := trunc(a3 / xpix) + 8;
    yy2 := trunc(((a4 / ypix) - 387) * -1) - 8;
    Form1.Image3.Canvas.Pen.Color := fg;
    Form1.Image3.Canvas.Pen.Width := 2;
    Form1.Image3.Canvas.Line(xx1, yy1, xx2, yy2);
  end;

begin
  // 1st page
  Form1.Panel1.Caption := mdata[1] + ' ';
  Form1.Panel2.Caption := mdata[2] + ' ';
  Form1.Panel3.Caption := mdata[3] + ' ';
  Form1.Panel4.Caption := mdata[4] + ' ';
  Form1.Panel5.Caption := mdata[5] + ' ';
  // 2nd page
  b := 7;
  repeat
    drawgraph1(g1xpix, g1ypix, strtofloat(mdata[b]), strtofloat(mdata[b + 1]),
      strtofloat(mdata[b + 2]), strtofloat(mdata[b + 3]));
    b := b + 2
  until b = 45;
  // 3rd page
  b := 47;
  repeat
    drawgraph2(g2xpix, g2ypix, strtofloat(mdata[b]), strtofloat(mdata[b + 1]),
      strtofloat(mdata[b + 2]), strtofloat(mdata[b + 3]));
    b := b + 2
  until b = 85;
  b := 87;
  repeat
    drawgraph2(g2xpix, g2ypix, strtofloat(mdata[b]), strtofloat(mdata[b + 1]),
      strtofloat(mdata[b + 2]), strtofloat(mdata[b + 3]));
    b := b + 2
  until b = 125;
  b := 127;
  repeat
    drawgraph2(g2xpix, g2ypix, strtofloat(mdata[b]), strtofloat(mdata[b + 1]),
      strtofloat(mdata[b + 2]), strtofloat(mdata[b + 3]));
    b := b + 2
  until b = 165;
  b := 167;
  repeat
    drawgraph2(g2xpix, g2ypix, strtofloat(mdata[b]), strtofloat(mdata[b + 1]),
      strtofloat(mdata[b + 2]), strtofloat(mdata[b + 3]));
    b := b + 2
  until b = 205;
end;

end.
