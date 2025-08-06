unit uAlunoAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uData, uAluno,
  FireDAC.Comp.Client, uConnection;

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
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    indexAlunoSelecionado : integer;
    nomeAlunoSelecionado : String;
    qntAlunos: Integer;
  end;

implementation

{$R *.dfm}




procedure TmodalAluno.btnModalAlunoClick(Sender: TObject);
begin


  if indexAlunoSelecionado <> -1 then begin
    dbConnection.qryInsert.SQL.Text:= 'INSERT INTO public.tb_alunos (aluno_id, aluno_nome) VALUES('+ inputCodigo.Text+ ', '+ QuotedStr(inputNome.Text) +  ')';
  end else begin
    dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_alunos SET aluno_nome =' + QuotedStr(inputNome.text) + ' WHERE aluno_id = ' + (indexAlunoSelecionado + 1).ToString + ';';
  end;


  if (inputNome.Text = '') or (inputCodigo.Text = '') then begin
    ShowMessage('Preencha todos os campos!');
  end else begin
     dbConnection.qryInsert.ExecSQL;
     inputCodigo.Text := '';
     inputNome.Text := '';
  end;
end;



procedure TmodalAluno.FormShow(Sender: TObject);
begin
  inputCodigo.Text := (qntAlunos + 1).ToString;
  if indexAlunoSelecionado <> -1 then begin
      inputCodigo.Text := (indexAlunoSelecionado + 1).ToString;
     inputNome.Text := nomeAlunoSelecionado;
  end;

  end;

end.
