unit uAlunoAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uData, uAluno,
  FireDAC.Comp.Client, uConnection, uListas, Vcl.Imaging.pngimage;

type
  TmodalAluno = class(TForm)
    pnlAdicionarAluno: TPanel;
    Label1: TLabel;
    lblInputCodigo: TLabel;
    lblInputNome: TLabel;
    btnModalAluno: TButton;
    inputCodigo: TEdit;
    inputNome: TEdit;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image1: TImage;
    procedure btnModalAlunoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    indexAlunoSelecionado : integer;
    nomeAlunoSelecionado : String;
    qntAlunos: Integer;
    novosAlunos: integer;
  end;

implementation

{$R *.dfm}

procedure TmodalAluno.btnModalAlunoClick(Sender: TObject);
begin

  if (inputNome.Text = '') or (inputCodigo.Text = '') then begin
      ShowMessage('Preencha todos os campos!');
      Exit;
  end;

  if indexAlunoSelecionado <> -1 then begin
    var aluno := getAlunoById(listaAlunos[indexAlunoSelecionado].getCodigo);
    dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_alunos SET aluno_nome =' + QuotedStr(inputNome.text) + ' WHERE aluno_id = ' + aluno.getCodigo.ToString + ';';
    listaAlunos[indexAlunoSelecionado].setNome(inputNome.text);
    listaAlunos[indexAlunoSelecionado].setCodigo(StrToInt(inputCodigo.Text));
    btnModalAluno.Caption := 'Adicionar';
  end else begin
    dbConnection.qryInsert.SQL.Text:= 'INSERT INTO public.tb_alunos (aluno_nome) VALUES('+ QuotedStr(inputNome.Text) +  ')';
    listaAlunos.Add(TAluno.Create(StrToInt(inputCodigo.Text), inputNome.Text));
  end;

  dbConnection.qryInsert.ExecSQL;
  dbConnection.qryMaxAlunos.Close;
  dbConnection.qryMaxAlunos.Open;
  qntAlunos := dbConnection.qryMaxAlunos.FieldByName('total_alunos').AsInteger + 1;
  inputCodigo.Text := (qntAlunos).ToString;
  inputNome.Text := '';
  novosAlunos := novosAlunos + 1;
  dbConnection.qryMaxAlunos.Close;


end;



procedure TmodalAluno.FormCreate(Sender: TObject);
begin
  novosAlunos := 0;
end;

procedure TmodalAluno.FormShow(Sender: TObject);
begin

  dbConnection.qryMaxAlunos.Open;
  qntAlunos := dbConnection.qryMaxAlunos.FieldByName('total_alunos').AsInteger + 1;
  inputCodigo.Text := (qntAlunos).ToString;
  if indexAlunoSelecionado <> -1 then begin
      var aluno := getAlunoById(listaAlunos[indexAlunoSelecionado].getCodigo);
      inputCodigo.Text := aluno.getCodigo.ToString ;
      inputNome.Text := aluno.getNome;

  end;

end;


end.
