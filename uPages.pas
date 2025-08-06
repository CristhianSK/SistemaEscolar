unit uPages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, uAluno, uProfessor, uAlunoAdd, uData,
  Vcl.StdCtrls,FireDAC.Comp.Client, uConnection, System.Generics.Collections;

type
  Tpages = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    lblTitAlunos: TLabel;
    pnlTitulo: TPanel;
    pnlAlunos: TPanel;
    ltbxAlunos: TListBox;
    pnlProfessores: TPanel;
    ListBox1: TListBox;
    pnlTituloProf: TPanel;
    lblTitProfessores: TLabel;
    btnModalProfessor: TButton;
    btnModalAluno: TButton;
    btnEditarAluno: TButton;
    btnExcluirAluno: TButton;
    procedure btnModalAlunoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure listarAlunos;
    procedure ltbxAlunosClick(Sender: TObject);
    procedure btnEditarAlunoClick(Sender: TObject);
    procedure btnExcluirAlunoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    listaAlunos : TObjectList<TAluno>;


  end;

var
  pages: Tpages;
  alunoAdd: TmodalAluno;


implementation

{$R *.dfm}



procedure Tpages.listarAlunos;
var textoAdicionado : String;
begin
  var getAlunos : TFDQuery;
  var aluno : TAluno;
  var i : Integer;



  ltbxAlunos.Items.Clear;
  listaAlunos.Clear;

  getAlunos := dbConnection.qrySelectAllAlunos;
  getAlunos.Open;

  while not getAlunos.Eof do begin
    if getAlunos.FieldByName('ativo').AsBoolean then begin
      aluno := TAluno.Create(getAlunos.FieldByName('aluno_id').AsInteger, getAlunos.FieldByName('aluno_nome').AsString);
      listaAlunos.Add(aluno);
      getAlunos.Next;
    end else begin
      getAlunos.Next;
    end;

  end;

  i := 0;

  for aluno in listaAlunos do begin
    textoAdicionado := listaAlunos[i].getCodigo.ToString + ' - ' + listaAlunos[i].getNome;
    ltbxAlunos.Items.Add(textoAdicionado);
    i := i + 1;
  end;

  lblTitAlunos.Caption := 'Alunos Cadastrados : ' + (listaAlunos.Count).ToString;
  getAlunos.Close;
end;

procedure Tpages.ltbxAlunosClick(Sender: TObject);
begin
   if ltbxAlunos.ItemIndex <> -1 then begin
      btnEditarAluno.Enabled := True;
      btnExcluirAluno.Enabled := True;
   end;

end;

procedure Tpages.btnEditarAlunoClick(Sender: TObject);
begin
  alunoAdd:= TmodalAluno.Create(Self);
  alunoAdd.indexAlunoSelecionado := listaAlunos[ltbxAlunos.ItemIndex].getCodigo;
  alunoAdd.nomeAlunoSelecionado := listaAlunos[ltbxAlunos.ItemIndex].getNome;
  alunoAdd.ShowModal;
  btnEditarAluno.Enabled := False;
  btnExcluirAluno.Enabled := False;
  alunoAdd.free;

  listarAlunos;


end;

procedure Tpages.btnExcluirAlunoClick(Sender: TObject);
begin
   dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_alunos SET ativo = false WHERE aluno_id = ' + (listaAlunos[ltbxAlunos.ItemIndex].getCodigo).ToString + ';';
   dbConnection.qryInsert.ExecSQL;
   btnEditarAluno.Enabled := False;
   btnExcluirAluno.Enabled := False;
   listarAlunos;
end;

procedure Tpages.btnModalAlunoClick(Sender: TObject);
begin
  alunoAdd:= TmodalAluno.Create(Self);
  alunoAdd.indexAlunoSelecionado := -1;
  alunoAdd.qntAlunos := listaAlunos.Count;
  alunoAdd.ShowModal;
  alunoAdd.Free;
  listarAlunos;
end;

procedure Tpages.FormCreate(Sender: TObject);
begin
  listaAlunos := TObjectList<TAluno>.Create();

  listarAlunos;
end;



end.
