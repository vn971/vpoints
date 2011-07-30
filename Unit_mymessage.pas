unit Unit_mymessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm_MyMessage = class(TForm)
    Button_ok: TButton;
    Memo: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    general_string:string;
  end;

var
  Form_MyMessage: TForm_MyMessage;

implementation

uses Unit_main,math, Types;

{$R *.dfm}

procedure TForm_MyMessage.FormActivate(Sender: TObject);
 var i,memo_height,other_height,other_width,memo_width:integer;
 begin
  ClientWidth:=600;
  Memo.Text:=general_string;
  memo_height:=Memo.Lines.Count*(abs(Canvas.TextHeight('|')));
  memo_height:=min(memo_height,600);
  memo_width:=100;
  for i:=0 to Memo.Lines.Count-1 do
    memo_width:=max(memo_width,Canvas.TextWidth(Memo.Lines[i])+100);

  other_height:=ClientHeight-Memo.Height;
  other_width:=ClientWidth-Memo.Width;
  ClientHeight:=memo_height+other_height;
  ClientWidth:=memo_width+other_width;
  Self.Top:=(Monitor.WorkareaRect.Bottom-Monitor.WorkareaRect.Top
      -ClientHeight)div 2;
  Self.Left:=(Monitor.WorkareaRect.Right-Monitor.WorkareaRect.Left
      -ClientWidth)div 2;

  Button_ok.Left:=((ClientWidth-Button_ok.Width) div 2);
  Button_ok.SetFocus;
 end;

procedure TForm_MyMessage.MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 begin
  if Key=13 then ModalResult:=mrOk;
 end;

end.
