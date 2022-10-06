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
   ctt-backend mode polarity parameter1...parameter10
     mode:       m0..m8
     polarity:   n | p
     parameters: numbers (see later)

 Halt codes:
   0: Normal exit
   1: Bad or bad number of parameters
   2: Cannot write temporary file
}

{$DEFINE DEMO}
{$DEFINE DEBUG}

program backend;

uses
  SysUtils;

type
  TInputArray = array[1..12] of string;
  TOutputArray = array[1..206] of string;

var
  b: byte;                                                   // general variable
  parameters: TInputArray;                                   // input parameters

{$I config.pp}

{$IFDEF DEMO}
  {$I demodata.pp}
{$ENDIF}

  function ioperm(from: cardinal; num: cardinal; turn_on: integer): integer;
  cdecl; external 'libc';

  // operation modes
  // M0 | Stand-by
  function mode0(p: TInputArray): TOutputArray;
  {
    parameters:
      p[1]:    m0         p[7]:    0
      p[2]:    n | p      p[8]:    0
      p[3]:    0          p[9]:    0
      p[4]:    0          p[10]:   0
      p[5]:    0          p[11]:   0
      p[6]:    0          p[12]:   0
  }
  begin
    for b := 1 to 206 do
      mode0[b] := '0';
  {$IFNDEF DEMO}
    // Place of the real measurement process
  {$ENDIF}
  {$IFDEF DEBUG}
    Write('Input:  ');
    for b := 1 to 12 do
      Write(p[b] + ' ');
    writeln;
    Write('Output: ');
    for b := 1 to 206 do
      Write(mode0[b] + ' ');
    writeln;
  {$ENDIF}
  end;


  // M1 | BUce
  function mode1(p: TInputArray): TOutputArray;
  {
    parameters:
      p[1]:    m1         p[7]:    0
      p[2]:    n | p      p[8]:    Ucem
      p[3]:    0          p[9]:    Ucbm
      p[4]:    0          p[10]:   Icm
      p[5]:    0          p[11]:   Ibm
      p[6]:    0          p[12]:   Pd
  }
  begin
    for b := 1 to 206 do
      mode1[b] := '0';
  {$IFDEF DEMO}
    mode1[1] := IntToStr(random(99) + 1);
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
  {$IFDEF DEBUG}
    Write('Input:  ');
    for b := 1 to 12 do
      Write(p[b] + ' ');
    writeln;
    Write('Output: ');
    for b := 1 to 206 do
      Write(mode1[b] + ' ');
    writeln;
  {$ENDIF}
  end;

  // M2 | BUcb
  function mode2(p: TInputArray): TOutputArray;
  {
    parameters:
      p[1]:    m2         p[7]:    0
      p[2]:    n | p      p[8]:    Ucem
      p[3]:    0          p[9]:    Ucbm
      p[4]:    0          p[10]:   Icm
      p[5]:    0          p[11]:   Ibm
      p[6]:    0          p[12]:   Pd
  }
  begin
    for b := 1 to 206 do
      mode2[b] := '0';
  {$IFDEF DEMO}
    mode2[2] := IntToStr(random(99) + 1);
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
    // Place of the real measurement process
    }
  {$ENDIF}
  {$IFDEF DEBUG}
    Write('Input:  ');
    for b := 1 to 12 do
      Write(p[b] + ' ');
    writeln;
    Write('Output: ');
    for b := 1 to 206 do
      Write(mode2[b] + ' ');
    writeln;
  {$ENDIF}
  end;

  // M3 | Ieb0
  function mode3(p: TInputArray): TOutputArray;
  {
    parameters:
      p[1]:    m3         p[7]:    0
      p[2]:    n | p      p[8]:    Ucem
      p[3]:    0          p[9]:    Ucbm
      p[4]:    0          p[10]:   Icm
      p[5]:    0          p[11]:   Ibm
      p[6]:    0          p[12]:   Pd
  }
  begin
    for b := 1 to 206 do
      mode3[b] := '0';
  {$IFDEF DEMO}
    mode3[3] := IntToStr(random(99) + 1);
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
  {$IFDEF DEBUG}
    Write('Input:  ');
    for b := 1 to 12 do
      Write(p[b] + ' ');
    writeln;
    Write('Output: ');
    for b := 1 to 206 do
      Write(mode3[b] + ' ');
    writeln;
  {$ENDIF}
  end;

  // M4 | Icb0
  function mode4(p: TInputArray): TOutputArray;
  {
    parameters:
      p[1]:    m4         p[7]:    0
      p[2]:    n | p      p[8]:    Ucem
      p[3]:    0          p[9]:    Ucbm
      p[4]:    0          p[10]:   Icm
      p[5]:    0          p[11]:   Ibm
      p[6]:    0          p[12]:   Pd
  }
  begin
    for b := 1 to 206 do
      mode4[b] := '0';
  {$IFDEF DEMO}
    mode4[4] := IntToStr(random(99) + 1);
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
  {$IFDEF DEBUG}
    Write('Input:  ');
    for b := 1 to 12 do
      Write(p[b] + ' ');
    writeln;
    Write('Output: ');
    for b := 1 to 206 do
      Write(mode4[b] + ' ');
    writeln;
  {$ENDIF}
  end;

  // M5 | Ice0
  function mode5(p: TInputArray): TOutputArray;
  {
    parameters:
      p[1]:    m5         p[7]:    0
      p[2]:    n | p      p[8]:    Ucem
      p[3]:    0          p[9]:    Ucbm
      p[4]:    0          p[10]:   Icm
      p[5]:    0          p[11]:   Ibm
      p[6]:    0          p[12]:   Pd
  }
  begin
    for b := 1 to 206 do
      mode5[b] := '0';
  {$IFDEF DEMO}
    mode5[5] := IntToStr(random(99) + 1);
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
  {$IFDEF DEBUG}
    Write('Input:  ');
    for b := 1 to 12 do
      Write(p[b] + ' ');
    writeln;
    Write('Output: ');
    for b := 1 to 206 do
      Write(mode5[b] + ' ');
    writeln;
  {$ENDIF}
  end;

  // M6 | Input diagram
  function mode6(p: TInputArray): TOutputArray;
  {
    parameters:
      p[1]:    m6         p[7]:    0
      p[2]:    n | p      p[8]:    Ucem
      p[3]:    Uce        p[9]:    Ucbm
      p[4]:    Ibmax      p[10]:   Icm
      p[5]:    0          p[11]:   Ibm
      p[6]:    0          p[12]:   Pd
  }
  begin
    for b := 1 to 206 do
      mode6[b] := '0';
  {$IFDEF DEMO}
    for b := 1 to 40 do
      mode6[b + 6] := idemo[b];
  {$ELSE}
    // Place of the real measurement process
  {$ENDIF}
  {$IFDEF DEBUG}
    Write('Input:  ');
    for b := 1 to 12 do
      Write(p[b] + ' ');
    writeln;
    Write('Output: ');
    for b := 1 to 206 do
      Write(mode6[b] + ' ');
    writeln;
  {$ENDIF}
  end;

  // M7 | Output diagram
  function mode7(p: TInputArray): TOutputArray;
  {
    parameters:
      p[1]:    m7         p[7]:    Ucemax
      p[2]:    n | p      p[8]:    Ucem
      p[3]:    Ib1        p[9]:    Ucbm
      p[4]:    Ib2        p[10]:   Icm
      p[5]:    Ib3        p[11]:   Ibm
      p[6]:    Ib4        p[12]:   Pd
  }
  begin
    for b := 1 to 206 do
      mode7[b] := '0';
  {$IFDEF DEMO}
    for b := 1 to 40 do
    begin
      mode7[b + 46] := o1demo[b];
      mode7[b + 86] := o2demo[b];
      mode7[b + 126] := o3demo[b];
      mode7[b + 166] := o4demo[b];
    end;
  {$ELSE}
    // Place of the real measurement process
  {$ENDIF}
  {$IFDEF DEBUG}
    Write('Input:  ');
    for b := 1 to 12 do
      Write(p[b] + ' ');
    writeln;
    Write('Output: ');
    for b := 1 to 206 do
      Write(mode7[b] + ' ');
    writeln;
  {$ENDIF}
  end;

  // M8 | Selection by h21e
  function mode8(p: TInputArray): TOutputArray;
  {
    parameters:
      p[1]:    m8         p[7]:    0
      p[2]:    n | p      p[8]:    Ucem
      p[3]:    0          p[9]:    Ucbm
      p[4]:    0          p[10]:   Icm
      p[5]:    0          p[11]:   Ibm
      p[6]:    0          p[12]:   Pd
  }
  begin
    for b := 1 to 206 do
      mode8[b] := '0';
  {$IFDEF DEMO}
    mode8[6] := IntToStr(random(150) + 25);
  {$ELSE}
    // Place of the real measurement process
  {$ENDIF}
  {$IFDEF DEBUG}
    Write('Input:  ');
    for b := 1 to 12 do
      Write(p[b] + ' ');
    writeln;
    Write('Output: ');
    for b := 1 to 206 do
      Write(mode8[b] + ' ');
    writeln;
  {$ENDIF}
  end;

  // save result to temp file
  function savedata(o: TOutputArray): boolean;
  var
    t: Text;
  begin
    savedata := True;
    Assign(t, DIR_TEMP + 'ctt.tmp');
  {$I-}
    rewrite(t);
    writeln(t, 'CTT_v' + VERSION);
    for b := 1 to 206 do
      writeln(t, o[b]);
    Close(t);
  {$I+}
    if ioresult <> 0 then
      savedata := False;
  end;

begin
  {$IFDEF DEMO}
  randomize;
  {$ENDIF}
  if paramcount = 12 then
    for b := 1 to 12 do
      parameters[b] := ParamStr(b);
  case parameters[1] of
    'm0': if not savedata(mode0(parameters)) then
        b := 1
      else
        b := 0;
    'm1': if not savedata(mode1(parameters)) then
        b := 1
      else
        b := 0;
    'm2': if not savedata(mode2(parameters)) then
        b := 1
      else
        b := 0;
    'm3': if not savedata(mode3(parameters)) then
        b := 1
      else
        b := 0;
    'm4': if not savedata(mode4(parameters)) then
        b := 1
      else
        b := 0;
    'm5': if not savedata(mode5(parameters)) then
        b := 1
      else
        b := 0;
    'm6': if not savedata(mode6(parameters)) then
        b := 1
      else
        b := 0;
    'm7': if not savedata(mode7(parameters)) then
        b := 1
      else
        b := 0;
    'm8': if not savedata(mode8(parameters)) then
        b := 1
      else
        b := 0;
    else
      writeln('ERROR #1: Bad or bad number of parameters.');
      writeln;
      writeln('Usage: ctt-backend mode polarity parameter1...parameter10');
      halt(1);
  end;
  if b = 1 then
  begin
    writeln('ERROR #2: Cannot write temporary file: ' + DIR_TEMP + 'ctt.tmp');
    halt(2);
  end;
  halt(0);
end.
