unit uProfessorAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uData, uProfessor,
  FireDAC.Comp.Client, uConnection, uListas, Vcl.Imaging.pngimage;

type
  TmodalProfessor = class(TForm)
    pnlAdicionarProfessor: TPanel;
    Label1: TLabel;
    lblInputCodigo: TLabel;
    lblInputNome: TLabel;
    btnModalProfessor: TButton;
    inputCodigo: TEdit;
    inputNome: TEdit;
    inputCpf: TEdit;
    lblInputCpf: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure btnModalProfessorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    indexProfessorSelecionado : integer;
    nomeProfessorSelecionado : String;
    qntProfessores: Integer;
    novosProfessores: integer;
  end;

var
  modalProfessor: TmodalProfessor;

implementation

{$R *.dfm}
procedure TmodalProfessor.btnModalProfessorClick(Sender: TObject);
begin
  if (inputNome.Text = '') or (inputCodigo.Text = '') then
  begin
    ShowMessage('Preencha todos os campos!');
    Exit;
  end else if Length(inputCpf.Text) < 11 then begin
    ShowMessage('O CPF precisa ter 11 digitos!');
    Exit;
  end;

  if indexProfessorSelecionado <> -1 then
  begin
    var professor := getProfessorById(listaProfessores[indexProfessorSelecionado].getCodigo);
    dbConnection.qryInsert.SQL.Text :='UPDATE public.tb_professores SET professor_nome = ' +QuotedStr(inputNome.Text) +' WHERE professor_id = ' + professor.getCodigo.ToString + ';';
    listaProfessores[indexProfessorSelecionado].setNome(inputNome.Text);
    listaProfessores[indexProfessorSelecionado].setCodigo(StrToInt(inputCodigo.Text));
    listaProfessores[indexProfessorSelecionado].setCpf(inputCpf.Text);
    btnModalProfessor.Caption := 'Adicionar';
  end else begin
    dbConnection.qryInsert.SQL.Text := 'INSERT INTO public.tb_professores (professor_nome, professor_cpf) VALUES(' + QuotedStr(inputNome.Text) + ',' + QuotedStr(inputCpf.Text) + ')';
    listaProfessores.Add(TProfessor.Create(StrToInt(inputCodigo.Text), inputNome.Text, inputCpf.Text));
  end;

  dbConnection.qryInsert.ExecSQL;
  dbConnection.qryMaxProfessores.Close;
  dbConnection.qryMaxProfessores.Open;
  qntProfessores := dbConnection.qryMaxProfessores.FieldByName('total_professores').AsInteger + 1;
  inputCodigo.Text := (qntProfessores).ToString;
  inputNome.Text := '';
  inputCpf.Text := '';
  novosProfessores := novosProfessores + 1;
  dbConnection.qryMaxProfessores.Close;
end;

procedure TmodalProfessor.FormCreate(Sender: TObject);
begin
  novosProfessores := 0;
end;

procedure TmodalProfessor.FormShow(Sender: TObject);
begin
  dbConnection.qryMaxProfessores.Open;
  qntProfessores := dbConnection.qryMaxProfessores.FieldByName('total_professores').AsInteger + 1;
  inputCodigo.Text := (qntProfessores).ToString;

  if indexProfessorSelecionado <> -1 then
  begin
    var professor := getProfessorById(listaProfessores[indexProfessorSelecionado].getCodigo);
    inputCodigo.Text := professor.getCodigo.ToString;
    inputNome.Text := professor.getNome;
    inputCpf.Text := professor.getCpf;
  end;

end;
end.
