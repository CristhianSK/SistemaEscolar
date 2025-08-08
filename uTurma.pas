unit uTurma;

interface

type
  TTurma = class
  private
    codigo: Integer;
    nome: String;
    codigoProfessor: Integer;
    codigoDisciplina: Integer;

  public
    constructor Create(aCodigo: Integer; aNome: String; aCodigoProfessor: Integer; aCodigoDisciplina: Integer);

    function getNome: String;
    procedure setNome(aNome: String);

    function getCodigo: Integer;
    procedure setCodigo(aCodigo: Integer);

    function getCodigoProfessor: Integer;
    procedure setCodigoProfessor(aCodigo: Integer);

    function getCodigoDisciplina: Integer;
    procedure setCodigoDisciplina(aCodigo: Integer);
  end;

implementation

uses System.SysUtils;

{ TTurma }

  constructor TTurma.Create(aCodigo: Integer; aNome: String; aCodigoProfessor: Integer; aCodigoDisciplina: Integer);
  begin
    Self.codigo := aCodigo;
    Self.nome := aNome;
    Self.codigoProfessor := aCodigoProfessor;
    Self.codigoDisciplina := aCodigoDisciplina;
  end;


  function TTurma.getCodigo: Integer;
  begin
    Result := Self.codigo;
  end;

  function TTurma.getCodigoDisciplina: Integer;
  begin
    Result := Self.codigoDisciplina;
  end;


  function TTurma.getCodigoProfessor: Integer;
  begin
    Result := Self.codigoProfessor;
  end;


  function TTurma.getNome: String;
  begin
    Result := Self.nome;
  end;


  procedure TTurma.setCodigo(aCodigo: Integer);
  begin
    Self.codigo := aCodigo;
  end;


  procedure TTurma.setCodigoDisciplina(aCodigo: Integer);
  begin
    Self.codigoDisciplina := aCodigo;
  end;


  procedure TTurma.setCodigoProfessor(aCodigo: Integer);
  begin
    Self.codigoProfessor := aCodigo;
  end;


  procedure TTurma.setNome(aNome: String);
  begin
    Self.nome := aNome;
  end;

end.
