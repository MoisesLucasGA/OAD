unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls,uQuiz,uModulo;

type
  TfrmPrincipal = class(TForm)
    pnlBack: TPanel;
    imgBack: TImage;
    pnlWelcome: TPanel;
    btnIniciar: TButton;
    Label1: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Centralizar;
    procedure btnIniciarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnIniciarClick(Sender: TObject);
begin
 frmQuiz.Show;
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
imgBack.Picture.LoadFromFile('..\..\images\MenuBack.jpg');
end;

end.
