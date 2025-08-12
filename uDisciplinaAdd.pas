unit uDisciplinaAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uData, uDisciplina,
  FireDAC.Comp.Client, uConnection, uListas;

type
  TmodalDisciplina = class(TForm)
    pnlAdicionarDisciplina: TPanel;
    Label1: TLabel;
    lblInputCodigo: TLabel;
    lblInputNome: TLabel;
    inputCodigo: TEdit;
    inputNome: TEdit;
    btnModalDisciplina: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnModalDisciplinaClick(Sender: TObject);
  private
    { Private declarations }
  public
    indexDisciplinaSelecionado : integer;
    nomeDisciplinaSelecionado : String;
    qntDisciplinas: Integer;
    novosDisciplinas: integer;
  end;

var
  modalDisciplina: TmodalDisciplina;

implementation

{$R *.dfm}

procedure TmodalDisciplina.btnModalDisciplinaClick(Sender: TObject);
begin

  if (inputNome.Text = '') or (inputCodigo.Text = '') then begin
      ShowMessage('Preencha todos os campos!');
      Exit;
  end;

  if indexDisciplinaSelecionado <> -1 then begin
    var disciplina := getDisciplinaById(listaDisciplinas[indexDisciplinaSelecionado].getCodigo);
    dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_disciplinas SET disciplina_nome =' + QuotedStr(inputNome.text) + ' WHERE disciplina_id = ' + disciplina.getCodigo.ToString + ';';
    listaDisciplinas[indexDisciplinaSelecionado].setNome(inputNome.text);
    listaDisciplinas[indexDisciplinaSelecionado].setCodigo(StrToInt(inputCodigo.Text));
    btnModalDisciplina.Caption := 'Adicionar';
  end else begin
    dbConnection.qryInsert.SQL.Text:= 'INSERT INTO public.tb_disciplinas (disciplina_nome) VALUES('+ QuotedStr(inputNome.Text) +  ')';
    listaDisciplinas.Add(TDisciplina.Create(StrToInt(inputCodigo.Text), inputNome.Text));
  end;

  dbConnection.qryInsert.ExecSQL;
  dbConnection.qryMaxDisciplinas.Close;
  dbConnection.qryMaxDisciplinas.Open;
  qntDisciplinas := dbConnection.qryMaxDisciplinas.FieldByName('total_disciplinas').AsInteger + 1;
  inputCodigo.Text := (qntDisciplinas).ToString;
  inputNome.Text := '';
  novosDisciplinas := novosDisciplinas + 1;
  dbConnection.qryMaxDisciplinas.Close;
end;

procedure TmodalDisciplina.FormCreate(Sender: TObject);
begin
    novosDisciplinas := 0;
end;

procedure TmodalDisciplina.FormShow(Sender: TObject);
begin
  dbConnection.qryMaxDisciplinas.Open;
  qntDisciplinas := dbConnection.qryMaxDisciplinas.FieldByName('total_Disciplinas').AsInteger + 1;
  inputCodigo.Text := (qntDisciplinas).ToString;
  if indexDisciplinaSelecionado <> -1 then begin
      var disciplina := getDisciplinaById(listaDisciplinas[indexDisciplinaSelecionado].getCodigo);
      inputCodigo.Text := disciplina.getCodigo.ToString ;
      inputNome.Text := disciplina.getNome;

  end;
end;

end.
