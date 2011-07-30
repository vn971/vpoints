unit Unit_main;

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

комментарий 2010-03-30:
код на самом деле средне-малой читаемости.
писать проект я начал вообще отчасти чтобы вспомнить
что такое Delphi - почти безо всяких знаний..
Первые несколько месяцев путался с оформлением кода - то есть
в разных местах этого кода вы увидите разные системы отступов.
Помимо этого только написав 2/3 программы познакомился с ООП -
поэтому в программе царит смесь глобальных процедур и функций и
некоторых блоков переделанных действительно под ООП.
Мне пока-что в своем коде все понятно - но для других я гарантировать не могу.
*)
interface

uses
  Windows, SysUtils, Graphics, Classes, Controls, Forms,
  Dialogs, Menus, Buttons, Math, inifiles, unit_link,
  StdCtrls, ClipBrd, ComCtrls, Grids, ExtCtrls, pngimage,
  DateUtils, StrUtils,idtcpclient, ActnList, ImgList, unit_goto,
  unit_mymessage,unit_coordinates,Registry,messages,wininet;

type
  TForm1 = class(TForm)
    MainMenu: TMainMenu;
    menu_File1: TMenuItem;
    menu_pointsxt: TMenuItem;
    OpenDialog: TOpenDialog;
    PageControl_nastrojki: TPageControl;
    TabSheet_PaperSize: TTabSheet;
    ComboBox_RazmerPolya: TComboBox;
    SaveDialog: TSaveDialog;
    Timer_tochka_na_pole: TTimer;
    PageControl_derevo_xodov: TPageControl;
    CheckBox_dop_xod: TCheckBox;
    ColorDialog: TColorDialog;
    Label_color_red: TLabel;
    Label_color_blue: TLabel;
    Label_color_setka_lines: TLabel;
    TabSheet_derevo_osnovnoe: TTabSheet;
    menu_save_vpoints: TMenuItem;
    menu_polish: TMenuItem;
    TabSheet_igra: TTabSheet;
    GroupBox_paper_size: TGroupBox;
    menu_view_polish_editor: TMenuItem;
    menu_view_polish_game_site: TMenuItem;
    menu_vkontakte: TMenuItem;
    menu_linktovkontakteruapplication1: TMenuItem;
    menu_link_polsk_manual: TMenuItem;
    SpeedButton_new_game: TSpeedButton;
    SpeedButton_add_cross: TSpeedButton;
    SpeedButton_change_turn: TSpeedButton;
    menu_linktosite1: TMenuItem;
    menu_linktoforum1: TMenuItem;
    menu_linktodownloadpage1: TMenuItem;
    TabSheet_napominalka: TTabSheet;
    Memo_derevo_help: TMemo;
    Label_color_background: TLabel;
    menu_Help1: TMenuItem;
    TabSheet_metki: TTabSheet;
    Label_help_MetkiNaPole: TLabel;
    menu_online1: TMenuItem;
    Timer_form_resize: TTimer;
    Timer_TablNodesJump: TTimer;
    Button_help_mass_tochki: TButton;
    TrackBar_razm_tochk: TTrackBar;
    GroupBox_razm_tochki: TGroupBox;
    Timer_LastTurnFlash: TTimer;
    Label_nazhmite_chtoyb_izmen: TLabel;
    menu_N16: TMenuItem;
    menu_N17: TMenuItem;
    menu_N18: TMenuItem;
    menu_N4: TMenuItem;
    menu_tochkiorg1: TMenuItem;
    menu_N11: TMenuItem;
    menu_forumtochkiorg1: TMenuItem;
    menu_N19: TMenuItem;
    menu_N20: TMenuItem;
    menu_N21: TMenuItem;
    menu_N22: TMenuItem;
    menu_N7: TMenuItem;
    Button_delete_MassPointsFromNode: TButton;
    TabSheet_colors: TTabSheet;
    TabSheet_prorisovka: TTabSheet;
    Panel_mass_point: TPanel;
    Label_help_mass_points: TLabel;
    Panel_labels: TPanel;
    BitBtn_cancel_last_turn: TBitBtn;
    Edit_label_text: TEdit;
    RadioButton_label_treugol: TRadioButton;
    RadioButton_label_kvadr: TRadioButton;
    RadioButton_label_kruzhki: TRadioButton;
    RadioButton_label_text: TRadioButton;
    BitBtn_screenshot_help: TBitBtn;
    BitBtn_labels_help: TBitBtn;
    BitBtn_clear_labels: TBitBtn;
    menu_N25: TMenuItem;
    menu_N12: TMenuItem;
    BitBtn_RazmerPolya_OK: TBitBtn;
    BitBtn_RazmerPolya_help: TBitBtn;
    TabSheet_hidden: TTabSheet;
    ImageList_OpenGames: TImageList;
    ActionList_main: TActionList;
    Action_OpenFromVpoints: TAction;
    Action_OpenFromPointsxtDir: TAction;
    Action_OpenFromClipBoard: TAction;
    Action_OpenFromVkontakteApplication: TAction;
    Action_OpenFromPolishServer: TAction;
    menu_N1: TMenuItem;
    menu_N3: TMenuItem;
    menu_N5: TMenuItem;
    menu_N8: TMenuItem;
    menu_N9: TMenuItem;
    menu_N10: TMenuItem;
    menu_N15: TMenuItem;
    Action_SaveVpointsAs: TAction;
    Action_SaveToClipBoard: TAction;
    Panel_IgrovoePole: TPanel;
    Image_pole_vneshnee: TImage;
    Image_pole: TImage;
    Shape_last_turn: TShape;
    navodka_shape: TShape;
    Shape_memo_help: TShape;
    Action_NewFile: TAction;
    menu_N14: TMenuItem;
    Action_ChangeTurns: TAction;
    Action_SaveToPolishServer: TAction;
    menu_N13: TMenuItem;
    Action_goto: TAction;
    BitBtn_goto: TBitBtn;
    TabSheet_ErrorLog: TTabSheet;
    Memo_log_errors: TMemo;
    Button_log_podrobnej_ob_oshibkax: TButton;
    Button_log_ochistit: TButton;
    CheckBox_log_show_errors: TCheckBox;
    RadioGroup_SurroundType: TRadioGroup;
    Button_date_build: TButton;
    TabSheet_comments: TTabSheet;
    memo_comments: TMemo;
    StatusBar: TStatusBar;
    TabSheet_players: TTabSheet;
    Label_okruzheno_blue: TLabel;
    Label_okruzheno_red: TLabel;
    edit_imya_blue: TEdit;
    edit_imya_red: TEdit;
    menu_N6: TMenuItem;
    StringGrid_tabl_punktov: TStringGrid;
    Action_SaveVpoints: TAction;
    GroupBox_PlayerRed: TGroupBox;
    GroupBox_PlayerBlue: TGroupBox;
    RadioGroup_ConnectType: TRadioGroup;
    menu_N23: TMenuItem;
    menu_N27: TMenuItem;
    Label_ColorTheme: TLabel;
    ComboBox_ColorTheme: TComboBox;
    TabSheet_system: TTabSheet;
    Button_OpenSgftochkiWithVpoints: TButton;
    Button_OpenSgfWithVpoints: TButton;
    LabeledEdit_dir_pointsxt: TLabeledEdit;
    Button_ResetErrorLog: TButton;
    Button_OpenSavWithVPoints: TButton;
    menu_N28: TMenuItem;
    menu_N30: TMenuItem;
    menu_N31: TMenuItem;
    menu_N32: TMenuItem;
    menu_N33: TMenuItem;
    menu_N34: TMenuItem;
    menu_N35: TMenuItem;
    menu_N36: TMenuItem;
    menu_N37: TMenuItem;
    menu_N40: TMenuItem;
    menu_N41: TMenuItem;
    menu_N42: TMenuItem;
    LabeledEdit_commentator: TLabeledEdit;
    menu_N45: TMenuItem;
    menu_N46: TMenuItem;
    RichEdit_gameinfo: TRichEdit;
    menu_N47: TMenuItem;
    menu_N48: TMenuItem;
    menu_N49: TMenuItem;
    menu_N50: TMenuItem;
    menu_N51: TMenuItem;
    CheckBox_black_border: TCheckBox;
    Image_triangle: TImage;
    Image_square: TImage;
    Image_circle: TImage;
    CheckBox_showLabels: TCheckBox;
    Action_massConvert: TAction;
    menu_N54: TMenuItem;
    Action_toProblem: TAction;
    menu_N53: TMenuItem;
    menu_N52: TMenuItem;
    OpenDialog_massConvert: TOpenDialog;
    SpeedButton1: TSpeedButton;
    RadioGroup_convertRules: TRadioGroup;
    Action_massRenameSav: TAction;
    menu_N55: TMenuItem;
    Button1: TButton;
    CheckBox_ShowCoordinates: TCheckBox;
    menu_N38: TMenuItem;
    procedure Image_poleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure memo_commentsKeyPress(Sender: TObject; var Key: Char);
    procedure memo_commentsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer_tochka_na_poleTimer(Sender: TObject);
    procedure memo_commentsMouseMove(Sender: TObject; Shift : TShiftState;
      X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox_dop_xodClick(Sender: TObject);
    procedure Label_color_redClick(Sender: TObject);
    procedure Label_color_blueClick(Sender: TObject);
    procedure Label_color_backgroundClick(Sender: TObject);
    procedure Label_color_setka_linesClick(Sender: TObject);
    procedure StringGrid_tabl_punktovMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure menu_linktovkontakteruapplication1Click(Sender: TObject);
    procedure menu_view_polish_editorClick(Sender: TObject);
    procedure menu_view_polish_game_siteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton_new_gameClick(Sender: TObject);
    procedure SpeedButton_add_crossClick(Sender: TObject);
    procedure menu_linktosite1Click(Sender: TObject);
    procedure menu_linktoforum1Click(Sender: TObject);
    procedure menu_linktodownloadpage1Click(Sender: TObject);
    procedure StringGrid_tabl_punktovSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure StringGrid_tabl_punktovKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure StringGrid_tabl_punktovDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure menu_link_polsk_manualClick(Sender: TObject);
    procedure memo_commentsChange(Sender: TObject);
    procedure CheckBox_zadosostavitelClick(Sender: TObject);
    procedure Button_mark_EndOfZadClick(Sender: TObject);
    procedure Button_mark_autoreplyClick(Sender: TObject);
    procedure Button_zadachnik_jump_parentClick(Sender: TObject);
    procedure Button_zadachnik_jump_childClick(Sender: TObject);
    procedure Label_blue_turnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Button_clear_problem_markerClick(Sender: TObject);
    procedure Timer_form_resizeTimer(Sender: TObject);
    procedure Timer_TablNodesJumpTimer(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure menu_online1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button_help_mass_tochkiClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer_LastTurnFlashTimer(Sender: TObject);
    procedure TabSheet_der_imageShow(Sender: TObject);
    procedure TrackBar_razm_tochkChange(Sender: TObject);
    procedure menu_tochkiorg1Click(Sender: TObject);
    procedure menu_N11Click(Sender: TObject);
    procedure menu_forumtochkiorg1Click(Sender: TObject);
    procedure menu_N19Click(Sender: TObject);
    procedure CheckBox_black_borderClick(Sender: TObject);
    procedure CheckBox_soedin_palochkami_NOT_IN_USEClick(Sender: TObject);
    procedure RadioButton_vid_palki_cClick(Sender: TObject);
    procedure RadioButton_vid_palki_oClick(Sender: TObject);
    procedure menu_N7Click(Sender: TObject);
    procedure Button_delete_MassPointsFromNodeClick(Sender: TObject);
    procedure Edit_label_textEnter(Sender: TObject);
    procedure BitBtn_screenshot_helpClick(Sender: TObject);
    procedure BitBtn_labels_helpClick(Sender: TObject);
    procedure BitBtn_clear_labelsClick(Sender: TObject);
    procedure BitBtn_RazmerPolya_OKClick(Sender: TObject);
    procedure ComboBox_RazmerPolyaChange(Sender: TObject);
    procedure BitBtn_RazmerPolya_helpClick(Sender: TObject);
    procedure ComboBox_RazmerPolyaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_label_textKeyPress(Sender: TObject; var Key: Char);
    procedure ActionList_mainUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure Action_SaveToClipBoardExecute(Sender: TObject);
    procedure Action_SaveVpointsAsExecute(Sender: TObject);
    procedure Action_OpenFromVpointsExecute(Sender: TObject);
    procedure Action_OpenFromVkontakteApplicationExecute(Sender: TObject);
    procedure Action_OpenFromClipBoardExecute(Sender: TObject);
    procedure Action_OpenFromPointsxtDirExecute(Sender: TObject);
    procedure Action_NewFileExecute(Sender: TObject);
    procedure Action_ChangeTurnsExecute(Sender: TObject);
    procedure Action_SaveToPolishServerExecute(Sender: TObject);
    procedure Action_gotoExecute(Sender: TObject);
    procedure Image_poleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Memo_derevo_helpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button_date_buildClick(Sender: TObject);
    procedure RadioGroup_SurroundTypeClick(Sender: TObject);
    procedure TreeViewChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure Button_log_ochistitClick(Sender: TObject);
    procedure Button_log_podrobnej_ob_oshibkaxClick(Sender: TObject);
    procedure Action_SaveVpointsExecute(Sender: TObject);
    procedure RadioGroup_ConnectTypeClick(Sender: TObject);
    procedure PageControl_derevo_xodovEnter(Sender: TObject);
    procedure PageControl_derevo_xodovExit(Sender: TObject);
    procedure RadioGroup_ConnectTypeExit(Sender: TObject);
    procedure menu_N27Click(Sender: TObject);
    procedure ComboBox_ColorThemeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure RegisterFileType(ext: string; FileName: string);
    procedure Button_OpenSgftochkiWithVpointsClick(Sender: TObject);
    procedure Button_OpenSgfWithVpointsClick(Sender: TObject);
    procedure deleteme_RadioGroup_showLabelsClick(Sender: TObject);
    procedure Button_ResetErrorLogClick(Sender: TObject);
    procedure Button_OpenSavWithVPointsClick(Sender: TObject);
    procedure menu_N32Click(Sender: TObject);
    procedure menu_N33Click(Sender: TObject);
    procedure menu_N34Click(Sender: TObject);
    procedure menu_N35Click(Sender: TObject);
    procedure menu_N36Click(Sender: TObject);
    procedure menu_N37Click(Sender: TObject);
    procedure menu_N40Click(Sender: TObject);
    procedure menu_N41Click(Sender: TObject);
    procedure menu_N42Click(Sender: TObject);
    procedure StringGrid_tabl_punktovEnter(Sender: TObject);
    procedure LabeledEdit_dir_pointsxtExit(Sender: TObject);
    procedure LabeledEdit_commentatorEnter(Sender: TObject);
    procedure LabeledEdit_commentatorExit(Sender: TObject);
    procedure edit_imya_redExit(Sender: TObject);
    procedure edit_imya_blueExit(Sender: TObject);
    procedure edit_imya_redKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_imya_blueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit_commentatorKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure LabeledEdit_dir_pointsxtKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure TabSheet_napominalkaShow(Sender: TObject);
    procedure menu_N45Click(Sender: TObject);
    procedure CheckBox_showLabelsClick(Sender: TObject);
    procedure Action_massConvertExecute(Sender: TObject);
    procedure Action_toProblemExecute(Sender: TObject);
    procedure Action_massRenameSavExecute(Sender: TObject);
    procedure StringGrid_tabl_punktovMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure StringGrid_tabl_punktovMouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox_ShowCoordinatesClick(Sender: TObject);
    procedure menu_N38Click(Sender: TObject);
  private
    { Private declarations }
    procedure WMHotKey(var Msg : TWMHotKey); message WM_HOTKEY;
    function isOpenInputDesktop:boolean;
  public
    { Public declarations }
  end;


const
  id_SnapShot=101;

  ttp_empty=0; ttp_red=1; ttp_blue=2;
  ttsss=666;
  tts_none=0; tts_ByRed=1; tts_ByBlue=2;
  tts_CtrlRed=3; tts_CtrlBlue=4;//If Player A has a surr.path but no opponent poins inside
type
//  TT_integer_values=tt_empty..tt_BlueBeated;
  TPaperPoint=
   record
    player: ttp_empty..ttp_blue;
    surrnd: tts_none..tts_CtrlBlue;
   end;
const
  tt_empty: TPaperPoint = (player:ttp_empty;surrnd:tts_none);
  tt_red: TPaperPoint = (player:ttp_red;surrnd:tts_none);
  tt_blue: TPaperPoint = (player:ttp_blue;surrnd:tts_none);
  tt_RedByBlue: TPaperPoint = (player:ttp_red;surrnd:tts_ByBlue);
  tt_BlueByRed: TPaperPoint = (player:ttp_blue;surrnd:tts_ByRed);
  tt_EmptyByRed: TPaperPoint = (player:ttp_empty;surrnd:tts_ByRed);
  tt_EmptyByBlue: TPaperPoint = (player:ttp_empty;surrnd:tts_ByBlue);
  tt_RedBeated: TPaperPoint = (player:ttp_red;surrnd:tts_ByRed);
  tt_BlueBeated: TPaperPoint = (player:ttp_blue;surrnd:tts_ByBlue);
  tt_RedCtrl: TPaperPoint = (player:ttp_empty;surrnd:tts_CtrlRed);
  tt_BlueCtrl: TPaperPoint = (player:ttp_empty;surrnd:tts_CtrlBlue);
type
//  tt_empty=0; tt_red=1; tt_blue=2; tt_redbyblue=3; tt_bluebyred=4;
//  tt_emptybyred=5; tt_emptybyblue=6; tt_RedBeated=7; tt_BlueBeated=8;
//  ttSet_BlueSurroundings=[tt_RedByBlue,tt_EmptyByBlue,tt_BlueBeated];
//  ttSet_RedSurroundings=[tt_BlueByRed,tt_EmptyByRed,tt_RedBeated];

 TMove =
  record
   koord_x: integer;
   koord_y: integer;
   kto_sxodil : boolean;//as always, red=true
  end;
 TMoveBestsvet=TPoint;


 odin_razmer_polya=
  record
   razmer_x : integer;
   razmer_y : integer;
  end;
 tmassiv_razmerov_polya = array [0..3] of odin_razmer_polya;

 PairStrings=
  record
   PageCaptn,TrText:string;
  end;
 T_PageIndex_TreeView=array [0..1] of PairStrings;

 TTableNode =
  record
   index:integer;
   contains_comment:boolean;
   contains_red:boolean;
   contains_blue:boolean;
   color:byte; //0=white, 1=red, 2=blue
  end;

 TDerevoNodeProperty=
  record
   name:string;
   value:string;
  end;

 TTableNodes=class
  public
   nodes:array of array of TTableNode;
   CurDer_x,CurDer_y:integer;//Current Derevo node
   sel_x,sel_y:integer; //Selection
   StringGrid:^TStringGrid;
   freezed:boolean;
   constructor Create;
   procedure MakeVisible(x,y:integer);
   procedure recalculate_CurDerevoNode;
   procedure Make_CurDerevoNode_Visible;
   procedure Select_CurDerevoNode;
   procedure recalculate_CurSelection;
   procedure recalculate_structure;
   procedure recalculate_OneNodeProperties(x,y:integer);
   procedure recalculate_CurDerevoNodeProperties;
   procedure ShowHint_OnCurrentSelection;
   procedure SelectTablNode(x,y:integer);
  end;

 TConnection=
  record
   t1,t2:TMove;
   removed:boolean;
  end;

 TConnectionControl=class
  public
   field:array of array of integer;
   pairs:array of TConnection;
   constructor Create;
   procedure Clear;
   procedure convert_AtoB(a_what,b_to:integer);
   procedure convert_T1toT2(t1_x,t1_y,t2_x,t2_y:integer);
   procedure AddPair(t1,t2:TMove);
  end;

 TSurroundingPath=
  record
   path: array of TMoveBestsvet;
   color: boolean;
  end;
 TSurroundings= array of TSurroundingPath;

 TIgrovoePole=class
  private
//   priv_dop_xod:boolean;
  public
   paper_size_x, paper_size_y:integer;
   pole:array of array of TPaperPoint;
   surroundings:TSurroundings;
   connects:TConnectionControl;
   dop_xod:boolean;// read priv_dop_xod write SetDopXod;
   procedure SetDopXod(b:boolean);
   constructor Create;
   procedure Clear;
   procedure RecalculateSurroundings;
   procedure ClearSurroundings;
   function Clone_Surroundings:TSurroundings;
   function Clone_OneSurr(indx:integer):TSurroundingPath;
  end;

 TDerevoNode=class
  public
   pr_array: array of TDerevoNodeProperty;
   childrens:array of Word;  //indexes of childrens
   parent_node:word;
   is_killed:boolean;
   tbl_x,tbl_y:integer;//position in TablNodes
   procedure AddProperty(new_property:TDerevoNodeProperty;
       force_new:boolean);
   procedure AddProperty_XOR(pro:TDerevoNodeProperty);
   constructor Create;
   procedure Clear;
   function ContainsProperty(pro:TDerevoNodeProperty):boolean;
   function ContainsName(name:string):boolean;
   function ContainsComment:boolean;
   function ContainsRed:boolean;
   function ContainsBlue:boolean;
   function GetValue_byName(pro_name:string):string;
//   function AddChildren:integer; vnachale nado ponyat' indeks vershiny - a eto neprosto...
   procedure AddOrRewrite_ValuebyName(pro_name:string;value_new:string);
   procedure DeleteProperty_ByIndex(pro_index:integer);
   procedure DeleteProperty_ByNameAndValue(
       prop_to_delete:TDerevoNodeProperty;how_to:integer);
   procedure DeleteProperty_ByNameAnd1Chast(pro:TDerevoNodeProperty);
   procedure ClearFrom_PropertyName(NameToClear:string);
   function is_interesting:boolean;
  end;

 TDerevo= class
  public
   nodes:array of TDerevoNode;
   CurNode:integer;
   Table:^TTableNodes;
   edit_imya_red,edit_imya_blue:^TEdit;
   edit_analizer:^TLabeledEdit;
   check_dop_xod:^TCheckBox;
   new_game_processing:boolean;
   constructor Create;
   procedure save_autosave;
   function index_in_ParentNode(from:integer):integer;
   procedure make_ChildIndex_bigger(node:integer);
   procedure make_ChildIndex_lesser(node:integer);
   function DerevoNode_NumParenthesesClosed(index:integer):integer;
   function DerevoNode_IsParenthesesOpened(index:integer):boolean;
   procedure DeleteNode_ByIndex(node_index:integer);
   function DeleteNode_WithChildrens_GiveNewIndx(node_index:integer):integer;
   procedure Add_GameProperty(prop:TDerevoNodeProperty);
   procedure Add_GameProperty_byNameVal(name,value:string);
   function AddNode_GiveNewIndx(index:integer):integer;
   procedure show_info;
   procedure Clear;
   function SaveSubTree(from:integer):string;
   procedure SaveSubTree_toFile(from:integer;filename:string);
// Vnimanie!
// Vo vremya raboty programmy poryadok punktov v massive
// NE sovpadaet s poryadkom etix punktov v fajle.
// Izvlekajte strukturu dereva iz peremennyx 'parent_node' i 'childrens'.
  end;

 TPaperVisual=class
  public
   razmer_tochki, liniya_soedineniya_shirina:integer;
   img,img_vneshn:^TImage;
   ismaximized:boolean;
   backup_left,backup_top,backup_DRight,backup_DBottom:integer;
   constructor Create;
   procedure new_connection(new_con_x,new_con_y,shift_x
       ,shift_y:integer;red_or_blue: boolean);
   procedure new_oreol(new_point_x,new_point_y :integer; new_point_type:TPaperPoint);
   procedure new_point(new_point_x,new_point_y:integer;new_point_type:TPaperPoint);
   procedure prorisovat;
   procedure Screenshot_make;
   function coord_to_point(koordinata_prostaya:integer):integer;
   procedure recalculate_ShagSetkiPixels_tochki;
   procedure prorisovat_full;
  end;

 TGameRoom=class
  public
   name:string;
   der:TDerevo;
   TablNds:TTableNodes;
   history:TStrings;
   procedure recieve(str:string);
   constructor Create;
  end;

 TGameRooms=class
  public
   rooms:array of TGameRoom;
   function RoomByName(r_name:string):TGameRoom;
  end;


 TMyErrorLogger=class
  private
   new_errors_found:boolean;
  public
   procedure NewMessage(str:string);
   procedure Check_forNewMessages;
  end;

 TWebDownload=class
  public
   tcp:TIdTCPClient;
   constructor Create;
   function GetFromAddress(FileURL:string):string;
   function DownloadFile(const FileURL): string;
   function GetTCP(url:string):String;
  end;

 TColor_InMyProgram=class
  public
   cred,cblue, csetka_lines,
     cbackground, ctablitsa_punktov:TColor;
   procedure apply_colors;
   function get_red(color : tcolor):byte;
   function get_green(color : tcolor):byte;
   function get_blue(color : tcolor):byte;
   function calculate_medium_color(color1,color2 :TColor):TColor;
   function color_contrast_to(color_ident:tcolor):tcolor;
   function light_red:tcolor;
   function light_blue:tcolor;
  end;

 TDirControl=class
  private
   Priv_CurF:string;
   Form_main:^TForm;
  public
   application
   ,saved
   ,screenshots
   ,images
   ,derevo_images
   ,metki_polya
   ,pointsxt220_HomePath
   ,AutosaveName
   ,massConvert
   ,curLang:string;
   constructor Create;
   function saved_full:string;
   function AutosaveFullPath:string;
   function derevo_images_full:string;
   function metki_polya_full:string;
   function screenshots_full:string;
   function massConvert_full:string;
   function langFull:string;
   procedure SetCurFile(s:string);
   property current_file:string read Priv_CurF write SetCurFile;
  end;

 TFileWork=class
  public
   function FileAgeDT(file_inp:string):TDateTime;
   procedure open_pointsxt220_pchar(var f:pchar;num_bytes:integer);
   procedure open_pointsxt220_file(file_name:string);
   function open_vpoints_IsCorrect(var file_as_string:string):boolean;
   procedure open_vpoints_string(var file_as_string:string);
   procedure open_vpoints_file(file_name:string);
   procedure open_vktochki_file(file_name:string);
   function open_vkontakte_IsCorrect(var file_as_string:string):boolean;
   procedure open_vkontakte100_OstatochnString(file_as_string:WideString);
   procedure open_vkontakte100_string(file_as_string:string);
   procedure open_SomePointsFormat_file(file_name:string);
   procedure OpenDialog_execute;
   function save_vpoints_string:WideString;
   procedure save_vpoints_file (file_name:string);
   procedure delete_autosave;
  end;

 TMessages_my=class
  public
   hint_locked:boolean;
   lang_dir:string;
   constructor Create;
   function Get_Upcase(str:string):string;
   function Get_1Chast(str:string):string;
   function Get_After1Chast(str:string):string;
   function convert_Nto1310(str:string):string;
   function GetStringFromClipBoard:WideString;
   function getLangFile(fName:string):string;
   procedure PutStringIntoClipBoard(const Str: WideString);
   procedure ShowLink(link_to_show,link_description:string);
   procedure ShowHint(StatusBar_message:string);
   procedure ShowMsg(mymessage:string);
   procedure showFile(fName:string);
   function ShowBoolDialog(mymessage:string):boolean;
   function ConvertString_to_Coordinates(inputstr:string):TMove;
   function ConvertCoordinate_to_string(inputcoord:integer):string;
   function ConvertTwoCoordinates_to_string(coord1,coord2:integer):string;
   function ConvertTwoCoordinates_to_string_old(coord1,coord2:integer):string;
   function ConvertTwoCoordinates_to_string_PolishSZ(coord1,coord2:integer):string;
   function calculate_hint(tbl_node:TTableNode;kx,ky:integer):string;
   function inttostr_fixed_length( s : integer; nuzhnaya_dlinna: integer) : string;
   function fileNameWOSuffix:string;
   function fileName:string;
   function translit(s:string):string;
   procedure saveToFile(FileName,s:string);
   function loadFromFile(FileName:string):string;
  end;


const
  date_build=40754;
  dir_saved='saved\';
  dir_screenshots='screenshots\';
  dir_images='images\';
  dir_derevo_images='derevo_images\';
  dir_metki_polya='metki_na_pole\';
  dir_pointsxt220_HomePath='C:\Program Files\Games\Points XT v220\SaveGames\';
  autosave_name='autosave.sgftochki';
  ext_png='.png';

  my_DateTime_format : TFormatSettings= (
    DateSeparator: '.';
    TimeSeparator: '-';
    ShortDateFormat: 'yyyy.mm.dd';
    LongTimeFormat: 'hh:mm' );

  razmery_polya: tmassiv_razmerov_polya =
  ((razmer_x:15;razmer_y:20),(razmer_x:25;razmer_y:30),
  (razmer_x:30; razmer_y:35),(razmer_x:39; razmer_y:32));
  PageIndex_TreeView:T_PageIndex_TreeView=
   ((PageCaptn:'asd';TrText:'sdf'),(PageCaptn:'asdf';TrText:'ewb'));

  //Tablitsa Nodes Index
  tni_empty=-1;
  tni_VnizVpravo=-2;
  tni_Razvilka_SverxuVniz_i_vpravo=-3;
  tni_PryamoVniz=-5;

  //<INI file
  color_red_default=$000000c8;
  color_blue_default=$00c80000;
  color_setka_lines_default=$00b0b0b0;
  color_background_default=$00ffffff;
  dop_xod_default=false;
  vetvej_maximum_default = 100;
  xodov_maximum_default = 800;
  default_paper_size_x=25;
  default_paper_size_y=30;
  //>INI file

var
//<ini file options
  vetvej_maximum,xodov_maximum : integer;
//>END ini file options


  msgs:TMessages_my;
  FileControl:TFileWork;
  DirControl:TDirControl;
  paper:TPaperVisual;
  Form1: TForm1;
  derevo : TDerevo;
  TableNodes: TTableNodes;
  igrovoe_pole : TIgrovoePole;
  {0 - no point
   1 - red point
   2 - blue point
   3 - red surrounded point (by blue)
   4 - blue surrounded point (by red)
   5 - red surrounds empty space
   6 - blue surrounds empty space}
  colors_my:TColor_InMyProgram;
  WebDownload:TWebDownload;
  ErrorLogger:TMyErrorLogger;
  {v kletke xranitsya indeks vershiny v dereve,
  -1 mesto pustoe
  -2 povorot vniz-vpravo
  -3 razvilka sverxu vniz i vpravo
  -5 pryamo vniz }

  TablNodes_bitmaps :array of TBitmap;
  bitmap_triangle:TBitmap;
  bitmap_square:TBitmap;
  bitmap_circle:TBitmap;
  roomms:TGameRooms;

  current_memo_comments:TStrings;
  last_turn_global : TMove;
  control_players_stupidity: array [False..True] of boolean;

  sejchas_xodit : boolean;//true=red, false=blue
  form_created,tabl_nodes_needs_jump,
  derevoJump_inBuffer,CommentChange_from_jump:boolean;

  derevo_jump_where : integer;
  shag_setki_pixels,svobodnoe_pole : integer;


implementation


{$R *.dfm}

function TPaperPoint_Eq(a,b:TPaperPoint):boolean;
 begin
  Result:=(a.player=b.player)and(a.surrnd=b.surrnd);
 end;

function TPPoint_In(inp:TPaperPoint; arr:array of TPaperPoint):boolean;
 var i:integer;
 begin
  Result:=false;
  for i:=0 to length(arr)-1 do
    if TPaperPoint_Eq(arr[i],inp) then Result:=true;
 end;

constructor TMessages_my.Create;
 begin
  inherited;
  hint_locked:=false;
  lang_dir:='rus\';
 end;

constructor TDirControl.Create;
 begin
  inherited;
  Priv_CurF:='';
  Form_main:=@Form1;
  Self.saved:=dir_saved;
  Self.screenshots:=dir_screenshots;
  Self.images:=dir_images;
  Self.derevo_images:=dir_derevo_images;
  Self.metki_polya:=dir_metki_polya;
  Self.AutosaveName:=autosave_name;
  massConvert:='converter\';
  curLang:='rus\';
 end;
function TDirControl.saved_full;
 begin Result:=application+saved; end;
function TDirControl.AutosaveFullPath;
 begin Result:=application+saved+AutosaveName; end;
function TDirControl.derevo_images_full;
 begin Result:=application+images+derevo_images; end;
function TDirControl.metki_polya_full;
 begin Result:=application+images+metki_polya; end;
function TDirControl.screenshots_full;
 begin Result:=application+screenshots; end;
function TDirControl.massConvert_full;
 begin Result:=application+massConvert; end;

function TDirControl.langFull;
 begin Result:=application+'language\'+curLang; end;

constructor TPaperVisual.Create;
 begin
  img:=@Form1.Image_pole;
  img_vneshn:=@Form1.Image_pole_vneshnee;
 end;

function TWebDownload.DownloadFile(const FileURL): string;
var
  hSession, hFile: HInternet;
  Buffer: array[1..1024] of Char;
  BufferLen: LongWord;
begin
  Result := '';
  hSession := InternetOpen('STEROID Download',
                           INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(hSession) then begin
    hFile := InternetOpenURL(hSession, PChar(FileURL), nil, 0,
                             INTERNET_FLAG_RELOAD, 0);
    if Assigned(hFile) then begin
      repeat
        InternetReadFile(hFile, @Buffer, SizeOf(Buffer), BufferLen);
          Result:=Result+copy(Buffer,0,BufferLen);
      until (BufferLen = 0);
      InternetCloseHandle(hFile);
    end;
    InternetCloseHandle(hSession);
  end;
end;

function TWebDownload.GetFromAddress;
 const
  BufferSize = 1024;
 var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Char;
  BufferLen: DWORD;
  sAppName: string;
 begin
  Result := '';
  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName),
      INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(hSession) then
   begin
     try
      hURL := InternetOpenURL(hSession, PChar(fileURL), nil, 0, 0, 0);
       try
  //      AssignFile(f, FileName);
  //      Rewrite(f,1);
        repeat
          InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
          Result:=Result+copy(Buffer,0,BufferLen);
  //        BlockWrite(f2, Buffer, BufferLen);
        until BufferLen = 0;
  //      CloseFile(f);
  //      Result := True;
       finally
        InternetCloseHandle(hURL);
       end;
     finally
      InternetCloseHandle(hSession);
     end;
   end;
 end;

function TWebDownload.GetTCP;
 begin
  tcp.Host:=url; tcp.Port:=80;
  tcp.Connect();
  Result:='';
  if Self.tcp.Connected then
   begin
     try
      Result:=tcp.ReadLn(#0,1);
     except
//      Break;
     end;
   end;
 end;

constructor TWebDownload.Create;
 begin
  inherited; tcp:=TIdTCPClient.Create(nil);
 end;

procedure TIgrovoePole.ClearSurroundings;
 begin
  SetLength(surroundings,0);
 end;

function TIgrovoePole.Clone_Surroundings;
 var i,j:integer;
 begin
  SetLength(Result,length(surroundings));
  for i:=0 to length(surroundings)-1 do
   begin
    SetLength(Result[i].path,length(surroundings[i].path));
    for j:=0 to length(surroundings[i].path)-1 do
      Result[i].path[j]:=surroundings[i].path[j];
    Result[i].color:=surroundings[i].color;
   end;
 end;

function TIgrovoePole.Clone_OneSurr;
 var i:integer;
 begin
  Result.color:=surroundings[indx].color;
  SetLength(Result.path,length(surroundings[indx].path));
  for i:=0 to length(surroundings[indx].path)-1 do
    Result.path[i]:=surroundings[indx].path[i];
 end;


procedure TIgrovoePole.RecalculateSurroundings;
 type TFieldBoolean=array of array of boolean;
 var
  zakraski,cur_zakr:TFieldBoolean;
  cur_SPath:TSurroundingPath;
  i,j,lx,ly,score_red,score_blue:integer;

  function BooleanField_Union(f1,f2:TFieldBoolean):TFieldBoolean;
   var i,j:integer;
   begin
    SetLength(Result,lx,ly);
    for i:=0 to lx-1 do for j:=0 to ly-1 do
     if (f1[i,j] or f2[i,j]) then Result[i,j]:=true;
   end;

  function extract_surrounding(start_x,start_y:integer):TFieldBoolean;
   //uses outer variables
   var
    i,j:integer; krasili_li:boolean;
    cur_surrnd_color: tts_none..tts_ByBlue;//TTSets;
   begin
//    if (pole[start_x,start_y] in ttSet_BlueSurroundings)
//      then cur_surrnd_color:=ttSet_BlueSurroundings;
//    if (pole[start_x,start_y]in ttSet_RedSurroundings)
//      then cur_surrnd_color:=ttSet_RedSurroundings;
    cur_surrnd_color:=pole[start_x,start_y].surrnd;
    SetLength(Result,lx,ly);
    Result[start_x,start_y]:=true;
    krasili_li:=true;
    while krasili_li=true do
     begin
      krasili_li:=false;
      for i:=1 to lx-2 do for j:=1 to ly-2 do
       begin
        if (Result[i,j]=false)
        and((Result[i-1,j]=true)
        or(Result[i+1,j]=true)
        or(Result[i,j-1]=true)
        or(Result[i,j+1]=true))
        and(pole[i,j].surrnd = cur_surrnd_color) then
         begin
          Result[i,j]:=true;
          krasili_li:=true;
         end;
       end;
     end;
   end;

  function extract_SurrPath(ff:TFieldBoolean;
      start_x,start_y:integer):TSurroundingPath;
   //_PROTIV_ chasovoj strelki
   //ispolzuetsya, chto startovaya tochka --- na granitse okruzhennoj oblasti
   type TVector=
    record
     dx,dy:integer;
    end;
   var
    cur_vect:TVector;
    cur_point:TMoveBestsvet;
    mrs:TSurroundingPath;//myResult
   function get_next_napravl(v:TVector):TVector; //_PO_ chasovoj strelke
    var v2:TVector;
    begin
     if (v.dx=-1) and (v.dy= 0) then begin v2.dx:=-1; v2.dy:=-1 end else//-*
     if (v.dx=-1) and (v.dy=-1) then begin v2.dx:= 0; v2.dy:=-1 end else//\.
     if (v.dx= 0) and (v.dy=-1) then begin v2.dx:=+1; v2.dy:=-1 end else//.|.
     if (v.dx=+1) and (v.dy=-1) then begin v2.dx:=+1; v2.dy:= 0 end else//./
     if (v.dx=+1) and (v.dy= 0) then begin v2.dx:=+1; v2.dy:=+1 end else//*-
     if (v.dx=+1) and (v.dy=+1) then begin v2.dx:= 0; v2.dy:=+1 end else//'\
     if (v.dx= 0) and (v.dy=+1) then begin v2.dx:=-1; v2.dy:=+1 end else//'|'
     if (v.dx=-1) and (v.dy=+1) then begin v2.dx:=-1; v2.dy:= 0 end;///'
     Result:=v2;
    end;
   begin
    SetLength(mrs.path,0);
    Result.path:=mrs.path;
    Result.color:=true;
    SetLength(Result.path,2);
    cur_point.x:=start_x; cur_point.y:=start_y-1;
    Result.path[0]:=cur_point;
    cur_vect.dx:=-1; cur_vect.dy:=+1;
    cur_point.x:=cur_point.x+cur_vect.dx; cur_point.y:=cur_point.y+cur_vect.dy;
    Result.path[1]:=cur_point;
    repeat
      cur_vect.dx:=-cur_vect.dx; cur_vect.dy:=-cur_vect.dy;
      repeat
         cur_vect:=get_next_napravl(cur_vect);
      until ff[cur_point.x+cur_vect.dx,cur_point.y+cur_vect.dy]=false;
      cur_point.x:=cur_point.x+cur_vect.dx; cur_point.y:=cur_point.y+cur_vect.dy;
      SetLength(Result.path,length(Result.path)+1);
      Result.path[length(Result.path)-1]:=cur_point;
    until (cur_point.X=Result.path[0].X)and(cur_point.Y=Result.path[0].Y);
   end;
 begin
  lx:=length(pole); ly:=length(pole[0]);
  SetLength(zakraski,igrovoe_pole.paper_size_x,igrovoe_pole.paper_size_y);
  SetLength(cur_zakr,igrovoe_pole.paper_size_x,igrovoe_pole.paper_size_y);
  for i:=0 to lx-1 do for j:=0 to ly-1 do
   begin zakraski[i,j]:=false; cur_zakr[i,j]:=false; end;
  SetLength(surroundings,0);
  score_red:=0; score_blue:=0;
  for i:=1 to igrovoe_pole.paper_size_x-2 do
    for j:=1 to igrovoe_pole.paper_size_y-2 do
     begin
      if (zakraski[i,j]=false)
          and ((pole[i,j].surrnd=tts_ByRed)
          or(pole[i,j].surrnd=tts_ByBlue)) then
       begin
        cur_zakr:=extract_surrounding(i,j);
        cur_SPath:=extract_SurrPath(cur_zakr,i,j);
        cur_SPath.color:=(pole[i,j].surrnd=tts_ByRed);
        SetLength(surroundings,length(surroundings)+1);
        surroundings[length(surroundings)-1]:=cur_SPath;
        zakraski:=BooleanField_Union(zakraski,cur_zakr);
       end;
      if TPaperPoint_Eq(pole[i,j],tt_BlueByRed) then inc(score_red);
      if TPaperPoint_Eq(pole[i,j],tt_RedByBlue) then inc(score_blue);
     end;
  //<Schetchik okruzhennyx tochek
  Form1.Label_okruzheno_red.Caption:='('+IntToStr(score_red)+')';
  Form1.Label_okruzheno_blue.Caption:='('+IntToStr(score_blue)+')';
  //>END Schetchik okruzhennyx tochek

 end;

function TMessages_my.Get_Upcase(str:string):string;
 var j:integer;
 begin
  Result:='';
  for j:=1 to Length(str) do
   if str[j]=UpCase(str[j])
    then
     Result:=Result+str[j];
 end;

function TMessages_my.Get_1Chast(str:string):string;
 var
  i:integer;
  local_exit:boolean;
 begin
  i:=1; Result:=''; local_exit:=false;
  while (i<=length(str)) and (local_exit=false) do
   begin
    if str[i]<>':'
     then Result:=Result+str[i]
     else local_exit:=true;
    inc(i);
   end;
 end;

function TMessages_my.Get_After1Chast(str:string):string;
 var
  i:integer;
  local_exit:boolean;
 begin
  i:=1; Result:=''; local_exit:=false;
  while (i<=length(str))and(local_exit=false) do
   begin
    local_exit:=(str[i]=':');
    inc(i);
   end;
  while (i<=length(str)) do
   begin
    Result:=Result+str[i];
    inc(i);
   end;
 end;


function TMessages_my.convert_Nto1310(str:string):string;
 var i:integer;
 begin
  i:=1;
  while i<= length(str) do
   begin
    if (str[i]='\') and (str[i+1] in ['n','N']) then
     begin
      Result:=Result+#13#10; inc(i);
     end
     else convert_Nto1310:=Result+str[i];
    inc(i);
   end;
 end;

function TMessages_my.GetStringFromClipBoard:WideString;
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

function TMessages_my.getLangFile;
 begin
  Result:=loadFromFile(DirControl.application+'language\'+lang_dir+fName+'.txt');
 end;

procedure TMessages_my.PutStringIntoClipBoard(const Str: WideString);
var
  Size: Integer;
  Data: THandle;
  DataPtr: Pointer;
begin
  Size := Length(Str);
  if Size = 0 then
    exit;
  if not IsClipboardFormatAvailable(CF_UNICODETEXT) then
    Clipboard.AsText := Str
  else
  begin
    Size := Size shl 1 + 2;
    Data := GlobalAlloc(GMEM_MOVEABLE + GMEM_DDESHARE, Size);
    try
      DataPtr := GlobalLock(Data);
      try
        Move(Pointer(Str)^, DataPtr^, Size);
        Clipboard.SetAsHandle(CF_UNICODETEXT, Data);
      finally
        GlobalUnlock(Data);
      end;
    except
      GlobalFree(Data);
      raise;
    end;
  end;
end;

procedure TMessages_my.ShowLink(link_to_show,link_description:string);
 begin
  with Form_link do
   begin
    if link_description=''
     then Memo_deskription.Text:=link_to_show
     else Memo_deskription.Text:=convert_Nto1310(link_description);
    Edit_action.Text:=link_to_show;
    Edit_action.Hint:=link_to_show;
    Form_link.ShowModal;
   end;
 end;


procedure TMessages_my.ShowHint(StatusBar_message:string);
 begin
  Form1.StatusBar.SimpleText:=StatusBar_message;
 end;

procedure TMessages_my.ShowMsg(mymessage:string);
 begin
  with Form_MyMessage do
   begin
    Form_MyMessage:=TForm_MyMessage.Create(Form1);
    general_string:=convert_Nto1310(mymessage);
    ShowModal;
    Form_MyMessage.Free;
   end;
 end;

procedure TMessages_my.showFile;
 begin
  ShowMsg(getLangFile(fName));
 end;

function TMessages_my.ShowBoolDialog(mymessage:string):boolean;
 begin
  Result:=(MessageDlg(convert_Nto1310(mymessage)
     ,mtConfirmation,[mbOK,mbCancel],0)=mrOk);
 end;

procedure TMyErrorLogger.NewMessage;
 begin
  Form1.Memo_log_errors.Lines.Add(msgs.convert_Nto1310(str));
  new_errors_found:=true;
  Form1.PageControl_nastrojki.ActivePageIndex:=Form1.TabSheet_ErrorLog.PageIndex;
 end;

procedure TMyErrorLogger.Check_forNewMessages;
 begin
  if (new_errors_found=true)
    and (not Form1.CheckBox_log_show_errors.Checked) then
   begin
    new_errors_found:=false;
    Form1.Memo_log_errors.Lines.Add('---');
    Form1.PageControl_nastrojki.ActivePageIndex:=Form1.TabSheet_ErrorLog.PageIndex;
    msgs.showFile('errorLog\NewMessage');
   end;
 end;

procedure TConnectionControl.convert_AtoB;
 var k,l:integer;
 begin
  for k:=0 to igrovoe_pole.paper_size_x-1 do
    for l:=0 to igrovoe_pole.paper_size_y-1 do
      if Self.field[k,l]=a_what then Self.field[k,l]:=b_to;
 end;

procedure TConnectionControl.convert_T1toT2;
 begin
  Self.convert_AtoB(Self.field[t1_x,t1_y],Self.field[t2_x,t2_y]);
 end;

procedure TConnectionControl.AddPair;
 var
  cur_int:integer;
 begin
  igrovoe_pole.connects.convert_T1toT2(
      t1.koord_x,t1.koord_y,t2.koord_x,t2.koord_y);

  cur_int:=length(igrovoe_pole.connects.pairs);
  SetLength(igrovoe_pole.connects.pairs,cur_int+1);
  igrovoe_pole.connects.pairs[cur_int].t1:=t1;
  igrovoe_pole.connects.pairs[cur_int].t2:=t2;
 end;

constructor TDerevo.Create;
 begin
  inherited;
  SetLength(Self.nodes,1);
  Self.nodes[0]:=TDerevoNode.Create;
  new_game_processing:=false;
  Self.Table:=@TableNodes;
  Self.edit_imya_red:=@Form1.edit_imya_red;
  Self.edit_imya_blue:=@Form1.edit_imya_blue;
  Self.edit_analizer:=@Form1.LabeledEdit_commentator;
  Self.check_dop_xod:=@Form1.CheckBox_dop_xod;
 end;

procedure TDerevo.Clear;
 begin
  SetLength(Self.nodes,1);
  Self.nodes[0]:=TDerevoNode.Create;
 end;

function TDerevo.index_in_ParentNode;
 var
  i,par_nodeIndx:integer;
  par_node:^TDerevoNode;
 begin
  Result:=-1;
  par_nodeIndx:=Self.nodes[from].parent_node;
  par_node:=@Self.nodes[par_nodeIndx];
  for i:=0 to length(par_node.childrens)-1 do
    if par_node.childrens[i]=from then
      Result:=i;
 end;

procedure TDerevo.make_ChildIndex_bigger;
 var
  par_node:^TDerevoNode;
  par_node_indx,child_indx_before,
  replaced_node,replaced_chi_index:integer;
 begin
  par_node_indx:=Self.nodes[node].parent_node;
  par_node:=@Self.nodes[par_node_indx];
  child_indx_before:=Self.index_in_ParentNode(node);
  if length(par_node.childrens)<=1 then exit;
  TableNodes.freezed:=true;
  if child_indx_before=length(par_node.childrens)-1
    then replaced_chi_index:=0
    else replaced_chi_index:=child_indx_before+1;
  replaced_node:=par_node.childrens[replaced_chi_index];
  par_node.childrens[child_indx_before]:=replaced_node;
  par_node.childrens[replaced_chi_index]:=node;
  TableNodes.recalculate_structure;
  TableNodes.freezed:=false;
  TableNodes.StringGrid.Repaint;
  TableNodes.Select_CurDerevoNode;
  Self.save_autosave;
 end;

procedure TDerevo.make_ChildIndex_lesser;
 var
  par_node:^TDerevoNode;
  par_node_indx,child_indx_before,
  replaced_node,replaced_chi_index:integer;
 begin
  par_node_indx:=Self.nodes[node].parent_node;
  par_node:=@Self.nodes[par_node_indx];
  child_indx_before:=Self.index_in_ParentNode(node);
  if length(par_node.childrens)<=1 then exit;
  TableNodes.freezed:=true;
  if child_indx_before=0
    then replaced_chi_index:=length(par_node.childrens)-1
    else replaced_chi_index:=child_indx_before-1;
  replaced_node:=par_node.childrens[replaced_chi_index];
  par_node.childrens[child_indx_before]:=replaced_node;
  par_node.childrens[replaced_chi_index]:=node;
  TableNodes.recalculate_structure;
  TableNodes.freezed:=false;
  TableNodes.StringGrid.Repaint;
  TableNodes.Select_CurDerevoNode;
  derevo.save_autosave;
 end;


procedure TTableNodes.recalculate_OneNodeProperties;
 begin
  with Self.nodes[x,y] do
   begin
    if index>=0 then
     begin
      contains_comment:=derevo.nodes[index].ContainsComment;
      contains_red:=derevo.nodes[index].ContainsRed;
      contains_blue:=derevo.nodes[index].ContainsBlue;
      if contains_red xor contains_blue then color:=0;
      if contains_red and (not contains_blue) then color:=1;
      if contains_blue and (not contains_red) then color:=2;
     end else begin
      contains_comment:=false;
      contains_red:=false;
      contains_blue:=false;
      color:=0;
     end;
   end;
 end;

procedure TTableNodes.recalculate_CurDerevoNodeProperties;
 begin
  Self.recalculate_CurDerevoNode;
  Self.recalculate_OneNodeProperties(CurDer_x,CurDer_y);
 end;

function TMessages_my.inttostr_fixed_length( s : integer; nuzhnaya_dlinna: integer) : string;
 var
  j:integer;
  otvet: string;
 begin
  otvet:=inttostr(s);
  if (length(otvet)) < nuzhnaya_dlinna then
    for j:=1 to nuzhnaya_dlinna- length(otvet) do
      otvet:='0'+otvet;
  inttostr_fixed_length:=otvet;
 end;

function TMessages_my.fileNameWOSuffix;
 var
  PW,PB,AN,DTDT:string;
 begin
  PW:=derevo.nodes[0].GetValue_byName('PW');
  PB:=derevo.nodes[0].GetValue_byName('PB');
  AN:=derevo.nodes[0].GetValue_byName('AN');
  DTDT:=derevo.nodes[0].GetValue_byName('DTDT');
  if DTDT='' then DTDT:=DateToStr(Date,my_DateTime_format);
  Result:=DTDT+' '+PW+' vs '+PB;
  if AN<>'' then Result:=Result+' +'+AN;
  Result:=translit(Result);
 end;

function TMessages_my.fileName;
 begin Result:=fileNameWOSuffix+'.sgftochki'; end;

function TMessages_my.translit;
 function trans(s:string):string;
  begin
    case s[1] of
     'а': Result:='a';
     'б': Result:='b';
     'в': Result:='v';
     'г': Result:='g';
     'д': Result:='d';
     'е': Result:='e';
     'ё': Result:='e';
     'ж': Result:='zh';
     'з': Result:='z';
     'и': Result:='i';
     'й': Result:='i';
     'к': Result:='k';
     'л': Result:='l';
     'м': Result:='m';
     'н': Result:='n';
     'о': Result:='o';
     'п': Result:='p';
     'р': Result:='r';
     'с': Result:='s';
     'т': Result:='t';
     'у': Result:='u';
     'ф': Result:='f';
     'х': Result:='h';
     'ц': Result:='ts';
     'ч': Result:='ch';
     'ш': Result:='sh';
     'щ': Result:='sch';
     'ь': Result:='''';
     'ы': Result:='y';
     'ъ': Result:='''';
     'э': Result:='e';
     'ю': Result:='yu';
     'я': Result:='ya';
     'А': Result:='A';
     'Б': Result:='B';
     'В': Result:='V';
     'Г': Result:='G';
     'Д': Result:='D';
     'Е': Result:='E';
     'Ё': Result:='E';
     'Ж': Result:='Zh';
     'З': Result:='Z';
     'И': Result:='I';
     'Й': Result:='I';
     'К': Result:='K';
     'Л': Result:='L';
     'М': Result:='M';
     'Н': Result:='N';
     'О': Result:='O';
     'П': Result:='P';
     'Р': Result:='R';
     'С': Result:='S';
     'Т': Result:='T';
     'У': Result:='U';
     'Ф': Result:='F';
     'Х': Result:='H';
     'Ц': Result:='Ts';
     'Ч': Result:='Ch';
     'Ш': Result:='Sh';
     'Щ': Result:='Sch';
     'Ь': Result:='''';
     'Ы': Result:='Y';
     'Ъ': Result:='''';
     'Э': Result:='E';
     'Ю': Result:='Yu';
     'Я': Result:='Ya';
    end;
  end;
 var
  i:integer;
  b:string;
 begin
  Result:='';
  for i:=1 to Length(s) do
   begin
    if ((s[i]<='я')and(s[i]>='а'))
        or((s[i]<='Я')and(s[i]>='А'))
        or(s[i]='ё')
        or(s[i]='Ё')
      then b:=trans(s[i])
    else b:=s[i];
    Result:=Result+b;
   end;
 end;

procedure TMessages_my.saveToFile;
var f:TStrings;
begin
 //fixme
  f:=TStringList.Create;
  f.Text:=s;
  f.SaveToFile(FileName);
end;

function TMessages_my.loadFromFile;
 var
  str:TStrings;
  utf8_prefix:boolean;
 begin
  str:=TStringList.Create;
  if FileExists(FileName)
   then
    str.LoadFromFile(FileName);
  utf8_prefix:=(length(str[0])>=3)and(copy(str.Text,1,3)=#$EF#$BB#$BF);
  if utf8_prefix
    then Result:=UTF8Decode(copy(str.Text,4,length(str.Text)-5))
    else Result:=copy(str.Text,1,length(str.Text)-2);
 end;

function TMessages_my.ConvertString_to_Coordinates(inputstr:string):TMove;
  function ConvertChar_to_Coordiate(input_must_be_char:string):integer;
   begin
    Result:=99;
    if input_must_be_char[1] in ['a'..'z']
      then Result:=ord(input_must_be_char[1])-ord('a');
    if input_must_be_char[1] in ['A'..'Z']
      then Result:=ord(input_must_be_char[1])-ord('A')+26;
   end;
 begin
  Result.kto_sxodil:=false;
  if inputstr[1]in['0'..'9'] then
   begin //old form
    Result.koord_x:=StrToInt(copy(inputstr,1,2));
    if (length(inputstr)>=5)and (inputstr[3]in['-',':'])
     then Result.koord_y:=StrToInt(copy(inputstr,4,2))
     else Result.koord_y:=Result.koord_x; //support of polish SZ property
   end else
   begin //new_form
    Result.koord_x:=ConvertChar_to_Coordiate(inputstr[1]);
    if length(inputstr)>=2
     then Result.koord_y:=ConvertChar_to_Coordiate(inputstr[2])
     else Result.koord_y:=Result.koord_x;
   end;
 end;

function TMessages_my.ConvertCoordinate_to_string(inputcoord:integer):string;
 begin
  if inputcoord in [0..25] then Result:=Chr(inputcoord+ord('a'));
  if inputcoord in [26..51] then Result:=Chr(inputcoord-26+ord('A'));
  if (inputcoord<0)or(inputcoord>51) then
    ErrorLogger.NewMessage(
        msgs.getLangFile('errorLog\negativeCoord')+' ('
        +IntToStr(inputcoord)+')');
 end;

function TMessages_my.ConvertTwoCoordinates_to_string(coord1,coord2:integer):string;
 begin Result:=ConvertCoordinate_to_string(coord1)
 +ConvertCoordinate_to_string(coord2); end;

function TMessages_my.ConvertTwoCoordinates_to_string_old(coord1,coord2:integer):string;
 begin
  Result:=inttostr_fixed_length(coord1,2)+'-'+inttostr_fixed_length(coord2,2);
 end;

function TMessages_my.ConvertTwoCoordinates_to_string_PolishSZ(coord1,coord2:integer):string;
 begin
  if coord1=coord2
   then Result:=inttostr_fixed_length(coord1,2)
   else Result:=inttostr_fixed_length(coord1,2)+':'+inttostr_fixed_length(coord2,2);
 end;

function TMessages_my.calculate_hint(tbl_node:TTableNode;kx,ky:integer):string;
 var
  indx,color:integer;
  con_comment:boolean;
  cur_str:string;
 begin
  indx:=tbl_node.index;
  color:=tbl_node.color;
  con_comment:=tbl_node.contains_comment;

  Result:='['+ConvertTwoCoordinates_to_string_old(kx,ky)+'] ';
  if indx=tni_empty then cur_str:=msgs.getLangFile('tabltypes\empty')
  else if indx=tni_VnizVpravo then cur_str:=''
  else if indx=tni_Razvilka_SverxuVniz_i_vpravo then cur_str:=''
  else if indx=tni_PryamoVniz then cur_str:=''
  else if indx>=0 then cur_str:=msgs.getLangFile('tabltypes\numb')+IntToStr(indx);
  Result:=Result+cur_str;
  if color=1 then Result:=Result+', '+msgs.getLangFile('tabltypes\redturn')
  else if color=2 then Result:=Result+', '+msgs.getLangFile('tabltypes\blueturn');
  if con_comment then Result:=Result+msgs.getLangFile('tabltypes\containsComment');
  if (con_comment)
      and(Form1.TabSheet_comments.PageControl.ActivePage
      <>Form1.TabSheet_comments) then
    Result:=Result+msgs.getLangFile('tabltypes\LookCommentInTab');
 end;

procedure TTableNodes.ShowHint_OnCurrentSelection;
 begin
  TableNodes.recalculate_CurSelection;
  TableNodes.recalculate_OneNodeProperties(TableNodes.sel_x,TableNodes.sel_y);
  msgs.ShowHint(msgs.calculate_hint(
    TableNodes.nodes[TableNodes.sel_x,TableNodes.sel_y]
    ,TableNodes.sel_x,TableNodes.sel_y));
 end;

procedure TTableNodes.SelectTablNode;
 var myrect:TGridRect; kx,ky:integer;
 begin
  kx:=x+Self.StringGrid.FixedCols;
  ky:=y+Self.StringGrid.FixedRows;
  myrect.Left:=kx; myrect.Right:=kx;
  myrect.Top:=ky; myrect.Bottom:=ky;
  StringGrid.Selection:=myrect;
  Self.MakeVisible(x,y);
 end;

function TPaperVisual.coord_to_point(koordinata_prostaya : integer) : integer;
 begin
  coord_to_point:= svobodnoe_pole +(koordinata_prostaya*shag_setki_pixels);
 end;

constructor TIgrovoePole.Create;
 begin
  inherited Create;
  paper_size_x:=0; paper_size_y:=0;
  SetLength(Self.pole,0,0);
  SetLength(Self.surroundings,0);
  Self.connects:=TConnectionControl.Create;
 end;

procedure TIgrovoePole.SetDopXod;
// var pro:TDerevoNodeProperty;
 begin
//  if form_created=false then exit;
//  pro.name:='RUAT'; pro.value:=BoolToStr(b);
//  derevo.Add_GameProperty(pro);
 end;

procedure TIgrovoePole.Clear;
 var i,j:integer;
 begin
  SetLength(Self.pole,paper_size_x,paper_size_y);
  for i:=0 to paper_size_x-1 do
    for j:=0 to paper_size_y-1 do
      Self.pole[i,j]:=tt_empty;
  ClearSurroundings;
  connects.Clear;
 end;

constructor TConnectionControl.Create;
 begin
  inherited;
  SetLength(Self.field,0,0);
  SetLength(Self.pairs,0);
 end;

procedure TConnectionControl.Clear;
 var
  i,j,counter : integer;//current integers
 begin
  SetLength(field,igrovoe_pole.paper_size_x,igrovoe_pole.paper_size_y);
  SetLength(pairs,0);
  counter:=1;
  for i:=0 to igrovoe_pole.paper_size_x-1 do
    begin
      for j:=0 to igrovoe_pole.paper_size_y-1 do
        begin
          Self.field[i,j]:=counter;
          inc(counter);
        end;
    end;
 end;

procedure Extract_ComboBox_RazmerPolya_ItemIndex;
 var
  j:integer;
  razmer_found:boolean;
 begin
  razmer_found:=false;
  with Form1 do
   begin
    for j:=0 to (ComboBox_RazmerPolya.Items.Count-1) do
      if (igrovoe_pole.paper_size_x=razmery_polya[j].razmer_x) and
          (igrovoe_pole.paper_size_y=razmery_polya[j].razmer_y) then
       begin
        ComboBox_RazmerPolya.ItemIndex:=j;
        razmer_found:=true;
       end;
    if razmer_found=false then ComboBox_RazmerPolya.Text:=
        IntToStr(igrovoe_pole.paper_size_x)+'*'+IntToStr(igrovoe_pole.paper_size_y);
   end;
 end;

function properties_equal(p1,p2:TDerevoNodeProperty;how_to:integer):boolean;
 //how-to: 1 means getting 1chast only
 begin
  if (how_to=0) then
   begin
    if (msgs.Get_Upcase(p1.name)=msgs.Get_Upcase(p2.name)) and (p1.value=p2.value)
     then result:=true
     else result:=false;

   end else begin
    if (msgs.Get_Upcase(p1.name)=msgs.Get_Upcase(p2.name))
       and (msgs.Get_1Chast(p1.value)=msgs.Get_1Chast(p2.value))
     then result:=true
     else result:=false;
   end;
 end;

procedure TDerevoNode.AddProperty;
 var
  i, propert_count_begore : integer;
  equal_property_found : boolean;//ostanovka
 begin
  propert_count_begore:=length(Self.pr_array);
  equal_property_found:=false;
  for i:= 0 to propert_count_begore-1 do
    if properties_equal(new_property,Self.pr_array[i],0)=true
     then equal_property_found:=true;
  if (equal_property_found=false)or(force_new=true) then
   begin
    SetLength(Self.pr_array,propert_count_begore+1);
    Self.pr_array[propert_count_begore]:=new_property;
   end;
 end;

procedure TDerevoNode.AddProperty_XOR;
 var
  i:integer;
  prop_found:boolean; indx_of_prop:word;
 begin
  prop_found:=false;
  indx_of_prop:=0;//for Delphi debug.
  for i:=0 to length(pr_array)-1 do
   begin
    if properties_equal(pr_array[i],pro,0) then
     begin
      prop_found:=true;
      indx_of_prop:=i;
     end;
   end;
  if prop_found=false
   then AddProperty(pro,false)
   else DeleteProperty_ByIndex(indx_of_prop);
 end;

constructor TDerevoNode.Create;
 begin
  inherited;
  SetLength(Self.pr_array,0);
  SetLength(Self.childrens,0);
  Self.parent_node:=0;
  Self.is_killed:=false;
  Self.tbl_x:=0; Self.tbl_y:=0;
 end;

procedure TDerevoNode.Clear;
 begin
  SetLength(Self.pr_array,0);
  SetLength(Self.childrens,0);
  Self.parent_node:=0;
  Self.is_killed:=false;
  Self.tbl_x:=0; Self.tbl_y:=0;
 end;

function TDerevo.DerevoNode_NumParenthesesClosed(index:integer):integer;
 var
  current_index:integer;
  current_parent:integer;
  current_parent_ChildNum:integer;
  local_exit:boolean;
 begin
  local_exit:=false;
  current_index:=index;
  if (Length(Self.nodes[index].childrens)<>0)
   then Result:=0
   else begin
    Result:=1;
    while (current_index<>0) and (local_exit=false) do
     begin
      current_parent:=Self.nodes[current_index].parent_node;
      current_parent_ChildNum:=Length(Self.nodes[current_parent].childrens);
      if current_parent_ChildNum>=2 then
       begin
        if Self.nodes[current_parent].childrens[current_parent_ChildNum-1]=
           current_index
         then inc(Result)
         else local_exit:=true;
       end;
      current_index:=current_parent;
     end;
    end;
 end;

function TDerevo.DerevoNode_IsParenthesesOpened(index:integer):boolean;
 var
  parent_index:integer;
  num_childrens_in_parent:integer;
 begin
  if index=0
   then Result:=true
   else begin
    parent_index:=Self.nodes[index].parent_node;
    num_childrens_in_parent:=length(Self.nodes[parent_index].childrens);
    Result:=(num_childrens_in_parent>=2);
   end;
 end;

procedure TDerevo.DeleteNode_ByIndex(node_index:integer);
 var par_indx,child_in_eyes_of_parent,i:integer;
 begin
  if (node_index<=0) or (node_index>=length(Self.nodes))
    then ErrorLogger.NewMessage('popytka udalit'' vershinu pri indx='+IntToStr(node_index));
  Self.nodes[node_index].is_killed:=true;
  par_indx:=Self.nodes[node_index].parent_node;
  with Self.nodes[par_indx] do
   begin
    child_in_eyes_of_parent:=0;
    while childrens[child_in_eyes_of_parent]<>node_index
     do inc(child_in_eyes_of_parent);
    for i:=child_in_eyes_of_parent
       to length(childrens)-2 do
     begin
      Self.nodes[par_indx].childrens[i]:=Self.nodes[par_indx].childrens[i+1];
     end;
    SetLength(childrens,length(childrens)-1);
   end;
 end;

procedure TDerevoNode.DeleteProperty_ByIndex(pro_index:integer);
 var i:integer;
 begin
  with Self do
   begin
    for i:=pro_index to Length(pr_array)-2 do
     begin
      pr_array[i]:=pr_array[i+1];
     end;
    SetLength(pr_array,length(pr_array)-1);
   end;
 end;

procedure TDerevoNode.DeleteProperty_ByNameAndValue(
   prop_to_delete:TDerevoNodeProperty;how_to:integer);
 //how-to
 //bit summ. 1 means getting 1 chast only
 var i:integer;
 begin
  with Self do
   begin
    i:=0;
    while i<=length(pr_array)-1 do
     begin
      if properties_equal(prop_to_delete,pr_array[i],how_to) then
       begin
        Self.DeleteProperty_ByIndex(i);
       end else inc(i);
     end;
   end;
 end;

procedure TDerevoNode.DeleteProperty_ByNameAnd1Chast;
 var i:integer;
 begin
  i:=0;
  while i<=length(pr_array)-1 do
   begin
    if (pro.name=pr_array[i].name)
      and (msgs.Get_1Chast(pro.value)=
      msgs.Get_1Chast(pr_array[i].value))
     then
     begin
      Self.DeleteProperty_ByIndex(i);
     end else inc(i);
   end;
 end;

function TDerevo.DeleteNode_WithChildrens_GiveNewIndx(node_index:integer):integer;
  procedure DeleteNode_Recursive(recur_node:integer);
   var i,childs_length:integer;
   begin
    childs_length:=length(Self.nodes[recur_node].childrens);
    for i:=childs_length-1 downto 0 do
     begin
      DeleteNode_Recursive(Self.nodes[recur_node].childrens[i]);
     end;
    derevo.DeleteNode_ByIndex(recur_node);
    //pravilno, chto udalenie posle rekursii?
   end;
 begin
  Result:=Self.nodes[node_index].parent_node;
  DeleteNode_Recursive(node_index);
  ErrorLogger.Check_forNewMessages;
 end;

procedure TDerevoNode.ClearFrom_PropertyName(NameToClear:string);
 var
  i:integer;
  was_deleted:boolean;
 begin
  with Self do
   begin
    repeat
      was_deleted:=false;
      i:=0;
      while i<=length(pr_array)-1 do
       begin
        if msgs.Get_Upcase(pr_array[i].name)=msgs.Get_Upcase(NameToClear) then
         begin
          was_deleted:=true;
          DeleteProperty_ByIndex(i);
         end;
        inc(i);
       end;
    until was_deleted=false;
   end;
 end;

procedure TDerevo.Add_GameProperty;
 begin

  //this deletes the old Value and places the new.
  Self.nodes[0].AddOrRewrite_ValuebyName(prop.name,prop.value);

  if (prop.name='PW')or(prop.name='PR') then edit_imya_red.Text:=prop.value
  else if prop.name='PB' then edit_imya_blue.Text:=prop.value
  else if prop.name='AN' then edit_analizer.Text:=prop.value
  else if prop.name='RUAT' then
   begin
    igrovoe_pole.dop_xod:=StrToBool(prop.value);
    check_dop_xod.Checked:=igrovoe_pole.dop_xod;
   end
  else if prop.name='SZ' then begin Extract_ComboBox_RazmerPolya_ItemIndex; end

  else begin end;
  show_info;
//I'm not using the 'RU' property.
//there are 3 different options:
//1) surround immediately when can surround or not,
//2) count empty territory or not
//3) give additional surrounding turn or not..
//It's not useful to write all theese options into a single 'RU'.
 end;

procedure TDerevo.Add_GameProperty_byNameVal;
 var pro:TDerevoNodeProperty;
 begin
  pro.name:=name; pro.value:=value;
  Add_GameProperty(pro);
 end;

function TDerevo.AddNode_GiveNewIndx(index:integer):integer;
 var
  j,der_length_begore, num_childrens_before,
  new_node_indx:integer;
  local_exit:boolean;
 begin
  der_length_begore:=Length(nodes);
  if (index<0)
      or (index>der_length_begore-1)
    then ErrorLogger.NewMessage(
      'Kapets. Byla popytka sozdat'' vershinu iz '
      +'\n-1 \nili \nlentgh(derevo.nodes)+..');
  //obrabatyvat' znachenie -1 ne nado.
  ErrorLogger.Check_forNewMessages;
  num_childrens_before:=Length(nodes[index].childrens);

  j:=1;
  new_node_indx:=-1;//for Delphi debug
  local_exit:=false;
  while (local_exit=false) and (j<=length(nodes)-1) do
   begin
    if nodes[j].is_killed=true then
     begin
      new_node_indx:=j;
      local_exit:=true;
      derevo.nodes[j].Clear;
     end;
    inc(j);
   end;

  if local_exit=false then
   begin
    SetLength(nodes,der_length_begore+1);
    new_node_indx:=der_length_begore;
    derevo.nodes[der_length_begore]:=TDerevoNode.Create;
   end;
  Result:=new_node_indx;
  //<add new node as a child}
  derevo.nodes[new_node_indx].parent_node:=index;
  SetLength(derevo.nodes[index].childrens,
     num_childrens_before+1);
  derevo.nodes[index].childrens[num_childrens_before]:=
     new_node_indx;
  //>add new node as a child
 end;


procedure TDerevo.show_info;
 var cur_str:string;
 const nl=#13#10;
 begin
  with Form1.RichEdit_gameinfo do
   begin
    Clear;
//    SelAttributes.Color:=clRed;
//    SelText:=nl;
//    SelText:='red'+nl;
//    SelAttributes.Color:=clBlue;
//    SelText:='blue'+nl;
    cur_str:=nodes[0].GetValue_byName('PW');
    SelAttributes.Color:=colors_my.cred;
    SelAttributes.Style:=SelAttributes.Style+[fsBold];
    SelText:='Игрок 1: ';
    SelAttributes.Style:=SelAttributes.Style-[fsBold];
    SelAttributes.Color:=clBlack;

    if length(cur_str)>9
      then SelText:=nl; //Text:=Text+nl;
    SelText:=cur_str+nl;
    cur_str:=nodes[0].GetValue_byName('PB');
    SelAttributes.Color:=colors_my.cblue;
    SelAttributes.Style:=SelAttributes.Style+[fsBold];
    SelText:='Игрок 2: ';
    SelAttributes.Style:=SelAttributes.Style-[fsBold];
    SelAttributes.Color:=clBlack;
    if length(cur_str)>9 then SelText:=nl;
    SelText:=cur_str+nl;
    Lines.Add(msgs.getLangFile('razmerPolya')+msgs.inttostr_fixed_length(igrovoe_pole.paper_size_x,2)
        +'*'+msgs.inttostr_fixed_length(igrovoe_pole.paper_size_y,2));
    if igrovoe_pole.dop_xod
      then Lines.Add(msgs.getLangFile('dopXodEst'))
      else Lines.Add(msgs.getLangFile('dopXodNetu'));
    cur_str:=nodes[0].GetValue_byName('DTDT');
    if cur_str='' then cur_str:=nodes[0].GetValue_byName('DT');
    if cur_str<>'' then Lines.Add('Время: '+cur_str);
    cur_str:=nodes[0].GetValue_byName('AN');
    if cur_str<>'' then Lines.Add(msgs.getLangFile('razborOt')+cur_str);
   end;
 end;

function TDerevoNode.ContainsProperty;
 var i:integer;
 begin
  Result:=false;
  for i:=0 to length(pr_array)-1 do
   begin
    if properties_equal(pr_array[i],pro,0)
      then Result:=true;
   end;
 end;

function TDerevoNode.ContainsName;
 var i:integer;
 begin
  Result:=false;
  for i:=0 to (Length(Self.pr_array)-1) do
    if msgs.Get_Upcase(Self.pr_array[i].name)=msgs.Get_Upcase(name)
     then Result:=true;
 end;


function TDerevoNode.is_interesting;
//contains comment, labes,
//has >1 childrens
 var has_childrens,has_comm:boolean;
 begin
  has_childrens:=length(Self.childrens)>1;
  has_comm:=Self.ContainsComment;
  Result:=has_comm or has_childrens;
 end;

function TDerevoNode.ContainsComment;
 begin
  Result:=Self.ContainsName('C')
     or Self.ContainsName('TR')
     or Self.ContainsName('SQ')
     or Self.ContainsName('CR')
     or Self.ContainsName('LB');
 end;

function TDerevoNode.ContainsRed;
 begin
  Result:=Self.ContainsName('R')
     or Self.ContainsName('W');
 end;

function TDerevoNode.ContainsBlue;
 begin
  Result:=Self.ContainsName('B');
 end;

function TDerevoNode.GetValue_byName(pro_name:string):string;
 var i:integer;
 begin
  i:=0; Result:='';
  while i<=length(Self.pr_array)-1 do
   begin
    if AnsiUpperCase(Self.pr_array[i].name)=AnsiUpperCase(pro_name)
      then Result:=Self.pr_array[i].value;
    inc(i);
   end;
 end;


procedure TDerevoNode.AddOrRewrite_ValuebyName;
 var
  i:integer;
  found:boolean;
  pro:TDerevoNodeProperty;
 begin
  i:=0;
  found:=false;
  while i<=length(Self.pr_array)-1 do
   begin
    if AnsiUpperCase(Self.pr_array[i].name)=AnsiUpperCase(pro_name) then
     begin
      Self.pr_array[i].value:=value_new;
      found:=true;
     end;
    inc(i);
   end;
  if found=false then
   begin
    pro.name:=pro_name; pro.value:=value_new;
    Self.AddProperty(pro,true);
   end;
 end;


function Derevo_AddNode_GiveNewIndex(start_from_node:integer;
   check_equal:TDerevoNodeProperty;force_create:boolean):integer;
 var
  j,k, der_length_begore, num_childrens_before,
  current_child_index,new_node_indx:integer;
  equal_node_found,local_exit:boolean;
 begin
  der_length_begore:=Length(derevo.nodes);
  if (start_from_node<0)
      or (start_from_node>der_length_begore-1)
    then ErrorLogger.NewMessage(
      'Kapets. Byla popytka sozdat'' vershinu iz '
      +'\n-1 \nili \nlentgh(derevo.nodes)+..');
  //obrabatyvat' znachenie -1 ne nado.
  ErrorLogger.Check_forNewMessages;
  num_childrens_before:=Length(derevo.nodes[start_from_node].childrens);
  Result:=-1;
  equal_node_found:=false;
  for j:=0 to num_childrens_before-1 do
   begin
    current_child_index:=derevo.nodes[start_from_node].childrens[j];
    for k:=0 to Length(derevo.nodes[current_child_index].pr_array)-1 do
      if properties_equal
          (check_equal,derevo.nodes[current_child_index].pr_array[k],0) then
       begin
        equal_node_found:=true;
        Result:=current_child_index;
       end;
   end;

  //esli equal_node_found=false, to sozdavat' ne nado, prosto peremestit'sya.
  //chto uzhe sdelano cherez Result:=current_child_index;
  if (equal_node_found=false)or(force_create=true) then
   begin
    j:=1;
    new_node_indx:=-1;//for Delphi debug
    local_exit:=false;
    while (local_exit=false) and (j<=length(derevo.nodes)-1) do
     begin
      if derevo.nodes[j].is_killed=true then
       begin
        new_node_indx:=j;
        local_exit:=true;
        derevo.nodes[j].Clear;
       end;
      inc(j);
     end;

    if local_exit=false then
     begin
      SetLength(derevo.nodes,der_length_begore+1);
      new_node_indx:=der_length_begore;
      derevo.nodes[der_length_begore]:=TDerevoNode.Create;
     end;
    Result:=new_node_indx;
    derevo.nodes[new_node_indx].Clear;
    //<add new node as a child
    derevo.nodes[new_node_indx].parent_node:=start_from_node;
    SetLength(derevo.nodes[start_from_node].childrens,
       num_childrens_before+1);
    derevo.nodes[start_from_node].childrens[num_childrens_before]:=
       new_node_indx;
    //>add new node as a child
   end;
 end;

procedure Derevo_Create;
 begin
  derevo.Create;
 end;

function proizvesti_shag_igrovogo_polya
   (novaya_tochka : TMove): boolean;//okruzhilos_li_novoe
 var
  pole_vneshnej_zakraski ,pole_vnutrennej_zakraski : array of array of boolean;
  i,j : integer;
  vspomogatelnaya_tochka:TMove;
  player_to_PaperPoint:TPaperPoint; //1 if red, 2 if blue
  krasili_sharuzh_li : boolean; //vo vneshnej zakraske
  krasili_iznutri_li :boolean; //smotrim, kogda konchitsya zakraska iznutri
  InCtrl,force_check:boolean;
  a,b,c,d,e,f,g,h:boolean;
//   abc
//   d!e
//   fgh
  function get_killed_TochkaType(byl_tsvet:TPaperPoint; kem:TPaperPoint):TPaperPoint;
   begin
    Result:=byl_tsvet;
    if TPaperPoint_Eq(kem,tt_red) then Result.surrnd:=tts_ByRed;
    if TPaperPoint_Eq(kem,tt_blue) then Result.surrnd:=tts_ByBlue;
   end;
  function get_opponent(you:TPaperPoint):TPaperPoint;
   begin
    Result:=tt_empty;
    if TPaperPoint_Eq(you,tt_red) then Result:=tt_blue
    else if TPaperPoint_Eq(you,tt_blue) then Result:=tt_red;
   end;

 begin
  InCtrl:=TPPoint_In(
    igrovoe_pole.pole[novaya_tochka.koord_x,novaya_tochka.koord_y],
    [tt_RedCtrl,tt_BlueCtrl]);
  if not(TPaperPoint_Eq(
      igrovoe_pole.pole[novaya_tochka.koord_x,novaya_tochka.koord_y]
      ,tt_empty) or InCtrl)
    then
    ErrorLogger.NewMessage(msgs.getLangFile('errorlog\poverx')
      +msgs.ConvertTwoCoordinates_to_string_old(novaya_tochka.koord_x,
      novaya_tochka.koord_y)+')');
  if novaya_tochka.kto_sxodil = true
   then
    igrovoe_pole.pole[novaya_tochka.koord_x,novaya_tochka.koord_y]:=tt_red
   else
    igrovoe_pole.pole[novaya_tochka.koord_x,novaya_tochka.koord_y]:=tt_blue;

  if (novaya_tochka.kto_sxodil)
   then player_to_PaperPoint:=tt_red
   else player_to_PaperPoint:=tt_blue;
  //vrazheskij tsvet = 3-poletsvet
  //5-poletsvet = surrounded by poletsvet

  //<vypolnyat' proverku okruzheniya tolko esli sosedej u novoj tochki>=2
  a:=false;b:=false;c:=false;d:=false;e:=false;f:=false;g:=false;h:=false;
  i:=novaya_tochka.koord_x-1; j:=novaya_tochka.koord_y-1;
  if (i in [0..igrovoe_pole.paper_size_x-1])and(j in [0..igrovoe_pole.paper_size_y-1])
   then a:=TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint);
  i:=novaya_tochka.koord_x; j:=novaya_tochka.koord_y-1;
  if (i in [0..igrovoe_pole.paper_size_x-1])and(j in [0..igrovoe_pole.paper_size_y-1])
   then b:=TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint);
  i:=novaya_tochka.koord_x+1; j:=novaya_tochka.koord_y-1;
  if (i in [0..igrovoe_pole.paper_size_x-1])and(j in [0..igrovoe_pole.paper_size_y-1])
   then c:=TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint);
  i:=novaya_tochka.koord_x-1; j:=novaya_tochka.koord_y;
  if (i in [0..igrovoe_pole.paper_size_x-1])and(j in [0..igrovoe_pole.paper_size_y-1])
   then d:=TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint);
  i:=novaya_tochka.koord_x+1;  j:=novaya_tochka.koord_y;
  if (i in [0..igrovoe_pole.paper_size_x-1])and(j in [0..igrovoe_pole.paper_size_y-1])
   then e:=TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint);
  i:=novaya_tochka.koord_x-1;  j:=novaya_tochka.koord_y+1;
  if (i in [0..igrovoe_pole.paper_size_x-1])and(j in [0..igrovoe_pole.paper_size_y-1])
   then f:=TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint);
  i:=novaya_tochka.koord_x;  j:=novaya_tochka.koord_y+1;
  if (i in [0..igrovoe_pole.paper_size_x-1])and(j in [0..igrovoe_pole.paper_size_y-1])
   then g:=TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint);
  i:=novaya_tochka.koord_x+1;  j:=novaya_tochka.koord_y+1;
  if (i in [0..igrovoe_pole.paper_size_x-1])and(j in [0..igrovoe_pole.paper_size_y-1])
   then h:=TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint);
  force_check:=false;
  if control_players_stupidity[(not novaya_tochka.kto_sxodil)]=true then
   begin
    force_check:=true;
    control_players_stupidity[(not novaya_tochka.kto_sxodil)]:=false;
   end;
  if (not force_check) and
    not((b and f and (not d)) or(b and h and (not e))
    or(d and c and (not b)) or(d and h and (not g))
    or(g and a and (not d)) or(g and c and (not e))
    or(e and a and (not b)) or(e and f and (not g))
    or(d and e and (not b) and (not g)) or(b and g and (not d) and (not e))
    or(a and h) or(f and c)
    or(a and f and (not d)) or(f and h and (not g))
    or(c and a and (not b)) or(c and h and (not e))) then
   begin Result:=false; end
  //>vypolnyat' proverku okruzheniya tolko esli sosedej u novoj tochki>=2
   else begin
    //<vneshnyaya zakraska -
    //krasim ot perimetra polya k tsentru.
    //smotrim, okruzhilsya li vrag..
    SetLength(pole_vneshnej_zakraski,igrovoe_pole.paper_size_x,igrovoe_pole.paper_size_y);
    SetLength(pole_vnutrennej_zakraski,igrovoe_pole.paper_size_x,igrovoe_pole.paper_size_y);
    for i:=0 to igrovoe_pole.paper_size_x-1 do
      for j:=0 to igrovoe_pole.paper_size_y-1 do
       begin
        pole_vnutrennej_zakraski[i,j]:=false;
        pole_vneshnej_zakraski[i,j]:=false;
       end; //obnulili

    //<oboshli pole po perimetru i pokrasili
    for i:= 0 to igrovoe_pole.paper_size_x-1 do
      if not TPaperPoint_Eq(igrovoe_pole.pole[i,0],player_to_PaperPoint)
       then pole_vneshnej_zakraski[i,0]:=true;
    for i:= 0 to igrovoe_pole.paper_size_x-1 do
      if not TPaperPoint_Eq(igrovoe_pole.pole[i,igrovoe_pole.paper_size_y-1],player_to_PaperPoint)
       then pole_vneshnej_zakraski[i,igrovoe_pole.paper_size_y-1]:=true;
    for j:=0 to igrovoe_pole.paper_size_y-1 do
      if not TPaperPoint_Eq(igrovoe_pole.pole[0,j],player_to_PaperPoint)
       then pole_vneshnej_zakraski[0,j]:=true;
    for j:=0 to igrovoe_pole.paper_size_y-1 do
      if not TPaperPoint_Eq(igrovoe_pole.pole[igrovoe_pole.paper_size_x-1,j],player_to_PaperPoint)
       then pole_vneshnej_zakraski[igrovoe_pole.paper_size_x-1,j]:=true;
    //>oboshli pole po perimetru i pokrasili

     //<puskaem volnu zalivki s kraev k tsentru
     repeat
      krasili_sharuzh_li:=false;
      for i:=1 to igrovoe_pole.paper_size_x-2 do
        for j:=1 to igrovoe_pole.paper_size_y-2 do
          begin
            if (pole_vneshnej_zakraski[i,j]=false) and
              (not TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint)) and (
              (pole_vneshnej_zakraski[i-1,j]=true) or
              (pole_vneshnej_zakraski[i+1,j]=true) or
              (pole_vneshnej_zakraski[i,j-1]=true) or
              (pole_vneshnej_zakraski[i,j+1]=true) ) then
             begin
               krasili_sharuzh_li:=true;
               pole_vneshnej_zakraski[i,j]:=true;
             end;
          end;
     until krasili_sharuzh_li=false;
     //>puskaem volnu zalivki s kraev k tsentru
    //>END vneshnaya zakraska.

    //<vydelyaem novye zaxvachennye tochki
    Result:=false;
    for i:=1 to igrovoe_pole.paper_size_x-2 do
      for j:=1 to igrovoe_pole.paper_size_y-2 do
       begin
        if TPaperPoint_Eq(igrovoe_pole.pole[i,j]
            ,get_opponent(player_to_PaperPoint)) //vrazheskij tsvet
            and (pole_vneshnej_zakraski[i,j]=false) then
          begin
            Result:=true;
            pole_vnutrennej_zakraski[i,j]:=true;
          end;
        if TPaperPoint_Eq(igrovoe_pole.pole[i,j],tt_empty)
            and (pole_vneshnej_zakraski[i,j]=false) then
          if player_to_PaperPoint.player=ttp_red
            then igrovoe_pole.pole[i,j]:=tt_RedCtrl
            else igrovoe_pole.pole[i,j]:=tt_BlueCtrl
       end;
    //>END vydelyaem novye zaxvachennye tochki

    //<vydelyaem novye zaxvachennye oblasti
    if Result=true then
     begin
      repeat
        krasili_iznutri_li:=false;
        for i:=1 to igrovoe_pole.paper_size_x-2 do
          for j:=1 to igrovoe_pole.paper_size_y-2 do
            if (pole_vnutrennej_zakraski[i,j]=false) and
              (not TPaperPoint_Eq(igrovoe_pole.pole[i,j],player_to_PaperPoint)) and
              ((pole_vnutrennej_zakraski[i-1,j]=true) or
              (pole_vnutrennej_zakraski[i+1,j]=true) or
              (pole_vnutrennej_zakraski[i,j-1]=true) or
              (pole_vnutrennej_zakraski[i,j+1]=true)  )
             then begin
              pole_vnutrennej_zakraski[i,j]:=true;
              krasili_iznutri_li:=true;
             end;
      until krasili_iznutri_li=false;
      for i:=0 to igrovoe_pole.paper_size_x-1 do
       begin
        pole_vneshnej_zakraski[i,0]:=true;
        pole_vneshnej_zakraski[i,igrovoe_pole.paper_size_y-1]:=true;
       end;
      for j:=0 to igrovoe_pole.paper_size_y-1 do
       begin
        pole_vneshnej_zakraski[0,j]:=true;
        pole_vneshnej_zakraski[igrovoe_pole.paper_size_x-1,j]:=true;
       end;
      repeat
        krasili_sharuzh_li:=false;
        for i:=1 to igrovoe_pole.paper_size_x-2 do
        for j:=1 to igrovoe_pole.paper_size_y-2 do
         begin
          if (pole_vnutrennej_zakraski[i,j]=false)
            and(pole_vneshnej_zakraski[i,j]=false)
            and((pole_vneshnej_zakraski[i-1,j]=true)
            or(pole_vneshnej_zakraski[i+1,j]=true)
            or(pole_vneshnej_zakraski[i,j-1]=true)
            or(pole_vneshnej_zakraski[i,j+1]=true)) then
           begin
            krasili_sharuzh_li:=true;
            pole_vneshnej_zakraski[i,j]:=true;
           end;
         end;
      until krasili_sharuzh_li=false;
      for i:=0 to igrovoe_pole.paper_size_x-1 do
      for j:=0 to igrovoe_pole.paper_size_y-1 do
        if pole_vneshnej_zakraski[i,j]=false then
         begin
          igrovoe_pole.pole[i,j]:=get_killed_TochkaType(igrovoe_pole.pole[i,j],player_to_PaperPoint);
         end;
     end;
    //>vydelyaem novye zaxvachennye oblasti
   end;//zashita ot duraka (kogda stavish v oblast' opponenta)

  //<soedinyaem novuju tochku s sosedyami
  i:=novaya_tochka.koord_x; j:=novaya_tochka.koord_y;
  if i>=1 then
    if (igrovoe_pole.connects.field[i,j]<>igrovoe_pole.connects.field[i-1,j])
        and TPaperPoint_Eq(igrovoe_pole.pole[i,j],igrovoe_pole.pole[i-1,j]) then
     begin
      vspomogatelnaya_tochka:=novaya_tochka;
      vspomogatelnaya_tochka.koord_x:=vspomogatelnaya_tochka.koord_x-1;
      igrovoe_pole.connects.AddPair(novaya_tochka,vspomogatelnaya_tochka);
     end;
  if j>=1 then
    if (igrovoe_pole.connects.field[i,j]<>igrovoe_pole.connects.field[i,j-1])
        and TPaperPoint_Eq(igrovoe_pole.pole[i,j],igrovoe_pole.pole[i,j-1]) then
     begin
      vspomogatelnaya_tochka:=novaya_tochka;
      vspomogatelnaya_tochka.koord_y:=vspomogatelnaya_tochka.koord_y-1;
      igrovoe_pole.connects.AddPair(novaya_tochka,vspomogatelnaya_tochka);
     end;
  if i<=igrovoe_pole.paper_size_x-1-1 then
    if (igrovoe_pole.connects.field[i,j]<>igrovoe_pole.connects.field[i+1,j])
        and TPaperPoint_Eq(igrovoe_pole.pole[i,j],igrovoe_pole.pole[i+1,j]) then
     begin
      vspomogatelnaya_tochka:=novaya_tochka;
      vspomogatelnaya_tochka.koord_x:=vspomogatelnaya_tochka.koord_x+1;
      igrovoe_pole.connects.AddPair(novaya_tochka,vspomogatelnaya_tochka);
     end;
  if j<=igrovoe_pole.paper_size_y-1-1 then
    if (igrovoe_pole.connects.field[i,j]<>igrovoe_pole.connects.field[i,j+1])
        and TPaperPoint_Eq(igrovoe_pole.pole[i,j],igrovoe_pole.pole[i,j+1]) then
     begin
      vspomogatelnaya_tochka:=novaya_tochka;
      vspomogatelnaya_tochka.koord_y:=vspomogatelnaya_tochka.koord_y+1;
      igrovoe_pole.connects.AddPair(novaya_tochka,vspomogatelnaya_tochka);
     end;
  //>END soedinyaem novuju tochku s sosedyami

  control_players_stupidity[(novaya_tochka.kto_sxodil)]:=
      control_players_stupidity[(novaya_tochka.kto_sxodil)]
      or ((InCtrl)and(Result=false));

  if Result=true then
   begin
//    igrovoe_pole.RecalculateSurroundings;
    //<pereshityvaem palochki
    i:=length(igrovoe_pole.surroundings)-1;
    if i>=0 then
     begin
      for j:=0 to length(igrovoe_pole.surroundings[i].path)-1-1 do
       begin
        igrovoe_pole.connects.convert_T1toT2(
            igrovoe_pole.surroundings[i].path[j].X,
            igrovoe_pole.surroundings[i].path[j].Y,
            igrovoe_pole.surroundings[i].path[j+1].X,
            igrovoe_pole.surroundings[i].path[j+1].Y);
       end;
     end;
    for i:=0 to length(igrovoe_pole.connects.pairs)-1 do
     begin
      vspomogatelnaya_tochka:=igrovoe_pole.connects.pairs[i].t1;
      if igrovoe_pole.pole[vspomogatelnaya_tochka.koord_x,
          vspomogatelnaya_tochka.koord_y].surrnd in [tts_ByBlue,tts_ByRed] then
       begin
        igrovoe_pole.connects.pairs[i].removed:=true;
       end;
     end;
    //>pereshityvaem palochki
   end;

 end;

procedure TablNodes_MakeSelectionVisible;
 var
  new_left_col,new_top_row:word;myrect:TGridRect;
  where_tekushee_mesto_x,where_tekushee_mesto_y:integer;
 begin
  myrect:=Form1.StringGrid_tabl_punktov.Selection;
  where_tekushee_mesto_x:=myrect.Left;
  where_tekushee_mesto_y:=myrect.Top;
  new_left_col:=Form1.StringGrid_tabl_punktov.LeftCol;
  new_top_row:=Form1.StringGrid_tabl_punktov.TopRow;

  if where_tekushee_mesto_x>=Form1.StringGrid_tabl_punktov.LeftCol+
     (Form1.StringGrid_tabl_punktov.VisibleColCount-1) then
   begin
    new_left_col:=where_tekushee_mesto_x-
       (Form1.StringGrid_tabl_punktov.VisibleColCount-1);
   end;
  if where_tekushee_mesto_x<new_left_col then
    new_left_col:=where_tekushee_mesto_x;

  if where_tekushee_mesto_y>=Form1.StringGrid_tabl_punktov.TopRow+
     (Form1.StringGrid_tabl_punktov.VisibleRowCount-1) then
   begin
    new_top_row:=where_tekushee_mesto_y-
       (Form1.StringGrid_tabl_punktov.VisibleRowCount-1);
   end;
  if where_tekushee_mesto_y<new_top_row then
    new_top_row:=where_tekushee_mesto_y;

  Form1.StringGrid_tabl_punktov.LeftCol:=new_left_col;
  Form1.StringGrid_tabl_punktov.TopRow:=new_top_row;
  Form1.StringGrid_tabl_punktov.Update;
 end;

constructor TTableNodes.Create;
 begin
  inherited;
  SetLength(nodes,0);
  StringGrid:=@Form1.StringGrid_tabl_punktov;
 end;

procedure TTableNodes.MakeVisible(x,y:integer);
 var
  new_left_col,new_top_row,kx,ky:word;
 begin
  kx:=x+Self.StringGrid.FixedCols;
  ky:=y+Self.StringGrid.FixedRows;
  new_left_col:=Self.StringGrid.LeftCol;
  new_top_row:=Self.StringGrid.TopRow;
  if kx>=Self.StringGrid.LeftCol+
     (Self.StringGrid.VisibleColCount-1) then
   begin
    new_left_col:=kx-(Self.StringGrid.VisibleColCount-1);
   end;
  if kx<new_left_col then new_left_col:=kx;

  if ky>=Self.StringGrid.TopRow+
     (Self.StringGrid.VisibleRowCount-1) then
   begin
    new_top_row:=ky-(Self.StringGrid.VisibleRowCount-1);
   end;
  if ky<new_top_row then new_top_row:=ky;

  Self.StringGrid.LeftCol:=new_left_col;
  Self.StringGrid.TopRow:=new_top_row;
  Self.StringGrid.Update;
 end;

procedure TablNodes_pokazat_mestonaxozhdenie;
 var
  i,j:integer;
  myRect: TGridRect;
  where_tekushee_mesto_x,where_tekushee_mesto_y:integer;
 begin
  where_tekushee_mesto_x:=0;
  where_tekushee_mesto_y:=0;
//to kill Delphi's Hint "variable might not have been initialized".

  for i:=0 to Length(TableNodes.nodes)-1 do
    for j:=0 to Length(TableNodes.nodes[0])-1 do
      if TableNodes.nodes[i,j].index=derevo.CurNode then
       begin
        where_tekushee_mesto_x:=i;
        where_tekushee_mesto_y:=j;//pribavka FixedRows dal'she
       end;

  inc(where_tekushee_mesto_x,Form1.StringGrid_tabl_punktov.FixedCols);
  inc(where_tekushee_mesto_y,Form1.StringGrid_tabl_punktov.FixedRows);
  myRect.Left := where_tekushee_mesto_x;
  myRect.Top := where_tekushee_mesto_y;
  myRect.Right := where_tekushee_mesto_x;
  myRect.Bottom := where_tekushee_mesto_y;
  Form1.StringGrid_tabl_punktov.Selection := myRect;
  TablNodes_MakeSelectionVisible;
 end;

procedure TTableNodes.recalculate_CurDerevoNode;
 begin
  Self.CurDer_x:=derevo.nodes[derevo.CurNode].tbl_x;
  Self.CurDer_y:=derevo.nodes[derevo.CurNode].tbl_y;
 end;

procedure TTableNodes.Make_CurDerevoNode_Visible;
 begin
  Self.recalculate_CurDerevoNode;
  Self.MakeVisible(Self.CurDer_x,Self.CurDer_y);
 end;
procedure TTableNodes.Select_CurDerevoNode;
 var GridRect:TGridRect;
 begin
  Self.recalculate_CurDerevoNode;
  GridRect.Left:=CurDer_x+Self.StringGrid.FixedCols;
  GridRect.Right:=GridRect.Left;
  GridRect.Top:=CurDer_y+Self.StringGrid.FixedRows;
  GridRect.Bottom:=GridRect.Top;
  Self.StringGrid.Selection:=GridRect;
  Self.MakeVisible(Self.CurDer_x,Self.CurDer_y);
 end;
procedure TTableNodes.recalculate_CurSelection;
 begin
  Self.sel_x:=Self.StringGrid.Selection.Left-
      Self.StringGrid.FixedCols;
  Self.sel_y:=Self.StringGrid.Selection.Top-
      Self.StringGrid.FixedRows;
 end;

procedure Check_TablPunktov_ContainsCommentGeneralized;
 var
  i,j:word;
 begin
  for i:=0 to Length(TableNodes.nodes)-1 do
    for j:=0 to Length(TableNodes.nodes[0])-1 do
      with TableNodes.nodes[i,j] do
       begin
        if index>=0 then
          contains_comment:=derevo.nodes[index].ContainsComment
          else contains_comment:=false;
       end;
  Form1.StringGrid_tabl_punktov.Update;
 end;

procedure FocusOn_TablPunktov;
 begin
  with Form1 do
   begin
    TabSheet_derevo_osnovnoe.PageControl.ActivePageIndex:=
       TabSheet_derevo_osnovnoe.PageIndex;
    if (StringGrid_tabl_punktov.CanFocus) and (Form1.Active)
       then StringGrid_tabl_punktov.SetFocus;
   end;
 end;


procedure TTableNodes.recalculate_structure;
  procedure recalculate_tabl_nodes;
   procedure NodeAdd_WithAllChildrens_Recursive (koord_x,koord_y,index:integer);
    procedure check_for_tabl_increase(max_x,max_y:integer);
     begin
      if (max_x>length(TableNodes.nodes)-1) or (max_y>length(TableNodes.nodes[0])-1)
       then
        SetLength(TableNodes.nodes,
           max(max_x+1,length(TableNodes.nodes)),
           max(max_y+1,length(TableNodes.nodes[0])));
     end;
    var
     i:integer;
     send_next_x,send_next_y:integer;
     cur_x,cur_y:integer;
    begin
     TableNodes.nodes[koord_x,koord_y].index:=index;
     derevo.nodes[index].tbl_x:=koord_x;
     derevo.nodes[index].tbl_y:=koord_y;
     if (koord_x>=1)and(koord_y>=1) then
        if TableNodes.nodes[koord_x-1,koord_y].index=0 then
      begin
       cur_x:=koord_x-1;
       cur_y:=koord_y;
       TableNodes.nodes[cur_x,cur_y].index:=-2;
       while (cur_y>1) and (TableNodes.nodes[cur_x,cur_y-1].index=0) do
        begin
         Dec(cur_y);
         TableNodes.nodes[cur_x,cur_y].index:=-5;
        end;
       if TableNodes.nodes[cur_x,cur_y-1].index=-2 then
        TableNodes.nodes[cur_x,cur_y-1].index:=-3;
      end;
     for i:=0 to length(derevo.nodes[index].childrens)-1 do
      begin
       send_next_x:=koord_x+1;
       if send_next_x>=xodov_maximum
        then ErrorLogger.NewMessage('Превышено xodov_maximum');
       send_next_y:=koord_y;
       check_for_tabl_increase(send_next_x,send_next_y);
       if send_next_y>=vetvej_maximum
        then ErrorLogger.NewMessage('Превышено vetvej_maximum');
       while (TableNodes.nodes[send_next_x,send_next_y].index<>0) do
        begin
         inc(send_next_y);
         check_for_tabl_increase(send_next_x,send_next_y);
         if send_next_y>=vetvej_maximum
          then ErrorLogger.NewMessage('Превышено vetvej_maximum');
        end;
       NodeAdd_WithAllChildrens_Recursive(send_next_x,send_next_y,
          derevo.nodes[index].childrens[i]);
      end;
    end;

   var
    i,j:integer;
   begin
    SetLength(TableNodes.nodes,1,1);
    NodeAdd_WithAllChildrens_Recursive(0,0,0);
    ErrorLogger.Check_forNewMessages;

    Form1.StringGrid_tabl_punktov.ColCount:=length(TableNodes.nodes);
    Form1.StringGrid_tabl_punktov.RowCount:=length(TableNodes.nodes[0])+
       Form1.StringGrid_tabl_punktov.FixedRows;

    for i:=0 to Length(TableNodes.nodes)-1 do
      for j:=0 to Length(TableNodes.nodes[0])-1 do
       begin
        if (TableNodes.nodes[i,j].index=0) and ((i<>0)or(j<>0))
         then TableNodes.nodes[i,j].index:=-1;
       end;
    Check_TablPunktov_ContainsCommentGeneralized;
    Form1.StringGrid_tabl_punktov.Repaint;
   end;
 begin
  recalculate_tabl_nodes;
 end;


function TColor_InMyProgram.get_red;
 begin
   get_red:=color shr 0;
 end;
function TColor_InMyProgram.get_green;
 begin
   get_green:=color shr 8;
 end;
function TColor_InMyProgram.get_blue;
 begin
   get_blue:=color shr 16;
 end;
function TColor_InMyProgram.calculate_medium_color;
 begin
   Result:=RGB( (get_red(color1)+get_red(color2)) shr 1,
       ( get_green(color1)+get_green(color2)) shr 1,
       ( get_blue(color1)+get_blue(color2)) shr 1 );
 end;
function TColor_InMyProgram.color_contrast_to;
 begin
  if get_red(color_ident)+get_green(color_ident)+get_blue(color_ident)<250
   then Result:=clWhite
   else result:=clBlack;
 end;
function TColor_InMyProgram.light_red;
 begin Result:=calculate_medium_color(cred,cbackground); end;
function TColor_InMyProgram.light_blue;
 begin Result:=calculate_medium_color(cblue,cbackground); end;

procedure TPaperVisual.recalculate_ShagSetkiPixels_tochki;
  function GetMaximum_ShagSetkiPixels : integer;
   begin
    Result:=min(
        floor(Form1.Panel_IgrovoePole.Width/igrovoe_pole.paper_size_x),
        floor(Form1.Panel_IgrovoePole.Height/igrovoe_pole.paper_size_y));
    Result:=max(Result,8);
   end;
 begin
  shag_setki_pixels:=GetMaximum_ShagSetkiPixels;
  svobodnoe_pole:=(shag_setki_pixels shr 1);
  razmer_tochki:=
     ((shag_setki_pixels*Form1.TrackBar_razm_tochk.Position)
     div Form1.TrackBar_razm_tochk.Max)+1;
  razmer_tochki:=max(razmer_tochki,5);
  Form1.Shape_last_turn.Width:=razmer_tochki+4;
  Form1.Shape_last_turn.Height:=razmer_tochki+4;
  Form1.navodka_shape.Width:=5;//max((shag_setki_pixels shr 2)+1,4);
  Form1.navodka_shape.Height:=Form1.navodka_shape.Width;
  liniya_soedineniya_shirina:=razmer_tochki div 4;
 end;

procedure pokazat_chej_xod;
 begin
  if sejchas_xodit then
   begin
    Form1.GroupBox_PlayerRed.Caption:=msgs.getLangFile('i1 now');
    Form1.GroupBox_PlayerBlue.Caption:=msgs.getLangFile('i2');
   end else begin
    Form1.GroupBox_PlayerRed.Caption:=msgs.getLangFile('i1');
    Form1.GroupBox_PlayerBlue.Caption:=msgs.getLangFile('i2 now');
   end;
  if sejchas_xodit then
   begin
    Form1.navodka_shape.Brush.Color:=colors_my.calculate_medium_color(colors_my.cred,colors_my.cbackground);
    Form1.navodka_shape.Pen.Color:=colors_my.calculate_medium_color(colors_my.cred,colors_my.cbackground);
   end;
  if not sejchas_xodit then
   begin
    Form1.navodka_shape.Brush.Color:=colors_my.light_blue;
    Form1.navodka_shape.Pen.Color:=colors_my.light_blue;
   end;
 end;

procedure TPaperVisual.new_connection(new_con_x,new_con_y,shift_x,shift_y:integer;
   red_or_blue: boolean);
 var curcolor:TColor;
 begin
  with Self.img.Canvas do
   begin
    if red_or_blue=true then curcolor:=colors_my.cred else curcolor:=colors_my.cblue;
    if Form1.CheckBox_black_border.Checked=true then curcolor:=clblack;
    Pen.Color:=curcolor;
    Pen.Width:=liniya_soedineniya_shirina;
    MoveTo(coord_to_point(new_con_x),coord_to_point(new_con_y));
    LineTo(coord_to_point(new_con_x+shift_x),coord_to_point(new_con_y+shift_y));
    Pen.Width:=1;
   end;
 end;

procedure TPaperVisual.new_oreol(new_point_x,new_point_y :integer; new_point_type:TPaperPoint);
 var
  color_zashtrix,light_red,light_blue:TColor;
  radius:integer;
 begin
  color_zashtrix:=clBlack;//Debug
  light_red:=colors_my.light_red;// calculate_medium_color(colors_my.cred,colors_my.cbackground);
  light_blue:=colors_my.light_blue;// calculate_medium_color(colors_my.cblue,colors_my.cbackground);

  if TPaperPoint_Eq(new_point_type,tt_BlueByRed) then color_zashtrix:=light_red;
  if TPaperPoint_Eq(new_point_type,tt_RedByBlue) then color_zashtrix:=light_blue;
  if  (TPaperPoint_Eq(new_point_type,tt_BlueByRed))
      or(TPaperPoint_Eq(new_point_type,tt_RedByBlue)) then
    with Form1.Image_pole.Canvas do
     begin
//      radius:=floor(shag_setki_pixels/sqrt(2))+1;
      radius:=floor(shag_setki_pixels/2)+1;
      Pen.Style:=psClear;
      Brush.Color:=color_zashtrix;
      Brush.Style:=bsDiagCross;
      Ellipse(
      coord_to_point(new_point_x)-radius ,
      coord_to_point(new_point_y)-radius ,
      coord_to_point(new_point_x)+radius+2 ,
      coord_to_point(new_point_y)+radius+2);
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
     end;

 end;

procedure TPaperVisual.new_point(new_point_x,new_point_y:integer;new_point_type:TPaperPoint);
 procedure draw_new_point_distributed(color_center,color_kraj:TColor;
    use_PointBorder:boolean);
  begin
   with Form1.image_pole.Canvas do
    begin
     Brush.Color:=color_center;
     if Form1.CheckBox_black_border.Checked
      then
       Pen.Color:=clBlack
      else
       Pen.Color:=color_kraj;
     if use_PointBorder=false then Pen.Style:=psClear;
     Ellipse(
     coord_to_point(new_point_x)-(razmer_tochki shr 1) ,
     coord_to_point(new_point_y)-(razmer_tochki shr 1) ,
     coord_to_point(new_point_x)+((razmer_tochki+1) shr 1) ,
     coord_to_point(new_point_y)+((razmer_tochki+1) shr 1));
     if use_PointBorder=false then Pen.Style:=psSolid;
    end;
  end;
 var
  light_red,light_blue:TColor;
  color_center,color_kraj:TColor;
  use_PointBorder:boolean;
 begin
  if new_point_type.player=ttp_empty then exit;

  light_red:=colors_my.light_red;// calculate_medium_color(colors_my.cred,colors_my.cbackground);
  light_blue:=colors_my.light_blue;// calculate_medium_color(colors_my.cblue,colors_my.cbackground);
  if Form1.CheckBox_black_border.Checked then
   begin
    if colors_my.cred=clwhite then light_red:=clMenu;
    if colors_my.cblue=clWhite then light_blue:=clMenu;
   end;

  color_center:=clWhite;//Debug
  color_kraj:=clWhite;//Debug
  if new_point_type.surrnd=tts_none then
   begin
    if new_point_type.player=ttp_red then
     begin
      color_center:=colors_my.cred;
      color_kraj:=light_red;
     end;
    if new_point_type.player=ttp_blue then
     begin
      color_center:=colors_my.cblue;
      color_kraj:=light_blue;
     end;
    use_PointBorder:=true;
   end else begin
    if new_point_type.player=ttp_red
      then color_center:=light_red
      else color_center:=light_blue;
    color_kraj:=color_center;
    use_PointBorder:=true;
   end;

  draw_new_point_distributed(color_center,color_kraj,use_PointBorder);
 end;

procedure TPaperVisual.prorisovat;
 type t_pole_zakraski= array of array of boolean;
 const granitsa_polya_width=1;
 var
//  myrect:TRect;
  surr_path:TSurroundingPath;
  light_red,light_blue:TColor;

  procedure clear_paper;
   begin
    with Form1 do
     begin
      image_pole.Width := shag_setki_pixels * (igrovoe_pole.paper_size_x );
      image_pole.Height :=shag_setki_pixels * (igrovoe_pole.paper_size_y );
      Image_pole.Picture.Bitmap.Width:=Image_pole.Width;
      Image_pole.Picture.Bitmap.Height:=Image_pole.Height;

      Image_pole_vneshnee.Width:=Image_pole.Width;
      Image_pole_vneshnee.Height:=Image_pole.Height;
      Image_pole_vneshnee.Picture.Bitmap.Width:=Image_pole_vneshnee.Width;
      Image_pole_vneshnee.Picture.Bitmap.Height:=Image_pole_vneshnee.Height;

      image_pole.Canvas.Brush.Color:=colors_my.cbackground;
      image_pole.Canvas.Pen.Color:=colors_my.color_contrast_to(colors_my.cbackground);
      Image_pole.Canvas.Pen.Width:=-1+granitsa_polya_width*2;
//      myrect.Left:=0; myrect.Top:=0; myrect.Right:=Image_pole.Width; myrect.Bottom:=Image_pole.Height;
//      image_pole.Canvas.DrawFocusRect(myrect);
      Image_pole.Canvas.Rectangle(0,0,image_pole.Width,image_pole.Height);
      Image_pole.Canvas.Pen.Width:=1;
      //I don't know how  to fast clear the Image.. Used canvas.rectangle.
     end;
   end;

  procedure draw_lines;
   var
    i,j:integer;
   begin
    with Form1.Image_pole.Canvas do
     begin
      Pen.Width:=1;
      Pen.Color:=colors_my.csetka_lines;
      Pen.Mode:=pmCopy;
      Brush.Color:=colors_my.csetka_lines;
      Brush.Style:=bsSolid;

      for i:=0 to igrovoe_pole.paper_size_x-1 do
       begin
        MoveTo(coord_to_point(i),granitsa_polya_width);
        LineTo(coord_to_point(i),Form1.image_pole.Height-granitsa_polya_width);
       end;
      for j:=0 to igrovoe_pole.paper_size_y-1 do
       begin
        MoveTo(granitsa_polya_width,coord_to_point(j));
        LineTo(Form1.image_pole.Width-granitsa_polya_width,coord_to_point(j));
       end;
     end;
   end;

  procedure draw_coordinates;
   var
    i,j:integer;
    str:string;
   begin
    with Form1.Image_pole.Canvas do
     begin
      Pen.Width:=1;
      Pen.Color:=colors_my.color_contrast_to(colors_my.cbackground);
      Pen.Mode:=pmBlack;
      Brush.Color:=colors_my.cbackground;
      Brush.Style:=bsClear;
      Font.Height:=shag_setki_pixels;

      for i:=0 to igrovoe_pole.paper_size_x-1 do
       begin
        str:=msgs.ConvertCoordinate_to_string(i);
        TextOut(coord_to_point(i)-(TextWidth(str)div 2)
            ,coord_to_point(0)-(TextHeight(str)div 2),str);
       end;
      for j:=0 to igrovoe_pole.paper_size_y-1 do
       begin
        str:=msgs.ConvertCoordinate_to_string(j);
        TextOut(coord_to_point(0)-(TextWidth(str)div 2)
            ,coord_to_point(j)-(TextHeight(str)div 2),str);
       end;
      Pen.Mode:=pmCopy;
      Brush.Style:=bsSolid;
     end;
   end;

  procedure draw_connections;
   var
    i,j:integer;
    cur_connection:TConnection;

   begin
    if Form1.RadioGroup_ConnectType.ItemIndex=1 then exit;

    if Form1.RadioGroup_ConnectType.ItemIndex=0 then
     begin
      for i:=0 to length(igrovoe_pole.connects.pairs)-1 do
       begin
        cur_connection:=igrovoe_pole.connects.pairs[i];
        if cur_connection.removed=false
         then
          paper.new_connection(
              cur_connection.t1.koord_x,
              cur_connection.t1.koord_y,
              cur_connection.t2.koord_x-cur_connection.t1.koord_x,
              cur_connection.t2.koord_y-cur_connection.t1.koord_y,
              cur_connection.t1.kto_sxodil);
       end;
     end;

    //<gorisontal'ki
    for i:=0 to igrovoe_pole.paper_size_x-2 do
      for j:=0 to igrovoe_pole.paper_size_y-1 do
        begin
        if TPaperPoint_Eq(igrovoe_pole.pole[i,j],igrovoe_pole.pole[i+1,j])
           and (igrovoe_pole.pole[i,j].surrnd=tts_none)
           and (igrovoe_pole.pole[i,j].player in [ttp_blue,ttp_red])
           and ((Form1.RadioGroup_ConnectType.ItemIndex=2)) then
         begin
          paper.new_connection(i,j,+1,0,igrovoe_pole.pole[i,j].player=ttp_red);
         end;
       end;
    //>goris
    //<vertikal'ki
    for i:=0 to igrovoe_pole.paper_size_x-1 do
      for j:=0 to igrovoe_pole.paper_size_y-2 do
       begin
        if TPaperPoint_Eq(igrovoe_pole.pole[i,j],igrovoe_pole.pole[i,j+1])
           and (igrovoe_pole.pole[i,j].surrnd=tts_none)
           and (igrovoe_pole.pole[i,j].player in [ttp_blue,ttp_red])
           and ((Form1.RadioGroup_ConnectType.ItemIndex=2)) then
         begin
          paper.new_connection(i,j,0,+1,igrovoe_pole.pole[i,j].player=ttp_red);
         end;
       end;
    //>vertikali
   end;

  procedure draw_surroundings(draw_Pen,draw_Brush:boolean);
   var i,j:integer;
   begin
    for j:=0 to length(igrovoe_pole.surroundings)-1 do
     begin
      surr_path:=igrovoe_pole.Clone_OneSurr(j);
      for i:=0 to length(surr_path.path)-1 do
       begin
        surr_path.path[i].X:=surr_path.path[i].X*shag_setki_pixels+svobodnoe_pole;
        surr_path.path[i].Y:=surr_path.path[i].Y*shag_setki_pixels+svobodnoe_pole;
       end;
      with Form1.Image_pole.Canvas do
       begin
        Pen.Width:=liniya_soedineniya_shirina;
        if draw_Pen=true
          then Pen.Style:=psSolid
          else Pen.Style:=psClear;
        if surr_path.color=true then
         begin
          if Form1.RadioGroup_SurroundType.ItemIndex in [1,2]
            then Brush.Color:=light_red
            else Brush.Color:=colors_my.calculate_medium_color(light_red,colors_my.cbackground);
          Pen.Color:=colors_my.cred;
          Brush.Style:=bsFDiagonal;
         end else begin
          if Form1.RadioGroup_SurroundType.ItemIndex in [1,2]
            then Brush.Color:=light_blue
            else Brush.Color:=colors_my.calculate_medium_color(light_blue,colors_my.cbackground);
          Pen.Color:=colors_my.cblue;
          Brush.Style:=bsBDiagonal;
         end;
        if Form1.RadioGroup_SurroundType.ItemIndex=0 then Brush.Style:=bsSolid;
        if draw_Brush=false then Brush.Style:=bsClear;
        if Form1.CheckBox_black_border.Checked then
         begin
          Brush.Color:=colors_my.calculate_medium_color(clGray,Brush.Color);
          Pen.Color:=clblack;
         end;
        Polygon(surr_path.path);
        Brush.Style:=bsSolid;
        Pen.Style:=psSolid;
        Pen.Width:=1;
       end;
     end;
   end;

  procedure draw_nodes;
   var i,j:integer;
   begin
    for i:=0 to igrovoe_pole.paper_size_x-1 do for j:=0 to igrovoe_pole.paper_size_y-1 do
     begin
      paper.new_point(i,j,igrovoe_pole.pole[i,j]);
     end;
   end;
  procedure draw_oreoly;
   var i,j:integer;
   begin
    for i:=0 to igrovoe_pole.paper_size_x-1 do for j:=0 to igrovoe_pole.paper_size_y-1 do
     begin
      paper.new_oreol(i,j,igrovoe_pole.pole[i,j]);
     end;
   end;

 begin
  light_red:=colors_my.light_red;// calculate_medium_color(colors_my.cred,colors_my.cbackground);
  light_blue:=colors_my.light_blue;// calculate_medium_color(colors_my.cblue,colors_my.cbackground);
  clear_paper;

  if (Form1.RadioGroup_SurroundType.ItemIndex in [1,2]) then
   begin
    draw_lines;
    if Form1.RadioGroup_SurroundType.ItemIndex=2 then draw_oreoly;
    draw_surroundings(true,true);
    draw_connections;
    draw_nodes;
    if Form1.CheckBox_ShowCoordinates.Checked then
      begin
      draw_coordinates;
      end;
   end;

  if (Form1.RadioGroup_SurroundType.ItemIndex=0) then
   begin
    draw_surroundings(false,true);
    draw_lines;
    draw_connections;
    draw_surroundings(true,false);
    draw_nodes;
    if Form1.CheckBox_ShowCoordinates.Checked then
      begin
      draw_coordinates;
      end;
   end;
 end;

procedure Execute_Property(
   prop:TDerevoNodeProperty;last_turn:boolean);

 var
  nam,val,cur_str:string;
  tochka:TMove;
  i,j:integer; cur_rect:TRect;
  SZ_changed:boolean;
 begin
  nam:=msgs.Get_Upcase(prop.name);
  val:=prop.value;
  if last_turn=false then
   begin
    if (nam='SZ') then
     begin
      SZ_changed:=(igrovoe_pole.paper_size_x<>msgs.ConvertString_to_Coordinates(val).koord_x)
         or(igrovoe_pole.paper_size_y<>msgs.ConvertString_to_Coordinates(val).koord_y);
      if SZ_changed then
       begin
        igrovoe_pole.paper_size_x:=msgs.ConvertString_to_Coordinates(val).koord_x;
        igrovoe_pole.paper_size_y:=msgs.ConvertString_to_Coordinates(val).koord_y;
        igrovoe_pole.Clear;
        paper.prorisovat_full;
        Extract_ComboBox_RazmerPolya_ItemIndex;
        sejchas_xodit:=Form1.ComboBox_RazmerPolya.ItemIndex=3;
        pokazat_chej_xod;
       end;
     end;
    if (nam='R')or(nam='AR')or(nam='W')or(nam='AW') then
     begin
      tochka.kto_sxodil:=true;
      tochka.koord_x:=msgs.ConvertString_to_Coordinates(val).koord_x;
      tochka.koord_y:=msgs.ConvertString_to_Coordinates(val).koord_y;
      sejchas_xodit:=proizvesti_shag_igrovogo_polya(tochka) and igrovoe_pole.dop_xod
     end;
    if (nam='B')or(nam='AB') then
     begin
      tochka.kto_sxodil:=false;
      tochka.koord_x:=msgs.ConvertString_to_Coordinates(val).koord_x;//StrToInt(copy(val,1,2));
      tochka.koord_y:=msgs.ConvertString_to_Coordinates(val).koord_y;//StrToInt(copy(val,4,2));
      sejchas_xodit:=not( proizvesti_shag_igrovogo_polya(tochka)and igrovoe_pole.dop_xod)
     end;
    if (nam='PR')or(nam='PW') then
     begin
      Form1.edit_imya_red.Text:=val;
     end;
    if (nam='PB') then
     Form1.edit_imya_blue.Text:=val;
   end;

  if last_turn=true then
   begin
    if nam='C' then
     begin
//      current_memo_comments.Text:=current_memo_comments.Text+val;
      current_memo_comments.Add(val);
     end;

    if (nam='TR')or(nam='SQ')or(nam='CR')or(nam='LB') then
     begin
      with Form1.Image_pole_vneshnee do
       begin
        Tag:=1;
        i:=paper.coord_to_point(msgs.ConvertString_to_Coordinates(val).koord_x);
        j:=paper.coord_to_point(msgs.ConvertString_to_Coordinates(val).koord_y);
        cur_rect.Left:=i-svobodnoe_pole;
        cur_rect.Top:=j-svobodnoe_pole;
        cur_rect.Right:=i+svobodnoe_pole;
        cur_rect.Bottom:=j+svobodnoe_pole;
        if nam='TR' then Canvas.StretchDraw(cur_rect,bitmap_triangle);
        if nam='SQ' then Canvas.StretchDraw(cur_rect,bitmap_square);
        if nam='CR' then Canvas.StretchDraw(cur_rect,bitmap_circle);
        cur_str:=msgs.Get_After1Chast(val);
        if nam='LB' then Canvas.TextOut(
           i-(Canvas.TextWidth(cur_str)div 2)
           ,j-(Canvas.TextHeight(cur_str)div 2),cur_str);
       end;
     end;
    if (nam='B') or (nam='R')or(nam='W') then
     begin
      with Form1 do
       begin
        Shape_last_turn.Left:=
            paper.coord_to_point(msgs.ConvertString_to_Coordinates(val).koord_x)
            -(Shape_last_turn.Width shr 1);
        Shape_last_turn.Top:=
            paper.coord_to_point(msgs.ConvertString_to_Coordinates(val).koord_y)
            -(Shape_last_turn.Height shr 1);
        if (nam='R')or(nam='W') then
         begin
          Shape_last_turn.Pen.Color:=colors_my.cred;
          last_turn_global.kto_sxodil:=true;
         end
         else begin
          Shape_last_turn.Pen.Color:=colors_my.cblue;
          last_turn_global.kto_sxodil:=false;
         end;
        if CheckBox_black_border.Checked then Shape_last_turn.Pen.Color:=clblack;
        last_turn_global.koord_x:=msgs.ConvertString_to_Coordinates(val).koord_x;
        last_turn_global.koord_y:=msgs.ConvertString_to_Coordinates(val).koord_y;
        Shape_last_turn.Visible:=(CheckBox_showLabels.Checked=false);
       end;
     end;
   end;
  if nam='AN' then Form1.LabeledEdit_commentator.Text:=val;
 end;



procedure Execute_NodeProperties(index:integer);
 var
  i:integer;
 begin
  for i:=0 to Length(derevo.nodes[index].pr_array)-1 do
   begin
    Execute_Property(derevo.nodes[index].pr_array[i],
       false);
   end;
 end;

procedure Execute_NodeProperties_VisualOnly(index:integer);
 var i:integer;
 begin
  with Form1 do
   begin
    if Image_pole_vneshnee.Tag<>0 then
     begin
      Image_pole_vneshnee.Canvas.Brush.Color:=clWhite;
      Image_pole_vneshnee.Canvas.Pen.Color:=clWhite;
      image_pole_vneshnee.Canvas.Rectangle(-1,-1,
         Image_pole_vneshnee.Width+1,
         Image_pole_vneshnee.Height+1);
      Image_pole_vneshnee.Canvas.Font.Height:=shag_setki_pixels;
     end;
//    TabSheet_zadachnik.TabVisible:=CheckBox_zadosostavitel.Checked;
    memo_comments.Lines:=TStringList.Create;
    Shape_last_turn.Visible:=false;
   end;
  current_memo_comments:=TStringList.Create;
  Form1.Shape_memo_help.Visible:=false;
  for i:=0 to Length(derevo.nodes[index].pr_array)-1 do
   begin
    Execute_Property(derevo.nodes[index].pr_array[i],true);
   end;

  CommentChange_from_jump:=true;
  Form1.memo_comments.Text:=current_memo_comments.Text;
  CommentChange_from_jump:=false;
  current_memo_comments.Clear;
 end;

procedure TPaperVisual.prorisovat_full;
 begin
  paper.ReCalculate_ShagSetkiPixels_tochki;
  paper.prorisovat;
//  Execute_NodeProperties_VisualOnly(derevo.CurNode);
  Form1.Shape_last_turn.Left:=
     paper.coord_to_point(last_turn_global.koord_x)
     -(Form1.Shape_last_turn.Width shr 1);
  Form1.Shape_last_turn.Top:=
     paper.coord_to_point(last_turn_global.koord_y)
     -(Form1.Shape_last_turn.Height shr 1);
 end;

procedure Derevo_JumpToNode_Immediate(node_index:integer);
 var
  nodes_seq : array of word;
  nodes_seq_MaxElem,i : integer;
  local_exit:boolean;
  current_node:Integer;
 begin
  derevo.CurNode:=node_index;
  igrovoe_pole.ClearSurroundings;
  current_node:=node_index;
  sejchas_xodit:=(Form1.ComboBox_RazmerPolya.ItemIndex=3);
  nodes_seq_MaxElem:=-1;
  local_exit:=false;
  while local_exit=false do
   begin
    inc(nodes_seq_MaxElem);
    SetLength(nodes_seq,nodes_seq_MaxElem+1);
    nodes_seq[nodes_seq_MaxElem]:=current_node;
    if (current_node>0)
     then
      current_node:=derevo.nodes[current_node].parent_node
     else
      local_exit:=true;
   end;
  igrovoe_pole.Clear;

  for i:=nodes_seq_MaxElem downto 0 do
   begin
    Execute_NodeProperties(nodes_seq[i]);
   end;

  Execute_NodeProperties_VisualOnly(nodes_seq[0]);
  if derevo.nodes[node_index].ContainsName('C')//and
    then Form1.TabSheet_comments.PageControl.ActivePageIndex:=
      Form1.TabSheet_comments.PageIndex;

  igrovoe_pole.RecalculateSurroundings;
  paper.prorisovat;
  pokazat_chej_xod;
  ErrorLogger.Check_forNewMessages;
  TableNodes.ShowHint_OnCurrentSelection;
 end;


procedure Derevo_JumpToNode_Slow(node_index:integer);
 begin
  if derevoJump_inBuffer=false then
   begin
    Derevo_JumpToNode_Immediate(node_index);
    derevoJump_inBuffer:=true;
   end else begin
    tabl_nodes_needs_jump:=true;
    derevo_jump_where:=node_index;
   end;
 end;

procedure TablNodes_FocusOnPos(coord_x,coord_y:integer);
//uses this procedure wher moving through table of nodes
 begin
  TableNodes.SelectTablNode(coord_x,coord_y);
  if TableNodes.nodes[coord_x,coord_y].index>=0 then
    Derevo_JumpToNode_Slow(TableNodes.nodes[coord_x,coord_y].index);
//  TableNodes.ShowHint_OnCurrentSelection;
 end;

procedure DerevoJump_ToParent;
 begin
  if derevo.CurNode>0 then
   begin
    derevo.CurNode:=derevo.nodes[derevo.CurNode].parent_node;
    Derevo_JumpToNode_Slow(derevo.CurNode);
    TablNodes_pokazat_mestonaxozhdenie;
   end
 end;


procedure DerevoJump_ToFirstChild;
 begin
  if length(derevo.nodes[derevo.CurNode].childrens)>=1 then
   begin
    derevo.CurNode:=derevo.nodes[derevo.CurNode].childrens[0];
    Derevo_JumpToNode_Slow(derevo.CurNode);
    TablNodes_pokazat_mestonaxozhdenie;
   end
 end;


procedure DerevoJump_PageDown;
 var
  x,y,i,j,cur_indx,cur_indx2:integer;
  contains_comment,local_exit,has_children:boolean;
 begin
  x:=Form1.StringGrid_tabl_punktov.Selection.Left;
  y:=Form1.StringGrid_tabl_punktov.Selection.Top
      -Form1.StringGrid_tabl_punktov.FixedRows;
  i:=x; j:=y+1;
  local_exit:=false;
  cur_indx:=0; //for Delphi debug
  while (i<=length(TableNodes.nodes)-1)and(local_exit=false) do
   begin
    while (j<=length(TableNodes.nodes[0])-1)and(local_exit=false) do
     begin
      cur_indx:=TableNodes.nodes[i,j].index;
      if cur_indx>=0 then
       begin
        contains_comment:=derevo.nodes[cur_indx].ContainsComment;
        has_children:=length(derevo.nodes[cur_indx].childrens)>=2;
        local_exit:=contains_comment or has_children;
       end;
      inc(j);
     end;
    inc(i); j:=0;
   end;
  if local_exit=true then
   begin
    derevo.CurNode:=cur_indx;
    Derevo_JumpToNode_Immediate(derevo.CurNode);
    TablNodes_pokazat_mestonaxozhdenie;
   end else begin
    i:=length(TableNodes.nodes)-1;
    cur_indx2:=0;//for Delphi debug
    for j:=0 to length(TableNodes.nodes[0])-1 do
     begin
      cur_indx:=TableNodes.nodes[i,j].index;
      if cur_indx>0 then cur_indx2:=cur_indx;
     end;
    if cur_indx2<>derevo.CurNode then
     begin
      derevo.CurNode:=cur_indx2;
      Derevo_JumpToNode_Immediate(derevo.CurNode);
      TablNodes_pokazat_mestonaxozhdenie;
     end;
   end;
 end;

procedure DerevoJump_PageUp;
 var
  x,y,i,j,cur_indx:integer;
  contains_comment,local_exit,has_children:boolean;
 begin
  x:=Form1.StringGrid_tabl_punktov.Selection.Left;
  y:=Form1.StringGrid_tabl_punktov.Selection.Top
      -Form1.StringGrid_tabl_punktov.FixedRows;
  i:=x; j:=y-1;
  local_exit:=false;
  cur_indx:=0; //for Delphi debug
  while (i>=0)and(local_exit=false) do
   begin
    while (j>=0)and(local_exit=false) do
     begin
      cur_indx:=TableNodes.nodes[i,j].index;
      if cur_indx>=0 then
       begin
        contains_comment:=derevo.nodes[cur_indx].ContainsComment;
        has_children:=length(derevo.nodes[cur_indx].childrens)>=2;
        local_exit:=contains_comment or has_children;
       end;
      dec(j);
     end;
    dec(i); j:=length(TableNodes.nodes[0])-1;
   end;
  if local_exit=true then
   begin
    derevo.CurNode:=cur_indx;
    Derevo_JumpToNode_Immediate(derevo.CurNode);
    TablNodes_pokazat_mestonaxozhdenie;
   end else begin
    if (x<>0)or(y<>0) then
     begin
      derevo.CurNode:=0;
      Derevo_JumpToNode_Immediate(derevo.CurNode);
      TablNodes_pokazat_mestonaxozhdenie;
     end;
   end;
 end;

procedure DerevoJump_StraightDown;
 begin
  with TableNodes do
   begin
    if sel_y<length(TableNodes.nodes[0])-1 then
     begin
      inc(sel_y);
      TablNodes_FocusOnPos(sel_x,sel_y);
     end;
   end;
 end;

procedure DerevoJump_StraightUp;
 begin
  if TableNodes.sel_y>0 then
   begin
    dec(TableNodes.sel_y);
    TablNodes_FocusOnPos(TableNodes.sel_x,TableNodes.sel_y);
   end;
 end;


procedure DerevoJump_Right(is_straight:boolean);
 var
  sel_indx,child_node:integer;
  go_straight,has_chidrens:boolean;
 begin
  with TableNodes do
   begin
    sel_indx:=nodes[sel_x,sel_y].index;
    if sel_indx>=0
      then has_chidrens:=length(derevo.nodes[sel_indx].childrens)>0
      else has_chidrens:=false;
    go_straight:=(is_straight=true)or(has_chidrens=false)or(sel_indx<=0);
    if go_straight then
     begin
      if sel_x<length(nodes)-1 then
       begin
        inc(sel_x);
        TablNodes_FocusOnPos(sel_x,sel_y);
       end;
     end else begin
      child_node:=derevo.nodes[sel_indx].childrens[0];
      TablNodes_FocusOnPos(
        derevo.nodes[child_node].tbl_x,
        derevo.nodes[child_node].tbl_y);
     end;
   end;
 end;

procedure DerevoJump_Left(is_straight:boolean);
 var
  parent_node,sel_indx:integer;
  go_straight:boolean;
 begin
  with TableNodes do
   begin
    sel_indx:=nodes[sel_x,sel_y].index;
    go_straight:=(sel_indx<=0)or(is_straight=true);
    if go_straight then
     begin
      if sel_x>0 then
       begin
        dec(sel_x);
        TablNodes_FocusOnPos(sel_x,sel_y);
       end;
     end else begin
      parent_node:=derevo.nodes[sel_indx].parent_node;
      TablNodes_FocusOnPos(
        derevo.nodes[parent_node].tbl_x,
        derevo.nodes[parent_node].tbl_y);
     end;
   end;
 end;

procedure DerevoJump_NeighbourChild(is_up:boolean);
 var
  parent_node:integer;
  what_children_am_i_for_parent, and_what_i_should_be:integer; // :)
 begin
  if derevo.CurNode>0 then
   begin
    parent_node:=derevo.nodes[derevo.CurNode].parent_node;
    if Length(derevo.nodes[parent_node].childrens)>=2 then
     begin
      what_children_am_i_for_parent:=0;
      while derevo.nodes[parent_node].
         childrens[what_children_am_i_for_parent]<>derevo.CurNode
       do
        inc(what_children_am_i_for_parent);
      and_what_i_should_be:=0;
      if not is_up then
        if what_children_am_i_for_parent=
           length(derevo.nodes[parent_node].childrens)-1
         then and_what_i_should_be:=0
         else and_what_i_should_be:=what_children_am_i_for_parent+1;
      if is_up then
        if what_children_am_i_for_parent=0
         then and_what_i_should_be:=
            length(derevo.nodes[parent_node].childrens)-1
         else and_what_i_should_be:=what_children_am_i_for_parent-1;
      derevo.CurNode:=derevo.nodes[parent_node].
         childrens[and_what_i_should_be];
      Derevo_JumpToNode_Immediate(derevo.CurNode);
      TablNodes_pokazat_mestonaxozhdenie;
     end;
   end;
 end;

procedure DerevoJump_NextChild;
 begin
  DerevoJump_NeighbourChild(false);
 end;

procedure DerevoJump_PrevChild;
 begin
  DerevoJump_NeighbourChild(true);
 end;

procedure DerevoJump_Down(is_straight:boolean);
 var tabl_x,tabl_y:integer;
 begin
  tabl_x:=TableNodes.sel_x;
  tabl_y:=TableNodes.sel_y;
  if (TableNodes.nodes[tabl_x,tabl_y].index<>derevo.CurNode)
      or (derevo.CurNode=0) then
   begin
    DerevoJump_StraightDown;
   end else begin
    if (length(derevo.nodes[
        derevo.nodes[derevo.CurNode].parent_node
        ].childrens)-1>
        derevo.index_in_ParentNode(derevo.CurNode))
        and (not is_straight)
      then DerevoJump_NextChild
      else DerevoJump_StraightDown;
   end;
 end;

procedure DerevoJump_Up(is_straight:boolean);
 var selX,selY:integer;
 begin
  selX:=TableNodes.sel_x;
  selY:=TableNodes.sel_y;
  if (TableNodes.nodes[selX,selY].index<>derevo.CurNode)
      or (derevo.CurNode=0) then
   begin
    DerevoJump_StraightUp;
   end else begin
    if (derevo.index_in_ParentNode(derevo.CurNode)>0)
        and (not is_straight)
      then DerevoJump_PrevChild
      else DerevoJump_StraightUp;
   end;
 end;


function preobrazovat_skobki_v_slesh (str : string): string;
var
  j : integer;
  otvet : string;
begin
j:=length(str);
while j>=1 do
  begin
  otvet:=str[j]+otvet;
  if (str[j]=']') or (str[j]='\') then otvet:='\'+otvet;
  dec(j);
  end;
Result:=otvet;
end;

function TFileWork.save_vpoints_string:WideString;
 var
  nodes_file_structure:array of integer;
  current_node_For_recursion:integer;
  cur_line:string;

  procedure calculate_order_of_nodes_recursive(indx:integer);
  //ordrer of nodes in the file
  //(As function: position in file -> position in derevo.nodes)
   var
    i:integer;
   begin
    nodes_file_structure[current_node_For_recursion]:=indx;
    inc(current_node_For_recursion);
    for i:=0 to (Length(derevo.nodes[indx].childrens)-1) do
      calculate_order_of_nodes_recursive(
         derevo.nodes[indx].childrens[i]);
   end;
  procedure AddLine_EmptyCurString;
   begin
    if cur_line<>'' then
     begin
      cur_line:=cur_line+#13#10;
      Result:=Result+cur_line;
      cur_line:='';
     end;
   end;
 var
  node_number,property_number:integer;
  i:integer;
  index_in_file:integer;
  previous_name:string;
 const
  line_max_length=75;
 begin
  Result:='';
  cur_line:='';
  SetLength(nodes_file_structure,length(derevo.nodes));
  current_node_For_recursion:=0;
  calculate_order_of_nodes_recursive(0);

  for index_in_file:=0 to Length(derevo.nodes)-1 do
   begin
    node_number:=nodes_file_structure[index_in_file];
    if (node_number<>0)or(index_in_file=0) then
     begin
      if derevo.DerevoNode_IsParenthesesOpened(node_number)
       then cur_line:=cur_line+'(';
      cur_line:=cur_line+';';
      previous_name:='';
      for property_number:=0 to Length(derevo.nodes[node_number].pr_array)-1 do
       begin
        if length(cur_line)+length(preobrazovat_skobki_v_slesh(
           derevo.nodes[node_number].pr_array[property_number].value))>=
           line_max_length then
         begin
          AddLine_EmptyCurString;
         end;
        if previous_name<>derevo.nodes[node_number]
          .pr_array[property_number].name then
         begin
          cur_line:=cur_line+derevo.nodes[node_number].pr_array
             [property_number].name;
         end;
        previous_name:=derevo.nodes[node_number].pr_array
           [property_number].name;
        cur_line:=cur_line+'[';
        cur_line:=cur_line+preobrazovat_skobki_v_slesh(
           derevo.nodes[node_number].pr_array[property_number].value);
        cur_line:=cur_line+']';
        if length(cur_line)>=line_max_length then
         begin
          AddLine_EmptyCurString;
         end else cur_line:=cur_line+' ';
       end;
      for i:=1 to derevo.DerevoNode_NumParenthesesClosed(node_number)
       do begin cur_line:=cur_line+')'; end;
      if (node_number=0) then AddLine_EmptyCurString;
     end;
   end;
  AddLine_EmptyCurString;
 end;


function TDerevo.SaveSubTree;
 var
  nodes_file_structure:array of integer;
  current_node_For_recursion:integer;
  cur_line:string;

  procedure calculate_order_of_nodes_recursive(indx:integer);
  //ordrer of nodes in the file
  //(As function: position in file -> position in derevo.nodes)
   var
    i:integer;
   begin
    nodes_file_structure[current_node_For_recursion]:=indx;
    inc(current_node_For_recursion);
    for i:=0 to (Length(derevo.nodes[indx].childrens)-1) do
      calculate_order_of_nodes_recursive(
         derevo.nodes[indx].childrens[i]);
   end;
  procedure AddLine_EmptyCurString;
   begin
    if cur_line<>'' then
     begin
      cur_line:=cur_line+#13#10;
      Result:=Result+cur_line;
      cur_line:='';
     end;
   end;
 var
  node_number,property_number:integer;
  i:integer;
  index_in_file:integer;
  previous_name:string;
 const
  line_max_length=80;
 begin
  Result:='';
  cur_line:='';
  SetLength(nodes_file_structure,length(derevo.nodes));
  current_node_For_recursion:=0;
  calculate_order_of_nodes_recursive(0);

  for index_in_file:=0 to Length(derevo.nodes)-1 do
   begin
    node_number:=nodes_file_structure[index_in_file];
    if (node_number<>0)or(index_in_file=0) then
     begin
      if derevo.DerevoNode_IsParenthesesOpened(node_number)
       then cur_line:=cur_line+'(';
      cur_line:=cur_line+';';
      previous_name:='';
      for property_number:=0 to Length(derevo.nodes[node_number].pr_array)-1 do
       begin
        if length(cur_line)+length(preobrazovat_skobki_v_slesh(
           derevo.nodes[node_number].pr_array[property_number].value))>=
           line_max_length then
         begin
          AddLine_EmptyCurString;
         end;
        if previous_name<>derevo.nodes[node_number]
          .pr_array[property_number].name then
         begin
          cur_line:=cur_line+derevo.nodes[node_number].pr_array
             [property_number].name;
         end;
        previous_name:=derevo.nodes[node_number].pr_array
           [property_number].name;
        cur_line:=cur_line+'[';
        cur_line:=cur_line+preobrazovat_skobki_v_slesh(
           derevo.nodes[node_number].pr_array[property_number].value);
        cur_line:=cur_line+']';
        if length(cur_line)>=line_max_length then
         begin
          AddLine_EmptyCurString;
         end else cur_line:=cur_line+' ';
       end;
      for i:=1 to derevo.DerevoNode_NumParenthesesClosed(node_number)
       do begin cur_line:=cur_line+')'; end;
      if (node_number=0) then AddLine_EmptyCurString;
     end;
   end;
  AddLine_EmptyCurString;
 end;

procedure TDerevo.SaveSubTree_toFile;
 var
  output_file:tstrings;
 begin
  output_file:=TStringList.Create;
  output_file.Text:=Self.SaveSubTree(from);
  output_file.SaveToFile(filename);
  output_file.Free;
 end;

procedure TFileWork.save_vpoints_file (file_name:string);
 var
  output_file:tstrings;
 begin
  output_file:=TStringList.Create;
  output_file.Text:=save_vpoints_string;
  output_file.SaveToFile(file_name);
  output_file.Free;
 end;

procedure TFileWork.delete_autosave;
 begin
  if FileExists(DirControl.AutosaveFullPath) then
    DeleteFile(DirControl.AutosaveFullPath);
 end;

procedure TDirControl.SetCurFile;
 var cur_str:string;
 begin
  if s=AutosaveFullPath
    then Priv_CurF:=''
    else Priv_CurF:=s;
  if ExtractFileExt(Priv_CurF)='sav' then Priv_CurF:='';

  if Priv_CurF=''
    then cur_str:='no file'
    else cur_str:=s;
  Form_main^.Caption:=cur_str+' - [VPoints '
      +DateToStr(date_build,my_DateTime_format)+']';
 end;


procedure TDerevo.save_autosave;
 begin
  FileControl.save_vpoints_file(DirControl.AutosaveFullPath);
 end;


procedure Derevo_Delete_Subtree;
 begin
  if derevo.CurNode=0 then
   begin
    msgs.showFile('derevoTopDelete');
    Form1.Action_NewFileExecute(nil);
   end else begin
    if msgs.ShowBoolDialog('Будет удалена '+
    'эта вершина дерева вместе со всеми ответвлениями. \n'+'Удалить?') then
     begin
      TableNodes.freezed:=true;
      derevo.CurNode:=derevo.DeleteNode_WithChildrens_GiveNewIndx(derevo.CurNode);
      TableNodes.recalculate_structure;
      TableNodes.freezed:=false;
      TablNodes_pokazat_mestonaxozhdenie;
      Derevo_JumpToNode_Immediate(derevo.CurNode);
      TableNodes.StringGrid.Repaint;
      derevo.save_autosave;
     end;
   end;
 end;

procedure Derevo_CreateEmptyChild_JupmToIt;
 var prop:TDerevoNodeProperty;
 begin //sozdat' novoe otvetvlenie
  TableNodes.freezed:=true;
  prop.name:='';
  prop.value:='';
  derevo.CurNode:=derevo.AddNode_GiveNewIndx(
     derevo.CurNode);
  derevo.save_autosave;
  TableNodes.recalculate_structure;
  TableNodes.freezed:=false;
  TableNodes.StringGrid.Repaint;
  TablNodes_pokazat_mestonaxozhdenie;
  Execute_NodeProperties_VisualOnly(derevo.CurNode);
 end;

procedure NewGame_NoRules;
 begin
  DirControl.current_file:='';
  derevo.CurNode:=0;
  derevo.Clear;
  Form1.StringGrid_tabl_punktov.ColCount:=1;
  Form1.StringGrid_tabl_punktov.RowCount:=1
     +Form1.StringGrid_tabl_punktov.FixedRows;
  igrovoe_pole.Clear;
  TableNodes.recalculate_structure;
end;

procedure NewGame_WithRules;
 var
  pro:TDerevoNodeProperty;
 begin
  NewGame_NoRules;
  pro.name:='GM'; pro.value:='40';
  derevo.nodes[0].AddProperty(pro,false);
  pro.name:='FF'; pro.value:='4';
  derevo.nodes[0].AddProperty(pro,false);
  pro.name:='CA'; pro.value:='CP1251';
  derevo.nodes[0].AddProperty(pro,false);
  pro.name:='RU'; pro.value:='russian';
  derevo.nodes[0].AddProperty(pro,false);
  if derevo.nodes[0].ContainsName('AP')=false then
   begin
    pro.name:='AP'; pro.value:='vpoints:'+IntToStr(date_build);
    derevo.nodes[0].AddProperty(pro,false);
   end;
  pro.name:='PW'; pro.value:='';
  derevo.Add_GameProperty(pro);
  pro.name:='PB'; pro.value:='';
  derevo.Add_GameProperty(pro);
  pro.name:='AN'; pro.value:='';
  derevo.Add_GameProperty(pro);
  pro.name:='DTDT'; pro.value:=DateToStr(Date,my_DateTime_format);
  derevo.nodes[0].AddProperty(pro,false);
  pro.name:='DTTM'; pro.value:=TimeToStr(Time,my_DateTime_format);
  derevo.nodes[0].AddProperty(pro,false);
  pro.name:='SZ'; pro.value
      :=msgs.ConvertTwoCoordinates_to_string_PolishSZ(igrovoe_pole.paper_size_x,igrovoe_pole.paper_size_y);
  derevo.Add_GameProperty(pro);
  sejchas_xodit:=(Form1.ComboBox_RazmerPolya.ItemIndex=3);
  pokazat_chej_xod;
  if form_created then paper.prorisovat;
 end;

function TFileWork.FileAgeDT;
 begin
  Result:=FileDateToDateTime(FileAge(file_inp));
 end;

procedure TFileWork.open_pointsxt220_pchar(var f:pchar;num_bytes:integer);

 function turn_to_PosInFile(turn:integer):integer;
  begin Result:=58-13+13*turn; end;

 var
  i,cur_mesto:integer;
  pro:TDerevoNodeProperty;
  imya_red,imya_blue:string;
 begin
  if num_bytes<27 then
   begin
    ErrorLogger.NewMessage(msgs.getLangFile('corruptFile'));
   end;
  ErrorLogger.Check_forNewMessages;
  assert(num_bytes>=27);

  imya_red:='';
  for i:=11 to 19 do
    if f[i]<>' ' then
      imya_red:=imya_red+f[i];

  imya_blue:='';
  for i:=20 to 28 do
    if f[i]<>' ' then
      imya_blue:=imya_blue+f[i];

  igrovoe_pole.paper_size_x:=razmery_polya[3].razmer_x;
  igrovoe_pole.paper_size_y:=razmery_polya[3].razmer_y;
  NewGame_WithRules;
  pro.name:='PW'; pro.value:=imya_red;
  derevo.Add_GameProperty(pro);
  pro.name:='PB'; pro.value:=imya_blue;
  derevo.Add_GameProperty(pro);
  pro.name:='RUAT'; pro.value:='0';
  derevo.Add_GameProperty(pro);
  Extract_ComboBox_RazmerPolya_ItemIndex;
  paper.ReCalculate_ShagSetkiPixels_tochki;

  derevo.CurNode:=0;
  while turn_to_PosInFile(derevo.CurNode+1)<=num_bytes-1 do
   begin
    derevo.CurNode:=derevo.AddNode_GiveNewIndx(derevo.CurNode);
    cur_mesto:=turn_to_PosInFile(derevo.CurNode);
    if f[cur_mesto+3]=#$ff then pro.name:='W' else pro.name:='B';
    pro.value:=msgs.ConvertTwoCoordinates_to_string(ord(f[cur_mesto]),ord(f[cur_mesto+1]));
    derevo.nodes[derevo.CurNode].AddProperty(pro,false);
   end;

  derevo.CurNode:=0;
  TableNodes.recalculate_structure;
  Derevo_JumpToNode_Immediate(0);
 end;

procedure TFileWork.open_pointsxt220_file(file_name:string);
 var
  file_handle:THandle;
  file_buffer:PChar;
  file_length:Integer;
  bytes_read:Integer;
 begin
  try
    file_handle:=FileOpen(file_name,fmOpenRead);
    file_length:=FileSeek(file_handle,0,2);
    FileSeek(file_handle,0,0);
    file_buffer:=pchar(AllocMem(file_length+1));
    bytes_read:=FileRead(file_handle,file_buffer^,file_length);
    FileClose(file_handle);
    open_pointsxt220_pchar(file_buffer,bytes_read);
    derevo.Add_GameProperty_byNameVal
        ('DTDT',DateToStr(FileAgeDT(file_name),my_DateTime_format));
  finally
    FreeMem(file_buffer);
  end;
 end;


function TFileWork.open_vpoints_IsCorrect(var file_as_string:string):boolean;
 //true if correct, false if incorrect
 var i:integer;
 begin
  Result:=true;

  i:=1;
  while (i<=length(file_as_string)) and(file_as_string[i]in[' ',#13,#10]) do
   begin inc(i); end;
  if i<>1 then delete(file_as_string,1,i-1);

  if (copy(file_as_string,1,1)<>'(')
   then Result:=false
   else begin
    i:=1+1;
    while (i<=length(file_as_string)) and(file_as_string[i]in[' ',#13,#10]) do
     begin inc(i); end;
    if (copy(file_as_string,i,1)<>';')
     then Result:=false;
   end;
 end;


procedure TFileWork.open_vpoints_string;
  var
   file_max_indx:integer;
   Pointer_to_PosInFile:integer;
   current_node_indx:integer;
   node_indx_increased_by_bracket:boolean;
   cur_simbol:string;
   cur_prop:TDerevoNodeProperty;
   local_exit:boolean;
   skobki_zakr:array of Byte; skobki_otrk:array of boolean;
   derevo_max_indx:integer;
   mesta_razvilok:array of Word;
   current_razvilk_indx:smallint;
   prev_node_closed:boolean;
   cur_parent_node,cur_parent_chi_l:word;
   current_state_is_PropertNameReaded:boolean;

  procedure ReadSimbol;
   begin
    if  Pointer_to_PosInFile<file_max_indx then
     begin
      inc(Pointer_to_PosInFile);
      cur_simbol:=file_as_string[Pointer_to_PosInFile];
     end else begin
      cur_simbol:='';
     end;
   end;
  procedure SetLength_Nodes;
   begin
    SetLength(skobki_zakr,current_node_indx+1);
    SetLength(skobki_otrk,current_node_indx+1);
    SetLength(derevo.nodes,current_node_indx+1);
    derevo.nodes[current_node_indx]:=TDerevoNode.Create;
   end;
  procedure Convert_Property_toNewFormat(var prop_to_conv:TDerevoNodeProperty);
   var
    cur_tochka:TMove;
    After1Chast:string;
   begin
    with prop_to_conv do
     begin
      if name='DT' then name:='DTDT';
      if name='PR' then name:='PW';
      if (name='AR')
          or(name='R')
          or(name='B')
          or(name='AB')
          or(name='TR')
          or(name='SQ')
          or(name='SZ')
          or(name='CR') then
       begin
        cur_tochka:=msgs.ConvertString_to_Coordinates(value);
        value:=msgs.ConvertTwoCoordinates_to_string
            (cur_tochka.koord_x,cur_tochka.koord_y);
       end;
      if name='R' then name:='W';
      if name='LB' then
       begin
        After1Chast:=msgs.Get_After1Chast(value);
        cur_tochka:=msgs.ConvertString_to_Coordinates(msgs.Get_1Chast(value));
        value:=msgs.ConvertTwoCoordinates_to_string
            (cur_tochka.koord_x,cur_tochka.koord_y)+':'+After1Chast;
       end;
      if name='SZ' then
       begin
        cur_tochka:=msgs.ConvertString_to_Coordinates(value);
        value:=msgs.ConvertTwoCoordinates_to_string_PolishSZ
            (cur_tochka.koord_x,cur_tochka.koord_y);
       end;
     end;
   end;
 begin
  NewGame_NoRules;
  file_max_indx:=length(file_as_string);
  current_node_indx:=-1;
  SetLength(skobki_zakr,0);
  SetLength(skobki_otrk,0);

  local_exit:=false; current_state_is_PropertNameReaded:=true;
  Pointer_to_PosInFile:=0;
  ReadSimbol;

  while (local_exit=false) and (cur_simbol<>'') do
   begin
    node_indx_increased_by_bracket:=false;
    if (cur_simbol='(') then
     begin
      node_indx_increased_by_bracket:=true;
      inc(current_node_indx);
      SetLength_Nodes;
      skobki_otrk[current_node_indx]:=true;
      ReadSimbol;
     end;
    if cur_simbol=#13 then ReadSimbol;
    if cur_simbol=#10 then ReadSimbol;
    if cur_simbol=' ' then ReadSimbol;
    if cur_simbol=';' then
     begin
      if node_indx_increased_by_bracket=true then
       begin
       end else begin
        inc(current_node_indx);
        SetLength_Nodes;
       end;
      ReadSimbol;
     end;
    if cur_simbol=')' then
     begin
      inc(skobki_zakr[current_node_indx]);
      ReadSimbol;
     end;
    if cur_simbol ='[' then
     begin
      current_state_is_PropertNameReaded:=true;
     end;
    if (cur_simbol>='A') and (cur_simbol<='Z') then
     begin
      //< reading property name
      local_exit:=false;
      cur_prop.name:='';
      while local_exit=false do
       begin
        if (cur_simbol>='A') and (cur_simbol<='Z') then
        cur_prop.name:=cur_prop.name+cur_simbol;
        if (cur_simbol='[') or (cur_simbol='')
         then local_exit:=true
         else ReadSimbol;
       end;
      //> reading name
      current_state_is_PropertNameReaded:=true;
     end;
    if current_state_is_PropertNameReaded=true then
     begin
      current_state_is_PropertNameReaded:=false;
      //reading '['
      if cur_simbol<>'[' then
       begin
        ErrorLogger.NewMessage('Ne najdeno "["');
        ErrorLogger.Check_forNewMessages;
        Application.Terminate;
       end else ReadSimbol;

      //<reading value
      local_exit:=false;
      cur_prop.value:='';
      while local_exit=false do
       begin
        if cur_simbol='\' then
         begin
          ReadSimbol;
          cur_prop.value:=cur_prop.value+cur_simbol;
          ReadSimbol;
         end;
        if (cur_simbol=']') or (cur_simbol='')
         then local_exit:=true
         else begin
          cur_prop.value:=cur_prop.value+cur_simbol;
          ReadSimbol;
         end;
       end;
      //>reading value

      //reading ']'
      if cur_simbol<>']' then
       begin
        ErrorLogger.NewMessage('Ne najdeno "]"');
        ErrorLogger.Check_forNewMessages;
        Application.Terminate;
       end else ReadSimbol;
      Convert_Property_toNewFormat(cur_prop);
      if (cur_prop.name='CA')and(
          (msgs.Get_Upcase(cur_prop.value)='UTF-8')
          or(msgs.Get_Upcase(cur_prop.value)='UTF8') ) then
       begin
        file_as_string:=UTF8Decode(file_as_string);
       end;
      derevo.nodes[current_node_indx].AddProperty(cur_prop,false);
     end;
    local_exit:=(cur_simbol<>'(') and (cur_simbol<>')') and (cur_simbol<>';')
       and (cur_simbol<>'[') and ((cur_simbol<'A')or(cur_simbol>'Z'))
       and (cur_simbol<>#13) and (cur_simbol<>' ');
   end;//global'nyj tsikl
  derevo_max_indx:=current_node_indx;

  //<izvlechenie struktury dereva iz skobok
  SetLength(mesta_razvilok,1);
  mesta_razvilok[0]:=0;
  current_razvilk_indx:=-1;
  prev_node_closed:=false;//?

  for current_node_indx:=0 to derevo_max_indx do
   begin
    if skobki_otrk[current_node_indx]=true then
     begin
      if prev_node_closed=true then
       begin
        inc(current_razvilk_indx);
        SetLength(mesta_razvilok,current_razvilk_indx+2);
       end else begin
        inc(current_razvilk_indx);
        SetLength(mesta_razvilok,current_razvilk_indx+2);
        if current_node_indx>0
         then
          mesta_razvilok[current_razvilk_indx]:=current_node_indx-1
         else
          mesta_razvilok[current_razvilk_indx]:=0;
       end;
      derevo.nodes[current_node_indx].parent_node:=
         mesta_razvilok[current_razvilk_indx];
     end else begin
      derevo.nodes[current_node_indx].parent_node:=current_node_indx-1;
     end;

    cur_parent_node:=derevo.nodes[current_node_indx].parent_node;
    if current_node_indx>0 then
     begin
      cur_parent_chi_l:=length(derevo.nodes[cur_parent_node].childrens);
      setlength(derevo.nodes[cur_parent_node].childrens,cur_parent_chi_l+1);
      derevo.nodes[cur_parent_node].childrens[cur_parent_chi_l]:=
         current_node_indx;
     end;
    dec(current_razvilk_indx,skobki_zakr[current_node_indx]);
    prev_node_closed:=skobki_zakr[current_node_indx]>0;
   end;
  //>END izvlechenie struktury dereva iz skobok
  TableNodes.recalculate_structure;
 end;

procedure TFileWork.open_vpoints_file(file_name:string);
 var
  file_to_open:TStrings;
  file_astext:string;
 begin
  file_to_open:=TStringList.Create;
  file_to_open.LoadFromFile(file_name);
  file_astext:=file_to_open.Text;
  open_vpoints_string(file_astext);
  file_to_open.Free;
 end;

procedure TFileWork.open_vktochki_file(file_name:string);
 begin
  open_vkontakte100_string(
    msgs.loadFromFile(file_name)
  );
 end;

function TFileWork.open_vkontakte_IsCorrect(var file_as_string:string):boolean;
 var i:integer;
 begin
  i:=1;
  while (i<length(file_as_string))
      and(file_as_string[i]in[' ',#13,#10]) do
   begin inc(i); end;
  if i<>1 then delete(file_as_string,1,i-1);
  Result:=(copy(file_as_string,1,3)='1.0');
 end;


procedure TFileWork.open_vkontakte100_OstatochnString(file_as_string:WideString);
 var
  Pointer_to_PosInFile:integer;
  i,current_node_indx,file_max_indx:Integer;
  cur_simbol:string;
  local_exit:boolean;
  cur_prop:TDerevoNodeProperty;
  cur_coord_x,cur_coord_y:byte;
  after_STOP:boolean;
  procedure ReadSimbol;
   begin
    if Pointer_to_PosInFile<file_max_indx then
     begin
      inc(Pointer_to_PosInFile);
      cur_simbol:=file_as_string[Pointer_to_PosInFile];
     end else begin
      cur_simbol:='';
     end;
    if (cur_simbol=' ')or(cur_simbol=#13)or(cur_simbol=#10) then ReadSimbol;
   end;
  function char_to_coord(var_char:char):byte;
   begin
    if (var_char in ['1'..'9'])
     then Result:=ord(var_char)- ord('1')
     else
      if (var_char in ['a'..'z'])
       then Result:=ord(var_char)-ord('a')+9
       else Result:=255;
   end;
 begin
  after_STOP:=false;
  file_max_indx:=Length(file_as_string);
  current_node_indx:=0;
  Pointer_to_PosInFile:=0;
  sejchas_xodit:=false;//vkontakte
  ReadSimbol;
  local_exit:=(cur_simbol='');
  while (local_exit=false) do
   begin
    if ((cur_simbol>='1') and (cur_simbol<='9'))
       or ((cur_simbol>='a') and (cur_simbol<='z')) then
     begin
      current_node_indx:=
         derevo.AddNode_GiveNewIndx(current_node_indx);
      cur_coord_y:=char_to_coord(cur_simbol[1]);
      ReadSimbol;
      cur_coord_x:=char_to_coord(cur_simbol[1]);
      ReadSimbol;
      if sejchas_xodit
       then cur_prop.name:='W'
       else cur_prop.name:='B';
      cur_prop.value:=msgs.ConvertTwoCoordinates_to_string(cur_coord_x,cur_coord_y);
      derevo.nodes[current_node_indx].AddProperty(cur_prop,false);
      if after_STOP=false
       then sejchas_xodit:=not(sejchas_xodit)xor((igrovoe_pole.dop_xod)and(cur_simbol='#'));
     end;
    if (cur_simbol='#') then
     begin
      i:=0;
      repeat
        ReadSimbol;
        if cur_simbol='#'
         then inc(i);
      until (cur_simbol='') or(i=4);
      ReadSimbol;
     end;
    if cur_simbol='0' then
     begin
      after_STOP:=true;
      ReadSimbol; ReadSimbol;
     end;
    local_exit:=(cur_simbol='');
   end;
 end;

procedure TFileWork.open_vkontakte100_string(file_as_string:string);
 var
  i,i2,i3,i4:integer;
  game_version:string;
  game_rules:string;
  cur_name:string;
  enter_simb,imya_red,imya_blue:string;
  pro:TDerevoNodeProperty;
  enter_by_13:boolean;
 begin
  enter_by_13:=(pos(#13#10,msgs.GetStringFromClipBoard)=0);
  if enter_by_13=true
   then enter_simb:=#10
   else enter_simb:=#13#10;
  i:=Pos(enter_simb,file_as_string);
  game_version:=Copy(file_as_string,1,i-1);
  if game_version='1.0' then
   begin
    derevo.new_game_processing:=true;
    TableNodes.freezed:=true;
    i2:=PosEx(enter_simb,file_as_string,i+length(enter_simb));
    cur_name:=copy(file_as_string
       ,i+length(enter_simb),i2-i-length(enter_simb));
    while cur_name[1]in ['0'..'9'] do delete(cur_name,1,1);
    delete(cur_name,1,1);
    imya_blue:=cur_name;

    i3:=PosEx(enter_simb,file_as_string,i2+length(enter_simb));
    cur_name:=copy(file_as_string
       ,i2+length(enter_simb),i3-i2-length(enter_simb));
    while cur_name[1]in ['0'..'9'] do delete(cur_name,1,1);
    delete(cur_name,1,1);
    imya_red:=cur_name;

    i4:=PosEx(enter_simb,file_as_string,i3+length(enter_simb));
    game_rules:=copy(file_as_string
       ,i3+length(enter_simb),i4-i3-length(enter_simb));
    if game_rules[1]='-' then igrovoe_pole.dop_xod:=false;
    if game_rules[1]='+' then igrovoe_pole.dop_xod:=true;
    if game_rules[2]='s' then
     begin igrovoe_pole.paper_size_x:=razmery_polya[0].razmer_x; igrovoe_pole.paper_size_y:=razmery_polya[0].razmer_y; end;
    if game_rules[2]='m' then
     begin igrovoe_pole.paper_size_x:=razmery_polya[1].razmer_x; igrovoe_pole.paper_size_y:=razmery_polya[1].razmer_y; end;
    if game_rules[2]='b' then
     begin igrovoe_pole.paper_size_x:=razmery_polya[2].razmer_x; igrovoe_pole.paper_size_y:=razmery_polya[2].razmer_y; end;
    Extract_ComboBox_RazmerPolya_ItemIndex;

    //<derevo
    NewGame_WithRules;
    pro.name:='PW'; pro.value:=imya_red;
    derevo.Add_GameProperty(pro);
    pro.name:='PB'; pro.value:=imya_blue;
    derevo.Add_GameProperty(pro);
    pro.name:='RUAT'; pro.value:=BoolToStr(igrovoe_pole.dop_xod);
    derevo.Add_GameProperty(pro);
    //>derevo

    open_vkontakte100_OstatochnString(
       copy(file_as_string,
       i4+length(enter_simb),9999));
    TableNodes.freezed:=false;
    TableNodes.recalculate_structure;
    derevo.save_autosave;
    paper.ReCalculate_ShagSetkiPixels_tochki;
    derevo.new_game_processing:=false;
    Derevo_JumpToNode_Immediate(0);
    msgs.showFile('loaded+');
   end else msgs.showFile('loaded-');
 end;


procedure TFileWork.open_SomePointsFormat_file(file_name:string);
 var extension:string;
 begin
  //ugly code: it is copied to/from the procedure that loades a game from the clipboard.
  //check it.
  derevo.CurNode:=0;
  TableNodes.freezed:=true;
  extension := ExtractFileExt(file_name);
  if (extension = '.sgftochki')or(extension='.sgf') then
  begin
    open_vpoints_file(file_name);
    DirControl.current_file:=file_name;
  end else begin
    if extension = '.sav' then
    begin
      open_pointsxt220_file(file_name);
    end else begin
      if extension = '.vktochki' then
      begin
        open_vktochki_file(file_name);
      end
    end
  end;
//  delete_autosave;
  FocusOn_TablPunktov;
  TableNodes.freezed:=false;
  TableNodes.StringGrid.Repaint;
  Derevo_JumpToNode_Immediate(0);
  paper.prorisovat_full;
  pokazat_chej_xod;
  derevo.show_info;
 end;

procedure TFileWork.OpenDialog_execute;
 var do_open:boolean;
 begin
  do_open:=not(FileExists(DirControl.AutosaveFullPath));
  if do_open=false then
    if msgs.ShowBoolDialog('Текущая партия будет потеряна. Продолжить?')
      then do_open:=true;
  if do_open=true then
    if Form1.OpenDialog.Execute then
      open_SomePointsFormat_file(Form1.OpenDialog.FileName);
 end;


function tochki_is_eq(pervaya_tochka:TMove; vtoraya_tochka:TMove):boolean;
var
  bool_cur:boolean;
begin
  if (pervaya_tochka.koord_x = vtoraya_tochka.koord_x) and
      (pervaya_tochka.koord_y = vtoraya_tochka.koord_y) and
      (pervaya_tochka.kto_sxodil = vtoraya_tochka.kto_sxodil) then
    begin
    bool_cur:=true;
    end else bool_cur:=false;
result:=bool_cur;
end;


procedure pokazat_tochku_na_kartinke_iz_memo;
 var
  current_string:string;
  j:integer;
  start_pos:integer;
  current_exit : boolean;
 begin
  current_string:=copy(Form1.memo_comments.Text,Form1.memo_comments.SelStart-5,12);
  start_pos:=-10;
  if (Length(current_string) >=7) then
    begin
    j:=7;
    current_exit:=false;
    while ((j>=1)and (not current_exit)) do
      begin
      if current_string[j]='(' then
        begin
        current_exit:=true;
        start_pos:=j;
        end;
      dec(j);
      end;

    if current_exit then
      begin
      current_string:=copy(current_string,start_pos,7);
      if (current_string[7]=')') and (current_string[4]='-') then
        begin
          try
          Form1.Shape_memo_help.Left:=
            paper.coord_to_point(StrToInt(copy(current_string,2,2)))-
            (Form1.Shape_memo_help.Width shr 1);
          Form1.Shape_memo_help.Top:=
            paper.coord_to_point(StrToInt(copy(current_string,5,2)))-
            (Form1.Shape_memo_help.Height shr 1);
          Form1.Shape_memo_help.Visible:=true;
          except;
          end;
        end else Form1.Shape_memo_help.Visible:=false;
      end else Form1.Shape_memo_help.Visible:=false;
    end else Form1.Shape_memo_help.Visible:=false;
 end;


procedure rewrite_ini;
 var
  ini_file:TMemIniFile;
 begin
  ini_file:=TMemIniFile.Create(DirControl.application+'vpoints.ini');
   try
    ini_file.WriteBool('Form','window maximised'
       ,Form1.WindowState=wsMaximized);
    if (Form1.WindowState<>wsMaximized) then
     begin
       ini_file.WriteInteger('Form','height',Form1.Height);
       ini_file.WriteInteger('Form','width',Form1.Width);
       ini_file.WriteInteger('Form','position on screen x',Form1.Left);
       ini_file.WriteInteger('Form','position on screen y',Form1.Top);
     end;

    ini_file.WriteInteger('Game rules','paper-size-x',igrovoe_pole.paper_size_x);
    ini_file.WriteInteger('Game rules','paper-size-y',igrovoe_pole.paper_size_y);
    ini_file.WriteBool('Game rules','additional surrounding turn',igrovoe_pole.dop_xod);

    ini_file.writeInteger('Graphics','color red',colors_my.cred);
    ini_file.writeInteger('Graphics','color blue',colors_my.cblue);
    ini_file.writeInteger('Graphics','color of paper lines',colors_my.csetka_lines);
    ini_file.writeInteger('Graphics','color background',colors_my.cbackground);
    ini_file.WriteInteger('Graphics','points size',Form1.TrackBar_razm_tochk.Position);
    ini_file.WriteBool('Graphics','black borders for points',Form1.CheckBox_black_border.Checked);
    ini_file.WriteInteger('Graphics','points connect type',Form1.RadioGroup_ConnectType.ItemIndex);
    ini_file.WriteInteger('Graphics','surround type',Form1.RadioGroup_SurroundType.ItemIndex);

    ini_file.WriteString('system','vopoints version',IntToStr(date_build));
    ini_file.WriteInteger('system','vetvej maksimum',vetvej_maximum);
    ini_file.WriteInteger('system','xodov maksimum',xodov_maximum);
    ini_file.WriteString('system','pointsxt home path',Form1.LabeledEdit_dir_pointsxt.Text);
    
    ini_file.WriteInteger('fonts','comments size',Form1.memo_comments.Font.Size);
    ini_file.WriteInteger('fonts','comments charset',Form1.memo_comments.Font.Charset);
    ini_file.WriteString('fonts','comments font name',Form1.memo_comments.Font.Name);

   finally
    ini_file.UpdateFile;
    ini_file.Free;
   end;
 end;

procedure TColor_InMyProgram.apply_colors;
 begin
  with Form1 do
   begin
//    edit_imya_blue.Font.Color:=cblue;
//    edit_imya_red.Font.Color:=cred;
//    edit_imya_red.Color:=color_contrast_to(cred);
//    edit_imya_blue.Color:=color_contrast_to(cblue);
//    Label_imya_red.Color:=cred;
    GroupBox_PlayerRed.Font.Color:=cred;
    GroupBox_PlayerBlue.Font.Color:=cblue;
    Label_color_red.Color:=cred;
    Label_color_red.Font.Color:=color_contrast_to(cred);
    Label_color_blue.Color:=cblue;
    Label_color_blue.Font.Color:=color_contrast_to(cblue);
    Label_color_setka_lines.Color:=csetka_lines;
    Label_color_setka_lines.Font.Color:=color_contrast_to(csetka_lines);
    Label_color_background.Color:=colors_my.cbackground;
    Label_color_background.Font.Color:=color_contrast_to(cbackground);
    if last_turn_global.kto_sxodil=true
     then Shape_last_turn.Pen.Color:=cred
     else Shape_last_turn.Pen.Color:=cblue;
    if Form1.CheckBox_black_border.Checked then Shape_last_turn.Pen.Color:=clblack;
    derevo.show_info;
   end;
  rewrite_ini;
  paper.prorisovat;
  pokazat_chej_xod;
 end;

procedure TPaperVisual.Screenshot_make;
 var
//  jpg_to_save:TJPEGImage;
  source_rect,destination_rect:TRect;
  myimage:TImage;
  i:integer; file_name:string;
  png_image:TPNGObject;
 begin
  with Form1 do
   begin
    if DirectoryExists(DirControl.screenshots_full)=false then
      CreateDir(DirControl.screenshots_full);
    i:=0;
    while FileExists(DirControl.screenshots_full+
       msgs.inttostr_fixed_length(i,3)+ext_png) do
     begin
      inc(i);
     end;
    file_name:=DirControl.screenshots_full+msgs.inttostr_fixed_length(i,3)+ext_png;

    source_rect.Left:=Panel_IgrovoePole.Left;
    source_rect.Top:=Panel_IgrovoePole.Top;
    source_rect.Right:=Panel_IgrovoePole.Left+Image_pole.Width;
    source_rect.Bottom:=Panel_IgrovoePole.Top+Image_pole.Height;

    myimage:=TImage.Create(Form1);
    myimage.Picture.Bitmap.Width:=Image_pole.Width;
    myimage.Picture.Bitmap.Height:=Image_pole.Height;
    destination_rect.Left:=0;destination_rect.Top:=0;
    destination_rect.Right:=Image_pole.Width;
    destination_rect.Bottom:=Image_pole.Height;
    myimage.Canvas.CopyRect(destination_rect,Form1.Canvas,source_rect);

    png_image:=TPNGObject.Create;
    png_image.Assign(myimage.Picture.Bitmap);
    png_image.SaveToFile(file_name);
{    jpg_to_save:=TJPEGImage.Create;
    jpg_to_save.Assign(myimage.Picture.Graphic);
    jpg_to_save.CompressionQuality:=90;
    jpg_to_save.Grayscale:=false;
    jpg_to_save.Compress;
    jpg_to_save.SaveToFile(file_name);
    jpg_to_save.Free;}
    myimage.Free;
    png_image.Free;
    msgs.ShowHint('Сделан скриншот '+file_name);
   end;
 end;

procedure TForm1.WMHotKey (var Msg : TWMHotKey);
 begin
  if (Msg.HotKey = id_SnapShot) then
    paper.Screenshot_make;
 end;

function TForm1.isOpenInputDesktop: boolean;
begin
  //Check if Desktop is not LOCKED!!!!
  result := OpenInputDesktop(0, false,DESKTOP_READOBJECTS) > 0;
end;

procedure MainMenu_RethinkHotkeys_translate(var mn:TMainMenu);
  procedure add_accel(var mi:TMenuItem);
   var
    i,j:integer;
    langString:string;
    langFileName:string;
    set_char: set of Char;
    local_exit:boolean;
    cur_char:Char;
    cur_str:string;
    cur_mi:TMenuItem;
   begin
    set_char:=[];
    for i:=0 to mi.Count-1 do
     begin
      cur_mi:=mi.Items[i];
      //<language
      langFileName:=DirControl.langFull+'mainMenu\'+cur_mi.Name+'.txt';
      if FileExists(langFileName)
      then cur_mi.Caption:=msgs.loadFromFile(langFileName)
      else begin
        langString:=#$ef+#$bb+#$bf+UTF8Encode(cur_mi.Caption);
        msgs.saveToFile(langFileName,langString);
      end;
      //>language
      add_accel(cur_mi);
      local_exit:=false;
      j:=1;
      AnsiReplaceStr(mi[i].Caption,'&','');
      if (not AnsiContainsStr(mi[i].Caption,'&'))
          and (mi[i].Caption<>'-')
          and (mi[i].Enabled=true) then
        while (j<=length(mi[i].Caption))and(local_exit=false) do
         begin
          cur_char:=(AnsiLowerCase(mi[i].Caption[j]))[1];
          if (not(cur_char in set_char))
              and(AnsiUpperCase(cur_char)<>AnsiLowerCase(cur_char)) then
           begin
            set_char:=set_char+[cur_char];
            cur_str:=mi[i].Caption;
            Insert('&',cur_str,j);
            mi[i].Caption:=cur_str;
            local_exit:=true;
           end;
          inc(j);
         end;
     end;
   end;
 var mmi:TMenuItem; //main menu item
 begin
  mmi:=mn.Items[0].Parent;
  add_accel(mmi);
 end;


procedure TForm1.FormCreate(Sender: TObject);
 begin
  Assert(not Scaled, 'TForm.Scaled property sucks, you should set it to False!');
  if Screen.PixelsPerInch <> PixelsPerInch then
  begin
    ScaleBy(Screen.PixelsPerInch, PixelsPerInch);
  end;

  ComboBox_ColorTheme.ItemIndex:=ComboBox_ColorTheme.Items.Count-1;
  DirControl:=TDirControl.Create;
  DirControl.application:=ExtractFilePath(Application.ExeName);
  msgs:=TMessages_my.Create;
  MainMenu_RethinkHotkeys_translate(MainMenu);

{$IFDEF MSWINDOWS}
  RegisterHotKey(Form1.Handle,
      id_SnapShot,
      MOD_CONTROL,
      VK_SNAPSHOT);
{$ENDIF}
 end;

procedure TForm1.FormShow(Sender: TObject);
  function GetPNGasBitmap(img_path:string):TBitmap;
   var CurPng:TPNGObject;
   begin
    Result:=TBitmap.Create;
    CurPng:=TPNGObject.Create;
    CurPng.LoadFromFile(img_path);
    Result.Assign(CurPng);
   end;
 var
  ini_file : tmeminifile;
  file_to_load,str2:string;
  bool:boolean;
 begin
  derevo:=TDerevo.Create;
  igrovoe_pole:=TIgrovoePole.Create;
  FileControl:=TFileWork.Create;
  colors_my:=TColor_InMyProgram.Create;
  WebDownload:=TWebDownload.Create;
  ErrorLogger:=TMyErrorLogger.Create;
  TableNodes:=TTableNodes.Create;

//<read ini file
  ini_file:=TMemIniFile.Create(DirControl.application+'vpoints.ini');
   try
    Form1.Width:= ini_file.ReadInteger('Form','width',860);
    Form1.height:= ini_file.ReadInteger('Form','height',670);
    Form1.Left:=ini_file.ReadInteger('Form','position on screen x',100);
    Form1.Top:=ini_file.ReadInteger('Form','position on screen y',50);
    igrovoe_pole.paper_size_x:=ini_file.ReadInteger('Game rules','paper-size-x',default_paper_size_x);
    if igrovoe_pole.paper_size_x<4 then igrovoe_pole.paper_size_x:=5;
    igrovoe_pole.paper_size_y:=ini_file.ReadInteger('Game rules','paper-size-y',default_paper_size_y);
    if igrovoe_pole.paper_size_y<4 then igrovoe_pole.paper_size_y:=5;
    igrovoe_pole.dop_xod:=ini_file.ReadBool('Game rules','additional surrounding turn',dop_xod_default);

    colors_my.cred:=ini_file.ReadInteger('Graphics','color red',color_red_default);
    colors_my.cblue:=ini_file.ReadInteger('Graphics','color blue',color_blue_default);
    colors_my.csetka_lines:=ini_file.ReadInteger('Graphics','color of paper lines',color_setka_lines_default);
    colors_my.cbackground:=ini_file.ReadInteger('Graphics','color background',color_background_default);
    Form1.TrackBar_razm_tochk.Position:=ini_file.ReadInteger('Graphics','points size',Form1.TrackBar_razm_tochk.Position);
    Form1.CheckBox_black_border.Checked:=ini_file.ReadBool('Graphics','black borders for points',false);
    Form1.RadioGroup_ConnectType.ItemIndex:=ini_file.ReadInteger('Graphics','points connect type',0);
    Form1.RadioGroup_SurroundType.ItemIndex:=ini_file.ReadInteger('Graphics','surround type',0);

    vetvej_maximum:=ini_file.ReadInteger('system','vetvej maksimum',vetvej_maximum_default);
    xodov_maximum:=ini_file.ReadInteger('system','xodov maksimum',xodov_maximum_default);
    DirControl.pointsxt220_HomePath:=
        ini_file.ReadString('system','pointsxt home path',dir_pointsxt220_HomePath);
    if ini_file.ReadBool('Form','window maximised',true)=true
     then
      WindowState:= wsMaximized
     else begin
      WindowState:= wsNormal;
     end;
   finally
    ini_file.Free;
   end;
//>END read ini file

//<obrabotat' informatsiju iz ini
  if DirControl.pointsxt220_HomePath='' then
    DirControl.pointsxt220_HomePath:=dir_pointsxt220_HomePath;
  igrovoe_pole.Clear;
  colors_my.apply_colors;
  igrovoe_pole.dop_xod:=igrovoe_pole.dop_xod;
  svobodnoe_pole := ((shag_setki_pixels+1) shr 1);
  colors_my.apply_colors;
  LabeledEdit_dir_pointsxt.Text:=DirControl.pointsxt220_HomePath;
  paper:=TPaperVisual.Create;
  paper.recalculate_ShagSetkiPixels_tochki;
  ActionList_mainUpdate(TBasicAction.Create(nil),bool);
//>obrabotat' informatsiju iz ini

  Image_pole.Left:=0; Image_pole.Top:=0;
  Image_pole_vneshnee.Left:=image_pole.Left;
  Image_pole_vneshnee.Top:=image_pole.Top;
  Image_pole_vneshnee.Canvas.Font.Size:=16;

  if (DirectoryExists(DirControl.saved_full)=false)
   then CreateDir(DirControl.saved_full);

  Extract_ComboBox_RazmerPolya_ItemIndex;
  SetLength(TablNodes_bitmaps,8);
  TablNodes_bitmaps[0]:=GetPNGasBitmap(DirControl.derevo_images_full+'simple_point.png');
  TablNodes_bitmaps[1]:=GetPNGasBitmap(DirControl.derevo_images_full+'down right.png');
  TablNodes_bitmaps[2]:=GetPNGasBitmap(DirControl.derevo_images_full+'down right down.png');
  TablNodes_bitmaps[3]:=GetPNGasBitmap(DirControl.derevo_images_full+'down down.png');
  TablNodes_bitmaps[4]:=GetPNGasBitmap(DirControl.derevo_images_full+'pusto.png');
  TablNodes_bitmaps[5]:=GetPNGasBitmap(DirControl.derevo_images_full+'kvadrat.png');
  TablNodes_bitmaps[6]:=GetPNGasBitmap(DirControl.derevo_images_full+'red_point.png');
  TablNodes_bitmaps[7]:=GetPNGasBitmap(DirControl.derevo_images_full+'blue_point.png');
  bitmap_triangle:=GetPNGasBitmap(DirControl.metki_polya_full+'triangle.png');
  bitmap_square:=GetPNGasBitmap(DirControl.metki_polya_full+'square.png');
  bitmap_circle:=GetPNGasBitmap(DirControl.metki_polya_full+'circle.png');

  with StringGrid_tabl_punktov do
   begin
    if FixedRows>=1 then RowHeights[0]:=abs(Font.Height)+4;
   end;
  PageControl_nastrojki.ActivePageIndex:=TabSheet_comments.PageIndex;
  PageControl_derevo_xodov.ActivePageIndex:=TabSheet_derevo_osnovnoe.PageIndex;

  Image_pole.ControlStyle:=Image_pole.ControlStyle + [csOpaque];
  Image_pole_vneshnee.ControlStyle:=Image_pole.ControlStyle + [csOpaque];
  SaveDialog.FileName:=DirControl.saved_full+'1.1';
  OpenDialog.FileName:=SaveDialog.FileName;

  //< file
  file_to_load:='';
  if ParamCount>=1 then
    if FileExists(ParamStr(1)) then file_to_load:=ParamStr(1);
  if FileExists(DirControl.AutosaveFullPath) then
    str2:=DirControl.AutosaveFullPath;
  if (file_to_load<>'') and (str2<>'') then
    if msgs.ShowBoolDialog(
        'Обнаружена несохраненная игра! '
        +'\nПрограмме было дано указание открыть новую игру, '
        +'но у нее имеется несохраненная старая. '
        +'\n\nНажмите ОК для восстановления старой игры, '
        +'Отмена для открытия новой.')
      then file_to_load:=str2
      else DeleteFile(DirControl.AutosaveFullPath)
    else file_to_load:=file_to_load+str2;//rovno odna iz strok nepustaya
  if file_to_load<>'' then
   begin
    FileControl.open_SomePointsFormat_file(file_to_load);
   end else begin
    NewGame_WithRules;
    derevo.Add_GameProperty_byNameVal('PW','');
    derevo.Add_GameProperty_byNameVal('PB','');
   end;
  //> file

  Derevo_JumpToNode_Immediate(0);
  TableNodes.recalculate_structure;
  form_created:=true;
  TableNodes.StringGrid.Repaint;
  PageControl_derevo_xodovEnter(Form1);
 end;


procedure TForm1.FormActivate(Sender: TObject);
 begin
  FocusOn_TablPunktov;
 end;


procedure TForm1.Image_poleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 const lt_triangle=0; lt_square=1; lt_circle=2; lt_text=3; lt_max_indx=3;
  array_properties_names: array [0..lt_max_indx] of string =('TR','SQ','CR','LB');
  function get_label_type:byte;
   begin
    Result:=9;
    if RadioButton_label_treugol.Checked then Result:=lt_triangle;
    if RadioButton_label_kvadr.Checked then Result:=lt_square;
    if RadioButton_label_kruzhki.Checked then Result:=lt_circle;
    if RadioButton_label_text.Checked then Result:=lt_text;
   end;
 var
  mouse_x,mouse_y,i,j:integer;
  okruzhilos_li,nuzhny_li_palochki,local_exit:boolean;
  novaya_tochka : TMove;
  player_to_PaperPoint : TPaperPoint; //=1 if red's turn, =2 if blue's turn
  novoe_mesto_v_dereve : integer;
  pro:TDerevoNodeProperty;
 begin
  mouse_x:=round((x-svobodnoe_pole)/shag_setki_pixels);
  mouse_y:=round((y-svobodnoe_pole)/shag_setki_pixels);
  if (mouse_x<0) or (mouse_y<0)
    then ErrorLogger.NewMessage('coord less than 0');
  ErrorLogger.Check_forNewMessages;

  //<put a simple dot on the field
  if  (not(ssshift in shift))
      and (not(ssalt in shift))
      and (not(ssctrl in shift))
      and (button=mbleft)
      and TPPoint_In(igrovoe_pole.pole[mouse_x,mouse_y]
      ,[tt_empty,tt_RedCtrl,tt_BlueCtrl])
   then begin

    //<obrabotka dereva
    if sejchas_xodit then pro.name:='W' else pro.name:='B';
    pro.value:=msgs.ConvertTwoCoordinates_to_string(mouse_x,mouse_y);
    novoe_mesto_v_dereve:=
       Derevo_AddNode_GiveNewIndex(derevo.CurNode,pro,false);
    derevo.CurNode:=novoe_mesto_v_dereve;
    derevo.nodes[derevo.CurNode].AddProperty(pro,false);
    TableNodes.recalculate_structure;
    TablNodes_pokazat_mestonaxozhdenie;
    //>obrabotka dereva
    derevo.save_autosave;

    novaya_tochka.koord_x:=mouse_x;
    novaya_tochka.koord_y:=mouse_y;
    novaya_tochka.kto_sxodil:=sejchas_xodit;
    okruzhilos_li:=proizvesti_shag_igrovogo_polya(novaya_tochka);
    ErrorLogger.Check_forNewMessages;
    if okruzhilos_li then
      begin
       igrovoe_pole.RecalculateSurroundings;
       paper.prorisovat_full;
      end
      else begin
        if sejchas_xodit=true
          then player_to_PaperPoint:=tt_red
          else player_to_PaperPoint:=tt_blue;
        paper.new_point(mouse_x,mouse_y,player_to_PaperPoint);
        nuzhny_li_palochki:=false;
        if Form1.RadioGroup_ConnectType.ItemIndex<>1 then
         begin
          if (mouse_x>0) then
            if TPaperPoint_Eq(igrovoe_pole.pole[mouse_x-1,mouse_y],player_to_PaperPoint) then
              nuzhny_li_palochki:=true;
          if (mouse_y>0) then
            if TPaperPoint_Eq(igrovoe_pole.pole[mouse_x,mouse_y-1],player_to_PaperPoint) then
              nuzhny_li_palochki:=true;
          if (mouse_x<igrovoe_pole.paper_size_x-1) then
            if TPaperPoint_Eq(igrovoe_pole.pole[mouse_x+1,mouse_y],player_to_PaperPoint) then
              nuzhny_li_palochki:=true;
          if (mouse_y<igrovoe_pole.paper_size_y-1) then
            if TPaperPoint_Eq(igrovoe_pole.pole[mouse_x,mouse_y+1],player_to_PaperPoint) then
              nuzhny_li_palochki:=true;
          if nuzhny_li_palochki then paper.prorisovat;
         end;
      end;
    sejchas_xodit:= not sejchas_xodit;
    if (igrovoe_pole.dop_xod) and (okruzhilos_li)
     then
      sejchas_xodit:= not sejchas_xodit;
    Form1.navodka_shape.Visible:=false;

    FocusOn_TablPunktov;
    pokazat_chej_xod;
    Execute_NodeProperties_VisualOnly(derevo.CurNode);
   end;
  //>put a simple dot on the field

  //<new mass point
  if (not(ssalt in shift))
     and (not(ssctrl in shift)) and (button=mbRight) then
   begin
    if derevo.CurNode=0
     then msgs.showFile('topNodeFill-')
     else begin
      if ssshift in Shift
        then pro.name:='AB'
        else pro.name:='AW';
      pro.value:=msgs.ConvertTwoCoordinates_to_string(mouse_x,mouse_y);
      if TPPoint_In(igrovoe_pole.pole[mouse_x,mouse_y],[tt_empty,tt_RedCtrl,tt_BlueCtrl]) then
       begin
        derevo.nodes[derevo.CurNode].AddProperty(pro,false);
       end else
       begin
        derevo.nodes[derevo.CurNode].DeleteProperty_ByNameAndValue(pro,0);
       end;
      Derevo_JumpToNode_Immediate(derevo.CurNode);
      navodka_shape.Visible:=false;
      derevo.save_autosave;
     end;
   end;
  //>new mass point

  //if add_to_comment click --selstart
  if (not(ssshift in shift)) and (not(ssalt in shift))
  and (ssctrl in shift) and (button=mbleft) then
    begin
     memo_comments.SelText:='('+msgs.inttostr_fixed_length(mouse_x,2)+
       '-'+msgs.inttostr_fixed_length(mouse_y,2)+') ';
     derevo.save_autosave;
    end;
  //end if add_to_comment click

  //<TR,SQ,CR,LB properties
  if (not(ssshift in shift)) and (ssalt in shift)
  and (ssctrl in shift) and (button=mbleft) then
    begin
     pro.value:=msgs.ConvertTwoCoordinates_to_string(mouse_x,mouse_y);
     j:=get_label_type;
     if j=lt_text then pro.value:=pro.value+':'+Edit_label_text.Text;
     for i:=0 to lt_max_indx do
      begin
       if i<>j then
        begin
         pro.name:=array_properties_names[i];
         derevo.nodes[derevo.CurNode].DeleteProperty_ByNameAndValue(pro,1);
        end;
      end;
     pro.name:=array_properties_names[j];
     derevo.nodes[derevo.CurNode].AddProperty_XOR(pro);
     Execute_NodeProperties_VisualOnly(derevo.CurNode);
     derevo.save_autosave;
     FocusOn_TablPunktov;
     Check_TablPunktov_ContainsCommentGeneralized;
    end;
  //>

  //<Jump to this turn
  if ((ssshift in shift)) and (not(ssalt in shift))
    and (not(ssctrl in shift)) and (button=mbleft)
    and (igrovoe_pole.pole[mouse_x,mouse_y].player<>ttp_empty)then
   begin
    pro.value:=msgs.ConvertTwoCoordinates_to_string(mouse_x,mouse_y);
    local_exit:=false;
    while local_exit=false do
     begin
      pro.name:='B';
      if (derevo.nodes[derevo.CurNode].ContainsProperty(pro))then local_exit:=true;
      pro.name:='W';
      if (derevo.nodes[derevo.CurNode].ContainsProperty(pro))then local_exit:=true;
      pro.name:='AB';
      if (derevo.nodes[derevo.CurNode].ContainsProperty(pro))then local_exit:=true;
      pro.name:='AW';
      if (derevo.nodes[derevo.CurNode].ContainsProperty(pro))then local_exit:=true;
      if local_exit=false
       then derevo.CurNode:=derevo.nodes[derevo.CurNode].parent_node;
     end;
    Derevo_JumpToNode_Immediate(derevo.CurNode);
    TableNodes.SelectTablNode(
        derevo.nodes[derevo.CurNode].tbl_x,
        derevo.nodes[derevo.CurNode].tbl_y);
   end;
  //>Jump to this turn
end;


procedure TForm1.Image_poleMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
 var
  mouse_x,mouse_y:integer;
  s,s2:string;
 begin
  if not isOpenInputDesktop then Exit;//Delphi bug, when returning from sleepMode
  mouse_x:=round((x-svobodnoe_pole)/shag_setki_pixels);
  mouse_y:=round((y-svobodnoe_pole)/shag_setki_pixels);
  s2:='';
  s:=msgs.ConvertTwoCoordinates_to_string_old(mouse_x,mouse_y)+s;
  case igrovoe_pole.pole[mouse_x,mouse_y].surrnd
   of
    tts_none: s2:='';
    tts_ByRed : s2:=msgs.getLangFile('pointtype\+red');
    tts_ByBlue : s2:=msgs.getLangFile('pointtype\+blue');
    tts_CtrlRed : s2:=msgs.getLangFile('pointtype\ctrlRed');
    tts_CtrlBlue : s2:=msgs.getLangFile('pointtype\ctrlBlue');
   end;
  if igrovoe_pole.pole[mouse_x,mouse_y].surrnd in [tts_ByRed,tts_ByBlue,tts_none] then
    case igrovoe_pole.pole[mouse_x,mouse_y].player
     of
      ttp_red: s2:=s2+msgs.getLangFile('pointtype\red');
      ttp_blue: s2:=s2+msgs.getLangFile('pointtype\blue');
      ttp_empty: s2:=s2+msgs.getLangFile('pointtype\empty');
     end;

  if TPaperPoint_Eq(igrovoe_pole.pole[mouse_x,mouse_y],tt_empty)
    then s2:='';
  if TPaperPoint_Eq(igrovoe_pole.pole[mouse_x,mouse_y],tt_RedBeated)
    then s2:=msgs.getLangFile('pointtype\-red');
  if TPaperPoint_Eq(igrovoe_pole.pole[mouse_x,mouse_y],tt_BlueBeated)
    then s2:=msgs.getLangFile('pointtype\-blue');
  msgs.ShowHint('['+s+'] '+s2);

  if (mouse_x>=0) and (mouse_y>=0) and
     (mouse_x<=igrovoe_pole.paper_size_x-1) and (mouse_y<=igrovoe_pole.paper_size_y) then
    if (igrovoe_pole.pole[mouse_x,mouse_y].player=ttp_empty)
        and (igrovoe_pole.pole[mouse_x,mouse_y].surrnd
         in [tts_none,tts_CtrlRed,tts_CtrlBlue]) then
     begin
      navodka_shape.Left:=paper.coord_to_point(mouse_x) -
         ((navodka_shape.Width-1) shr 1);
      navodka_shape.Top:=paper.coord_to_point(mouse_y) -
         ((navodka_shape.Height-1) shr 1);
      navodka_shape.Visible:=true;
     end else  navodka_shape.Visible:=false;
 end;

procedure TForm1.memo_commentsKeyPress(Sender: TObject; var Key: Char);
begin
  pokazat_tochku_na_kartinke_iz_memo;
end;


procedure TForm1.memo_commentsKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  pokazat_tochku_na_kartinke_iz_memo;
end;

procedure TForm1.Timer_tochka_na_poleTimer(Sender: TObject);
 var
  mous:TPoint;
  image_rect:TRect;
 begin
  //if Mouse is outside the game field - remove the help-dot.
  pokazat_tochku_na_kartinke_iz_memo;
  if not isOpenInputDesktop then Exit;//Delphi bug, when returning from sleepMode
  mous:=Image_pole.ScreenToClient(Mouse.CursorPos);
  image_rect:=Image_pole.ClientRect;
  if (mous.X>=image_rect.Left) and (mous.X<=image_rect.Right)
      and (mous.Y>=image_rect.Top) and (mous.Y<=image_rect.Bottom)
    then
    else navodka_shape.Visible:=false;
 end;

procedure TForm1.memo_commentsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not isOpenInputDesktop then Exit;//Delphi bug, when returning from sleepMode
  pokazat_tochku_na_kartinke_iz_memo;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
// var
//  file_exist,current_file_changed:boolean;
 begin
//  rewrite_ini;
  UnRegisterHotKey(Form1.Handle, id_SnapShot);
 end;

procedure TForm1.CheckBox_dop_xodClick(Sender: TObject);
begin
if (form_created)and(igrovoe_pole.dop_xod<>CheckBox_dop_xod.Checked) then
 begin
  igrovoe_pole.dop_xod:=CheckBox_dop_xod.Checked;
  derevo.Add_GameProperty_byNameVal('RUAT',BoolToStr(igrovoe_pole.dop_xod));
  rewrite_ini;
 end;
end;

procedure TForm1.Label_color_redClick(Sender: TObject);
begin
ColorDialog.Color:=colors_my.cred;
if ColorDialog.Execute=true then
  begin
  colors_my.cred:=ColorDialog.Color;
  colors_my.apply_colors;
  end;
end;

procedure TForm1.Label_color_blueClick(Sender: TObject);
begin
ColorDialog.Color:=colors_my.cblue;
if ColorDialog.Execute=true then
  begin
  colors_my.cblue:=ColorDialog.Color;
  colors_my.apply_colors;
  end;
end;

procedure TForm1.Label_color_backgroundClick(Sender: TObject);
begin
ColorDialog.Color:=colors_my.cbackground;
if ColorDialog.Execute=true then
  begin
  colors_my.cbackground:=ColorDialog.Color;
  colors_my.apply_colors;
  end;
end;

procedure TForm1.Label_color_setka_linesClick(Sender: TObject);
begin
ColorDialog.Color:=colors_my.csetka_lines;
if ColorDialog.Execute=true then
  begin
  colors_my.csetka_lines:=ColorDialog.Color;
  colors_my.apply_colors;
  end;
end;

procedure TForm1.StringGrid_tabl_punktovMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
 var
  kx,ky:integer;
 begin
  if not isOpenInputDesktop then Exit;//Delphi bug, when returning from sleepMode
  FocusOn_TablPunktov;
  StringGrid_tabl_punktov.MouseToCell(X,Y,kx,ky);
  kx:=kx-StringGrid_tabl_punktov.FixedCols;
  ky:=ky-StringGrid_tabl_punktov.FixedRows;
  if (kx<0) or (kx>=length(TableNodes.nodes))
      or (ky<0) or (ky>=length(TableNodes.nodes[0]))
    then begin msgs.ShowHint(''); exit; end;
  TableNodes.recalculate_OneNodeProperties(kx,ky);
  msgs.ShowHint(msgs.calculate_hint(TableNodes.nodes[kx,ky],kx,ky));
 end;

procedure TForm1.FormResize(Sender: TObject);
 begin
  Timer_form_resize.Enabled:=true;
 end;


procedure TForm1.menu_linktovkontakteruapplication1Click(Sender: TObject);
 begin
  msgs.ShowLink('http://vkontakte.ru/app153705',
  'Приложение на сайте vkontakte.ru.\n'
  +''
  +'В приложении всегда есть с кем сыграть, но, к сожалению, много глюков и ошибок,'
  +'связанных с нестабильностью сети. (15 октября 2009)'
  +''
  );
 end;

procedure TForm1.menu_view_polish_editorClick(Sender: TObject);
begin
msgs.ShowLink('http://eidokropki.reaktywni.pl/',
  'Редактор игр. На страницу автоматически попадают '
  +'все сыгранные у поляков партии.');
end;

procedure TForm1.menu_view_polish_game_siteClick(Sender: TObject);
begin
msgs.ShowLink('http://www.szkrab.net.pl/szkrab/index.php',
   'Сайт, с которого можно играть в польские точки. '+
   'Работает на Java.');
end;

procedure TForm1.menu_link_polsk_manualClick(Sender: TObject);
begin
 msgs.ShowLink('http://vn91.tochki.org/polskie/pravila.html',
    'Страничка с правилами польских точек.\n'+
    'Если эта не будет работать, то есть запасная:\n'+
    'http://vn91.narod.ru/directories/tochki/polskie/pravila.html');
end;

procedure TForm1.SpeedButton_new_gameClick(Sender: TObject);
 begin
  Action_NewFileExecute(Form1);
 end;

procedure TForm1.SpeedButton_add_crossClick(Sender: TObject);
 var
  skrest_x,skrest_y,i,j:integer;
  svobodno_li_mesto:boolean;
  cur_prop:TDerevoNodeProperty;
  popytki_counter:word;
 begin
  popytki_counter:=0;
  repeat
    inc(popytki_counter);
    skrest_x:=(igrovoe_pole.paper_size_x*2 div 5)+ random(igrovoe_pole.paper_size_x div 5)-1;
    skrest_y:=(igrovoe_pole.paper_size_y*2 div 5)+ random(igrovoe_pole.paper_size_y div 5)-1;
    svobodno_li_mesto:=true;
    for i:=skrest_x-3 to skrest_x+4 do
      for j:=skrest_y-3 to skrest_y+4 do
        if igrovoe_pole.pole[i,j].player<>ttp_empty then svobodno_li_mesto:=false;
  until (svobodno_li_mesto=true) or (popytki_counter=91);
  if svobodno_li_mesto=true then
   begin
    derevo.CurNode:=derevo.AddNode_GiveNewIndx(
       derevo.CurNode);//cur_prop ne vazhen t.k. force_create=true.

    if sejchas_xodit=true
     then cur_prop.name:='AW'
     else cur_prop.name:='AB';
    cur_prop.value:=msgs.ConvertTwoCoordinates_to_string(skrest_x,skrest_y);
    derevo.nodes[derevo.CurNode].AddProperty(cur_prop,false);

    if sejchas_xodit=false
     then cur_prop.name:='AW'
     else cur_prop.name:='AB';
    cur_prop.value:=msgs.ConvertTwoCoordinates_to_string(skrest_x+1,skrest_y);
    derevo.nodes[derevo.CurNode].AddProperty(cur_prop,false);

    if sejchas_xodit=true
     then cur_prop.name:='AW'
     else cur_prop.name:='AB';
    cur_prop.value:=msgs.ConvertTwoCoordinates_to_string(skrest_x+1,skrest_y+1);
    derevo.nodes[derevo.CurNode].AddProperty(cur_prop,false);

    if sejchas_xodit=false
     then cur_prop.name:='AW'
     else cur_prop.name:='AB';
    cur_prop.value:=msgs.ConvertTwoCoordinates_to_string(skrest_x,skrest_y+1);
    derevo.nodes[derevo.CurNode].AddProperty(cur_prop,false);

    TableNodes.recalculate_structure;
    StringGrid_tabl_punktov.Repaint;
    Derevo_JumpToNode_Immediate(derevo.CurNode);
    TablNodes_pokazat_mestonaxozhdenie;
   end
   else msgs.showFile('cross-');
end;

procedure TForm1.menu_linktosite1Click(Sender: TObject);
 begin
  msgs.ShowLink('http://tochki.org',
      'Сайт о точках. \nБольшинство информации содержится на форуме, '
      +'можно сразу идти туда.');
 end;

procedure TForm1.menu_linktoforum1Click(Sender: TObject);
 begin
  msgs.ShowLink('http://forum.tochki.org','Форум о точках.');
 end;

procedure TForm1.menu_linktodownloadpage1Click(Sender: TObject);
 begin
  msgs.ShowLink('http://tochki.org/download/pointsxt.php',
     'Нужна версия 2.2.0. Если качать через letitbit, то прийдется '+
     'ждать минуту и смотреть рекламу.');
 end;

procedure TForm1.StringGrid_tabl_punktovSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
 var
  current_node:Integer;
 begin
  if TableNodes.freezed=true then exit;
  if derevo.new_game_processing=true then exit;
  TableNodes.sel_x:=ACol-Form1.StringGrid_tabl_punktov.FixedCols;
  TableNodes.sel_y:=ARow-Form1.StringGrid_tabl_punktov.FixedRows;
  current_node:=TableNodes.nodes[TableNodes.sel_x,TableNodes.sel_y].index;
  if current_node>=0 then
   begin
    derevo.CurNode:=current_node;
    Derevo_JumpToNode_Slow(derevo.CurNode);
   end;
  TableNodes.ShowHint_OnCurrentSelection;
 end;

procedure TForm1.StringGrid_tabl_punktovKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
 begin
  TableNodes.recalculate_CurSelection;
  if (Key in [33,34]) then Key:=0;
  if Key=36 then ; //End
  if key=35 then ; //Home
  if Key=220 {\} then
   begin
    if (ssshift in Shift)
      then derevo.make_ChildIndex_lesser(derevo.CurNode)
      else derevo.make_ChildIndex_bigger(derevo.CurNode);
   end;
  if (Key=46 {Delete}) then Derevo_Delete_Subtree;
  if (not(ssshift in Shift))and (not(ssctrl in Shift)) then
   begin
    if Key=37{left} then begin Key:=0; DerevoJump_Left(ssAlt in Shift); end;
    if Key=39{right} then begin Key:=0; DerevoJump_Right(ssAlt in Shift); end;
    if Key=38{up} then begin Key:=0; DerevoJump_Up((ssalt in Shift)); end;
    if Key=40{down} then begin Key:=0; DerevoJump_Down((ssalt in Shift)); end;
   end;
  if (Key=45) //Ins
    then Derevo_CreateEmptyChild_JupmToIt;
  if ssctrl in Shift then
   begin
    if Key=40 {ctrl+down} then DerevoJump_PageDown;
    if Key=38 {ctrl+up} then DerevoJump_PageUp;
    if (Key>=37) and (Key<=40) then Key:=0;
   end;
 end;

procedure TForm1.StringGrid_tabl_punktovDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
 var
  tabl_contains,index_imglist,kx,ky:integer;
  contains_comment:boolean;
 begin
  if (form_created=false)or(TableNodes.freezed=true) then exit;
  with Form1.StringGrid_tabl_punktov.Canvas do
   begin
    kx:=ACol-StringGrid_tabl_punktov.FixedCols;
    ky:=ARow-StringGrid_tabl_punktov.FixedRows;
    if ky=-1 then
      TextRect(Rect
         ,Rect.Left+
         ((StringGrid_tabl_punktov.DefaultColWidth-
         TextWidth(IntToStr(kx)+'.'))shr 1)
         ,Rect.Top, IntToStr(kx)+'.');
    if (kx>=0) and (kx<=length(TableNodes.nodes)-1) and
       (ky>=0) and (ky<=length(TableNodes.nodes[0])-1) then
     begin
      tabl_contains:=TableNodes.nodes[kx,ky].index;
      TableNodes.recalculate_OneNodeProperties(kx,ky);
     end else tabl_contains:=-7;
    index_imglist:=-1;
    contains_comment:=false;
    if (tabl_contains>=0)
        and(tabl_contains<=length(derevo.nodes)-1)
        and(derevo.nodes[tabl_contains].is_killed=false) then
     begin
      contains_comment:=TableNodes.nodes[kx,ky].contains_comment;
      if TableNodes.nodes[kx,ky].color=0 then index_imglist:=0
      else if TableNodes.nodes[kx,ky].color=1 then index_imglist:=6
      else if TableNodes.nodes[kx,ky].color=2 then index_imglist:=7;
     end;
    if tabl_contains=-2 then index_imglist:=1;
    if tabl_contains=-3 then index_imglist:=2;
    if tabl_contains=-5 then index_imglist:=3;
    if tabl_contains=-1 then index_imglist:=4;
    if tabl_contains=0 then index_imglist:=5;

    if index_imglist>=0 then
      StretchDraw(Rect,TablNodes_bitmaps[index_imglist]);
    if contains_comment=true then
     begin
      Brush.Style:=bsClear;
      Font.Color:=clRed;
      Font.Size:=12;
      TextOut(Rect.Left+10,Rect.Top+8,'*');
      Font.Color:=clBlack;
      Brush.Style:=bsSolid;
     end;
    if (gdselected in State) then
     begin
      Brush.Style:=bsClear;
      Rectangle(Rect);
     end;
   end;
 end;

procedure TForm1.memo_commentsChange(Sender: TObject);
 var
//  i:integer;
  pro:TDerevoNodeProperty;
 begin
  if CommentChange_from_jump=true then exit;
  derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('C');
//  for i:=0 to memo_comments.Lines.Count-1 do
//   begin
//    new_pro.value:=memo_comments.Lines[i];
//    derevo.nodes[derevo.CurNode].AddProperty(new_pro,false);
//   end;
  pro.name:='C'; pro.value:=memo_comments.Text;
  while (length(pro.value)>=1)
      and (ord(pro.value[length(pro.value)]) in [10,13,32]) do
    Delete(pro.value,length(pro.value),1);
  if pro.value<>'' then
    derevo.nodes[derevo.CurNode].AddProperty(pro,true);
  derevo.save_autosave;
  Check_TablPunktov_ContainsCommentGeneralized;
 end;

procedure TForm1.CheckBox_zadosostavitelClick(Sender: TObject);
 begin
//  if CheckBox_zadosostavitel.Checked then
//   begin
//    TabSheet_zadachnik.TabVisible:=true;
//    Button_mark_EndOfZad.Visible:=true;
//    Button_mark_autoreply.Visible:=true;
//    Button_clear_problem_marker.Visible:=true;
//   end else begin
//    TabSheet_zadachnik.TabVisible:=false;
//    Button_mark_EndOfZad.Visible:=false;
//    Button_mark_autoreply.Visible:=false;
//    Button_clear_problem_marker.Visible:=false;
//   end;
 end;

procedure TForm1.Button_mark_EndOfZadClick(Sender: TObject);
 var pro:TDerevoNodeProperty;
 begin
  if derevo.CurNode<>0 then
   begin
    derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('JU');
    pro.name:='JU';
    pro.value:='p';
    derevo.nodes[derevo.CurNode].AddProperty(pro,false);
    Execute_NodeProperties_VisualOnly(derevo.CurNode);
   end else msgs.ShowMsg('Нельзя поменить корень дерева как тупиковый.');
 end;

procedure TForm1.Button_mark_autoreplyClick(Sender: TObject);
 var pro:TDerevoNodeProperty;
 begin
  if length(derevo.nodes[derevo.CurNode].childrens)>=1 then
   begin
    derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('JU');
    pro.name:='JU';
    pro.value:='c';
    derevo.nodes[derevo.CurNode].AddProperty(pro,false);
    Execute_NodeProperties_VisualOnly(derevo.CurNode);
   end else msgs.ShowMsg('Нельзя пометить край дерева как автоотвечаемый');
 end;

procedure TForm1.Button_clear_problem_markerClick(Sender: TObject);
 begin
  derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('JU');
  Execute_NodeProperties_VisualOnly(derevo.CurNode);
 end;

procedure TForm1.Button_zadachnik_jump_parentClick(Sender: TObject);
 begin
//  TabSheet_zadachnik.TabVisible:=CheckBox_zadosostavitel.Checked;
  DerevoJump_ToParent;
  FocusOn_TablPunktov;
 end;

procedure TForm1.Button_zadachnik_jump_childClick(Sender: TObject);
 begin
//  TabSheet_zadachnik.TabVisible:=CheckBox_zadosostavitel.Checked;
  DerevoJump_ToFirstChild;
  FocusOn_TablPunktov;
 end;


procedure TForm1.Label_blue_turnMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
FocusOn_TablPunktov;
end;


procedure TForm1.Timer_form_resizeTimer(Sender: TObject);
 begin
  if form_created then
   begin
    Timer_form_resize.Enabled:=false;
    rewrite_ini;
    paper.prorisovat_full;
    Execute_NodeProperties_VisualOnly(derevo.CurNode);
    Shape_last_turn.Left:=
       paper.coord_to_point(last_turn_global.koord_x)
       -(Shape_last_turn.Width shr 1);
    Shape_last_turn.Top:=
       paper.coord_to_point(last_turn_global.koord_y)
       -(Shape_last_turn.Height shr 1);
   end;
 end;

procedure TForm1.Timer_TablNodesJumpTimer(Sender: TObject);
 begin
  if form_created then
   begin
    if tabl_nodes_needs_jump=true then
     begin
      tabl_nodes_needs_jump:=false;
      Derevo_JumpToNode_Immediate(derevo_jump_where);
     end else derevoJump_inBuffer:=false;
    Timer_TablNodesJump.Interval:=
       (TableNodes.sel_x*1 div 5) +30;
   end;
 end;

procedure TForm1.N12Click(Sender: TObject);
begin
 msgs.ShowLink(DirControl.application+'manual\index.html',
    'Это путь к файлу с help на компе.\n'+
    'Вы также можете найти его в директории "manual" этой игры.\n'+
    'При возможности лучше пользуйтесь страничкой онлайн -\n'+
    'В программе могут быть обновления.');
end;

procedure TForm1.menu_N7Click(Sender: TObject);
 begin
  msgs.showFile('rules_tochki');
 end;

procedure TForm1.menu_online1Click(Sender: TObject);
 begin
  msgs.ShowLink('http://lj.rossia.org/users/vn_tochki/',
    msgs.getLangFile('aboutVpoints1')+
    DateToStr(date_build)+
    msgs.getLangFile('aboutVpoints2'));
 end;

procedure TForm1.Button_help_mass_tochkiClick(Sender: TObject);
begin
 msgs.showFile('massPointsHowTo');
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var i:integer;
begin
// Form1.Caption:=IntToStr(Key);
 i:=0;
 if (Key=112)and(Timer_LastTurnFlash.Enabled=false) then //F1
  begin
   Shape_last_turn.Brush.Style:=bsSolid;
   Timer_LastTurnFlash.Enabled:=true;
   Timer_LastTurnFlash.Tag:=0;
  end;
 if (ssalt in Shift=false) and(ssctrl in Shift)  //Ctrl
    and (ssshift in shift=false) then
  begin
   if (Key=87) then
     Action_ChangeTurnsExecute(Form1);
   if (Key=89) then
     paper.Screenshot_make;
  end;
 if (ssctrl in Shift) and (ssshift in Shift)
    and ((ssalt in shift)=false) and (Key=89) then
   if msgs.ShowBoolDialog('Удалить скриншоты этой программы?') then
    begin
     while FileExists(DirControl.screenshots_full+msgs.inttostr_fixed_length(i,3)+ext_png) do
      begin
       DeleteFile(DirControl.screenshots_full+msgs.inttostr_fixed_length(i,3)+ext_png);
       inc(i);
      end;
     if i>=1 then
       msgs.ShowMsg('Удалены скриншоты 000'+ext_png+' - '
          +msgs.inttostr_fixed_length(i-1,3)+ext_png+' .')
      else msgs.ShowMsg('Скриншота 000'+ext_png+' не найдено. Ничего не удалено.');
    end;
end;

procedure TForm1.Timer_LastTurnFlashTimer(Sender: TObject);
 begin
  with Shape_last_turn do
   begin
    if Timer_LastTurnFlash.Tag=2 then
     begin
      Timer_LastTurnFlash.Enabled:=false;
      Brush.Style:=bsClear;
     end;
    if Timer_LastTurnFlash.Tag=1 then
     begin
      Timer_LastTurnFlash.Tag:=2;
     end;
    if Timer_LastTurnFlash.Tag=0 then
     begin
      Timer_LastTurnFlash.Tag:=1;
      Brush.Color:=clBlack;
     end;
   end;
 end;

procedure TForm1.TabSheet_der_imageShow(Sender: TObject);
 procedure draw_tabl_node(kx,ky,index_to_draw:integer; comment:boolean);
  var
   cur_string:string;
  begin
   if index_to_draw=-1 then cur_string:='';
   if index_to_draw=-2 then cur_string:=' L';
   if index_to_draw=-3 then cur_string:=' |-';
   if index_to_draw=-5 then cur_string:=' |';
   if index_to_draw>=1 then cur_string:='<>';//inttostr(index_to_draw);
   if index_to_draw=0 then cur_string:='=>';
   if comment=true then cur_string:=cur_string+'*';
  end;

 var i,j:integer;
 begin
  if form_created then
   begin
    for i:=0 to Length(TableNodes.nodes)-1 do
      for j:=0 to Length(TableNodes.nodes[0])-1 do
       begin
        draw_tabl_node(i,j,TableNodes.nodes[i,j].index
           ,TableNodes.nodes[i,j].contains_comment);
       end;

   end;
 end;


procedure TForm1.TrackBar_razm_tochkChange(Sender: TObject);
 begin
  if form_created then
   begin
    paper.prorisovat_full;
    Execute_NodeProperties_VisualOnly(derevo.CurNode);
   end;
 end;

procedure TForm1.menu_tochkiorg1Click(Sender: TObject);
begin
  msgs.ShowLink('http://tochki.org/save/',
     'Большой архив игр для pointsXT'
     +'\n'+'Выложены игры многих профессионалов, турнирные партии.'
     +'\n'+'Все игры оттуда можно просматривать с помощью этой проги.');
end;

procedure TForm1.menu_N11Click(Sender: TObject);
 begin
  msgs.ShowLink('http://vkontakte.ru/topic-3727783_21787640',
   'Пока-что там всего несколько игр. Добавляйте.:)');
 end;

procedure TForm1.menu_forumtochkiorg1Click(Sender: TObject);
 begin
  msgs.ShowLink('http://forum.tochki.org/index.php?showtopic=934','Разборы игр на форуме специально для программы vpoints. Там сейчас игр восемь (15 октярбря), добавляются новые.');
 end;

procedure TForm1.menu_N19Click(Sender: TObject);
 begin
   msgs.ShowLink('http://forum.tochki.org/index.php?showforum=20',
    '"Разборы игр (или после драки кулаками машут!)"');
 end;

procedure TForm1.CheckBox_black_borderClick(Sender: TObject);
 begin
  if form_created then
   begin
    rewrite_ini;
    paper.prorisovat;
   end;
 end;

procedure TForm1.CheckBox_soedin_palochkami_NOT_IN_USEClick(Sender: TObject);
 begin
  if form_created then
   begin
    rewrite_ini;
    paper.prorisovat;
   end;
 end;

procedure TForm1.RadioButton_vid_palki_cClick(Sender: TObject);
 begin
  if form_created then
   begin
    paper.prorisovat;
    rewrite_ini;
   end;
 end;

procedure TForm1.RadioButton_vid_palki_oClick(Sender: TObject);
 begin
  RadioButton_vid_palki_cClick(Form1);
 end;


procedure TForm1.Button_delete_MassPointsFromNodeClick(Sender: TObject);
 var really_do:boolean;
 begin
  if derevo.nodes[derevo.CurNode].ContainsName('AB')
      or derevo.nodes[derevo.CurNode].ContainsName('AR')
      or derevo.nodes[derevo.CurNode].ContainsName('AW') then
   begin
    really_do:=false;
    if length(derevo.nodes[derevo.CurNode].childrens)>=1 then
     begin
      if msgs.ShowBoolDialog(
        'Изменение массовых точек в этот ход затронет все последующие ходы '
        +'(все "дочерние" ветви в дереве). \n\nПродолжить?'
        ) then really_do:=true;
     end else really_do:=true;
    if really_do then
     begin
      derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('AR');
      derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('AW');
      derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('AB');
      Derevo_JumpToNode_Immediate(derevo.CurNode);
      derevo.save_autosave;
     end;
   end
   else begin
    msgs.showFile('massPointsDel-');
   end;
 end;


procedure TForm1.Edit_label_textEnter(Sender: TObject);
 begin RadioButton_label_text.Checked:=true; end;

procedure TForm1.BitBtn_screenshot_helpClick(Sender: TObject);
 begin
  msgs.showFile('makeScreenshot');
 end;

procedure TForm1.BitBtn_labels_helpClick(Sender: TObject);
 begin
  msgs.showFile('labelHowTo');
 end;

procedure TForm1.BitBtn_clear_labelsClick(Sender: TObject);
 begin
  if derevo.nodes[derevo.CurNode].ContainsName('TR')
     or derevo.nodes[derevo.CurNode].ContainsName('SQ')
     or derevo.nodes[derevo.CurNode].ContainsName('CR')
     or derevo.nodes[derevo.CurNode].ContainsName('LB') then
   begin
    derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('TR');
    derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('SQ');
    derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('CR');
    derevo.nodes[derevo.CurNode].ClearFrom_PropertyName('LB');
    derevo.save_autosave;
    Execute_NodeProperties_VisualOnly(derevo.CurNode);
    Check_TablPunktov_ContainsCommentGeneralized;
   end else msgs.showFile('labelDel-');
 end;


procedure TForm1.BitBtn_RazmerPolya_OKClick(Sender: TObject);
 var
  i:integer;
  str_paper_x,str_paper_y:string;
 begin
  i:=1;
  with ComboBox_RazmerPolya do
   begin
    while (i<=length(Text))and(not(Text[i] in ['0'..'9'])) do inc(i);
    str_paper_x:='';
    while (i<=length(Text))and(Text[i] in ['0'..'9']) do
     begin
      str_paper_x:=str_paper_x+Text[i];
      inc(i);
     end;
    while (i<=length(Text))and(not(Text[i] in ['0'..'9'])) do inc(i);
    str_paper_y:='';
    while (i<=length(Text))and(Text[i] in ['0'..'9']) do
     begin
      str_paper_y:=str_paper_y+Text[i];
      inc(i);
     end;
   end;
  if (not(StrToInt(str_paper_x)in[3..51]))or(not(StrToInt(str_paper_y)in[3..51]))
   then msgs.showFile('razmeryPolya-')
   else
    if msgs.ShowBoolDialog('При изменении размеров поля '
        +'текущая партия будет потеряна. Продолжить?') then
     begin
      derevo.new_game_processing:=true;
      TableNodes.freezed:=true;
      ComboBox_RazmerPolya.Text:=str_paper_x+'*'+str_paper_y;
      igrovoe_pole.paper_size_x:=StrToInt(str_paper_x);//razmery_polya[ComboBox_RazmerPolya.ItemIndex].razmer_x;
      igrovoe_pole.paper_size_y:=StrToInt(str_paper_y);//razmery_polya[ComboBox_RazmerPolya.ItemIndex].razmer_y;
      paper.ReCalculate_ShagSetkiPixels_tochki;
      NewGame_WithRules;
      rewrite_ini;
      BitBtn_RazmerPolya_OK.Enabled:=false;
      TableNodes.freezed:=false;
      derevo.new_game_processing:=false;
      Execute_NodeProperties_VisualOnly(0);
      FocusOn_TablPunktov;
     end;
 end;

procedure TForm1.ComboBox_RazmerPolyaChange(Sender: TObject);
 begin BitBtn_RazmerPolya_OK.Enabled:=true; end;

procedure TForm1.BitBtn_RazmerPolya_helpClick(Sender: TObject);
 begin
msgs.showFile('razmerPolyaVruchnuju');
 end;

procedure TForm1.ComboBox_RazmerPolyaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
 begin
  if Key=13 then BitBtn_RazmerPolya_OKClick(Form1);
 end;

procedure TForm1.Edit_label_textKeyPress(Sender: TObject; var Key: Char);
begin
Edit_label_text.Text:=Key; Key:=#0;
end;

procedure TForm1.ActionList_mainUpdate(Action: TBasicAction;
  var Handled: Boolean);
 begin
  Action_OpenFromVpoints.Enabled:=true;
  Action_OpenFromPointsxtDir.Enabled:=DirectoryExists(DirControl.pointsxt220_HomePath);
  Action_OpenFromPointsxtDir.Caption:=
      'Из файла - в папке "'+DirControl.pointsxt220_HomePath+'"';
  menu_N5.Action:=Action_OpenFromPointsxtDir;
  Action_OpenFromClipBoard.Enabled:=true;
  Action_OpenFromVkontakteApplication.Enabled:=true;
  Action_OpenFromPolishServer.Enabled:=true;
  Action_NewFile.Enabled:=true;
  Action_goto.Enabled:=true;
  Handled:=true;
 end;

procedure TForm1.Action_SaveToClipBoardExecute(Sender: TObject);
 begin
  msgs.PutStringIntoClipBoard(FileControl.save_vpoints_string);
  msgs.showFile('toBuffer+');
 end;

procedure TForm1.Action_SaveVpointsAsExecute(Sender: TObject);
 var
  FileName_to_save,dir_cur,cur_str:string;
 begin
  dir_cur:=ExtractFileDir(SaveDialog.FileName);
  if length(dir_cur)>=1 then
    if (dir_cur[length(dir_cur)]<>'/') or (dir_cur[length(dir_cur)]<>'\') then
      dir_cur:=dir_cur+'\';
  cur_str:=msgs.fileNameWOSuffix;
  SaveDialog.FileName:=cur_str;
  if SaveDialog.Execute then
   begin
     FileName_to_save:=SaveDialog.FileName;
     FileControl.save_vpoints_file(FileName_to_save);
     DirControl.current_file:=FileName_to_save;
     DeleteFile(DirControl.AutosaveFullPath);
   end;
 end;

procedure TForm1.Action_OpenFromVpointsExecute(Sender: TObject);
 begin
  OpenDialog.FileName:=DirControl.saved_full+'1.1';
  FileControl.OpenDialog_execute;
 end;

procedure TForm1.Action_OpenFromVkontakteApplicationExecute(
  Sender: TObject);
 begin
  msgs.showFile('load_vkontakte');
 end;

procedure TForm1.Action_OpenFromClipBoardExecute(Sender: TObject);
 var file_to_load:string; i:integer;
 begin
  if msgs.ShowBoolDialog('Текущая партия будет потеряна. Продолжить?') then
   begin
    file_to_load:=msgs.GetStringFromClipBoard;
    i:=1; while (length(file_to_load)>=i)and(file_to_load[i]in[' ',#13,#10]) do begin inc(i); end;
    delete(file_to_load,1,i-1);
    if copy(file_to_load,1,3)='1.0' then
     begin
      FileControl.open_vkontakte100_string(file_to_load);
     end else
     begin
      if FileControl.open_vpoints_IsCorrect(file_to_load) then
       begin
        //Ugly code.. It is copied from the file loading procedure.
        //should be joined into a single procedure.
        //(preparations before and after loading the data)
        derevo.CurNode:=0;
        TableNodes.freezed:=true;
        FileControl.open_vpoints_string(file_to_load);
        FocusOn_TablPunktov;
        TableNodes.freezed:=false;
        TableNodes.StringGrid.Repaint;
        Derevo_JumpToNode_Immediate(0);
        paper.prorisovat_full;
        pokazat_chej_xod;
        derevo.show_info;
        msgs.showFile('loaded+');
       end else begin
        msgs.showFile('openFromBufferFailed');
       end;
     end;
    FocusOn_TablPunktov;
   end;
 end;

procedure TForm1.Action_OpenFromPointsxtDirExecute(Sender: TObject);
 begin
  OpenDialog.FileName:=DirControl.pointsxt220_HomePath+'1.1';
  FileControl.OpenDialog_execute;
 end;

procedure TForm1.Action_NewFileExecute(Sender: TObject);
 begin
  if msgs.ShowBoolDialog(
     'Текущая партия будет потеряна.\n\nПродолжить?') then
   begin
    derevo.new_game_processing:=true;
    NewGame_WithRules;
    derevo.new_game_processing:=false;
    Execute_NodeProperties_VisualOnly(0);
    DeleteFile(DirControl.AutosaveFullPath);
   end;
 end;

procedure TForm1.Action_ChangeTurnsExecute(Sender: TObject);
begin
  sejchas_xodit:= not sejchas_xodit;
  pokazat_chej_xod;
end;

procedure TForm1.Action_SaveToPolishServerExecute(Sender: TObject);
 begin
  msgs.ShowLink('http://eidokropki.reaktywni.pl/upload.phtml?lang=ru'
    ,'Пройдя по этой ссылке вы сможете сохранить любую точечную '
    +'игру на польский сервер. '
    +'Партии, выложенные туда, открыты для просмотра и свободно скачиваемы.'
    +'\n\nДля загрузки партии на польский сервер надо в графе '
    +'"Paste Raw SGF" нажать правой кнопкой мыши "вставить" и потом снизу нажать кнопку "Upload".'
    +'\n\n'
    +'После того, как вы загрузите партию, скопируйте путь из адресной строки браузера. '
    +'Он и будет служить ссылкой для загруженной партии.');
end;

procedure TForm1.Action_gotoExecute(Sender: TObject);
 var i,x,indx:integer;
 begin
  Form_goto.ShowModal;
  if Form_goto.ModalResult=mrOk then
   begin
    indx:=0;
    x:=Form_goto.SpinEdit.Value;
    x:=math.Min(x,length(TableNodes.nodes)-1);
    for i:=Length(TableNodes.nodes[0])-1 downto 0 do
      if TableNodes.nodes[x,i].index<>tni_empty
        then indx:=TableNodes.nodes[x,i].index;
    derevo.CurNode:=indx;
    Derevo_JumpToNode_Immediate(indx);
    TablNodes_pokazat_mestonaxozhdenie;
    FocusOn_TablPunktov;
   end;
 end;

procedure TForm1.Memo_derevo_helpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 begin
  if Key=72 then PageControl_nastrojki.ActivePageIndex
    :=TabSheet_hidden.PageIndex;
 end;

procedure mass_renamer1_NotInUse;
//renamer for (*.sav) files:
//it opens a file, looks at names of the players and renames the file.
 var
  i,j:integer;
  cur_name,rename_to,imya_red,imya_blue:string;
  local_exit:boolean;
 begin
  i:=1;
  cur_name:=DirControl.saved_full+'cur\'+msgs.inttostr_fixed_length(i,4)+'.sav';
  while FileExists(cur_name) do
   begin
    FileControl.open_pointsxt220_file(cur_name);
    local_exit:=false; j:=1;
    while local_exit=false do
     begin
      imya_red:=derevo.nodes[0].GetValue_byName('PW');
      imya_blue:=derevo.nodes[0].GetValue_byName('PB');
      rename_to:=DirControl.saved_full+'cur\'+
        imya_red+' vs '+imya_blue
        +' '+msgs.inttostr_fixed_length(j,3)
        +'.sav';
      if FileExists(rename_to)=false
       then local_exit:=true
       else inc(j);
     end;

    RenameFile(cur_name,rename_to);
    inc(i);
    cur_name:=DirControl.saved_full+'cur\'+msgs.inttostr_fixed_length(i,4)+'.sav';
   end;
 end;


procedure TForm1.Button_date_buildClick(Sender: TObject);
 begin
  msgs.ShowMsg('Current date: '+FloatToStr(Date));
 end;

procedure TForm1.RadioGroup_SurroundTypeClick(Sender: TObject);
 begin
  if form_created then
   begin
    paper.prorisovat;
    rewrite_ini;
   end;
 end;

procedure TForm1.TreeViewChanging(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);

  function Upcase_EQ(s1,s2:string):boolean;
   begin Result:=(AnsiLowerCase(s1)=AnsiLowerCase(s2)); end;

 var
  i,page_to_activate,node_indx:integer;
  text_to_search:string;
 begin
  page_to_activate:=-1;
  text_to_search:=Node.Text;
  node_indx:=Node.StateIndex;

  for i:=0 to PageControl_nastrojki.PageCount-1 do
    if (Upcase_EQ(text_to_search,PageControl_nastrojki.Pages[i].Caption))
        or((node_indx=PageControl_nastrojki.Pages[i].Tag)and(node_indx>0)) then
        page_to_activate:=i;

  if page_to_activate<>-1
    then PageControl_nastrojki.ActivePageIndex:=page_to_activate;
 end;

procedure TForm1.Button_log_ochistitClick(Sender: TObject);
 var l1,l2:string;
 begin
  with Form1.Memo_log_errors do
   begin
    if Lines.Count>=3 then
     begin
      if Lines.Count>=1 then l1:=Lines[0] else l1:='';
      if Lines.Count>=2 then l2:=Lines[1] else l2:='';
      Lines.Clear;
      Lines.Add(l1);
      Lines.Add(l2);
     end else msgs.showFile('clean-');
   end;
 end;

procedure TForm1.Button_log_podrobnej_ob_oshibkaxClick(Sender: TObject);
 begin
  msgs.showFile('all');
 end;

procedure TForm1.Action_SaveVpointsExecute(Sender: TObject);
 begin
  if FileExists(DirControl.current_file) then
   begin
    FileControl.save_vpoints_file(DirControl.current_file);
    DeleteFile(DirControl.AutosaveFullPath);
   end else Action_SaveVpointsAsExecute(Form1);
 end;

procedure TForm1.RadioGroup_ConnectTypeClick(Sender: TObject);
 begin
  if form_created then
   begin
    paper.prorisovat;
    rewrite_ini;
   end;
 end;

procedure TForm1.PageControl_derevo_xodovEnter(Sender: TObject);
begin
  if form_created then TabSheet_derevo_osnovnoe.Caption:='Дерево ходов';
end;

procedure TForm1.PageControl_derevo_xodovExit(Sender: TObject);
begin
  if form_created then
    TabSheet_derevo_osnovnoe.Caption:='Дерево ходов (для управления щелкните по табличке или наведите на нее курсор)';
end;

procedure TForm1.RadioGroup_ConnectTypeExit(Sender: TObject);
begin
msgs.ShowHint('');
end;


procedure TForm1.menu_N27Click(Sender: TObject);
 var
  date_new:integer;
  info_text:TStrings;
  info_formatted,link:string;
 begin
  if msgs.ShowBoolDialog(
      'Для проверки версии необходимо соединение с интернетом.'
      +'\nЕсли его нет, программа ЗАКРОЕТСЯ с ошибкой.'
      +'\n\nЕсть соединение с интернетом?')=false then exit;
  info_text:=TStringList.Create;
  info_text.Text:=WebDownload.GetFromAddress(
    'http://vn91.narod.ru/directories/tochki'
    +'/directories/vpoints/lastversion.txt');

  date_new:=StrToInt(info_text.Values['date_build']);
  link:=info_text.Values['link'];
  if link='' then
    link:='http://vn91.narod.ru/directories/tochki/'
      +'directories/vpoints/vpoints_setup.exe';

  info_text.Delete(0);
  while AnsiContainsStr(info_text[0],'=') do
  begin
    info_text.Delete(0);
  end;
  info_formatted:='\n\nНиже написана информация о новой версии.\n\n'+info_text.Text;

  if date_build=date_new
   then
    msgs.ShowMsg(
      'У вас самая последняя версия этой программы ('
      +DateToStr(date_build)+')'+info_formatted)
  else if date_build>date_new
   then
    msgs.ShowMsg(
        'Номер вашей версии ВЫШЕ, чем тот, что указан в интернете.'
        +'\nВидимо, я просто забыл обновить.'
        +'\nНапишите мне если увидите подобное сообщение '
        +'(я vn91, он же Вася Новиков).'+info_formatted
        )
  else if date_build<date_new
   then
    msgs.ShowLink(
      link,
      'Ваша версия программы - '+DateToStr(date_build)+'.'
      +'\nНовая версия - '+DateToStr(date_new)+'.'
      +info_formatted
      );
 end;

procedure TForm1.ComboBox_ColorThemeChange(Sender: TObject);
  procedure apply_default_DrawRules;
   begin
    CheckBox_black_border.Checked:=false;
    RadioGroup_SurroundType.ItemIndex:=0;
   end;
 begin
  with colors_my do
   begin
    if AnsiLowerCase(ComboBox_ColorTheme.Text)='темная' then
     begin
      cred:=4227327;
      cblue:=0;
      csetka_lines:=8421504;
      cbackground:=4210752;
      apply_default_DrawRules;
      apply_colors;
     end;
    if AnsiLowerCase(ComboBox_ColorTheme.Text)='стандартная' then
     begin
      cred:=200;
      cblue:=13107200;
      csetka_lines:=11579568;
      cbackground:=16777215;
      apply_default_DrawRules;
      apply_colors;
     end;
    if AnsiLowerCase(ComboBox_ColorTheme.Text)='красно-черная' then
     begin
      cred:=255;
      cblue:=0;
      csetka_lines:=8421504;
      cbackground:=15790320;
      apply_default_DrawRules;
      apply_colors;
     end;
    if AnsiLowerCase(ComboBox_ColorTheme.Text)='ч/б темная' then
     begin
      cred:=14540253;
      cblue:=0;
      csetka_lines:=8421504;
      cbackground:=4737096;
      apply_default_DrawRules;
      apply_colors;
     end;
    if AnsiLowerCase(ComboBox_ColorTheme.Text)='ч/б светлая' then
     begin
      cred:=16777215;
      cblue:=0;
      csetka_lines:=10790052;
      cbackground:=16777215;
      apply_default_DrawRules;
      RadioGroup_SurroundType.ItemIndex:=1;
      CheckBox_black_border.Checked:=true;
      apply_colors;
     end;
   end;
 end;

procedure TForm1.RegisterFileType(ext: string; FileName: string);
 var
  reg: TRegistry;
 begin
  reg:=TRegistry.Create;
  with reg do
   begin
    RootKey:=HKEY_CLASSES_ROOT;
    OpenKey('.'+ext,True);
    WriteString('',ext+'file');
    CloseKey;
    CreateKey(ext+'file');
    OpenKey(ext+'file\DefaultIcon',True);
    WriteString('',FileName+',0');
    CloseKey;
    OpenKey(ext+'file\shell\open\command',True);
    WriteString('',FileName+' "%1"');
    CloseKey;
    Free;
   end;
 end;


procedure TForm1.Button_OpenSgftochkiWithVpointsClick(Sender: TObject);
begin
Self.RegisterFileType('sgftochki',Application.ExeName);
end;
procedure TForm1.Button_OpenSgfWithVpointsClick(Sender: TObject);
begin
Self.RegisterFileType('sgf',Application.ExeName);
end;
procedure TForm1.Button_OpenSavWithVPointsClick(Sender: TObject);
begin
if msgs.ShowBoolDialog(
'Учтите, что формат файла "sav" может быть использован во многих программах/играх, '
+'не только pointsXT и VPoints.'
+'\n\nЕсли другая программа или игра открывала в процессе работы файлы sav - '
+'она продолжит это делать как и раньше.'
+'\nНо если вы открывали sav-данные двойным щелчком по этому sav, то теперь '
+'у вас данные будут автоматически открываться через VPoints.'
+'\n\nПродолжить?'
) then
 Self.RegisterFileType('sav',Application.ExeName);
end;

procedure TForm1.deleteme_RadioGroup_showLabelsClick(Sender: TObject);
 var show:boolean;
 begin
  show:=(CheckBox_showLabels.Checked=false);
  Image_pole_vneshnee.Visible:=show;
  Shape_last_turn.Visible:=show;
  if show=false then msgs.showFile('labelsHide');
 end;

procedure TForm1.Button_ResetErrorLogClick(Sender: TObject);
 begin
  DirControl.pointsxt220_HomePath:=dir_pointsxt220_HomePath;
  LabeledEdit_dir_pointsxt.Text:=DirControl.pointsxt220_HomePath;
  rewrite_ini;
 end;


procedure TForm1.menu_N32Click(Sender: TObject);
begin
PageControl_nastrojki.ActivePageIndex:=TabSheet_igra.PageIndex;
end;

procedure TForm1.menu_N33Click(Sender: TObject);
begin
TabSheet_metki.PageControl.ActivePageIndex:=TabSheet_metki.PageIndex;
end;

procedure TForm1.menu_N34Click(Sender: TObject);
begin
TabSheet_PaperSize.PageControl.ActivePageIndex:=TabSheet_PaperSize.PageIndex;
end;

procedure TForm1.menu_N35Click(Sender: TObject);
begin
TabSheet_players.PageControl.ActivePageIndex:=TabSheet_players.PageIndex;
end;

procedure TForm1.menu_N36Click(Sender: TObject);
begin
PageControl_nastrojki.ActivePageIndex:=TabSheet_comments.PageIndex;
end;

procedure TForm1.menu_N37Click(Sender: TObject);
begin
PageControl_nastrojki.ActivePageIndex:=TabSheet_colors.PageIndex;
end;

procedure TForm1.menu_N38Click(Sender: TObject);
begin
  PageControl_nastrojki.ActivePageIndex:=TabSheet_prorisovka.PageIndex;
end;

procedure TForm1.menu_N40Click(Sender: TObject);
begin
TabSheet_napominalka.PageControl.ActivePageIndex:=TabSheet_napominalka.PageIndex;
end;

procedure TForm1.menu_N41Click(Sender: TObject);
begin
TabSheet_ErrorLog.PageControl.ActivePageIndex:=TabSheet_ErrorLog.PageIndex;
end;

procedure TForm1.menu_N42Click(Sender: TObject);
begin
PageControl_nastrojki.ActivePageIndex:=TabSheet_system.PageIndex;
end;

procedure TForm1.StringGrid_tabl_punktovEnter(Sender: TObject);
begin
StringGrid_tabl_punktov.Update;
end;

procedure TForm1.LabeledEdit_dir_pointsxtExit(Sender: TObject);
 begin
  if form_created then
   begin
    if LabeledEdit_dir_pointsxt.Text<>'' then
     begin
      DirControl.pointsxt220_HomePath:=LabeledEdit_dir_pointsxt.Text;
      rewrite_ini;
     end else begin
      LabeledEdit_dir_pointsxt.Text:=dir_pointsxt220_HomePath;
     end;
   end;
 end;

procedure TForm1.LabeledEdit_commentatorEnter(Sender: TObject);
 begin
//  LabeledEdit_commentator.Text:=derevo.nodes[0].GetValue_byName('AN');
 end;

procedure TForm1.LabeledEdit_commentatorExit(Sender: TObject);
 var pro:TDerevoNodeProperty;
 begin
  pro.name:='AN'; pro.value:=LabeledEdit_commentator.Text;
  derevo.Add_GameProperty(pro);
  derevo.save_autosave;
 end;

procedure TForm1.edit_imya_redExit(Sender: TObject);
 var cur_prop:TDerevoNodeProperty;
 begin
  cur_prop.name:='PW'; cur_prop.value:=edit_imya_red.Text;
  derevo.Add_GameProperty(cur_prop);
  derevo.save_autosave;
 end;

procedure TForm1.edit_imya_blueExit(Sender: TObject);
 var cur_prop:TDerevoNodeProperty;
 begin
  cur_prop.name:='PB'; cur_prop.value:=edit_imya_blue.Text;
  derevo.Add_GameProperty(cur_prop);
  derevo.save_autosave;
 end;

procedure TForm1.edit_imya_redKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then edit_imya_redExit(nil);
end;

procedure TForm1.edit_imya_blueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 begin
  if Key=13 then edit_imya_blueExit(nil);
 end;

procedure TForm1.LabeledEdit_commentatorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key=13 then LabeledEdit_commentatorExit(nil);
end;

procedure TForm1.LabeledEdit_dir_pointsxtKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key=13 then LabeledEdit_dir_pointsxtExit(nil);
end;

procedure TForm1.TabSheet_napominalkaShow(Sender: TObject);
 begin
  msgs.ShowHint('тестовая подсказка');
 end;

function TGameRooms.RoomByName;
 begin
  Result:=rooms[0];
 end;

constructor TGameRoom.Create;
 begin
  inherited;
  name:='';
  history:=TStringList.Create;
  der:=derevo;
  TablNds:=TableNodes;
 end;

procedure TGameRoom.recieve;
 var
  table_action,message_numb,node_numb
//      ,game_action
      :string;
  chr:char;
  i1,i2,i3,i4,i5,msg_numb_int:integer;
 begin
  i1:=1; //pervyj znak "/"
  i2:=PosEx('/',str,i1+1);
  i3:=PosEx('/',str,i2+1);
  table_action:=copy(str,i2+1,i3-i2-1);
  if table_action='s' then
   begin
    i4:=PosEx('/',str,i3+1);
    message_numb:=copy(str,i3+1,i4-i3-1);
    if message_numb='%'
     then msg_numb_int:=0
     else msg_numb_int:=StrToInt(message_numb);
    if msg_numb_int=0 then begin end;
    i5:=PosEx('/',str,i3+1);
    node_numb:=copy(str,i4+1,i5-i4-1);
    chr:=node_numb[1];
    if chr='!' then //cur_node:=der.CurNode
    else if chr='+' then
     begin
     end
    else if chr='&' then
     begin
     end;
   end else begin end;//not recieve...
 end;

procedure GameRecieve(str:string);
 var
  table_name:string;
  i1,i2:integer;
  current_room:TGameRoom;
 begin
  i1:=1; //pervyj znak "/"
  i2:=PosEx('/',str,i1+1);
  table_name:=copy(str,i1+1,i2-i1-1);
  current_room:=roomms.RoomByName(table_name);
  current_room.recieve(str);
 end;


procedure TForm1.menu_N45Click(Sender: TObject);
 var t:TRect;
 begin
  t:=Panel_IgrovoePole.BoundsRect;
  if paper.ismaximized=false then
   begin
    paper.backup_left:=t.Left;
    paper.backup_top:=t.Top;
    paper.backup_DRight:=Panel_IgrovoePole.Parent.ClientWidth-t.Right;
    paper.backup_DBottom:=Panel_IgrovoePole.Parent.ClientHeight-t.Bottom;
    t.Left:=0;
    t.Top:=0;
    t.Right:=Form1.ClientWidth;
    t.Bottom:=Form1.ClientHeight-StatusBar.Height;
    menu_N45.Caption:='-><-';
   end else begin
    t.Left:=paper.backup_left;
    t.Top:=paper.backup_top;
    t.Right:=Panel_IgrovoePole.Parent.ClientWidth-paper.backup_DRight;
    t.Bottom:=Panel_IgrovoePole.Parent.ClientHeight-paper.backup_DBottom;
    menu_N45.Caption:='<-->';
    FocusOn_TablPunktov;
   end;
  Panel_IgrovoePole.BoundsRect:=t;
  paper.prorisovat_full;
  paper.ismaximized:=not paper.ismaximized;
  menu_N28.Visible:=not paper.ismaximized;
  menu_N30.Visible:=not paper.ismaximized;
  menu_N31.Visible:=not paper.ismaximized;
  menu_N34.Visible:=not paper.ismaximized;
  menu_N50.Visible:=not paper.ismaximized;
 end;

procedure TForm1.CheckBox_showLabelsClick(Sender: TObject);
 var show:boolean;
 begin
  show:=(CheckBox_showLabels.Checked=false);
  Image_pole_vneshnee.Visible:=show;
  Shape_last_turn.Visible:=show;
  if show=false then msgs.showFile('labelsHide');
 end;


procedure TForm1.Action_massConvertExecute(Sender: TObject);
//mass converter (*.sav) to (*.sgftochki).
 var
  i,j:integer;
  cur_name,rename_to_base,rename_to:string;
  num_conv:integer;
 begin
  derevo.new_game_processing:=true;
  msgs.showFile('massconverter_before');
  num_conv:=0;
  if OpenDialog_massConvert.Execute then
   begin
    for i:=0 to OpenDialog_massConvert.Files.Count-1 do
     begin
      cur_name:=OpenDialog_massConvert.Files[i];
      FileControl.open_pointsxt220_file(cur_name);
      if RadioGroup_convertRules.ItemIndex=0 then
       begin
        rename_to_base:=ChangeFileExt(cur_name,'');
        rename_to_base:=msgs.translit(rename_to_base);
       end else begin
        rename_to_base:=ExtractFileDir(cur_name)+'\'+msgs.fileNameWOSuffix;
       end;
      rename_to:=rename_to_base+'.sgftochki';
      j:=0;
      while (FileExists(rename_to))and(cur_name<>rename_to) do
      begin
        inc(j);
        rename_to:=rename_to_base+' '+msgs.inttostr_fixed_length(j,2)+'.sgftochki';
      end;

      FileControl.save_vpoints_file(rename_to_base);
      inc(num_conv);
     end;
    msgs.ShowMsg('Успешно сконвертировано '+IntToStr(num_conv)+' файлов.');
   end;

  NewGame_WithRules;
  derevo.new_game_processing:=false;
  Execute_NodeProperties_VisualOnly(0);
  DeleteFile(DirControl.AutosaveFullPath);
 end;

procedure TForm1.Action_massRenameSavExecute(Sender: TObject);
//mass *.sav renamer
 var
  i,j:integer;
  cur_name,rename_to:string;
  num_conv:integer;
//  failed_sgfExist:TStrings;
 begin
  derevo.new_game_processing:=true;
  msgs.showFile('massRenamerSav_before');
  num_conv:=0;
  if OpenDialog_massConvert.Execute then
   begin
    for i:=0 to OpenDialog_massConvert.Files.Count-1 do
     begin
      cur_name:=OpenDialog_massConvert.Files[i];
      FileControl.open_pointsxt220_file(cur_name);
      j:=0;
      rename_to:=ExtractFileDir(cur_name)+'\'+msgs.fileNameWOSuffix+'.sav';
      while (FileExists(rename_to))and(cur_name<>rename_to) do
      begin
        inc(j);
        rename_to:=ExtractFileDir(cur_name)+'\'+msgs.fileNameWOSuffix+' '
            +msgs.inttostr_fixed_length(j,2)+'.sav';
      end;
      RenameFile(cur_name,rename_to);
      inc(num_conv);
     end;
    msgs.ShowMsg('Успешно переименовано '+IntToStr(num_conv)+' файлов.');
   end;
  NewGame_WithRules;
  derevo.new_game_processing:=false;
  Execute_NodeProperties_VisualOnly(0);
  DeleteFile(DirControl.AutosaveFullPath);
 end;

procedure TForm1.Action_toProblemExecute(Sender: TObject);
 var
  i,j,newNode:integer;
  nodesArray:array of integer;
  countdown_node,num_converted:integer;
  curPro:TDerevoNodeProperty;
 begin
  SetLength(nodesArray,0);
  countdown_node:=derevo.CurNode;
  repeat
    SetLength(nodesArray,length(nodesArray)+1);
    nodesArray[length(nodesArray)-1]:=countdown_node;
    countdown_node:=derevo.nodes[countdown_node].parent_node;
  until countdown_node=0;

  newNode:=0;//for Delphi debug
  num_converted:=0;
  for i:=Length(nodesArray)-1 downto 0 do
    for j:=0 to Length(derevo.nodes[nodesArray[i]].pr_array)-1 do
     begin
      curPro:=derevo.nodes[nodesArray[i]].pr_array[j];
      if (curPro.name='W')or(curPro.name='AW') then
       begin
        if num_converted=0 then newNode:=derevo.AddNode_GiveNewIndx(0);
        curPro.name:='AW';
        derevo.nodes[newNode].AddProperty(curPro,true);
        inc(num_converted);
       end;
      if (curPro.name='B')or(curPro.name='AB') then
       begin
        if num_converted=0 then newNode:=derevo.AddNode_GiveNewIndx(0);
        curPro.name:='AB';
        derevo.nodes[newNode].AddProperty(curPro,true);
        inc(num_converted);
       end;
     end;
  if num_converted>0 then
   begin
    TableNodes.recalculate_structure;
    Derevo_JumpToNode_Immediate(newNode);
    TableNodes.Select_CurDerevoNode;
    msgs.showFile('toProblem_executed');
   end else msgs.showFile('toProblem_warning');

 end;

procedure TForm1.StringGrid_tabl_punktovMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  begin
  TableNodes.recalculate_CurSelection;
  if ssCtrl in Shift then
    DerevoJump_PageDown
  else
    DerevoJump_Right(false);
  Handled:=true;
end;
procedure TForm1.StringGrid_tabl_punktovMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  begin
  TableNodes.recalculate_CurSelection;
  if ssCtrl in Shift then
    DerevoJump_PageUp
  else
    DerevoJump_Left(false);
  Handled:=true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Form_coordinates:=TForm_coordinates.Create(nil);
Form_coordinates.Show;
end;

procedure TForm1.CheckBox_ShowCoordinatesClick(Sender: TObject);
begin
  paper.prorisovat;
end;

end.

