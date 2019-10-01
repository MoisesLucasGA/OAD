unit uModulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,System.StrUtils;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Conectar:Boolean;
    function Desconectar:Boolean;
    function ListarQuestao(idQuestao:Integer):Boolean;
    function QtdQuestao: Integer;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

function TDM.Conectar: Boolean;
begin
  FDConnection1.Connected := False;
  FDConnection1.Connected := True;
  Result := True;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
 path : string;
begin
  FDConnection1.Connected := False;
  path := ExtractFilePath(ParamStr(0));
  FDConnection1.Params.Database := path+'DB.db';
  FDConnection1.Connected := True;
end;

function TDM.Desconectar: Boolean;
begin
  FDConnection1.Connected := False;
  Result := True;
end;


function TDM.ListarQuestao(idQuestao: Integer): Boolean;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT * FROM QUESTAO WHERE id = :idQuestao');
  FDQuery1.ParamByName('idQuestao').AsInteger := idQuestao;
  FDQuery1.Open();
  Result := True;
end;

function TDM.QtdQuestao: Integer;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT * FROM QUESTAO');
  FDQuery1.Open();
  Result := FDQuery1.RowsAffected;
end;

end.
