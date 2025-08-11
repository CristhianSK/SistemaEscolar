unit uTurmaAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uData, uTurma,
  FireDAC.Comp.Client, uConnection, uListas;


type
  TmodalTurma = class(TForm)
    pnlAdicionarTurma: TPanel;
    Label1: TLabel;
    lblInputCodigo: TLabel;
    lblInputNome: TLabel;
    btnModalTurma: TButton;
    inputCodigo: TEdit;
    inputNome: TEdit;
    inputCodigoProf: TEdit;
    lblInputProf: TLabel;
    inputCodigoDisc: TEdit;
    lblInputDisc: TLabel;
    slcProfessores: TComboBox;
    procedure btnModalTurmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    indexTurmaSelecionado : integer;
    nomeTurmaSelecionado : String;
    qntTurmas: Integer;
    novasTurmas: integer;
  end;

var
  modalTurma: TmodalTurma;

implementation

{$R *.dfm}
procedure TmodalTurma.btnModalTurmaClick(Sender: TObject);
begin


  if (inputNome.Text = '') or (inputCodigo.Text = '') or (inputCodigoProf.Text = '') or (inputCodigoDisc.Text = '') then begin
      ShowMessage('Preencha todos os campos!');
      exit;
  end;

  if indexTurmaSelecionado <> -1 then begin
    var turma := getTurmaById(listaTurmas[indexTurmaSelecionado].getCodigo);

    dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_turmas SET turma_nome='+ QuotedStr(inputNome.text) + ', turma_id_professor= '+ inputCodigoProf.Text + ', turma_id_disciplina= '+ inputCodigoDisc.Text  +' WHERE turma_id = ' + turma.getCodigo.ToString + ';';

    listaTurmas[indexTurmaSelecionado].setNome(inputNome.text);
    listaTurmas[indexTurmaSelecionado].setCodigo(StrToInt(inputCodigo.Text));
    btnModalTurma.Caption := 'Adicionar';
  end else begin
    dbConnection.qryInsert.SQL.Text:= 'INSERT INTO public.tb_turmas (turma_nome, turma_id_professor, turma_id_disciplina) VALUES('+ QuotedStr(inputNome.Text) +','+ inputCodigoProf.Text +','+ inputCodigoDisc.Text +')';
    listaTurmas.Add(TTurma.Create(StrToInt(inputCodigo.Text), inputNome.Text, StrToInt(inputCodigoProf.Text), StrToInt(inputCodigoDisc.Text)));
  end;


    dbConnection.qryInsert.ExecSQL;
    dbConnection.qryMaxTurmas.Close;
    dbConnection.qryMaxTurmas.Open;
    qntTurmas := dbConnection.qryMaxTurmas.FieldByName('total_turmas').AsInteger + 1;
    inputCodigo.Text := (qntTurmas).ToString;
    inputNome.Text := '';
    inputCodigoProf.Text := '';
    inputCodigoDisc.Text := '';
    novasTurmas := novasTurmas + 1;

end;



 procedure TmodalTurma.FormCreate(Sender: TObject);
begin
  novasTurmas := 0;

{
  for professor in listaProfessores do begin
   slcProfessores.items.Add(professor);
  end;
 }

  end;

procedure TmodalTurma.FormShow(Sender: TObject);
begin


  dbConnection.qryMaxTurmas.Close;
  dbConnection.qryMaxTurmas.Open;
  qntTurmas := dbConnection.qryMaxTurmas.FieldByName('total_turmas').AsInteger + 1;
  inputCodigo.Text := (qntTurmas).ToString;
  if indexTurmaSelecionado <> -1 then begin
      var turma := getTurmaById(listaTurmas[indexTurmaSelecionado].getCodigo);
      inputCodigo.Text := turma.getCodigo.ToString ;
      inputNome.Text := turma.getNome;
  end;

  end;
end.
