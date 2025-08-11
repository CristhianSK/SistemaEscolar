unit uMatriculaAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uData, uTurma, uAluno, uMatricula,
  FireDAC.Comp.Client, uConnection, uListas;

type
  TmodalMatricula = class(TForm)
    pnlAdicionarTurma: TPanel;
    Label1: TLabel;
    lblInputCodigo: TLabel;
    lblInputAluno: TLabel;
    lblInputTurma: TLabel;
    btnModalMatricula: TButton;
    inputCodigo: TEdit;
    slcAlunos: TComboBox;
    slcTurmas: TComboBox;
    procedure btnModalMatriculaClick(Sender: TObject);
  private
    { Private declarations }
  public
    indexMatriculaSelecionado : integer;
    qntMatriculas: Integer;
    novosMatriculas: integer;
    alunoSelecionado: TAluno;
    turmaSelecionada: TTurma;
  end;

var
  modalMatricula: TmodalMatricula;

implementation

{$R *.dfm}

procedure TmodalMatricula.btnModalMatriculaClick(Sender: TObject);
begin


  if (inputCodigo.Text = '') or (slcAlunos.ItemIndex = -1) or (slcTurmas.ItemIndex = -1) then begin
      ShowMessage('Preencha todos os campos!');
      exit;
  end;

  if indexMatriculaSelecionado <> -1 then begin
    var matricula := getMatriculaById(listaMatriculas[indexMatriculaSelecionado].getCodigo);

    dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_atriculas SET matricula_id_aluno= '+ (alunoSelecionado.getCodigo).ToString + ', matricula_id_turma= '+ (turmaSelecionada.getCodigo).ToString  +' WHERE matricula_id = ' + matricula.getCodigo.ToString + ';';

    listaMatriculas[indexMatriculaSelecionado].setCodigo(StrToInt(inputCodigo.Text));
    listaMatriculas[indexMatriculaSelecionado].setCodigoAluno(alunoSelecionado.getCodigo);
    listaMatriculas[indexMatriculaSelecionado].setCodigoTurma(turmaSelecionada.getCodigo);

    btnModalMatricula.Caption := 'Adicionar';
  end else begin
    dbConnection.qryInsert.SQL.Text:= 'INSERT INTO public.tb_matriculas (turma_id_aluno, turma_id_turma) VALUES('+(alunoSelecionado.getCodigo).ToString +','+ (turmaSelecionada.getCodigo).ToString +')';
    listaMAtriculas.Add(TMatricula.Create(StrToInt(inputCodigo.Text),alunoSelecionado.getCodigo,turmaSelecionada.getCodigo));
  end;


    dbConnection.qryInsert.ExecSQL;
    dbConnection.qryMaxTurmas.Close;
    dbConnection.qryMaxTurmas.Open;
    qntMatriculas := dbConnection.qryMaxMatriculas.FieldByName('total_matriculas').AsInteger + 1;
    inputCodigo.Text := (qntMatriculas).ToString;
    slcAlunos.ItemIndex := -1;
    slcTurmas.ItemIndex := -1;
    novosMatriculas := novosMatriculas + 1;

end;

end.
