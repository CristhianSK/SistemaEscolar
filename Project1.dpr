program Project1;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {home},
  uPages in 'uPages.pas' {pages};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Thome, home);
  Application.CreateForm(Tpages, pages);
  Application.Run;
end.
