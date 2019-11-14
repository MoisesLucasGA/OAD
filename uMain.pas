unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls,uQuiz,uModulo,uScore,uGerencia;

type
  TfrmPrincipal = class(TForm)
    pnlBack: TPanel;
    imgBack: TImage;
    pnlWelcome: TPanel;
    btnIniciar: TButton;
    Label1: TLabel;
    edtNome: TEdit;
    btnScore: TButton;
    btnGerenciar: TButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Centralizar;
    procedure btnIniciarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnScoreClick(Sender: TObject);
    procedure btnGerenciarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idUsuario:Integer;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnGerenciarClick(Sender: TObject);
begin
  frmGerencia.Show;
end;

procedure TfrmPrincipal.btnIniciarClick(Sender: TObject);
begin
  if edtNome.Text <> '' then
  begin
    if DM.Conectar then
    begin
      if Not(DM.BuscarUsuario(edtNome.Text)) then
      begin
        DM.InserirUsuario(edtNome.Text);
      end;
    end;
    DM.BuscarUsuario(edtNome.Text);
    idUsuario := DM.FDQuery1.FieldByName('id').AsInteger;
    DM.Desconectar;
    frmQuiz.Show;
  end
  else
  begin
    ShowMessage('Campo Obrigatório');
  end;



end;

procedure TfrmPrincipal.btnScoreClick(Sender: TObject);
begin
  frmScore.Show;
end;

procedure TfrmPrincipal.Centralizar;
begin
  pnlWelcome.Top := (self.Height div 2) - (pnlWelcome.Height div 2);
  pnlWelcome.Left := (self.Width div 2) - (pnlWelcome.Width div 2);
end;

procedure TfrmPrincipal.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Centralizar;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
imgBack.Picture.LoadFromFile('MenuBack.jpg');
end;

end.
