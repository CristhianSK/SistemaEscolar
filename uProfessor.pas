unit uProfessor;

interface
uses uPessoa;

type TProfessor = class(TPessoa)
  private
  cpf : String;

  public
  constructor Create(aCodigo : Integer; aNome : String; aCpf : String);

end;


implementation

{ TProfessor }

constructor TProfessor.Create(aCodigo: Integer; aNome, aCpf: String);
begin
  inherited Create(aCodigo, aNome);
  self.cpf := aCpf;
end;

end.
