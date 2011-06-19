{ +--------------------------------------------------------------------------+ }
{ | CTT v0.1 * Transistor tester                                             | }
{ | Copyright (C) 2010-2011 Pozsar Zsolt <info@pozsarzs.hu>                  | }
{ | frmmain.pp                                                               | }
{ | Main form                                                   [RN: CTT/28] | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

{
 Halt codes:
 ~~~~~~~~~~~
    1: missing file
    2: cannot read/write temporary file
}

unit frmmain;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, process, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, Menus, ComCtrls, ExtCtrls, StdCtrls, Spin, ExtDlgs, Grids, Buttons,
  frmabout, frmserial, frmpref, frmdetails, commonproc, dos;
type
  { TForm1 }
  TForm1 = class(TForm)
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    FloatSpinEdit1: TFloatSpinEdit;
    FloatSpinEdit2: TFloatSpinEdit;
    FloatSpinEdit3: TFloatSpinEdit;
    FloatSpinEdit4: TFloatSpinEdit;
    FloatSpinEdit5: TFloatSpinEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Memo2: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Process1: TProcess;
    Process2: TProcess;
    SaveDialog1: TSaveDialog;
    SpinEdit1: TSpinEdit;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure MenuItem38Click(Sender: TObject);
    procedure MenuItem39Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
var
  Form1: TForm1;
  changedprofile: boolean;
  grid, header: boolean;
  i: byte;
  profilefilename: string;
  profilename: string;
  s: string;
  tdir,tname,textn: shortstring;

Resourcestring
  MESSAGE01='Demo';
  MESSAGE02='Full';
  MESSAGE03='Off-line';
  MESSAGE04='On-line';
  MESSAGE05='New version is available. Please visit CTT''s homepage!';
  MESSAGE06='Open original profile';
  MESSAGE07='Save profile as';
  MESSAGE08='Profile files (*.pro)|*.pro|';
  MESSAGE09='File is exist. Replace?';
  MESSAGE10='new profile';
  MESSAGE11='Save recent profile?';
  MESSAGE12='Num';
  MESSAGE13='h21E';
  MESSAGE14='Box';
  MESSAGE15='Compartment of the sorting box';
  MESSAGE16='emitter';
  MESSAGE17='base';
  MESSAGE18='collector';
  MESSAGE19='shield/metal package';
  MESSAGE20='none';
  MESSAGE21='Missing files! Please reinstall CTT!';
  MESSAGE22='There is not newer version!';
  MESSAGE23='(description)';
  MESSAGE24='Open own profile';
  MESSAGE25='Profile load error, creating a new one';
  MESSAGE26='(unknown)';
  MESSAGE27='Invalid or missing hardware key!';
  MESSAGE28='Save result in BMP format';
  MESSAGE29='Save result in TXT format';
  MESSAGE30='Bitmap files (*.bmp)|*.bmp|';
  MESSAGE31='Text files (*.txt)|*.txt|';
  MESSAGE32='Cannot save this file!';
  MESSAGE33='Connect a transistor to tester and press OK!';
  MESSAGE34='Put it to this compartment: #';
  MESSAGE35='Set aside...';
  MESSAGE36='X: ';
  MESSAGE37='Y: ';
  MESSAGE38='resolution: ';
  MESSAGE39='marker: ';
  MESSAGE40='Bipolar transistor input characteristic';
  MESSAGE41='Bipolar transistor output characteristic';

implementation

{ TForm1 }

// -- Events -------------------------------------------------------------------
// on create event
procedure TForm1.FormCreate(Sender: TObject);
var
  searchresult: searchrec;
begin
  makeuserdir;
  getlang;
  getexepath;
  loadcfg;
  grid:=true; ToolButton10.Down:=grid;
  header:=true; ToolButton9.Down:=grid;
  for b:=1 to 206 do mdata[b]:='0';
  // default
  commonproc.g1xdiv:=100;       // x: 100mV/div
  commonproc.g1ydiv:=50;        // y: 50uA/div
  commonproc.g1xpix:=commonproc.g1xdiv/25;
  commonproc.g1ypix:=commonproc.g1ydiv/25;
  commonproc.g2xdiv:=1000;      // x: 1000mV/div
  commonproc.g2ydiv:=100;       // y: 100mA/div
  commonproc.g2xpix:=commonproc.g2xdiv/25;
  commonproc.g2ypix:=commonproc.g2ydiv/25;
  setdisplaycolors;
  if (Application.Params[1]='-o') or (Application.Params[1]='--offline')
  then commonproc.offline:=true;
  if commonproc.offline=true
  then StatusBar1.Panels.Items[1].Text:=' '+MESSAGE03
  else StatusBar1.Panels.Items[1].Text:=' '+MESSAGE04;
  MenuItem6.Enabled:=not offline;
  MenuItem7.Enabled:=not offline;
  MenuItem14.Enabled:=not offline;
  MenuItem20.Enabled:=not offline;
  crk;
  if commonproc.r=false
  then StatusBar1.Panels.Items[0].Text:=' '+MESSAGE01
  else StatusBar1.Panels.Items[0].Text:=' '+MESSAGE02;
  case commonproc.baseaddress of
    '1': StatusBar1.Panels.Items[2].Text:=' 378H';
    '2': StatusBar1.Panels.Items[2].Text:=' 278H';
    '3': StatusBar1.Panels.Items[2].Text:=' 3BCH';
  end;
  if offline=false then
    if searchupdate=true
      then StatusBar1.Panels.Items[3].Text:=' '+MESSAGE05;
  changedprofile:=false;
  profilename:='';
  {$IFDEF LINUX}
  findfirst(exepath+'packages/*.png',anyfile,searchresult);
  {$ENDIF}
  {$IFDEF WIN32}
  findfirst(exepath+'packages\*.png',anyfile,searchresult);
  {$ENDIF}
  b:=0;
  while doserror=0 do
  begin
    with searchresult do
    begin
      s:=name;
      delete(s, length(s)-3,4);
      Combobox2.Items.Add(uppercase(s));
      if b<254 then b:=b+1;
    end;
    findnext(searchresult);
  end;
  if b=0 then
  begin
    showmessage(MESSAGE21);
    halt(1);
  end;
  ComboBox2.Sorted:=true;
  Combobox2.ItemIndex:=0;
  {$IFDEF LINUX}
  Image1.Picture.LoadFromFile(exepath+'packages/'+lowercase(ComboBox2.Items.ValueFromIndex[ComboBox2.ItemIndex]+'.png'));
  {$ENDIF}
  {$IFDEF WIN32}
  Image1.Picture.LoadFromFile(exepath+'packages\'+lowercase(ComboBox2.Items.ValueFromIndex[ComboBox2.ItemIndex]+'.png'));
  {$ENDIF}
  Combobox3.Items.Add(MESSAGE16);
  Combobox3.Items.Add(MESSAGE17);
  Combobox3.Items.Add(MESSAGE18);
  Combobox3.Items.Add(MESSAGE19);
  Combobox3.Items.Add(MESSAGE20);
  Combobox3.ItemIndex:=0;
  Combobox4.Items.Add(MESSAGE16);
  Combobox4.Items.Add(MESSAGE17);
  Combobox4.Items.Add(MESSAGE18);
  Combobox4.Items.Add(MESSAGE19);
  Combobox4.Items.Add(MESSAGE20);
  Combobox4.ItemIndex:=1;
  Combobox5.Items.Add(MESSAGE16);
  Combobox5.Items.Add(MESSAGE17);
  Combobox5.Items.Add(MESSAGE18);
  Combobox5.Items.Add(MESSAGE19);
  Combobox5.Items.Add(MESSAGE20);
  Combobox5.ItemIndex:=2;
  Combobox6.Items.Add(MESSAGE16);
  Combobox6.Items.Add(MESSAGE17);
  Combobox6.Items.Add(MESSAGE18);
  Combobox6.Items.Add(MESSAGE19);
  Combobox6.Items.Add(MESSAGE20);
  Combobox6.ItemIndex:=4;
  Combobox7.Items.Add(MESSAGE16);
  Combobox7.Items.Add(MESSAGE17);
  Combobox7.Items.Add(MESSAGE18);
  Combobox7.Items.Add(MESSAGE19);
  Combobox7.Items.Add(MESSAGE20);
  Combobox7.ItemIndex:=4;
  Combobox8.Items.Add(MESSAGE16);
  Combobox8.Items.Add(MESSAGE17);
  Combobox8.Items.Add(MESSAGE18);
  Combobox8.Items.Add(MESSAGE19);
  Combobox8.Items.Add(MESSAGE20);
  Combobox8.ItemIndex:=4;
  Combobox9.Items.Add(MESSAGE16);
  Combobox9.Items.Add(MESSAGE17);
  Combobox9.Items.Add(MESSAGE18);
  Combobox9.Items.Add(MESSAGE19);
  Combobox9.Items.Add(MESSAGE20);
  Combobox9.ItemIndex:=4;
  StringGrid1.Cells[0,0]:=MESSAGE12;
  StringGrid1.Cells[1,0]:=MESSAGE13;
  StringGrid1.Cells[2,0]:=MESSAGE15;
  Screen.Cursors[1] := LoadCursorFromLazarusResource('haircross');
  randomize;
end;

// on close query event;
procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if changedprofile=true then
  begin
    if MessageDlg(MESSAGE11,mtConfirmation, [mbYes, mbNo],0)=mrYes then
    begin
      if profilename='' then
      begin
        SaveDialog1.InitialDir:=userdir;
        SaveDialog1.Title:=MESSAGE07;
        SaveDialog1.Filename:=Edit2.Text+'.pro';
        SaveDialog1.Filter:=MESSAGE08;
        SaveDialog1.FilterIndex:=0;
        if SaveDialog1.Execute=false then exit;
        profilefilename:= SaveDialog1.FileName;
        i:=length(profilefilename);
        if profilefilename[i-3]+profilefilename[i-2]+profilefilename[i-1]+profilefilename[i]<>'.pro' then profilefilename:=profilefilename+'.pro';
        fsplit(profilefilename,tdir,tname,textn);
        if FSearch(tname+textn,tdir)<>'' then
        if MessageDlg(MESSAGE09,mtConfirmation, [mbYes, mbNo],0)=mrNo then exit;
        if length(profilefilename)=0 then exit;
        if saveprofile(profilefilename)=false then exit;
      end else if saveprofile(profilefilename)=false then exit;
    end;
  end;
  canclose:=true;
end;

// on change events
procedure TForm1.Edit2Change(Sender: TObject);
begin
  if changedprofile=false then Form1.Caption:=Form1.Caption+' *';
  changedprofile:=true;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  {$IFDEF LINUX}
  Image1.Picture.LoadFromFile(exepath+'packages/'+lowercase(ComboBox2.Items.ValueFromIndex[ComboBox2.ItemIndex]+'.png'));
  {$ENDIF}
  {$IFDEF WIN32}
  Image1.Picture.LoadFromFile(exepath+'packages\'+lowercase(ComboBox2.Items.ValueFromIndex[ComboBox2.ItemIndex]+'.png'));
  {$ENDIF}
  if changedprofile=false then Form1.Caption:=Form1.Caption+' *';
  changedprofile:=true;
end;

// PageControl onshow event
procedure TForm1.TabSheet1Show(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex=1) or
     (PageControl1.ActivePageIndex=2) then
  begin
    MenuItem29.Enabled:=true;
    ToolButton5.Enabled:=true;
    ToolButton6.Enabled:=true;
  end else
  begin
    MenuItem29.Enabled:=false;
    ToolButton5.Enabled:=false;
    ToolButton6.Enabled:=false
  end;
end;

// -- Operation modes ----------------------------------------------------------
// -- M1 --
// start measure
procedure TForm1.Button2Click(Sender: TObject);
begin
  if measure(1)=false then showmessage(MESSAGE27) else writetodisplay;
end;

// clear display
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  cleardisplay(1);
end;

// -- M2 --
// start measure
procedure TForm1.Button3Click(Sender: TObject);
begin
  if measure(2)=false then showmessage(MESSAGE27) else writetodisplay;
end;

// clear display
procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  cleardisplay(2);
end;

// -- M3 --
// start measure
procedure TForm1.Button4Click(Sender: TObject);
begin
  if measure(3)=false then showmessage(MESSAGE27) else writetodisplay;
end;

// clear display
procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  cleardisplay(3);
end;

// -- M4 --
// start measure
procedure TForm1.Button5Click(Sender: TObject);
begin
  if measure(4)=false then showmessage(MESSAGE27) else writetodisplay;
end;

// clear display
procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  cleardisplay(4);
end;

// -- M5 --
// start measure
procedure TForm1.Button6Click(Sender: TObject);
begin
  if measure(5)=false then showmessage(MESSAGE27) else writetodisplay;
end;

// clear display
procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  cleardisplay(5);
end;

// -- M6 --
// start measure
procedure TForm1.Button1Click(Sender: TObject);
begin
  // uce ellenőrzés
  if measure(6)=false then showmessage(MESSAGE27) else writetodisplay;
  Memo1.Lines.Add(MESSAGE40+' ['+Form1.Edit2.Text+']');
  b:=7;
  repeat
    Memo1.Lines.Add(' '+mdata[b]+' mV'+#9+mdata[b+1]+' uA');
    b:=b+2
  until b=45;
  Memo1.Lines.Add('');
end;

// input diagram cursor
procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (x>=8) and (y>=29) and (x<=508) and (y<=379)
  then Image2.Cursor:=1 else Image2.Cursor:=crDefault;
end;

// input diagram marker position
procedure TForm1.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with Image2 do
  begin
    Canvas.Font.Size:=8;
    Canvas.Brush.Color:= bg;
    Canvas.Font.Color:=fg;
    Canvas.FillRect(200,2,Width,28);
    if (x>=8) and (y>=29) and (x<=508) and (y<=379) then
    begin
      if header=true then
      begin
        Canvas.TextOut(200,2, MESSAGE39+floattostr((x-8)*g1xpix)+' mV');
        Canvas.TextOut(200,14, MESSAGE39+floattostr((y-379)*(-1)*g1ypix)+' uA');
      end;
    end else
    begin
     if header=true then
     begin
       Canvas.TextOut(200,2, MESSAGE39+'- mV');
       Canvas.TextOut(200,14, MESSAGE39+'- uA');
     end;
    end;
  end;
end;

// details button
procedure TForm1.Button8Click(Sender: TObject);
begin
  if Form5.Showing=false then
  begin
    Form5.Height:=Form1.Height;
    Form5.Left:=Form1.Left+Form1.Width+15;
    Form5.Top:=Form1.Top;
    Form5.Show;
  end else Form5.Close;
end;

// clear display
procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  cleardisplay(6);
  Memo1.Clear;
end;

// -- M7 --
procedure TForm1.Button10Click(Sender: TObject);
begin
//ib ellenőrzés
  if measure(7)=false then showmessage(MESSAGE27) else writetodisplay;
  Memo2.Lines.Add(MESSAGE41+' ['+Edit2.Text+']');
  b:=47;
  repeat
    Memo2.Lines.Add(' '+mdata[b]+' mV'+#9+mdata[b+1]+' mA'+#9+
                    '| '+mdata[b+40]+' mV'+#9+mdata[b+41]+' mA'+#9+
                    '| '+mdata[b+80]+' mV'+#9+mdata[b+81]+' mA'+#9+
                    '| '+mdata[b+120]+' mV'+#9+mdata[b+121]+' mA');
    b:=b+2
  until b=85;
  Memo2.Lines.Add('');
end;

// output diagram cursor
procedure TForm1.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (x>=8) and (y>=29) and (x<=508) and (y<=379)
  then Image3.Cursor:=1 else Image3.Cursor:=crDefault;
end;

// output diagram marker position
procedure TForm1.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with Image3 do
  begin
    Canvas.Font.Size:=8;
    Canvas.Brush.Color:= bg;
    Canvas.Font.Color:=fg;
    Canvas.FillRect(200,2,Width,28);
    if (x>=8) and (y>=29) and (x<=508) and (y<=379) then
    begin
      if header=true then
      begin
        Canvas.TextOut(200,2, MESSAGE39+floattostr((x-8)*g1xpix)+' mV');
        Canvas.TextOut(200,14, MESSAGE39+floattostr((y-379)*(-1)*g1ypix)+' uA');
      end;
    end else
    begin
     if header=true then
     begin
       Canvas.TextOut(200,2, MESSAGE39+'- mV');
       Canvas.TextOut(200,14, MESSAGE39+'- uA');
     end;
    end;
  end;
end;

// clear display
procedure TForm1.BitBtn7Click(Sender: TObject);
begin
  cleardisplay(7);
  Memo2.Clear;
end;

// -- M8 --
// start sorting
procedure TForm1.Button7Click(Sender: TObject);
var
  box: array[1..20] of byte;
  boxindex: byte;
  count: integer;
  inputdata: byte;
  minvalue, maxvalue: single;
  br: boolean;
  put: boolean;
begin
  StringGrid1.RowCount:=1;
  for count:=1 to 20 do box[count]:=0;
  boxindex:=0;
  SpinEdit1.Enabled:=false;
  Button7.Enabled:=false;
  Button11.Enabled:=false;
  br:=false;
  count:=1;
  repeat
    if (MessageDlg(MESSAGE33,mtConfirmation, [mbOk, mbCancel],0)=mrOk)
      or (count=65534) then
    begin
      if measure(8)=false then
      begin
        showmessage(MESSAGE27);
        br:=true;
      end else
      begin
        StringGrid1.RowCount:=StringGrid1.RowCount+1;
        StringGrid1.Cells[0,count]:=inttostr(count);
        StringGrid1.Cells[1,count]:=commonproc.mdata[6];
        inputdata:=strtoint(mdata[6]);
        minvalue:=inputdata-inputdata*Spinedit1.Value/100;
        maxvalue:=inputdata+inputdata*Spinedit1.Value/100;
        put:=false;
        for b:=1 to 20 do
          if (box[b]<=maxvalue) and (box[b]>=minvalue) then
          begin
            put:=true;
            StringGrid1.Cells[2,count]:=MESSAGE34+inttostr(b);
            break;
          end;
        if put=false then
        begin
          if boxindex<20 then
          begin
            boxindex:=boxindex+1;
            box[boxindex]:=inputdata;
            StringGrid1.Cells[2,count]:=MESSAGE34+inttostr(boxindex);
          end else StringGrid1.Cells[2,count]:=MESSAGE35;
        end;
        StringGrid1.Row:=StringGrid1.RowCount-1;
      end;
    end else br:=true;
    count:=count+1;
  until br=true;
  Button11.Enabled:=true;
  Button7.Enabled:=true;
  SpinEdit1.Enabled:=true;
end;

// clear button
procedure TForm1.Button11Click(Sender: TObject);
begin
  StringGrid1.RowCount:=1;
end;

// -- File menu ----------------------------------------------------------------
// new profile
procedure TForm1.MenuItem18Click(Sender: TObject);
var
  mr: longint;
begin
  if changedprofile=true then
  begin
    mr:=MessageDlg(MESSAGE11,mtConfirmation, [mbYes, mbNo, mbCancel],0);
    if mr=2 then exit;
    if mr=6 then
    begin
      if profilename='' then
      begin
        SaveDialog1.InitialDir:=userdir;
        SaveDialog1.Title:=MESSAGE07;
        SaveDialog1.Filename:=Edit2.Text+'.pro';
        SaveDialog1.Filter:=MESSAGE08;
        SaveDialog1.FilterIndex:=0;
        if SaveDialog1.Execute=false then exit;
        profilefilename:= SaveDialog1.FileName;
        i:=length(profilefilename);
        if profilefilename[i-3]+profilefilename[i-2]+profilefilename[i-1]+profilefilename[i]<>'.pro' then profilefilename:=profilefilename+'.pro';
        fsplit(profilefilename,tdir,tname,textn);
        if FSearch(tname+textn,tdir)<>'' then
        if MessageDlg(MESSAGE09,mtConfirmation, [mbYes, mbNo],0)=mrNo then exit;
        if length(profilefilename)=0 then exit;
        if saveprofile(profilefilename)=false then exit;
      end else if saveprofile(profilefilename)=false then exit;
    end;
  end;
  Edit2.Caption:=MESSAGE10;
  FloatSpinEdit1.Value:=0;
  FloatSpinEdit2.Value:=0;
  FloatSpinEdit3.Value:=0;
  FloatSpinEdit4.Value:=0;
  FloatSpinEdit5.Value:=0;
  ComboBox1.ItemIndex:=0;
  Edit1.Caption:=MESSAGE23;
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Sender);
  ComboBox3.ItemIndex:=0;
  ComboBox4.ItemIndex:=1;
  ComboBox5.ItemIndex:=2;
  ComboBox6.ItemIndex:=4;
  ComboBox7.ItemIndex:=4;
  ComboBox8.ItemIndex:=4;
  ComboBox9.ItemIndex:=4;
  cleardisplay(99);
  Form1.Caption:='CTT - '+MESSAGE10;
  changedprofile:=false;
  profilename:='';
  profilefilename:='';
end;

// open profile
procedure SelectFile;
var
  mr: longint;
begin
  if changedprofile=true then
  begin
    mr:=MessageDlg(MESSAGE11,mtConfirmation, [mbYes, mbNo, mbCancel],0);
    if mr=2 then exit;
    if mr=6 then
    begin
      if profilename='' then
      begin
        Form1.SaveDialog1.InitialDir:=userdir;
        Form1.SaveDialog1.Title:=MESSAGE07;
        Form1.SaveDialog1.Filename:=Form1.Edit2.Text+'.pro';
        Form1.SaveDialog1.Filter:=MESSAGE08;
        Form1.SaveDialog1.FilterIndex:=0;
        if Form1.SaveDialog1.Execute=false then exit;
        profilefilename:= Form1.SaveDialog1.FileName;
        i:=length(profilefilename);
        if profilefilename[i-3]+profilefilename[i-2]+profilefilename[i-1]+profilefilename[i]<>'.pro' then profilefilename:=profilefilename+'.pro';
        fsplit(profilefilename,tdir,tname,textn);
        if FSearch(tname+textn,tdir)<>'' then
        if MessageDlg(MESSAGE09,mtConfirmation, [mbYes, mbNo],0)=mrNo then exit;
        if length(profilefilename)=0 then exit;
        if saveprofile(profilefilename)=false then exit;
      end else if saveprofile(profilefilename)=false then exit;
    end;
  end;
  Form1.OpenDialog1.Filter:=MESSAGE08;
  Form1.OpenDialog1.FilterIndex:=0;
  if Form1.OpenDialog1.Execute=false then exit;
  profilefilename:= Form1.OpenDialog1.FileName;
  if loadprofile(profilefilename)=false then
  begin
    showmessage(MESSAGE25);
    exit;
  end;
  Form1.Panel1.Caption:='0 ';
  Form1.Panel2.Caption:='0 ';
  Form1.Panel3.Caption:='0 ';
  Form1.Panel4.Caption:='0 ';
  Form1.Panel5.Caption:='0 ';
  cleardisplay(6);
  cleardisplay(7);
  Form1.Caption:='CTT - '+profilename;
end;

// open original profile
procedure TForm1.MenuItem21Click(Sender: TObject);
begin
  OpenDialog1.InitialDir:=exepath+'profiles';
  OpenDialog1.Title:=MESSAGE06;
  SelectFile;
  ComboBox2Change(Sender);
  changedprofile:=false;
end;

// open my profile
procedure TForm1.MenuItem27Click(Sender: TObject);
begin
  OpenDialog1.InitialDir:=userdir;
  OpenDialog1.Title:=MESSAGE24;
  SelectFile;
  ComboBox2Change(Sender);
  changedprofile:=false;
end;

// save profile
procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  if profilename='' then
  begin
    SaveDialog1.InitialDir:=userdir;
    SaveDialog1.Title:=MESSAGE07;
    SaveDialog1.Filename:=Edit2.Text+'.pro';
    SaveDialog1.Filter:=MESSAGE08;
    SaveDialog1.FilterIndex:=0;
    if SaveDialog1.Execute=false then exit;
    profilefilename:= SaveDialog1.FileName;
    i:=length(profilefilename);
    if profilefilename[i-3]+profilefilename[i-2]+profilefilename[i-1]+profilefilename[i]<>'.pro' then profilefilename:=profilefilename+'.pro';
    fsplit(profilefilename,tdir,tname,textn);
    if FSearch(tname+textn,tdir)<>'' then
      if MessageDlg(MESSAGE09,mtConfirmation, [mbYes, mbNo],0)=mrNo then exit;
    if length(profilefilename)=0 then exit;
  end;
  if saveprofile(profilefilename)=true then
  begin
    changedprofile:=false;
    Form1.Caption:='CTT - '+profilename;
  end;
end;

// save profile as
procedure TForm1.MenuItem28Click(Sender: TObject);
begin
  SaveDialog1.InitialDir:=userdir;
  SaveDialog1.Title:=MESSAGE07;
  SaveDialog1.Filename:=Edit2.Text+'.pro';
  SaveDialog1.Filter:=MESSAGE08;
  SaveDialog1.FilterIndex:=0;
  if SaveDialog1.Execute=false then exit;
  profilefilename:= SaveDialog1.FileName;
  i:=length(profilefilename);
  if profilefilename[i-3]+profilefilename[i-2]+profilefilename[i-1]+profilefilename[i]<>'.pro' then profilefilename:=profilefilename+'.pro';
  fsplit(profilefilename,tdir,tname,textn);
  if FSearch(tname+textn,tdir)<>'' then
    if MessageDlg(MESSAGE09,mtConfirmation, [mbYes, mbNo],0)=mrNo then exit;
  if length(profilefilename)=0 then exit;
  if saveprofile(profilefilename)=true then
  begin
    changedprofile:=false;
    Form1.Caption:='CTT - '+profilename;
  end;
end;

// save result as BMP
procedure TForm1.MenuItem30Click(Sender: TObject);
var
  filename: string;
begin
  {$IFDEF LINUX}
  SaveDialog1.InitialDir:=userdir+'..';
  {$ENDIF}
  {$IFDEF WIN32}
  SaveDialog1.InitialDir:=userdir+'..\..';
  {$ENDIF}
  SaveDialog1.Title:=MESSAGE28;
  SaveDialog1.Filename:=Edit2.Text+'.bmp';
  SaveDialog1.Filter:=MESSAGE30;
  SaveDialog1.FilterIndex:=0;
  if SaveDialog1.Execute=false then exit;
  filename:=SaveDialog1.Filename;
  i:=length(filename);
  if filename[i-3]+filename[i-2]+filename[i-1]+filename[i]<>'.bmp' then filename:=filename+'.bmp';
  fsplit(filename,tdir,tname,textn);
  if FSearch(tname+textn,tdir)<>'' then
  if MessageDlg(MESSAGE09,mtConfirmation, [mbYes, mbNo],0)=mrNo then exit;
  if length(filename)=0 then exit;
  try
    if PageControl1.ActivePageIndex=1 then Image2.Picture.SaveToFile(filename);
    if PageControl1.ActivePageIndex=2 then Image3.Picture.SaveToFile(filename);
  except
    showmessage(MESSAGE32);
  end;
end;

// save result as text
procedure TForm1.MenuItem31Click(Sender: TObject);
var
  filename: string;
begin
  {$IFDEF LINUX}
  SaveDialog1.InitialDir:=userdir+'..';
  {$ENDIF}
  {$IFDEF WIN32}
  SaveDialog1.InitialDir:=userdir+'..\..';
  {$ENDIF}
  SaveDialog1.Title:=MESSAGE29;
  SaveDialog1.Filename:=Edit2.Text+'.txt';
  SaveDialog1.Filter:=MESSAGE31;
  SaveDialog1.FilterIndex:=0;
  if SaveDialog1.Execute=false then exit;
  filename:=SaveDialog1.Filename;
  i:=length(filename);
  if filename[i-3]+filename[i-2]+filename[i-1]+filename[i]<>'.txt' then filename:=filename+'.txt';
  fsplit(filename,tdir,tname,textn);
  if FSearch(tname+textn,tdir)<>'' then
  if MessageDlg(MESSAGE09,mtConfirmation, [mbYes, mbNo],0)=mrNo then exit;
  if length(filename)=0 then exit;
  try
    if PageControl1.ActivePageIndex=1 then Memo1.Lines.SaveToFile(filename);
    if PageControl1.ActivePageIndex=2 then Memo2.Lines.SaveToFile(filename);
  except
    showmessage(MESSAGE32);
  end;
end;

// search update
procedure TForm1.MenuItem20Click(Sender: TObject);
begin
  if searchupdate=true then
  begin
    showmessage(MESSAGE05);
    StatusBar1.Panels.Items[3].Text:=' '+MESSAGE05;
  end else showmessage(MESSAGE22);
end;

// quit
procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

//-- View menu -----------------------------------------------------------------
// Toggle grid
procedure TForm1.MenuItem38Click(Sender: TObject);
begin
  grid:=not grid;
  ToolButton10.Down:=grid;
  cleardisplay(99);
  writetodisplay;
end;

// Toggle header
procedure TForm1.MenuItem39Click(Sender: TObject);
begin
  header:=not header;
  ToolButton9.Down:=header;
  cleardisplay(99);
  writetodisplay;
end;

// Refresh display
procedure TForm1.MenuItem43Click(Sender: TObject);
begin
  writetodisplay;
end;

// clear all display
procedure TForm1.MenuItem44Click(Sender: TObject);
begin
  cleardisplay(99);
end;

// -- Operation menu -----------------------------------------------------------
// view 1st page
procedure TForm1.MenuItem22Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
end;

// view 2nd page
procedure TForm1.MenuItem23Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=1;
end;

// view 3rd page
procedure TForm1.MenuItem40Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=2;
end;

// view 4th page
procedure TForm1.MenuItem24Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=3;
end;

// Preferences
procedure TForm1.MenuItem26Click(Sender: TObject);
begin
  Form4.ShowModal;
  if commonproc.offline=true
  then StatusBar1.Panels.Items[1].Text:=' '+MESSAGE03
  else StatusBar1.Panels.Items[1].Text:=' '+MESSAGE04;
  MenuItem6.Enabled:=not offline;
  MenuItem7.Enabled:=not offline;
  MenuItem14.Enabled:=not offline;
  MenuItem20.Enabled:=not offline;
  case commonproc.baseaddress of
    '1': StatusBar1.Panels.Items[2].Text:=' 378H';
    '2': StatusBar1.Panels.Items[2].Text:=' 278H';
    '3': StatusBar1.Panels.Items[2].Text:=' 3BCH';
  end;
end;

// -- Help menu ----------------------------------------------------------------
// Software help
procedure TForm1.MenuItem10Click(Sender: TObject);
begin
{$IFDEF LINUX}
  runbrowser(exepath+'help/'+lang+'/index.html');
{$ENDIF}
{$IFDEF WIN32}
  runbrowser(exepath+'help\'+lang+'\index.html');
{$ENDIF}
end;

// Hardware help
procedure TForm1.MenuItem11Click(Sender: TObject);
begin
{$IFDEF LINUX}
  runbrowser(exepath+'help/'+lang+'/index.html');
{$ENDIF}
{$IFDEF WIN32}
  runbrowser(exepath+'help\'+lang+'\index.html');
{$ENDIF}
end;

// Set serial number
procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Form3.ShowModal;
  if commonproc.r=false
  then StatusBar1.Panels.Items[0].Text:=' '+MESSAGE01
  else StatusBar1.Panels.Items[0].Text:=' '+MESSAGE02;
  savecfg;
end;

// On-line registration
procedure TForm1.MenuItem6Click(Sender: TObject);
begin
{$IFDEF LINUX}
  runbrowser(exepath+'help/'+lang+'/index.html');
{$ENDIF}
{$IFDEF WIN32}
  runbrowser(exepath+'help\'+lang+'\index.html');
{$ENDIF}
end;

// See homepage
procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  runbrowser(commonproc.HOMEPAGE);
end;

// Send bugreport
procedure TForm1.MenuItem7Click(Sender: TObject);
begin
{$IFDEF LINUX}
  runbrowser(exepath+'help/'+lang+'/index.html');
{$ENDIF}
{$IFDEF WIN32}
  runbrowser(exepath+'help\'+lang+'\index.html');
{$ENDIF}
end;

// About
procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

initialization
  {$I frmmain.lrs}
  {$I haircross.lrs}
end.
