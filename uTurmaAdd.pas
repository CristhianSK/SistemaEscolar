unit uTurmaAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uData, uTurma, uProfessor, uDisciplina,
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
    lblInputProf: TLabel;
    lblInputDisc: TLabel;
    slcProfessores: TComboBox;
    slcDisciplinas: TComboBox;
    procedure btnModalTurmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure slcProfessoresChange(Sender: TObject);
    procedure slcDisciplinasChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    indexTurmaSelecionado : integer;
    qntTurmas: Integer;
    novasTurmas: integer;
    professorSelecionado: TProfessor;
    disciplinaSelecionada: TDisciplina;
  end;

var
  modalTurma: TmodalTurma;

implementation

{$R *.dfm}
procedure TmodalTurma.btnModalTurmaClick(Sender: TObject);
begin


  if (inputNome.Text = '') or (inputCodigo.Text = '') or (slcProfessores.ItemIndex = -1) or (slcDisciplinas.ItemIndex = -1) then begin
      ShowMessage('Preencha todos os campos!');
      exit;
  end;

  if indexTurmaSelecionado <> -1 then begin
    var turma := getTurmaById(listaTurmas[indexTurmaSelecionado].getCodigo);

    dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_turmas SET turma_nome='+ QuotedStr(inputNome.text) + ', turma_id_professor= '+ (professorSelecionado.getCodigo).ToString + ', turma_id_disciplina= '+ (disciplinaSelecionada.getCodigo).ToString  +' WHERE turma_id = ' + turma.getCodigo.ToString + ';';

    listaTurmas[indexTurmaSelecionado].setNome(inputNome.text);
    listaTurmas[indexTurmaSelecionado].setCodigo(StrToInt(inputCodigo.Text));
    btnModalTurma.Caption := 'Adicionar';
  end else begin
    dbConnection.qryInsert.SQL.Text:= 'INSERT INTO public.tb_turmas (turma_nome, turma_id_professor, turma_id_disciplina) VALUES('+ QuotedStr(inputNome.Text) +','+ (professorSelecionado.getCodigo).ToString +','+ (disciplinaSelecionada.getCodigo).ToString +')';
    listaTurmas.Add(TTurma.Create(StrToInt(inputCodigo.Text), inputNome.Text, professorSelecionado.getCodigo,disciplinaSelecionada.getCodigo));
  end;


    dbConnection.qryInsert.ExecSQL;
    dbConnection.qryMaxTurmas.Close;
    dbConnection.qryMaxTurmas.Open;
    qntTurmas := dbConnection.qryMaxTurmas.FieldByName('total_turmas').AsInteger + 1;
    inputCodigo.Text := (qntTurmas).ToString;
    inputNome.Text := '';
    slcProfessores.ItemIndex := -1;
    slcDisciplinas.ItemIndex := -1;
    novasTurmas := novasTurmas + 1;

end;



procedure TmodalTurma.FormCreate(Sender: TObject);

begin
  novasTurmas := 0;
  end;

procedure TmodalTurma.FormShow(Sender: TObject);
var professor : TProfessor;
    disciplina : TDisciplina;
begin
slcProfessores.Clear;
slcDisciplinas.Clear;

  for professor in listaProfessores do begin
    slcProfessores.items.Add(professor.getNome);
  end;

  for disciplina in listaDisciplinas do begin
    slcDisciplinas.items.Add(disciplina.getNome);

  end;


  dbConnection.qryMaxTurmas.Close;
  dbConnection.qryMaxTurmas.Open;
  qntTurmas := dbConnection.qryMaxTurmas.FieldByName('total_turmas').AsInteger + 1;
  inputCodigo.Text := (qntTurmas).ToString;
  if indexTurmaSelecionado <> -1 then begin
      var turma := getTurmaById(listaTurmas[indexTurmaSelecionado].getCodigo);
      inputCodigo.Text := turma.getCodigo.ToString ;
      inputNome.Text := turma.getNome;
      slcProfessores.ItemIndex := indexTurmaSelecionado;
      slcDisciplinas.ItemIndex := indexTurmaSelecionado;

  end;

  end;


procedure TmodalTurma.slcDisciplinasChange(Sender: TObject);
var
  indice: Integer;
begin
  indice := slcDisciplinas.ItemIndex;

  if indice > -1 then begin
    disciplinaSelecionada := listaDisciplinas[indice];
  end;
end;



procedure TmodalTurma.slcProfessoresChange(Sender: TObject);
var
  indice: Integer;
begin
  indice := slcProfessores.ItemIndex;

  if indice > -1 then begin
    professorSelecionado := listaProfessores[indice];
  end;
end;

end.
