object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 282
  Width = 550
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Mois'#233's Lucas\Documents\Embarcadero\Studio\Proj' +
        'ects\ODA\DB\DB.db'
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
end
