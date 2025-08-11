unit uMatriculaAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uData, uTurma, uAluno, uMatricula,
  FireDAC.Comp.Client, uConnection, uListas;

type
  TmodalMatricula = class(TForm)
    pnlAdicionarTurma: TPanel;
    Label1: TLabel;
    lblInputCodigo: TLabel;
    lblInputAluno: TLabel;
    lblInputTurma: TLabel;
    btnModalMatricula: TButton;
    inputCodigo: TEdit;
    slcAlunos: TComboBox;
    slcTurmas: TComboBox;
    procedure btnModalMatriculaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure slcAlunosChange(Sender: TObject);
    procedure slcTurmasChange(Sender: TObject);
  private
    { Private declarations }
  public
    indexMatriculaSelecionado : integer;
    qntMatriculas: Integer;
    novosMatriculas: integer;
    alunoSelecionado: TAluno;
    turmaSelecionada: TTurma;
  end;

var
  modalMatricula: TmodalMatricula;

implementation

{$R *.dfm}

procedure TmodalMatricula.btnModalMatriculaClick(Sender: TObject);
begin


  if (inputCodigo.Text = '') or (slcAlunos.ItemIndex = -1) or (slcTurmas.ItemIndex = -1) then begin
      ShowMessage('Preencha todos os campos!');
      exit;
  end;

  if indexMatriculaSelecionado <> -1 then begin
    var matricula := getMatriculaById(listaMatriculas[indexMatriculaSelecionado].getCodigo);

    dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_matriculas SET matricula_id_aluno= '+ (alunoSelecionado.getCodigo).ToString + ', matricula_id_turma= '+ (turmaSelecionada.getCodigo).ToString  +' WHERE matricula_id = ' + matricula.getCodigo.ToString + ';';

    listaMatriculas[indexMatriculaSelecionado].setCodigo(StrToInt(inputCodigo.Text));
    listaMatriculas[indexMatriculaSelecionado].setCodigoAluno(alunoSelecionado.getCodigo);
    listaMatriculas[indexMatriculaSelecionado].setCodigoTurma(turmaSelecionada.getCodigo);

    btnModalMatricula.Caption := 'Adicionar';
  end else begin
    dbConnection.qryInsert.SQL.Text:= 'INSERT INTO public.tb_matriculas(turma_id_aluno, turma_id_turma) VALUES('+(alunoSelecionado.getCodigo).ToString +','+ (turmaSelecionada.getCodigo).ToString +')';
    listaMatriculas.Add(TMatricula.Create(StrToInt(inputCodigo.Text),alunoSelecionado.getCodigo,turmaSelecionada.getCodigo));
  end;


    dbConnection.qryInsert.ExecSQL;
    dbConnection.qryMaxTurmas.Close;
    dbConnection.qryMaxTurmas.Open;
    qntMatriculas := dbConnection.qryMaxMatriculas.FieldByName('total_matriculas').AsInteger + 1;
    inputCodigo.Text := (qntMatriculas).ToString;
    slcAlunos.ItemIndex := -1;
    slcTurmas.ItemIndex := -1;
    novosMatriculas := novosMatriculas + 1;

end;

procedure TmodalMatricula.FormCreate(Sender: TObject);
begin
  novosMatriculas := 0;
end;
procedure TmodalMatricula.FormShow(Sender: TObject);

var aluno : TAluno;
var  turma : TTurma;
begin
slcAlunos.Clear;
slcTurmas.Clear;

  for aluno in listaAlunos do begin
    slcAlunos.items.Add(aluno.getNome);
  end;

  for turma in listaTurmas do begin
    slcTurmas.items.Add(turma.getNome);

  end;


  dbConnection.qryMaxMatriculas.Close;
  dbConnection.qryMaxMatriculas.Open;
  qntMatriculas := dbConnection.qryMaxMatriculas.FieldByName('total_matriculas').AsInteger + 1;
  inputCodigo.Text := (qntMatriculas).ToString;
  if indexMatriculaSelecionado <> -1 then begin
      var matricula := getMatriculaById(listaMatriculas[indexMatriculaSelecionado].getCodigo);
      inputCodigo.Text := matricula.getCodigo.ToString ;
      slcAlunos.ItemIndex := indexMatriculaSelecionado;
      slcTurmas.ItemIndex := indexMatriculaSelecionado;
  end;

end;


procedure TmodalMatricula.slcAlunosChange(Sender: TObject);
var
  indice: Integer;
begin
  indice := slcAlunos.ItemIndex;

  if indice > -1 then begin
    alunoSelecionado := listaAlunos[indice];
  end;
end;

procedure TmodalMatricula.slcTurmasChange(Sender: TObject);
var
  indice: Integer;
begin
  indice := slcTurmas.ItemIndex;

  if indice > -1 then begin
    turmaSelecionada := listaTurmas[indice];
  end;
end;


end.
