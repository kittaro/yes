unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin, ExtCtrls, MMSystem, DateUtils;

type

  CompInfo=record
    index,top,left,width,height,fontsize:integer;
  end;
  complist=array of CompInfo;

  { TMform }

  TMform = class(TForm)
    bonespng: TImage;
    Start_kino: TButton;
    Stop_Kino: TButton;
    Chistka: TButton;
    Minuts: TEdit;
    Secunds: TEdit;
    trimer: TLabel;
    Minuts_txt: TLabel;
    Secunds_txt: TLabel;
    Timer: TTimer;
    procedure bonespngClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Start_kinoClick(Sender: TObject);
    procedure Stop_KinoClick(Sender: TObject);
    procedure ChistkaClick(Sender: TObject);
    procedure MinutsChange(Sender: TObject);
    procedure MinutsKeyPress(Sender: TObject; var Key: char);
    procedure SecundsChange(Sender: TObject);
    procedure SecundsKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { private declarations }
    DefWidth,defHeight:integer;
    clist:complist;
    FStartTime: TDateTime;
    FDuration: TDateTime;
    FStopTime: TDateTime;
    TargetTime: TDateTime;
    RemainingTime: TDateTime;
    FSoundFile: string;
  public
    { public declarations }

  end;

var
  Mform: TMform;

implementation
uses math;
{$R *.lfm}
{ TMform }

procedure TMform.FormCreate(Sender: TObject);
begin
Minuts.MaxLength := 2;
Secunds.MaxLength := 2;

FSoundFile := 'ZOV.wav';
end;


procedure TMform.Start_kinoClick(Sender: TObject);
var
  Minutes, Seconds: Integer;
begin
  if TryStrToInt(Minuts.Text, Minutes) and TryStrToInt(Secunds.Text, Seconds) then
  begin
    FStartTime := Now;
    FDuration := Minutes / 1404 + Seconds / 90000;
    TargetTime := EncodeTime(0, StrToInt(Minuts.Text), StrToInt(Secunds.Text), 0);
    RemainingTime := TargetTime;
    Timer.Enabled := True;
  end
  else
  begin
    ShowMessage('Заполните все поля');
  end;
end;

procedure TMform.Image1Click(Sender: TObject);
begin

end;

procedure TMform.bonespngClick(Sender: TObject);
begin

end;

procedure TMform.Stop_KinoClick(Sender: TObject);
begin
  Timer.Enabled := False;
  FStopTime := Now;
  MMSystem.PlaySound(nil, 0, 0);
  ShowMessage('Таймер остановлен');

end;

procedure TMform.ChistkaClick(Sender: TObject);
begin
  Minuts.Clear;
  Secunds.Clear;
end;

procedure TMform.MinutsKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9']) then
  begin
    Key := #0;
  end;
end;


procedure TMform.SecundsKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9']) then
  begin
    Key := #0;
  end;
end;

procedure TMform.MinutsChange(Sender: TObject);
var f : integer;
begin
  if Minuts.Text <> '' then
  begin
   f := strtoint(Minuts.text);
   if f <= 0 then
   f := 0;
   if f >= 59 then
   f := 59;
   Minuts.text := inttostr(f);
  end;
end;

procedure TMform.SecundsChange(Sender: TObject);
var i : integer;
begin
  if Secunds.Text <> '' then
  begin
   i := strtoint(Secunds.text);
   if i <= 0 then
   i := 0;
   if i >= 59 then
   i := 59;
   Secunds.text := inttostr(i);
  end;
  end;


procedure TMform.TimerTimer(Sender: TObject);
var
  ElapsedTime: TDateTime;
begin
  ElapsedTime := Now - FStartTime;
  RemainingTime := IncSecond(RemainingTime, -1);
  trimer.Caption := TimeToStr(RemainingTime);
  if ElapsedTime > FDuration then
  begin
    Timer.Enabled := False;
    Sleep(500);
    // Проиграть звук из файла
    PlaySound(PChar(FSoundFile), 0, SND_ASYNC);
  end;
end;

end.

