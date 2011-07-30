program vpoints;

uses
  Forms,
  Unit_main in 'Unit_main.pas' {Form1},
  Unit_link in 'unit_link.pas' {Form_link},
  Unit_goto in 'Unit_goto.pas' {Form_goto},
  Unit_mymessage in 'Unit_mymessage.pas' {Form_MyMessage},
  Unit_coordinates in 'Unit_coordinates.pas' {Form_coordinates};

{Form1}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'vpoints';
  Application.CreateForm(TForm1, Form1);
  //  Application.CreateForm(TForm_vkontakte, Form_vkontakte);
  Application.CreateForm(TForm_link, Form_link);
  Application.CreateForm(TForm_goto, Form_goto);
  Application.Run;
end.
