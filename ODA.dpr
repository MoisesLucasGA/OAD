program ODA;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmPrincipal},
  uModulo in 'uModulo.pas' {DM: TDataModule},
  uQuiz in 'uQuiz.pas' {frmQuiz},
  uScore in 'uScore.pas' {frmScore},
  uGerencia in 'uGerencia.pas' {frmGerencia};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmQuiz, frmQuiz);
  Application.CreateForm(TfrmScore, frmScore);
  Application.CreateForm(TfrmGerencia, frmGerencia);
  Application.Run;
end.
