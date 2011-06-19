{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010 Pozsar Zsolt <info@pozsarzs.hu>                       | }
{ | ctt-backend.pp                                                           | }
{ | Main form                                                   [RN: CTT/26] | }
{ +--------------------------------------------------------------------------+ }
unit frmmain; 
{$mode objfpc}{$H+}
interface
uses
  Windows, Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ComCtrls;
type
  TInp32 = function(Address: SmallInt): SmallInt; stdcall;
  TOut32 = procedure(Address: SmallInt; Data: SmallInt); stdcall;

  { TForm1 }

  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Inpout32: THandle;
    Inp32: TInp32;
    Out32: TOut32;
  public
  end;
var
  Form1: TForm1; 

implementation

{ TForm1 }

// OnCreate event
procedure TForm1.FormCreate(Sender: TObject);
begin
 Inpout32 := LoadLibrary('inpout32.dll');
 if (Inpout32 <> 0) then
 begin
   Inp32 := TInp32(GetProcAddress(Inpout32, 'Inp32'));
   if (@Inp32 = nil) then Caption := 'Error';
   Out32 := TOut32(GetProcAddress(Inpout32, 'Out32'));
   if (@Out32 = nil) then Caption := 'Error';
  end
  else Caption := 'Error';
end;

// OnDestroy event
procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeLibrary(Inpout32);
end;

initialization
  {$I frmmain.lrs}
end.
