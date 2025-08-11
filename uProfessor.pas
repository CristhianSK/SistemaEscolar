unit uProfessor;

interface
uses uPessoa;

type TProfessor = class(TPessoa)
  private
  cpf : String;

  public
  constructor Create(aCodigo : Integer; aNome : String; aCpf : String);


  function getCpf : String;
  procedure setCpf(aCpf: String);


end;


implementation

{ TProfessor }

constructor TProfessor.Create(aCodigo: Integer; aNome, aCpf: String);
begin
  inherited Create(aCodigo, aNome);
  self.cpf := aCpf;
end;


  function TProfessor.getCpf: String;
  begin
      Result := self.cpf;
  end;

  procedure TProfessor.setCpf(aCpf: String);
  begin
      self.cpf := aCpf;
  end;



end.
