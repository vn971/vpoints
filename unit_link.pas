unit Unit_link;
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
  Dialogs, StdCtrls,ShellAPI, Buttons;

type
  TForm_link = class(TForm)
    Memo_deskription: TMemo;
    Edit_action: TEdit;
    BitBtn1: TBitBtn;
    procedure Label_actionClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Edit_actionClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_link: TForm_link;

implementation

{$R *.dfm}

procedure TForm_link.Label_actionClick(Sender: TObject);
 begin
  ShellExecute(Form_link.handle, 'open', pansichar{PWideChar}(Edit_action.Text), nil, nil, SW_SHOW);
  Form_link.Close;
 end;

procedure TForm_link.FormDeactivate(Sender: TObject);
begin
Form_link.Close;
end;

procedure TForm_link.Edit_actionClick(Sender: TObject);
begin
 Label_actionClick(Form_link);
end;

procedure TForm_link.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if ord(Key)=27 then Self.Close;
end;

end.



