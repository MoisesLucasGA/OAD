object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 282
  Width = 550
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=sQLite')
    LoginPrompt = False
    Left = 416
    Top = 128
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from QUESTAO')
    Left = 176
    Top = 128
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from QUESTAO')
    Left = 96
    Top = 176
  end
end
