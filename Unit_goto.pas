unit Unit_goto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin;

type
  TForm_goto = class(TForm)
    SpinEdit: TSpinEdit;
    BitBtn: TBitBtn;
    procedure SpinEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_goto: TForm_goto;

implementation

{$R *.dfm}


procedure TForm_goto.SpinEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 begin
  if Key=13 then
   begin
    BitBtnClick(Form_goto);
   end;
 end;

procedure TForm_goto.BitBtnClick(Sender: TObject);
 begin
  ModalResult:=mrOk;
 end;

procedure TForm_goto.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(Key)=27 then ModalResult:=mrNo;
end;

procedure TForm_goto.FormActivate(Sender: TObject);
 begin
  SpinEdit.SelectAll;
  if SpinEdit.CanFocus then SpinEdit.SetFocus;
 end;

end.
