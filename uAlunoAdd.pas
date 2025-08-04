unit uAlunoAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TalunosAdd = class(TForm)
    b: TPanel;
    lblInputNome: TLabel;
    lblInputCodigo: TLabel;
    inputCodigo: TEdit;
    inputNome: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  alunosAdd: TalunosAdd;

implementation

{$R *.dfm}

end.
