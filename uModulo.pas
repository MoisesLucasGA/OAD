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
    FDQuery2: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Conectar:Boolean;
    function Desconectar:Boolean;
    function BuscarQuestao(idQuestao:Integer):Boolean;
    function ListarQuestao:Boolean;
    function QtdQuestao: Integer;
    function InserirUsuario(nome:string):Boolean;
    function BuscarUsuario(nome:string):Boolean;
    function BuscarUsuarioID(id:Integer):Boolean;
    function InserirScore(id:Integer;tempo:TDateTime):Boolean;
    function BuscarScore:Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

function TDM.BuscarScore: Boolean;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT * FROM  SCORE ORDER BY pontuacao LIMIT 10');
  FDQuery1.Open();
  result := True;
end;

function TDM.BuscarUsuario(nome: string): Boolean;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT * FROM USUARIO WHERE nome = :nome');
  FDQuery1.ParamByName('nome').AsString := nome;
  FDQuery1.Open();
  if FDQuery1.RowsAffected > 0 then
    Result := True
  else
    Result := False
end;

function TDM.BuscarUsuarioID(id: Integer): Boolean;
begin
  FDQuery2.Close;
  FDQuery2.SQL.Clear;
  FDQuery2.SQL.Add('SELECT * FROM USUARIO WHERE id = :id');
  FDQuery2.ParamByName('id').AsInteger := id;
  FDQuery2.Open();
  Result := True;
end;

function TDM.Conectar: Boolean;
begin
  FDConnection1.Connected := False;
  FDConnection1.Connected := True;
  Result := True;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
//var
 //path : string;
begin
  FDConnection1.Connected := False;
  //path := ExtractFilePath(ParamStr(0));
  FDConnection1.Params.Database := 'DB.db';
  FDConnection1.Connected := True;
end;

function TDM.Desconectar: Boolean;
begin
  FDConnection1.Connected := False;
  Result := True;
end;


function TDM.InserirScore(id: Integer; tempo: TDateTime): Boolean;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO SCORE(id_usuario,pontuacao) VALUES(:id,:tempo)');
  FDQuery1.ParamByName('id').AsInteger := id;
  FDQuery1.ParamByName('tempo').AsTime := tempo;
  FDQuery1.ExecSQL;
  Result := True;
end;

function TDM.InserirUsuario(nome: string): Boolean;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO USUARIO(nome) VALUES(:nome)');
  FDQuery1.ParamByName('nome').AsString := nome;
  FDQuery1.ExecSQL;
  Result := True;
end;

function TDM.ListarQuestao: Boolean;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT * FROM QUESTAO');
  FDQuery1.Open();
  Result := True;
end;

function TDM.BuscarQuestao(idQuestao: Integer): Boolean;
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
