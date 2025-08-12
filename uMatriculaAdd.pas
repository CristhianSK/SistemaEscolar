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
    dbConnection.qryInsert.SQL.Text:= 'INSERT INTO public.tb_matriculas(matricula_id_aluno, matricula_id_turma) VALUES('+(alunoSelecionado.getCodigo).ToString +','+ (turmaSelecionada.getCodigo).ToString +')';
    listaMatriculas.Add(TMatricula.Create(StrToInt(inputCodigo.Text),alunoSelecionado.getCodigo,turmaSelecionada.getCodigo));
  end;


    dbConnection.qryInsert.ExecSQL;
    dbConnection.qryMaxMatriculas.Close;
    dbConnection.qryMaxMatriculas.Open;
    qntMatriculas := dbConnection.qryMaxMatriculas.FieldByName('total_matriculas').AsInteger + 1;
    inputCodigo.Text := (qntMatriculas).ToString;
    slcAlunos.ItemIndex := -1;
    slcTurmas.ItemIndex := -1;
    novosMatriculas := novosMatriculas + 1;
    dbConnection.qryMaxMatriculas.Close;
end;

procedure TmodalMatricula.FormCreate(Sender: TObject);
begin
  novosMatriculas := 0;
end;
procedure TmodalMatricula.FormShow(Sender: TObject);

var aluno : TAluno;
   turma : TTurma;
   i : Integer;

begin
slcAlunos.Clear;
slcTurmas.Clear;

  for aluno in listaAlunos do begin
    slcAlunos.items.AddObject(aluno.getNome, aluno);
  end;

  for turma in listaTurmas do begin
    slcTurmas.items.AddObject(turma.getNome, turma);

  end;


  dbConnection.qryMaxMatriculas.Close;
  dbConnection.qryMaxMatriculas.Open;
  qntMatriculas := dbConnection.qryMaxMatriculas.FieldByName('total_matriculas').AsInteger + 1;
  inputCodigo.Text := (qntMatriculas).ToString;
  if indexMatriculaSelecionado <> -1 then begin
      var matricula := getMatriculaById(listaMatriculas[indexMatriculaSelecionado].getCodigo);
      inputCodigo.Text := matricula.getCodigo.ToString ;

    for i := 0 to slcAlunos.Items.Count - 1 do begin
      var alu := slcAlunos.Items.Objects[i] as TAluno;
      if alu.getCodigo = matricula.getCodigoAluno then
      begin
        slcAlunos.ItemIndex := i;
        alunoSelecionado := alu;
        Break;
      end;
    end;


    for i := 0 to slcTurmas.Items.Count - 1 do begin
      var tur := slcTurmas.Items.Objects[i] as TTurma;
      if tur.getCodigo = matricula.getCodigoTurma then
      begin
        slcTurmas.ItemIndex := i;
        turmaSelecionada := tur;
        Break;
      end;
    end;

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
