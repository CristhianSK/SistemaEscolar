unit uMatricula;

interface

type
  TMatricula = class
  private
    codigo: Integer;
    codigoTurma: Integer;
    codigoAluno: Integer;

  public
    constructor Create(aCodigo: Integer;aCodigoAluno: Integer;  aCodigoTurma: Integer);

    function getCodigo: Integer;
    procedure setCodigo(aCodigo: Integer);

    function getCodigoTurma: Integer;
    procedure setCodigoTurma(aCodigo: Integer);

    function getCodigoAluno: Integer;
    procedure setCodigoAluno(aCodigo: Integer);
  end;

implementation

uses System.SysUtils;

{ TTurma }

  constructor TMatricula.Create(aCodigo: Integer; aCodigoAluno: Integer; aCodigoTurma: Integer);
  begin
    Self.codigo := aCodigo;
    Self.codigoTurma := aCodigoTurma;
    Self.codigoAluno := aCodigoAluno;
  end;


  function TMatricula.getCodigo: Integer;
  begin
    Result := Self.codigo;
  end;

  function TMatricula.getCodigoAluno: Integer;
  begin
    Result := Self.codigoAluno;
  end;


  function TMatricula.getCodigoTurma: Integer;
  begin
    Result := Self.codigoTurma;
  end;



  procedure TMatricula.setCodigo(aCodigo: Integer);
  begin
    Self.codigo := aCodigo;
  end;


  procedure TMatricula.setCodigoAluno(aCodigo: Integer);
  begin
    Self.codigoAluno := aCodigo;
  end;


  procedure TMatricula.setCodigoTurma(aCodigo: Integer);
  begin
    Self.codigoTurma := aCodigo;
  end;



end.
