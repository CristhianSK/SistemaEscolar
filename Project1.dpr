program Project1;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {home},
  uPages in 'uPages.pas' {pages},
  uPessoa in 'uPessoa.pas',
  uAluno in 'uAluno.pas',
  uProfessor in 'uProfessor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Thome, home);
  Application.CreateForm(Tpages, pages);
  Application.Run;
end.
