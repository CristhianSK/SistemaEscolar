unit uAlunoAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uData, uAluno,
  uConnection;

type
  TmodalAluno = class(TForm)
    pnlAdicionarAluno: TPanel;
    Label1: TLabel;
    lblInputCodigo: TLabel;
    lblInputNome: TLabel;
    btnModalAluno: TButton;
    inputCodigo: TEdit;
    inputNome: TEdit;
    procedure btnModalAlunoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modalAluno: TmodalAluno;

implementation

{$R *.dfm}

procedure TmodalAluno.btnModalAlunoClick(Sender: TObject);
begin
var aluno : TAluno;
var textoExibido : String;

begin
  if (inputNome.Text = '') or (inputCodigo.Text = '') then begin
    ShowMessage('Preencha todos os campos!');
  end else begin
     aluno := TAluno.Create(strToInt(inputCodigo.Text), inputNome.Text);
     textoExibido :=' Nome: ' + aluno.getNome + ' Código: ' + aluno.getCodigo.ToString ;
   //  ltbxAlunos.Items.AddObject(textoExibido, aluno);
  end;

end;

end;

end.
