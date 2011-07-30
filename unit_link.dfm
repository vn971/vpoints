object Form_link: TForm_link
  Left = 367
  Top = 207
  Width = 584
  Height = 371
  Caption = 'vpoints-link'
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDeactivate = FormDeactivate
  OnKeyPress = FormKeyPress
  DesignSize = (
    576
    344)
  PixelsPerInch = 96
  TextHeight = 16
  object Memo_deskription: TMemo
    Left = 16
    Top = 64
    Width = 540
    Height = 257
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Edit_action: TEdit
    Left = 16
    Top = 19
    Width = 539
    Height = 24
    Cursor = crDrag
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    Text = 'Edit_action'
    OnClick = Edit_actionClick
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = -20
    Width = 17
    Height = 17
    TabOrder = 2
    Kind = bkAbort
  end
end
