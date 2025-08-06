unit uAluno;

interface
uses uPessoa;

type TAluno = class(TPessoa)

  public
  constructor Create(aCodigo : Integer; aNome : String);

end;

implementation

{ TAluno }

  constructor TAluno.Create(aCodigo : Integer; aNome : String);
  begin
    inherited Create(aCodigo, aNome);
  end;

end.
