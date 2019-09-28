unit uQuiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uModulo;

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
    procedure GerarItems;
    procedure GerarQuestao;
    procedure FormCreate(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Centralizar;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    idQuestao: Integer;
  end;

var
  frmQuiz: TfrmQuiz;
  

implementation

{$R *.dfm}

procedure TfrmQuiz.btnConfirmarClick(Sender: TObject);
begin
  if (rBtnA.Checked = false) and (rBtnB.Checked = false) and (rBtnC.Checked = false) and (rBtnD.Checked = false) then
    begin
      ShowMessage('Selecione um item por favor');
    end
  else
    begin
      ShowMessage('Teste');
    end;

end;

procedure TfrmQuiz.btnProximoClick(Sender: TObject);
begin
  Inc(idQuestao);
  GerarQuestao;
end;

procedure TfrmQuiz.Centralizar;
begin
  
  pnlQuiz.Top := (self.Height div 2) - (pnlQuiz.Height div 2);
  pnlQuiz.Left := (self.Width div 2) - (pnlQuiz.Width div 2);

end;

procedure TfrmQuiz.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  centralizar;
end;

procedure TfrmQuiz.FormCreate(Sender: TObject);
begin
idQuestao := 1;
//GerarQuestao;
end;

procedure TfrmQuiz.FormShow(Sender: TObject);
begin
GerarQuestao;
end;

procedure TfrmQuiz.GerarItems;
var
  item : array[0..3] of string;
  j : Integer;

begin
  item[0] := dm.FDQuery1.FieldByName('item1').AsString;
  item[1] := dm.FDQuery1.FieldByName('item2').AsString;
  item[2] := dm.FDQuery1.FieldByName('item3').AsString;
  item[3] := dm.FDQuery1.FieldByName('resposta').AsString;

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
      if idQuestao <> 1 then
      begin
        for i := 1 to idQuestao do
        begin
          DM.FDQuery1.Next;
        end;  
      end;
      imgTira.Picture.LoadFromFile(DM.FDQuery1.FieldByName('foto').AsString);
      lblEnunciado.Caption := DM.FDQuery1.FieldByName('enunciado').AsString;
      GerarItems;
    end;
    DM.Desconectar;
end;

end.
