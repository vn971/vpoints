unit Unit_coordinates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm_coordinates = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_coordinates: TForm_coordinates;

implementation

{$R *.dfm}

function ConvertCoordinate_to_string(inputcoord:integer):string;
 begin
  if inputcoord in [0..25] then Result:=Chr(inputcoord+ord('a'));
  if inputcoord in [26..51] then Result:=Chr(inputcoord-26+ord('A'));
 end;

function ConvertTwoCoordinates_to_string(coord1,coord2:integer):string;
 begin Result:=ConvertCoordinate_to_string(coord1)
 +ConvertCoordinate_to_string(coord2); end;


procedure UpdateAll(x,y:integer);
begin
  Form_coordinates.LabeledEdit3.Text:=ConvertTwoCoordinates_to_string(x,y);
  Form_coordinates.LabeledEdit2.Text:=IntToStr(x)+'-'+IntToStr(y);
end;

procedure TForm_coordinates.Button1Click(Sender: TObject);
function vk2coord(s:char):integer;
begin
  if s<='9'
    then Result:=ord(s)-ord('1')
    else Result:=ord(s)-ord('a')+9;
end;

var
  s:string;
  s1,s2:char;
  x,y:integer;
begin
  s:=LabeledEdit1.Text;
  s1:=s[1];
  s2:=s[2];
  x:=vk2coord(s1);
  y:=vk2coord(s2);
  UpdateAll(x,y);
end;

end.
