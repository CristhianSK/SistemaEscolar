unit uPages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, uAluno, uProfessor, uAlunoAdd, uData,
  Vcl.StdCtrls,FireDAC.Comp.Client, uConnection, System.Generics.Collections, uListas;

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
    procedure puxarAlunos;
    procedure editarAluno;
    procedure excluirAluno;
    procedure mostrarNovosAlunos;
    procedure ltbxAlunosClick(Sender: TObject);
    procedure btnEditarAlunoClick(Sender: TObject);
    procedure btnExcluirAlunoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }



  end;

var
  pages: Tpages;
  alunoAdd: TmodalAluno;


implementation

{$R *.dfm}


procedure Tpages.puxarAlunos;
begin
  var getAlunos : TFDQuery;
  var aluno : TAluno;

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

  getAlunos.Close;
  listarAlunos;
end;


procedure Tpages.listarAlunos;
var textoAdicionado : String;
var i : Integer;
var aluno : TAluno;
begin

  ltbxAlunos.Clear;
  i := 0;

  for aluno in listaAlunos do begin
    textoAdicionado := listaAlunos[i].getCodigo.ToString + ' - ' + listaAlunos[i].getNome;
    ltbxAlunos.Items.Add(textoAdicionado);
    i := i + 1;
  end;

  lblTitAlunos.Caption := 'Alunos Cadastrados : ' + (listaAlunos.Count).ToString;

end;


procedure Tpages.editarAluno;
var alunoSelecionado : TAluno;
begin
alunoSelecionado := getAlunoById(listaAlunos[ltbxAlunos.ItemIndex].getCodigo);

  btnEditarAluno.Enabled := False;
  btnExcluirAluno.Enabled := False;

  alunoAdd.indexAlunoSelecionado := ltbxAlunos.ItemIndex;

  alunoAdd.ShowModal;
  ltbxAlunos.Items[ltbxAlunos.ItemIndex] := alunoSelecionado.getCodigo.ToString + ' - ' + alunoSelecionado.getNome;

end;


procedure Tpages.excluirAluno;
var alunoSelecionado : TAluno;
begin
   alunoSelecionado := getAlunoById(listaAlunos[ltbxAlunos.ItemIndex].getCodigo);
   dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_alunos SET ativo = false WHERE aluno_id = ' + (alunoSelecionado.getCodigo).ToString + ';';
   dbConnection.qryInsert.ExecSQL;
   btnEditarAluno.Enabled := False;
   btnExcluirAluno.Enabled := False;
   listaAlunos.remove(alunoSelecionado);
   ltbxAlunos.items.Delete(ltbxAlunos.ItemIndex);
end;


procedure Tpages.mostrarNovosAlunos;
var i: Integer;
var adicionarAluno: Integer;
begin

  for i := 0 to alunoAdd.novosAlunos - 1 do
  begin
    adicionarAluno := listaAlunos.Count - alunoAdd.novosAlunos ;
    ltbxAlunos.Items.Add(listaAlunos[adicionarAluno].getNome + 'a' );
  end;



end;

procedure Tpages.ltbxAlunosClick(Sender: TObject);
begin
   if ltbxAlunos.ItemIndex <> -1 then begin
      btnEditarAluno.Enabled := True;
      btnExcluirAluno.Enabled := True;
   end;

end;


procedure Tpages.btnEditarAlunoClick(Sender: TObject);
var alunoSelecionado : TAluno;
begin

  alunoAdd:= TmodalAluno.Create(Self);
  alunoAdd.btnModalAluno.Caption := 'Atualizar';
  editarAluno;
  alunoAdd.free;

end;

procedure Tpages.btnExcluirAlunoClick(Sender: TObject);
begin

   excluirAluno;

end;

procedure Tpages.btnModalAlunoClick(Sender: TObject);
begin

  alunoAdd:= TmodalAluno.Create(Self);
  alunoAdd.indexAlunoSelecionado := -1;
  alunoAdd.qntAlunos := listaAlunos.Count;
  alunoAdd.ShowModal;
  if alunoAdd.novosAlunos > 0 then mostrarNovosAlunos;
  alunoAdd.Free;

end;

procedure Tpages.FormCreate(Sender: TObject);
begin
  puxarAlunos;
end;

end.
