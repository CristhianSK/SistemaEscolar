unit uDisciplina;

interface

type TDisciplina = class
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

  constructor TDisciplina.Create(aCodigo : Integer; aNome : String);
  begin
    Self.codigo := aCodigo;
    Self.nome := aNome;
  end;



  function TDisciplina.getCodigo: Integer;
  begin
      Result := self.codigo;
  end;

  function TDisciplina.getNome: String;
  begin
      Result := self.nome;
  end;



  procedure TDisciplina.setCodigo(aCodigo: integer);
  begin
      self.codigo := aCodigo;
  end;

  procedure TDisciplina.setNome(aNome: String);
  begin
      self.nome := aNome;
  end;

end.
