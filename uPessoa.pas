unit uPessoa;

interface

type TPessoa = class
  private
  codigo : integer;
  nome : String;

  public
  constructor Create(aCodigo : Integer; aNome : String);

  function getNome : String;
  procedure setNome(aNome: String);

  function getCodigo : Integer;
  procedure setCodigo(aCodigo: integer);

  end;



implementation

uses System.SysUtils;

  constructor TPessoa.Create(aCodigo : Integer; aNome : String);
  begin
    Self.codigo := aCodigo;
    Self.nome := aNome;
  end;



  function TPessoa.getCodigo: Integer;
  begin
      Result := self.codigo;
  end;

  function TPessoa.getNome: String;
  begin
      Result := self.nome;
  end;



  procedure TPessoa.setCodigo(aCodigo: integer);
  begin
      self.codigo := aCodigo;
  end;

  procedure TPessoa.setNome(aNome: String);
  begin
      self.nome := aNome;
  end;

end.
