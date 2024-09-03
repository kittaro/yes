unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type
  { TForm1 }
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private

  public

  end;

var Form1: TForm1; k1, k2: integer; t: int64;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  k1 := StrToInt(Edit1.Text);
  k2 := StrToInt(Edit2.Text);
  t := k1;
  while k2 > 1 do
  begin
    t := t * k1;
    k2 := k2 - 1;
  end;
  Memo1.Lines.Add('Число ' + Edit1.Text + ' в степени ' + Edit2.Text + ' равно: ' + FloatToStr(t));
end;

end.
