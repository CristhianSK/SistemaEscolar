unit uListas;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Variants, System.Classes, uData, uAluno, uTurma, uProfessor, uDisciplina, uMatricula,
  FireDAC.Comp.Client, uConnection;

  var listaAlunos : TObjectList<TAluno>;
  var listaProfessores : TObjectList<TProfessor>;
  var listaDisciplinas : TObjectList<TDisciplina>;
  var listaTurmas : TObjectList<TTurma>;
  var listaMatriculas: TObjectList<TMatricula>;

  function getAlunoById(id: Integer): TAluno;
  function getProfessorById(id: Integer): TProfessor;
  function getDisciplinaById(id: Integer): TDisciplina;
  function getTurmaById(id: Integer): TTurma;
  function getMatriculaById(id: Integer) : TMatricula;

implementation

function getAlunoById(ID: Integer): TAluno;
var aluno : TAluno;
begin
  for aluno in listaAlunos do begin
    if (aluno.getCodigo <> id) then begin
    end else begin
      result:= aluno;
      break;
    end;
  end;
end;

function getTurmaById(ID: Integer): TTurma;
var turma : TTurma;
begin
  for turma in listaTurmas do begin
    if (turma.getCodigo <> id) then begin
    end else begin
      result:= turma;
      break;
    end;
  end;
end;

function getProfessorById(ID: Integer): TProfessor;
var professor : TProfessor;
begin
  for professor in listaProfessores do begin
    if (professor.getCodigo <> id) then begin
    end else begin
      result:= professor;
      break;
    end;
  end;
end;


function getDisciplinaById(ID: Integer): TDisciplina;
var disciplina : TDisciplina;
begin
  for disciplina in listaDisciplinas do begin
    if (disciplina.getCodigo <> id) then begin
    end else begin
      result:= disciplina;
      break;
    end;
  end;
end;

function getMatriculaById(ID: Integer): TMatricula;
var matricula : TMatricula;
begin
  for matricula in listaMatriculas do begin
    if (matricula.getCodigo <> id) then begin
    end else begin
      result:= matricula;
      break;
    end;
  end;
end;


initialization
  listaAlunos := TObjectList<TAluno>.Create;
  listaTurmas := TObjectList<TTurma>.Create;
  listaProfessores := TObjectList<TProfessor>.Create;
  listaDisciplinas := TObjectList<TDisciplina>.Create;
  listaMatriculas := TObjectList<TMatricula>.Create;
finalization
  listaAlunos.Free;
  listaTurmas.Free;
  listaProfessores.Free;
  listaDisciplinas.Free;
  listaMatriculas.Free;
end.
