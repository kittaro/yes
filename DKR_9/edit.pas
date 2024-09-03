unit Edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfEdit }

    TfEdit = class(TForm)
    bCancel: TBitBtn;
    bSave: TBitBtn;
    CBSmotr: TComboBox;
    CBNote: TComboBox;
    eAuthor: TEdit;
    eYear: TEdit;
    Regh: TEdit;
    eName: TEdit;
    Lname: TLabel;
    Author: TLabel;
    Bass: TLabel;
    Year: TLabel;
    Disk: TLabel;
    Fyletypee: TLabel;
    procedure bSaveClick(Sender: TObject);
    procedure eDlitChange(Sender: TObject);
    procedure eYearChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AuthorClick(Sender: TObject);
    procedure LnameClick(Sender: TObject);
    procedure ReghChange(Sender: TObject);
    procedure eYearKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  fEdit: TfEdit;

implementation

{$R *.lfm}

{ TfEdit }

procedure TfEdit.bSaveClick(Sender: TObject);
begin

end;

procedure TfEdit.eDlitChange(Sender: TObject);
begin

end;

procedure TfEdit.eYearChange(Sender: TObject);
begin

end;

procedure TfEdit.FormShow(Sender: TObject);
begin
  eName.SetFocus;
end;

procedure TfEdit.AuthorClick(Sender: TObject);
begin

end;

procedure TfEdit.LnameClick(Sender: TObject);
begin

end;

procedure TfEdit.ReghChange(Sender: TObject);
begin

end;

procedure TfEdit.eYearKeyPress(Sender: TObject; var Key:char);
begin
     if not (Key in ['0'..'9', #8]) then Key := #0;
end;


end.

