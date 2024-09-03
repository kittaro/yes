unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

    { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  c, alpha, S, a: real;
begin
  c := StrToFloat(Edit1.Text);
  alpha := StrToFloat(Edit2.Text) * Pi / 180;
  a := c * Sin(alpha);
  if tan(alpha) > 0 then
    S := 1/4 * c * c * tan(alpha)
  else
    ShowMessage('Невозможно вычислить площадь с данными значениями');
  Label5.Caption := 'S треугольника: ' + FloatToStr(S);
  Label8.Caption := 'Боковая сторона a: ' + FloatToStr(a);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.clear;
  Edit2.clear;
  Label5.caption := 'S треугольника:  ';
  Label8.Caption := 'Боковая сторона a: ';
end;


procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.
