object frmGerencia: TfrmGerencia
  Left = 0
  Top = 0
  Caption = 'Gerenciar Quest'#245'es'
  ClientHeight = 510
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 62
    Height = 13
    AutoSize = False
    Caption = 'Quest'#227'o ID: '
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 62
    Height = 13
    AutoSize = False
    Caption = 'Enunciado: '
  end
  object Label6: TLabel
    Left = 32
    Top = 173
    Width = 52
    Height = 13
    Caption = 'Resposta: '
  end
  object Label5: TLabel
    Left = 368
    Top = 173
    Width = 35
    Height = 13
    Caption = 'Item3: '
  end
  object Label7: TLabel
    Left = 32
    Top = 232
    Width = 35
    Height = 13
    AutoSize = False
    Caption = ' Foto:'
  end
  object Label11: TLabel
    Left = 369
    Top = 32
    Width = 26
    Height = 13
    Caption = 'item1'
    FocusControl = DBMemo3
  end
  object Label12: TLabel
    Left = 368
    Top = 104
    Width = 26
    Height = 13
    Caption = 'item2'
    FocusControl = DBMemo4
  end
  object edtID: TEdit
    Left = 128
    Top = 29
    Width = 41
    Height = 21
    Enabled = False
    TabOrder = 0
    Visible = False
  end
  object DBEdit1: TDBEdit
    Left = 128
    Top = 29
    Width = 134
    Height = 21
    DataField = 'id'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 128
    Top = 73
    Width = 185
    Height = 72
    DataField = 'enunciado'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBMemo2: TDBMemo
    Left = 128
    Top = 170
    Width = 185
    Height = 44
    DataField = 'resposta'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBMemo3: TDBMemo
    Left = 464
    Top = 29
    Width = 185
    Height = 44
    DataField = 'item1'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBMemo4: TDBMemo
    Left = 464
    Top = 101
    Width = 185
    Height = 44
    DataField = 'item2'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBMemo5: TDBMemo
    Left = 464
    Top = 170
    Width = 185
    Height = 44
    DataField = 'item3'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit2: TDBEdit
    Left = 128
    Top = 229
    Width = 185
    Height = 21
    DataField = 'foto'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBNavigator1: TDBNavigator
    Left = 216
    Top = 306
    Width = 216
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost]
    TabOrder = 8
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'QUESTAO'
    TableName = 'QUESTAO'
    Left = 496
    Top = 456
    object FDTable1id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTable1enunciado: TWideMemoField
      FieldName = 'enunciado'
      Origin = 'enunciado'
      BlobType = ftWideMemo
    end
    object FDTable1resposta: TWideMemoField
      FieldName = 'resposta'
      Origin = 'resposta'
      BlobType = ftWideMemo
    end
    object FDTable1item1: TWideMemoField
      FieldName = 'item1'
      Origin = 'item1'
      BlobType = ftWideMemo
    end
    object FDTable1item2: TWideMemoField
      FieldName = 'item2'
      Origin = 'item2'
      BlobType = ftWideMemo
    end
    object FDTable1item3: TWideMemoField
      FieldName = 'item3'
      Origin = 'item3'
      BlobType = ftWideMemo
    end
    object FDTable1foto: TStringField
      FieldName = 'foto'
      Origin = 'foto'
      Size = 32767
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Mois'#233's Lucas\Documents\Embarcadero\Studio\Proj' +
        'ects\ODA\Win32\Debug\DB.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 432
    Top = 456
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 368
    Top = 456
  end
end
