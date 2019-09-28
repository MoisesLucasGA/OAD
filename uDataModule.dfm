object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 323
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Mois'#233's Lucas\Documents\Embarcadero\Studio\Proj' +
        'ects\ODA\DB\DB.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 376
    Top = 64
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 144
    Top = 120
  end
end
