object frmScore: TfrmScore
  Left = 0
  Top = 0
  Caption = 'Pontua'#231#227'o'
  ClientHeight = 503
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 184
    Top = 8
    Width = 345
    Height = 49
    Alignment = taCenter
    AutoSize = False
    Caption = 'OS 10 MAIS R'#193'PIDOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object ListBox1: TListBox
    Left = 184
    Top = 72
    Width = 345
    Height = 361
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnAtualizar: TButton
    Left = 315
    Top = 448
    Width = 81
    Height = 33
    Caption = 'Atualizar'
    TabOrder = 1
    OnClick = btnAtualizarClick
  end
end
