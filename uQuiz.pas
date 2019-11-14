unit uQuiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uModulo,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.Imaging.jpeg;

type
  TfrmQuiz = class(TForm)
    imgTira: TImage;
    lblEnunciado: TLabel;
    btnConfirmar: TButton;
    rBtnA: TRadioButton;
    rBtnB: TRadioButton;
    rBtnC: TRadioButton;
    rBtnD: TRadioButton;
    btnProximo: TButton;
    pnlMain: TPanel;
    pnlQuiz: TPanel;
    btnSair: TButton;
    pnlItems: TPanel;
    PageControl1: TPageControl;
    tbQuestao1: TTabSheet;
    procedure GerarItems;
    procedure GerarQuestao;
    procedure Acertou;
    procedure FormCreate(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Centralizar;
    procedure Resetar;
    procedure Formatar;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idQuestao: Integer;
    qtdQuestao: Integer;
    resposta : string;
  end;

var
  frmQuiz: TfrmQuiz;
  TempoInicio: TTime;
  TempoFim: TTime;


implementation

{$R *.dfm}
uses uMain;

procedure TfrmQuiz.Acertou;
begin
  if (btnConfirmar.Enabled = true) then
    begin
      btnConfirmar.Enabled := false;
      rBtnA.Enabled := false;
      rBtnB.Enabled := false;
      rBtnC.Enabled := false;
      rBtnD.Enabled := false;
      btnProximo.Enabled := True;
    end
    else
    begin
      btnConfirmar.Enabled := true;
      rBtnA.Enabled := true;
      rBtnB.Enabled := true;
      rBtnC.Enabled := true;
      rBtnD.Enabled := true;
      btnProximo.Enabled := false;
    end;
end;

procedure TfrmQuiz.btnConfirmarClick(Sender: TObject);
begin
  if (rBtnA.Checked = false) and (rBtnB.Checked = false) and (rBtnC.Checked = false) and (rBtnD.Checked = false) then
    begin
      ShowMessage('Selecione um item por favor');
    end
  else
    begin
    // VERIFICAR RESPOSTA
        //BUTTON A SELECIONADO
        if(rBtnA.Checked = true) then
          begin
            if rBtnA.Caption = resposta then
              begin
                ShowMessage('ACERTOU!!!!');
                Acertou;
              end
            else
              ShowMessage('Tente novamente');
          end
          //BUTTON B SELECIONADO
          else if (rBtnB.Checked = true) then
            if rBtnB.Caption = resposta then
              begin
                ShowMessage('ACERTOU!!!!');
                Acertou;
              end
            else
            ShowMessage('Tente novamente')
          //BUTTON C SELECIONADO
          else if (rBtnC.Checked = true) then
            if rBtnC.Caption = resposta then
              begin
                ShowMessage('ACERTOU!!!!');
                Acertou;
              end
            else
              ShowMessage('Tente novamente')
          //BUTTON D SELECIONADO
          else if (rBtnD.Checked = true) then
            if rBtnD.Caption = resposta then
              begin
                ShowMessage('ACERTOU!!!!');
                Acertou;
              end
            else
              ShowMessage('Tente novamente');
      end;

end;

procedure TfrmQuiz.btnProximoClick(Sender: TObject);
begin
  if idQuestao = qtdQuestao then
  begin
    ShowMessage('Parabéns você terminou!!!');
    TempoFim := GetTime;
    if DM.Conectar then
    begin
      DM.InserirScore(frmPrincipal.idUsuario,TempoInicio-TempoFim);
      DM.Desconectar;
      frmQuiz.Hide;
      Resetar;
    end;

  end
  else if idQuestao < qtdQuestao then
  begin
    Inc(idQuestao);
    Acertou;
    GerarQuestao;
  end;
  tbQuestao1.Caption := 'Questão ' + idQuestao.ToString;
end;

procedure TfrmQuiz.btnSairClick(Sender: TObject);
begin
  frmQuiz.Hide;
  Resetar;
end;

procedure TfrmQuiz.Centralizar;
begin
  pnlQuiz.Height := self.Height - 50;
  pnlQuiz.Left := (self.Width div 2) - (pnlQuiz.Width div 2);
    imgTira.Height := (pnlQuiz.Height div 2) + 20;
    pnlItems.Height := (self.Height div 2) - 60;
end;

procedure TfrmQuiz.Formatar;
begin
    imgTira.Align := TAlign.alCustom;
    imgTira.Height := 336;
    imgTira.Width := 713;
    imgTira.Top := 0;
    imgTira.Left := 63;

    pnlItems.Align := TAlign.alBottom;

    lblEnunciado.Align := TAlign.alNone;
    lblEnunciado.Height := 41;
    lblEnunciado.Width := 585;
    lblEnunciado.Top := 24;
    lblEnunciado.Left := 63;

    rBtnA.Align := TAlign.alNone;
    rBtnA.Height := 33;
    rBtnA.Width := 281;
    rBtnA.Top := 63;
    rBtnA.Left := 63;

    rBtnB.Align := TAlign.alNone;
    rBtnB.Height := 33;
    rBtnB.Width := 281;
    rBtnB.Top := 63;
    rBtnB.Left := 448;

    rBtnC.Align := TAlign.alNone;
    rBtnC.Height := 33;
    rBtnC.Width := 281;
    rBtnC.Top := 120;
    rBtnC.Left := 63;

    rBtnD.Align := TAlign.alNone;
    rBtnD.Height := 33;
    rBtnD.Width := 281;
    rBtnD.Top := 120;
    rBtnD.Left := 448;

    btnSair.Align := TAlign.alNone;
    btnSair.Height := 29;
    btnSair.Width := 75;
    btnSair.Top := 180;
    btnSair.Left := 80;

    btnProximo.Align := TAlign.alNone;
    btnProximo.Height := 29;
    btnProximo.Width := 75;
    btnProximo.Top := 180;
    btnProximo.Left := 582;

    btnConfirmar.Align := TAlign.alNone;
    btnConfirmar.Height := 29;
    btnConfirmar.Width := 75;
    btnConfirmar.Top := 180;
    btnConfirmar.Left := 701;
  Centralizar;
end;

procedure TfrmQuiz.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  centralizar;
end;

procedure TfrmQuiz.FormCreate(Sender: TObject);
begin
Resetar;
btnProximo.Enabled := false;
end;

procedure TfrmQuiz.FormShow(Sender: TObject);
begin
if DM.Conectar then
  begin
    qtdQuestao := DM.QtdQuestao;
  end;
  DM.Desconectar;
TempoInicio := GetTime;
Formatar;
GerarQuestao;
end;

procedure TfrmQuiz.GerarItems;
var
  j : Integer;

begin


  j := Random(4);
  if j=0 then
  begin
    rBtnA.Caption := dm.FDQuery1.FieldByName('resposta').AsString;
    rBtnB.Caption := dm.FDQuery1.FieldByName('item1').AsString;
    rBtnC.Caption := dm.FDQuery1.FieldByName('item2').AsString;
    rBtnD.Caption := dm.FDQuery1.FieldByName('item3').AsString;
  end
  else if j=1 then
  begin
    rBtnA.Caption := dm.FDQuery1.FieldByName('item1').AsString;
    rBtnB.Caption := dm.FDQuery1.FieldByName('resposta').AsString;
    rBtnC.Caption := dm.FDQuery1.FieldByName('item2').AsString;
    rBtnD.Caption := dm.FDQuery1.FieldByName('item3').AsString;
  end
  else if j=2 then
  begin
    rBtnA.Caption := dm.FDQuery1.FieldByName('item2').AsString;
    rBtnB.Caption := dm.FDQuery1.FieldByName('item1').AsString;
    rBtnC.Caption := dm.FDQuery1.FieldByName('resposta').AsString;
    rBtnD.Caption := dm.FDQuery1.FieldByName('item3').AsString;
  end
  else if j=3 then
  begin
    rBtnA.Caption := dm.FDQuery1.FieldByName('item3').AsString;
    rBtnB.Caption := dm.FDQuery1.FieldByName('item2').AsString;
    rBtnC.Caption := dm.FDQuery1.FieldByName('item1').AsString;
    rBtnD.Caption := dm.FDQuery1.FieldByName('resposta').AsString;
  end;
end;

procedure TfrmQuiz.GerarQuestao;
var
i : Integer;
begin
  if DM.Conectar then
    begin
      DM.ListarQuestao;
      DM.FDQuery1.First;
      for i := 1 to idQuestao-1 do
      begin
        DM.FDQuery1.Next;
      end;
      imgTira.Picture.LoadFromFile(DM.FDQuery1.FieldByName('foto').AsString);
      lblEnunciado.Caption :=  idQuestao.ToString+') '+DM.FDQuery1.FieldByName('enunciado').AsString;
      resposta := DM.FDQuery1.FieldByName('resposta').AsString;
      GerarItems;
    end;
    DM.Desconectar;
end;

procedure TfrmQuiz.Resetar;
begin
if DM.Conectar then
  begin
    qtdQuestao := DM.QtdQuestao;
  end;
  DM.Desconectar;

  idQuestao := 1;
  btnConfirmar.Enabled := true;
  btnProximo.Enabled := false;
  rBtnA.Checked := false;
  rBtnB.Checked := false;
  rBtnC.Checked := false;
  rBtnD.Checked := false;
  rBtnA.Enabled := true;
  rBtnB.Enabled := true;
  rBtnC.Enabled := true;
  rBtnD.Enabled := true;
  PageControl1.ActivePage := tbQuestao1;
  tbQuestao1.TabVisible := True;
  tbQuestao1.Caption := 'Questão 1';
end;

end.

