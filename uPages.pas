unit uPages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, uAluno, uProfessor, uTurma, uAlunoAdd, uTurmaAdd, uProfessorAdd, uData,
  Vcl.StdCtrls,FireDAC.Comp.Client, uConnection, System.Generics.Collections, uListas;

type
  Tpages = class(TForm)
    paginas: TPageControl;
    Alunos: TTabSheet;
    tabProfessores: TTabSheet;
    tabDisciplinas: TTabSheet;
    lblTitAlunos: TLabel;
    pnlTitulo: TPanel;
    pnlAlunos: TPanel;
    ltbxAlunos: TListBox;
    btnModalAluno: TButton;
    btnEditarAluno: TButton;
    btnExcluirAluno: TButton;
    Panel1: TPanel;
    ltbxProfessores: TListBox;
    btnModalProfessor: TButton;
    btnEditarProfessor: TButton;
    btnExcluirProfessor: TButton;
    Panel2: TPanel;
    lblTitProfessores: TLabel;
    tabTurmas: TTabSheet;
    tabMatriculas: TTabSheet;
    Panel3: TPanel;
    ltbxTurmas: TListBox;
    btnModalTurma: TButton;
    btnEditarTurma: TButton;
    btnExcluirTurma: TButton;
    Panel4: TPanel;
    lblTitTurmas: TLabel;
    procedure btnModalAlunoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure listarAlunos;
    procedure puxarAlunos;
    procedure editarAluno;
    procedure excluirAluno;
    procedure mostrarNovosAlunos;

    procedure listarProfessores;
    procedure puxarProfessores;
    procedure editarProfessor;
    procedure excluirProfessor;
    procedure mostrarNovosProfessores;


    procedure listarTurmas;
    procedure puxarTurmas;
    procedure editarTurma;
    procedure excluirTurma;
    procedure mostrarNovasTurmas;



    procedure ltbxAlunosClick(Sender: TObject);
    procedure btnEditarAlunoClick(Sender: TObject);
    procedure btnExcluirAlunoClick(Sender: TObject);
    procedure ltbxTurmasClick(Sender: TObject);
    procedure btnEditarTurmaClick(Sender: TObject);
    procedure btnModalTurmaClick(Sender: TObject);
    procedure btnExcluirTurmaClick(Sender: TObject);
    procedure btnEditarProfessorClick(Sender: TObject);
    procedure btnModalProfessorClick(Sender: TObject);
    procedure btnExcluirProfessorClick(Sender: TObject);
    procedure ltbxProfessoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }



  end;

var
  pages: Tpages;
  alunoAdd: TmodalAluno;
  turmaAdd: TmodalTurma;
  professorAdd: TmodalProfessor;


implementation

{$R *.dfm}


////// COMEÇO DO CODIGO ALUNOS//////
////// COMEÇO DO CODIGO ALUNOS//////
////// COMEÇO DO CODIGO ALUNOS//////
//////FUNÇÕES /////

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
    adicionarAluno := listaAlunos.Count - (alunoAdd.novosAlunos) + i ;
    ltbxAlunos.Items.Add(listaAlunos[adicionarAluno].getCodigo.ToString + ' - ' + listaAlunos[adicionarAluno].getNome );
  end;

end;

// ****** FIM DAS FUNÇÕES ALUNOS ******
// ****** FIM DAS FUNÇÕES ALUNOS ******
// ****** FIM DAS FUNÇÕES ALUNOS ******

// ****** INICIO DAS FUNÇÕES PROFESSORES ******
// ****** INICIO DAS FUNÇÕES PROFESSORES ******
// ****** INICIO DAS FUNÇÕES PROFESSORES ******


procedure Tpages.puxarProfessores;
begin
  var getProfessores : TFDQuery;
  var professor : TProfessor;

  getProfessores := dbConnection.qrySelectAllProfessores;
  getProfessores.Open;

  while not getProfessores.Eof do begin
    if getProfessores.FieldByName('ativo').AsBoolean then begin
      professor := TProfessor.Create(getProfessores.FieldByName('professor_id').AsInteger, getProfessores.FieldByName('professor_nome').AsString, getProfessores.FieldByName('professor_cpf').AsString);
      listaProfessores.Add(professor);
      getProfessores.Next;
    end else begin
      getProfessores.Next;
    end;
  end;

  getProfessores.Close;
  listarProfessores;
end;


procedure Tpages.listarProfessores;
var textoAdicionado : String;
var i : Integer;
var professor : TProfessor;
begin

  ltbxProfessores.Clear;
  i := 0;

  for professor in listaProfessores do begin
    textoAdicionado := listaProfessores[i].getCodigo.ToString + ' - ' + listaProfessores[i].getNome + ' - ' + listaProfessores[i].getCpf;
    ltbxProfessores.Items.Add(textoAdicionado);
    i := i + 1;
  end;

  lblTitProfessores.Caption := 'Professores Cadastrados : ' + (listaProfessores.Count).ToString;

end;


procedure Tpages.editarProfessor;
var professorSelecionado : TProfessor;
begin

  professorSelecionado := getProfessorById(listaProfessores[ltbxProfessores.ItemIndex].getCodigo);

  btnEditarProfessor.Enabled := False;
  btnExcluirProfessor.Enabled := False;

  professorAdd.indexProfessorSelecionado := ltbxProfessores.ItemIndex;

  professorAdd.ShowModal;
  ltbxProfessores.Items[ltbxProfessores.ItemIndex] := professorSelecionado.getCodigo.ToString + ' - ' + professorSelecionado.getNome + ' - ' + professorSelecionado.getCpf;

end;


procedure Tpages.excluirProfessor;
var professorSelecionado : TProfessor;
begin
   professorSelecionado := getProfessorById(listaProfessores[ltbxProfessores.ItemIndex].getCodigo);
   dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_professores SET ativo = false WHERE professor_id = ' + (professorSelecionado.getCodigo).ToString + ';';
   dbConnection.qryInsert.ExecSQL;
   btnEditarProfessor.Enabled := False;
   btnExcluirProfessor.Enabled := False;
   listaProfessores.remove(professorSelecionado);
   ltbxProfessores.items.Delete(ltbxProfessores.ItemIndex);
end;


procedure Tpages.mostrarNovosProfessores;
var i: Integer;
var adicionarProfessor: Integer;
begin

  for i := 0 to professorAdd.novosProfessores - 1 do
  begin
    adicionarProfessor := listaProfessores.Count - (professorAdd.novosProfessores) + i ;
    ltbxProfessores.Items.Add(listaProfessores[adicionarProfessor].getCodigo.ToString + ' - ' + listaProfessores[adicionarProfessor].getNome + ' - ' + listaProfessores[adicionarProfessor].getCpf );
  end;

end;


// ****** INICIO DAS FUNÇÕES TURMAS ******
// ****** INICIO DAS FUNÇÕES TURMAS ******
// ****** INICIO DAS FUNÇÕES TURMAS ******

procedure Tpages.puxarTurmas;
begin
  var getTurmas : TFDQuery;
  var turma : TTurma;

  getTurmas := dbConnection.qrySelectAllTurmas;
  getTurmas.Open;

  while not getTurmas.Eof do begin
    if getTurmas.FieldByName('ativo').AsBoolean then begin
      turma := TTurma.Create(getTurmas.FieldByName('turma_id').AsInteger, getTurmas.FieldByName('turma_nome').AsString,getTurmas.FieldByName('turma_id_professor').AsInteger,getTurmas.FieldByName('turma_id_disciplina').AsInteger);
      listaTurmas.Add(turma);
      getTurmas.Next;
    end else begin
      getTurmas.Next;
    end;

  end;

  getTurmas.Close;
  listarTurmas;
end;


procedure Tpages.listarTurmas;
var textoAdicionado : String;
var i : Integer;
var turma : TTurma;
begin

  ltbxTurmas.Clear;
  i := 0;

  for turma in listaTurmas do begin
    textoAdicionado := listaTurmas[i].getCodigo.ToString + ' - ' + listaTurmas[i].getNome + ' - Professor ID: ' + listaTurmas[i].getCodigoProfessor.ToString + ' - Materia ID: ' + listaTurmas[i].getCodigoDisciplina.ToString;
    ltbxTurmas.Items.Add(textoAdicionado);
    i := i + 1;
  end;

  lblTitTurmas.Caption := 'Turmas Cadastradas : ' + (listaTurmas.Count).ToString;

end;


procedure Tpages.editarTurma;
var turmaSelecionado : TTurma;
begin

  turmaSelecionado := getTurmaById(listaTurmas[ltbxTurmas.ItemIndex].getCodigo);

  btnEditarTurma.Enabled := False;
  btnExcluirTurma.Enabled := False;

  turmaAdd.indexTurmaSelecionado := ltbxTurmas.ItemIndex;

  turmaAdd.ShowModal;
  ltbxTurmas.Items[ltbxTurmas.ItemIndex] := turmaSelecionado.getCodigo.ToString + ' - ' + turmaSelecionado.getNome + ' - Professor ID: ' + turmaSelecionado.getCodigoProfessor.ToString + ' - Materia ID: ' + turmaSelecionado.getCodigoDisciplina.ToString;



end;


procedure Tpages.excluirTurma;
var turmaSelecionado : TTurma;
begin
   turmaSelecionado := getTurmaById(listaTurmas[ltbxTurmas.ItemIndex].getCodigo);
   dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_turmas SET ativo = false WHERE turma_id = ' + (turmaSelecionado.getCodigo).ToString + ';';
   dbConnection.qryInsert.ExecSQL;
   btnEditarTurma.Enabled := False;
   btnExcluirTurma.Enabled := False;
   listaTurmas.remove(turmaSelecionado);
   ltbxTurmas.items.Delete(ltbxTurmas.ItemIndex);
end;


procedure Tpages.mostrarNovasTurmas;
var i: Integer;
var adicionarTurma: Integer;
begin

  for i := 0 to turmaAdd.novasTurmas - 1 do
  begin
    adicionarTurma := listaTurmas.Count - (turmaAdd.novasTurmas) + i ;
    ltbxTurmas.Items.Add(listaTurmas[adicionarTurma].getCodigo.ToString + ' - ' + listaTurmas[adicionarTurma].getNome + ' - Professor ID: ' + listaTurmas[adicionarTurma].getCodigoProfessor.ToString + ' - Materia ID: ' + listaTurmas[adicionarTurma].getCodigoDisciplina.ToString);
  end;

end;
// ****** FIM DAS FUNÇÕES TURMAS ******
// ****** FIM DAS FUNÇÕES TURMAS ******
// ****** FIM DAS FUNÇÕES TURMAS ******


// ****** FIM DAS FUNÇÕES******
// ****** FIM DAS FUNÇÕES ******
// ****** FIM DAS FUNÇÕES******

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
  alunoAdd.Free;

  if alunoAdd.novosAlunos > 0 then mostrarNovosAlunos;

end;





////// FIM DO CODIGO ALUNOS//////
////// FIM DO CODIGO ALUNOS//////
////// FIM DO CODIGO ALUNOS//////
////// FIM DO CODIGO ALUNOS//////
 procedure Tpages.btnEditarProfessorClick(Sender: TObject);
var professorSelecionado : TAluno;
begin

  professorAdd:= TmodalProfessor.Create(Self);
  professorAdd.btnModalProfessor.Caption := 'Atualizar';
  editarProfessor;
  professorAdd.free;
end;

procedure Tpages.btnModalProfessorClick(Sender: TObject);
begin
  professorAdd:= TmodalProfessor.Create(Self);
  professorAdd.indexProfessorSelecionado := -1;
  professorAdd.qntProfessores := listaProfessores.Count;
  professorAdd.ShowModal;
  professorAdd.Free;

  if professorAdd.novosProfessores > 0 then mostrarNovosProfessores; end;

procedure Tpages.btnExcluirProfessorClick(Sender: TObject);
begin
   excluirProfessor;
end;

procedure Tpages.ltbxProfessoresClick(Sender: TObject);
begin

   if ltbxProfessores.ItemIndex <> -1 then begin
      btnEditarProfessor.Enabled := True;
      btnExcluirProfessor.Enabled := True;
   end;

end;


////// FIM DO CODIGO PROFESSORES//////
////// FIM DO CODIGO PROFESSORES//////
////// FIM DO CODIGO PROFESSORES//////
////// FIM DO CODIGO PROFESSORES//////



procedure Tpages.btnEditarTurmaClick(Sender: TObject);
begin
  turmaAdd:= TmodalTurma.Create(Self);
  turmaAdd.btnModalTurma.Caption := 'Atualizar';
  editarTurma;
  turmaAdd.free;

end;


 procedure Tpages.btnModalTurmaClick(Sender: TObject);
begin
  turmaAdd:= TmodalTurma.Create(Self);
  turmaAdd.indexTurmaSelecionado := -1;
  turmaAdd.qntTurmas := listaTurmas.Count;
  turmaAdd.ShowModal;
  turmaAdd.Free;

  if turmaAdd.novasTurmas > 0 then mostrarNovasTurmas;

end;


procedure Tpages.btnExcluirTurmaClick(Sender: TObject);
begin
   excluirTurma;
end;


procedure Tpages.ltbxTurmasClick(Sender: TObject);
begin

   if ltbxTurmas.ItemIndex <> -1 then begin
      btnEditarTurma.Enabled := True;
      btnExcluirTurma.Enabled := True;
   end;

end;


procedure Tpages.FormCreate(Sender: TObject);
begin
  puxarAlunos;
  puxarTurmas;
  puxarProfessores;
end;

end.
