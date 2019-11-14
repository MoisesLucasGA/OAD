unit uScore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uModulo, Vcl.StdCtrls;

type
  TfrmScore = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    btnAtualizar: TButton;
    procedure Atualizar;
    procedure btnAtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScore: TfrmScore;

implementation

{$R *.dfm}

{ TfrmScore }

procedure TfrmScore.Atualizar;
var i:Integer;
begin
  ListBox1.Items.Clear;
  if DM.Conectar then
  begin
    DM.BuscarScore;
    DM.FDQuery1.First;
    for i := 1 to DM.FDQuery1.RowsAffected do
    begin
      DM.BuscarUsuarioID(DM.FDQuery1.FieldByName('id_usuario').AsInteger);
      ListBox1.Items.Add(i.ToString + '° < ' + DM.FDQuery2.FieldByName('nome').AsString + ' > _______' + DM.FDQuery1.FieldByName('pontuacao').AsString);
      DM.FDQuery1.Next;
    end;

  end;
end;

procedure TfrmScore.btnAtualizarClick(Sender: TObject);
begin
  Atualizar;
end;

end.


