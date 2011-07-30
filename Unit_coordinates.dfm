object Form_coordinates: TForm_coordinates
  Left = 192
  Top = 107
  Width = 559
  Height = 437
  Caption = 'Form_coordinates'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit1: TLabeledEdit
    Left = 80
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'vkontakte'
    TabOrder = 0
  end
  object LabeledEdit2: TLabeledEdit
    Left = 80
    Top = 88
    Width = 121
    Height = 21
    EditLabel.Width = 62
    EditLabel.Height = 13
    EditLabel.Caption = 'board coords'
    TabOrder = 1
  end
  object LabeledEdit3: TLabeledEdit
    Left = 80
    Top = 128
    Width = 121
    Height = 21
    EditLabel.Width = 14
    EditLabel.Height = 13
    EditLabel.Caption = 'sgf'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 216
    Top = 48
    Width = 75
    Height = 25
    Caption = '-->'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 88
    Width = 75
    Height = 25
    Caption = '-->'
    TabOrder = 4
  end
  object Button3: TButton
    Left = 216
    Top = 128
    Width = 75
    Height = 25
    Caption = '-->'
    TabOrder = 5
  end
end
