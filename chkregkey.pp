{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010-2011 Pozsar Zsolt <info@pozsarzs.hu>                  | }
{ | keycheck.pp                                                              | }
{ | Registration key checker                                    [RN: CTT/28] | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit chkregkey;
interface
var
  c1: integer;
const
  c2 = 21345;
  c3 = 87236;
  appID = '99';

function checkregkey(filename, serial: string): string;

implementation

// decrypt registration data
function decrypt (const s: string; key: Word): string;
var
  i: byte;
begin
  decrypt:=s;
  for i:=1 to length(s) do
  begin
    decrypt[i]:=char(byte(s[i]) xor (key shr 8));
    key:=(byte(s[i])+key)*c2+c3;
  end
end;

// check registration key
function checkregkey(filename, serial: string): string;
var
  key, ss: string;
  t: file of char;
  c: char;
  ii, e: integer;
  b: byte;
begin
  if length(serial)<>20 then
  begin
    checkregkey:='!';
    exit;
  end;
  assign(t,filename);
  {$I-}
  reset(t);
  key:='';
  repeat
    read(t,c);
    key:=key+c;
  until eof(t);
  {$I+}
  if ioresult<>0 then
  begin
    checkregkey:='!';
    exit;
  end;
  close(t);
  ss:=serial[16]+serial[17]+serial[18]+serial[19]+serial[20];
  val(ss,c1,e);
  if e<>0 then
  begin
    checkregkey:='!';
    exit;
  end;
  key:=decrypt(key,c1);
  if key[56]+key[57]=appID then
  begin
    ss:=key[67]+key[68];
    val(ss,ii,e);
    if e<>0 then
    begin
      checkregkey:='!';
      exit;
    end;
    checkregkey:='';
    for b:=4 to 3+ii do
      checkregkey:=checkregkey+key[b];
  end else checkregkey:='!';
end;

end.
