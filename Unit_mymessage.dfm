object Form_MyMessage: TForm_MyMessage
  Left = 336
  Top = 184
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'vpoints message'
  ClientHeight = 135
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    594
    135)
  PixelsPerInch = 96
  TextHeight = 13
  object Button_ok: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Memo: TMemo
    Left = 8
    Top = 8
    Width = 577
    Height = 84
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Color = clWhite
    ReadOnly = True
    TabOrder = 1
    OnKeyDown = MemoKeyDown
  end
end
