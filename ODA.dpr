program ODA;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmPrincipal},
  uModulo in 'uModulo.pas' {DM: TDataModule},
  uQuiz in 'uQuiz.pas' {frmQuiz};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmQuiz, frmQuiz);
  Application.Run;
end.
