object frmQuiz: TfrmQuiz
  Left = 0
  Top = 0
  Caption = 'Quiz'
  ClientHeight = 491
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 491
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 600
    ExplicitHeight = 505
    object pnlQuiz: TPanel
      Left = 16
      Top = 1
      Width = 697
      Height = 489
      Align = alCustom
      TabOrder = 0
      object lblEnunciado: TLabel
        Left = 64
        Top = 265
        Width = 129
        Height = 32
        Alignment = taCenter
        Caption = 'lblEnunciado'
        Layout = tlCenter
      end
      object imgTira: TImage
        Left = 88
        Top = 1
        Width = 561
        Height = 258
        Align = alCustom
        Constraints.MaxWidth = 900
        Stretch = True
      end
      object rBtnA: TRadioButton
        Left = 64
        Top = 311
        Width = 243
        Height = 33
        Caption = 'A)'
        TabOrder = 0
        WordWrap = True
      end
      object rBtnB: TRadioButton
        Left = 368
        Top = 311
        Width = 243
        Height = 33
        Caption = 'B)'
        TabOrder = 1
        WordWrap = True
      end
      object rBtnC: TRadioButton
        Left = 64
        Top = 384
        Width = 243
        Height = 33
        Caption = 'C)'
        TabOrder = 2
        WordWrap = True
      end
      object rBtnD: TRadioButton
        Left = 368
        Top = 384
        Width = 243
        Height = 33
        Caption = 'D)'
        TabOrder = 3
        WordWrap = True
      end
      object btnProximo: TButton
        Left = 424
        Top = 452
        Width = 75
        Height = 25
        Caption = 'Pr'#243'xima'
        TabOrder = 4
        OnClick = btnProximoClick
      end
      object btnConfirmar: TButton
        Left = 536
        Top = 452
        Width = 75
        Height = 25
        Align = alCustom
        Caption = 'Confirmar'
        TabOrder = 5
        OnClick = btnConfirmarClick
      end
    end
  end
end
