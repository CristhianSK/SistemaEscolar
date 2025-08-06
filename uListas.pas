unit uListas;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Variants, System.Classes, uData, uAluno,
  FireDAC.Comp.Client, uConnection;

  var listaAlunos : TObjectList<TAluno>;

  function getAlunoById(id: Integer): TAluno;

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




initialization
  listaAlunos := TObjectList<TAluno>.Create;

finalization
  listaAlunos.Free;

end.
