unit Unit_vkontakte;
(*
Программа бесплатная, лицензия GNU GPL.

Vpoints - program for points game analization
Copyright (C) 2010  Vasya Novikov

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, version 2 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

Мои контакты - http://n1-site.narod.ru/contacts/index.html
*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ClipBrd, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TForm_vkontakte = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Memo3: TMemo;
    PageControl_osnovn: TPageControl;
    TabSheet_short: TTabSheet;
    TabSheet_long: TTabSheet;
    TabSheet_what_is_clipboard: TTabSheet;
    Memo_kod: TMemo;
    Label_ClipB_snizu: TLabel;
    Timer_vkontakte: TTimer;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Timer_vkontakteTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    general_string:string;
    needs_load:boolean;
  end;

var
  Form_vkontakte: TForm_vkontakte;

implementation

{$R *.dfm}

function get_clipboard:WideString;
 var
  data:THandle;
 begin
  if not IsClipboardFormatAvailable(CF_UNICODETEXT) then
    Result := Clipboard.AsText
   else
   begin
    Clipboard.Open;
    Data := GetClipboardData(CF_UNICODETEXT);
    try
      if Data <> 0 then
        Result := PWideChar(GlobalLock(Data))
      else
        Result := '';
    finally
      if Data <> 0 then
        GlobalUnlock(Data);
      Clipboard.Close;
    end;
   end;
 end;

procedure LoadVkontakteGame;
 begin
  with Form_vkontakte do
   begin
    needs_load:=true;
    general_string:=get_clipboard;
    Form_vkontakte.Close;
   end;
 end;

procedure TForm_vkontakte.Button1Click(Sender: TObject);
begin
 LoadVkontakteGame;
end;

procedure TForm_vkontakte.Timer_vkontakteTimer(Sender: TObject);
begin
Memo_kod.Text:=get_clipboard;
end;

procedure TForm_vkontakte.FormPaint(Sender: TObject);
begin
Memo_kod.Text:=get_clipboard;
end;

procedure TForm_vkontakte.FormShow(Sender: TObject);
begin
Timer_vkontakte.Enabled:=true;
end;

procedure TForm_vkontakte.FormClose(Sender: TObject;
  var Action: TCloseAction);
 begin
  Timer_vkontakte.Enabled:=false;
 end;

procedure TForm_vkontakte.FormCreate(Sender: TObject);
begin
Timer_vkontakte.Enabled:=false;
end;

procedure TForm_vkontakte.BitBtn1Click(Sender: TObject);
 begin Self.Close; end;

end.
