program Project1;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {home},
  uPages in 'uPages.pas' {pages},
  uPessoa in 'uPessoa.pas',
  uAluno in 'uAluno.pas',
  uProfessor in 'uProfessor.pas',
  uAlunoAdd in 'uAlunoAdd.pas' {modalAluno},
  uConnection in 'uConnection.pas' {dbConnection: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdbConnection, dbConnection);
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tpages, pages);
  Application.Run;
end.
