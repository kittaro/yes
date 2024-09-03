unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

    { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
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
  a, b, t, f: real;
begin
  a := strtofloat(Edit1.Text);
  b := strtofloat(Edit2.Text);
  t := strtofloat(Edit3.Text);

  f := Exp(-b*t) * Sin(a*t + b) - Sqrt(Abs(b*t + a));

  Label5.Caption := 'Ответ: '+floattostr(f);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.clear;
  Edit2.clear;
  Edit3.clear;
  Label5.caption:= 'Ответ: ';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.
