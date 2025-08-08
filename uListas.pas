unit uListas;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Variants, System.Classes, uData, uAluno, uTurma,
  FireDAC.Comp.Client, uConnection;

  var listaAlunos : TObjectList<TAluno>;
  var listaTurmas : TObjectList<TTurma>;

  function getAlunoById(id: Integer): TAluno;
  function getTurmaById(id: Integer): TTurma;

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



initialization
  listaAlunos := TObjectList<TAluno>.Create;
  listaTurmas := TObjectList<TTurma>.Create;

finalization
  listaAlunos.Free;
  listaTurmas.Free;
end.
