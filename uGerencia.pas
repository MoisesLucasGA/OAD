unit uGerencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uModulo, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmGerencia = class(TForm)
    Label1: TLabel;
    edtID: TEdit;
    Label2: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    FDTable1: TFDTable;
    FDConnection1: TFDConnection;
    FDTable1id: TFDAutoIncField;
    FDTable1enunciado: TWideMemoField;
    FDTable1resposta: TWideMemoField;
    FDTable1item1: TWideMemoField;
    FDTable1item2: TWideMemoField;
    FDTable1item3: TWideMemoField;
    FDTable1foto: TStringField;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label11: TLabel;
    DBMemo3: TDBMemo;
    Label12: TLabel;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerencia: TfrmGerencia;

implementation

{$R *.dfm}


procedure TfrmGerencia.FormCreate(Sender: TObject);
begin
  FDConnection1.Connected := False;
  FDConnection1.Params.Database := 'DB.db';
  FDConnection1.Connected := True;
end;

procedure TfrmGerencia.FormShow(Sender: TObject);
begin
  FDTable1.Active := true;
  DataSource1.Enabled := true;
end;

end.
