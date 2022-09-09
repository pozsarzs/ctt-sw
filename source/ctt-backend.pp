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
 Operation modes:
 ~~~~~~~~~~~~~~~~
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

 Usage:
 ~~~~~~
   ctt-backend[.exe] mode polarity data1 data2 ...data6)

 Halt codes:
 ~~~~~~~~~~~
 1: manual run
 2: temporary file write error
}

{$DEFINE DEMO}

program backend;
uses sysutils;
var
  b: byte;                                                   // general variable
  parameters: array[1..6] of integer;                              // input data
  puffer: array[1..206] of string;                              // output puffer
  s: string;                                                 // general variable

{$IFDEF DEMO}
  {$I demodata.pp}
{$ENDIF}

function ioperm(from: Cardinal; num: Cardinal; turn_on: Integer): Integer;
  cdecl; external 'libc';

// operation modes
procedure mode1;
begin
  {$IFDEF DEMO}
  puffer[1]:=inttostr(random(99)+1);
  {$ELSE}
  // tényleges mérés
  {$ENDIF}
end;

procedure mode2;
begin
  {$IFDEF DEMO}
  puffer[2]:=inttostr(random(99)+1);
  {$ELSE}
  // tényleges mérés
{$ENDIF}
end;

procedure mode3;
begin
  {$IFDEF DEMO}
  puffer[3]:=inttostr(random(99)+1);
  {$ELSE}
  // tényleges mérés
  {$ENDIF}
end;

procedure mode4;
begin
  {$IFDEF DEMO}
  puffer[4]:=inttostr(random(99)+1);
  {$ELSE}
  // tényleges mérés
  {$ENDIF}
end;

procedure mode5;
begin
  {$IFDEF DEMO}
  puffer[5]:=inttostr(random(99)+1);
  {$ELSE}
  // tényleges mérés
  {$ENDIF}
end;

procedure mode6;
begin
  {$IFDEF DEMO}
  for b:=1 to 40 do puffer[b+6]:=idemo[b];
  {$ELSE}
  // tényleges mérés
  {$ENDIF}
end;

procedure mode7;
begin
  {$IFDEF DEMO}
  for b:=1 to 40 do puffer[b+46]:=o1demo[b];
  for b:=1 to 40 do puffer[b+86]:=o2demo[b];
  for b:=1 to 40 do puffer[b+126]:=o3demo[b];
  for b:=1 to 40 do puffer[b+166]:=o4demo[b];
  {$ELSE}
  // tényleges mérés
  {$ENDIF}
end;

procedure mode8;
begin
  {$IFDEF DEMO}
  puffer[6]:=inttostr(random(150)+25);
  {$ELSE}
  // tényleges mérés
  {$ENDIF}
end;

// save result to temp file
function savedata: boolean;
var
  t: text;
begin
  savedata:=true;
  assign(t,'/tmp/ctt.tmp');
  {$I-}
  rewrite(t);
  writeln(t,'CTT_v0.1');
  for b:=1 to 206 do
  begin
    s:=puffer[b];
    writeln(t,s);
  end;
  close(t);
  {$I+}
  if ioresult<>0 then savedata:=false;
end;

begin
  for b:=1 to 206 do puffer[b]:='0';
  for b:=1 to 6 do parameters[b]:=0;
  if paramcount>1 then
  begin
    // input data
    for b:=1 to 6 do
      if paramstr(b+1)<>'' then parameters[b]:=strtoint(paramstr(b+1));
    // operation mode
    if paramstr(1)='m1' then mode1;
    if paramstr(1)='m2' then mode2;
    if paramstr(1)='m3' then mode3;
    if paramstr(1)='m4' then mode4;
    if paramstr(1)='m5' then mode5;
    if paramstr(1)='m6' then mode6;
    if paramstr(1)='m7' then mode7;
    if paramstr(1)='m8' then mode8;
    if savedata=false then halt(2);
  end else
  begin
    writeln('Do not run this file manually!');
    halt(1);
  end;
  halt(0);
end.
