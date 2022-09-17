{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * transistor tester and characteristic curve plotter            | }
{ | Copyright (C) 2010-2022 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | ctt-backend.pp                                                           | }
{ | Backend program                                                          | }
{ +--------------------------------------------------------------------------+ }

//   This program is free software: you can redistribute it and/or modify it
// under the terms of the European Union Public License 1.1 version.

//   This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.

{
 Usage:
   ctt-backend mode polarity parameter1 parameter2...parameter6

 Halt codes:
   1: manual run
   2: temporary file write error
}

{$DEFINE DEMO}

program backend;

uses
  SysUtils;

var
  b: byte;                                                   // general variable
  polarity: char;                                                     // NPN/PNP
  parameters: array[2..6] of integer;                              // input data
  puffer: array[1..206] of string;                              // output puffer
  s: string;                                                 // general variable

{$I config.pp}

{$IFDEF DEMO}
  {$I demodata.pp}
{$ENDIF}

  function ioperm(from: cardinal; num: cardinal; turn_on: integer): integer;
  cdecl; external 'libc';

  // operation modes
  procedure mode1;
  begin
  {$IFDEF DEMO}
    puffer[1] := IntToStr(random(99) + 1);
  {$ELSE}
    {
      Measurement process:
        write $A0 to -SL0 (low-power, NPN, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        write $A1 or $E1 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M1)
        write $00 to -SL5 (start A/D converter)
        wait for D7 from -SL4
        write $A0 or $E0 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        read lower bits from -SL3
        read higher and status bits from -SL4
    }
    // Place of the real measurement process
  {$ENDIF}
  end;

  procedure mode2;
  begin
  {$IFDEF DEMO}
    puffer[2] := IntToStr(random(99) + 1);
  {$ELSE}
    {
      Measurement process:
        write $A0 to -SL0 (low-power, NPN, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        write $A2 or $E2 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M1)
        write $00 to -SL5 (start A/D converter)
        wait for D7 from -SL4
        write $A0 or $E0 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        read lower bits from -SL3
        read higher and status bits from -SL4
    }
    // Place of the real measurement process
  {$ENDIF}
  end;

  procedure mode3;
  begin
  {$IFDEF DEMO}
    puffer[3] := IntToStr(random(99) + 1);
  {$ELSE}
    {
      Measurement process:
        write $A0 to -SL0 (low-power, NPN, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        write $A3 or $E3 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M1)
        write $00 to -SL5 (start A/D converter)
        wait for D7 from -SL4
        write $A0 or $E0 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        read lower bits from -SL3
        read higher and status bits from -SL4
    }
    // Place of the real measurement process
  {$ENDIF}
  end;

  procedure mode4;
  begin
  {$IFDEF DEMO}
    puffer[4] := IntToStr(random(99) + 1);
  {$ELSE}
    {
      Measurement process:
        write $A0 to -SL0 (low-power, NPN, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        write $A4 or $E4 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M1)
        write $00 to -SL5 (start A/D converter)
        wait for D7 from -SL4
        write $A0 or $E0 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        read lower bits from -SL3
        read higher and status bits from -SL4
    }
    // Place of the real measurement process
  {$ENDIF}
  end;

  procedure mode5;
  begin
  {$IFDEF DEMO}
    puffer[5] := IntToStr(random(99) + 1);
  {$ELSE}
    {
      Measurement process:
        write $A0 to -SL0 (low-power, NPN, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        write $A5 or $E5 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M1)
        write $00 to -SL5 (start A/D converter)
        wait for D7 from -SL4
        write $A0 or $E0 to -SL0 (low-power, NPN or PNP, Not enable, Ube, x, M0)
        write $00 to -SL6 (Uout=0 V)
        write $00 to -SL7 (Uout=0 V)
        read lower bits from -SL3
        read higher and status bits from -SL4
    }
    // Place of the real measurement process
  {$ENDIF}
  end;

  procedure mode6;
  begin
  {$IFDEF DEMO}
    for b := 1 to 40 do
      puffer[b + 6] := idemo[b];
  {$ELSE}
    // tényleges mérés
  {$ENDIF}
  end;

  procedure mode7;
  begin
  {$IFDEF DEMO}
    for b := 1 to 40 do
      puffer[b + 46] := o1demo[b];
    for b := 1 to 40 do
      puffer[b + 86] := o2demo[b];
    for b := 1 to 40 do
      puffer[b + 126] := o3demo[b];
    for b := 1 to 40 do
      puffer[b + 166] := o4demo[b];
  {$ELSE}
    // tényleges mérés
  {$ENDIF}
  end;

  procedure mode8;
  begin
  {$IFDEF DEMO}
    puffer[6] := IntToStr(random(150) + 25);
  {$ELSE}
    // tényleges mérés
  {$ENDIF}
  end;

  // save result to temp file
  function savedata: boolean;
  var
    t: Text;
  begin
    savedata := True;
    Assign(t, DIR_TEMP + 'ctt.tmp');
  {$I-}
    rewrite(t);
    writeln(t, 'CTT_v' + VERSION);
    for b := 1 to 206 do
    begin
      s := puffer[b];
      writeln(t, s);
    end;
    Close(t);
  {$I+}
    if ioresult <> 0 then
      savedata := False;
  end;

begin
  {$IFDEF DEMO}
  randomize;
  {$ENDIF}
  for b := 1 to 206 do
    puffer[b] := '0';
  for b := 2 to 6 do
    parameters[b] := 0;
  if paramcount > 1 then
  begin
    // input data
    polarity := ParamStr(2)[1];
    for b := 2 to 6 do
      if ParamStr(b + 1) <> '' then
        parameters[b] := StrToInt(ParamStr(b + 1));
    // operation mode
    if ParamStr(1) = 'm1' then
      mode1;
    if ParamStr(1) = 'm2' then
      mode2;
    if ParamStr(1) = 'm3' then
      mode3;
    if ParamStr(1) = 'm4' then
      mode4;
    if ParamStr(1) = 'm5' then
      mode5;
    if ParamStr(1) = 'm6' then
      mode6;
    if ParamStr(1) = 'm7' then
      mode7;
    if ParamStr(1) = 'm8' then
      mode8;
    if savedata = False then
      halt(2);
  end
  else
  begin
    writeln('Do not run this file manually!');
    halt(1);
  end;
  halt(0);
end.
