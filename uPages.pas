unit uPages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, uAluno, uProfessor, uTurma, uAlunoAdd, uTurmaAdd
  , uProfessorAdd, uMatricula, uMatriculaAdd,
  uDisciplina,uDisciplinaAdd, uData,
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
    Panel5: TPanel;
    lblTitDisciplina: TLabel;
    Panel6: TPanel;
    ltbxDisciplinas: TListBox;
    btnModalDisciplina: TButton;
    btnEditarDisciplina: TButton;
    btnExcluirDisciplina: TButton;
    Panel7: TPanel;
    ltbxMatriculas: TListBox;
    btnModalMatricula: TButton;
    btnEditarMatricula: TButton;
    btnExcluirMatricula: TButton;
    Panel8: TPanel;
    lblMatriculas: TLabel;
    procedure btnModalAlunoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure listarAlunos;
    procedure puxarAlunos;
    procedure editarAluno;
    procedure excluirAluno;
    procedure mostrarNovosAlunos;

    procedure listarDisciplinas;
    procedure puxarDisciplinas;
    procedure editarDisciplina;
    procedure excluirDisciplina;
    procedure mostrarNovosDisciplinas;


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


    procedure listarMatriculas;
    procedure puxarMatriculas;
    procedure editarMatricula;
    procedure excluirMatricula;
    procedure mostrarNovosMatriculas;



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
    procedure ltbxDisciplinasClick(Sender: TObject);
    procedure btnExcluirDisciplinaClick(Sender: TObject);
    procedure btnModalDisciplinaClick(Sender: TObject);
    procedure btnEditarDisciplinaClick(Sender: TObject);
    procedure btnModalMatriculaClick(Sender: TObject);
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
  disciplinaAdd: TmodalDisciplina;
  matriculaAdd: TmodalMatricula;


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


// ****** FIM DAS FUNÇÕES PROFESSORES ******
// ****** FIM DAS FUNÇÕES PROFESSORES ******
// ****** FIM DAS FUNÇÕES PROFESSORES ******

// ****** INICIO DAS FUNÇÕES DISCIPLINAS ******
// ****** INICIO DAS FUNÇÕES DISCIPLINAS ******
// ****** INICIO DAS FUNÇÕES DISCIPLINAS ******


procedure Tpages.puxarDisciplinas;
begin
  var getDisciplinas : TFDQuery;
  var disciplina : TDisciplina;

  getDisciplinas := dbConnection.qrySelectAllDisciplinas;
  getDisciplinas.Open;

  while not getDisciplinas.Eof do begin
    if getDisciplinas.FieldByName('ativo').AsBoolean then begin
      disciplina := TDisciplina.Create(getDisciplinas.FieldByName('disciplina_id').AsInteger, getDisciplinas.FieldByName('disciplina_nome').AsString);
      listaDisciplinas.Add(disciplina);
      getDisciplinas.Next;
    end else begin
      getDisciplinas.Next;
    end;

  end;

  getDisciplinas.Close;
  listarDisciplinas;
end;


procedure Tpages.listarDisciplinas;
var textoAdicionado : String;
var i : Integer;
var disciplina : TDisciplina;
begin

  ltbxDisciplinas.Clear;
  i := 0;

  for disciplina in listaDisciplinas do begin
    textoAdicionado := listaDisciplinas[i].getCodigo.ToString + ' - ' + listaDisciplinas[i].getNome;
    ltbxDisciplinas.Items.Add(textoAdicionado);
    i := i + 1;
  end;

  lblTitDisciplina.Caption := 'Disciplinas Cadastradas : ' + (listaDisciplinas.Count).ToString;

end;

procedure Tpages.editarDisciplina;
var disciplinaSelecionado : TDisciplina;
begin

  disciplinaSelecionado := getDisciplinaById(listaDisciplinas[ltbxDisciplinas.ItemIndex].getCodigo);

  btnEditarDisciplina.Enabled := False;
  btnExcluirDisciplina.Enabled := False;

  disciplinaAdd.indexDisciplinaSelecionado := ltbxDisciplinas.ItemIndex;

  disciplinaAdd.ShowModal;
  ltbxDisciplinas.Items[ltbxDisciplinas.ItemIndex] := disciplinaSelecionado.getCodigo.ToString + ' - ' + disciplinaSelecionado.getNome;

end;


procedure Tpages.excluirDisciplina;
var disciplinaSelecionado : TDisciplina;
begin
   disciplinaSelecionado := getDisciplinaById(listaDisciplinas[ltbxDisciplinas.ItemIndex].getCodigo);
   dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_disciplinas SET ativo = false WHERE disciplina_id = ' + (disciplinaSelecionado.getCodigo).ToString + ';';
   dbConnection.qryInsert.ExecSQL;
   btnEditarDisciplina.Enabled := False;
   btnExcluirDisciplina.Enabled := False;
   listaDisciplinas.remove(disciplinaSelecionado);
   ltbxDisciplinas.items.Delete(ltbxDisciplinas.ItemIndex);
end;


procedure Tpages.mostrarNovosDisciplinas;
var i: Integer;
var adicionarDisciplina: Integer;
begin

  for i := 0 to disciplinaAdd.novosDisciplinas - 1 do
  begin
    adicionarDisciplina := listaDisciplinas.Count - (disciplinaAdd.novosDisciplinas) + i ;
    ltbxDisciplinas.Items.Add(listaDisciplinas[adicionarDisciplina].getCodigo.ToString + ' - ' + listaDisciplinas[adicionarDisciplina].getNome );
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

// ****** INICIO DAS FUNÇÕES MATRICULAS ******
// ****** INICIO DAS FUNÇÕES MATRICULAS ******
// ****** INICIO DAS FUNÇÕES MATRICLAS ******
procedure Tpages.puxarMatriculas;
begin
  var getMatriculas : TFDQuery;
  var matricula : TMatricula;

  getMatriculas := dbConnection.qrySelectAllMatriculas;
  getMatriculas.Open;

  while not getMatriculas.Eof do begin
    if getMatriculas.FieldByName('ativo').AsBoolean then begin
      matricula := TMatricula.Create(getMatriculas.FieldByName('matricula_id').AsInteger,getMatriculas.FieldByName('matricula_id_aluno').AsInteger,getMatriculas.FieldByName('matricula_id_turma').AsInteger);
      listaMatriculas.Add(matricula);
      getMatriculas.Next;
    end else begin
      getMatriculas.Next;
    end;

  end;

  getMatriculas.Close;
  listarMatriculas;
end;


procedure Tpages.listarMatriculas;
var textoAdicionado : String;
var i : Integer;
var matricula : TMatricula;
begin

  ltbxMatriculas.Clear;
  i := 0;

  for matricula in listaMatriculas do begin
    textoAdicionado := listaMatriculas[i].getCodigo.ToString + ' - Aluno ID: ' + listaMatriculas[i].getCodigoAluno.ToString + ' - Turma ID: ' + listaMatriculas[i].getCodigoTurma.ToString;
    ltbxMatriculas.Items.Add(textoAdicionado);
    i := i + 1;
  end;

  lblMatriculas.Caption := 'Matriculas Cadastradas : ' + (listaMatriculas.Count).ToString;

end;


procedure Tpages.excluirMatricula;
var matriculaSelecionado : TMatricula;
begin
   matriculaSelecionado := getMatriculaById(listaMatriculas[ltbxMatriculas.ItemIndex].getCodigo);
   dbConnection.qryInsert.SQL.Text:= 'UPDATE public.tb_matriculas SET ativo = false WHERE matricula_id = ' + (matriculaSelecionado.getCodigo).ToString + ';';
   dbConnection.qryInsert.ExecSQL;
   btnEditarMatricula.Enabled := False;
   btnExcluirMatricula.Enabled := False;
   listaMatriculas.remove(matriculaSelecionado);
   ltbxMatriculas.items.Delete(ltbxMatriculas.ItemIndex);
end;


procedure Tpages.editarMatricula;
var matriculaSelecionado : TMatricula;
begin

  matriculaSelecionado := getMatriculaById(listaMatriculas[ltbxMatriculas.ItemIndex].getCodigo);

  btnEditarMatricula.Enabled := False;
  btnExcluirMatricula.Enabled := False;

  matriculaAdd.indexMatriculaSelecionado := ltbxMatriculas.ItemIndex;

  matriculaAdd.ShowModal;
  ltbxMatriculas.Items[ltbxMatriculas.ItemIndex] := matriculaSelecionado.getCodigo.ToString + ' - ' + matriculaSelecionado.getCodigoAluno.ToString + ' - ' + matriculaSelecionado.getCodigoTurma.ToString;

end;



procedure Tpages.mostrarNovosMatriculas;
var i: Integer;
var adicionarMatricula: Integer;
begin

  for i := 0 to matriculaAdd.novosMatriculas - 1 do
  begin
    adicionarMatricula := listaMatriculas.Count - (matriculaAdd.novosMatriculas) + i ;
    ltbxMatriculas.Items.Add(listaMatriculas[adicionarMatricula].getCodigo.ToString + ' - ' + listaMatriculas[adicionarMatricula].getCodigoAluno.toString + ' - ' + listaMatriculas[adicionarMatricula].getCodigoTurma.toString);
  end;

end;


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
var professorSelecionado : TProfessor;
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

  if professorAdd.novosProfessores > 0 then mostrarNovosProfessores;
end;

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

procedure Tpages.btnEditarDisciplinaClick(Sender: TObject);
var disciplinaSelecionado : TDisciplina;
begin

  disciplinaAdd:= TmodalDisciplina.Create(Self);
  disciplinaAdd.btnModalDisciplina.Caption := 'Atualizar';
  editarDisciplina;
  disciplinaAdd.free;
end;

procedure Tpages.ltbxDisciplinasClick(Sender: TObject);
begin
   if ltbxDisciplinas.ItemIndex <> -1 then begin
      btnEditarDisciplina.Enabled := True;
      btnExcluirDisciplina.Enabled := True;
   end;
end;


procedure Tpages.btnExcluirDisciplinaClick(Sender: TObject);
begin
    excluirDisciplina;
end;

procedure Tpages.btnModalDisciplinaClick(Sender: TObject);
begin
  disciplinaAdd:= TmodalDisciplina.Create(Self);
  disciplinaAdd.indexDisciplinaSelecionado := -1;
  disciplinaAdd.qntDisciplinas := listaDisciplinas.Count;
  disciplinaAdd.ShowModal;
  disciplinaAdd.Free;

  if disciplinaAdd.novosDisciplinas > 0 then mostrarNovosDisciplinas;
end;

////// FIM DO CODIGO DISCIPLINAS//////
////// FIM DO CODIGO DISCIPLINAS//////
////// FIM DO CODIGO DISCIPLINAS//////
////// FIM DO CODIGO DISCIPLINAS//////


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
////// FIM DO CODIGO TURMAS//////
////// FIM DO CODIGO TURMAS//////
////// FIM DO CODIGO TURMAS//////
////// FIM DO CODIGO TURMAS//////

procedure Tpages.btnModalMatriculaClick(Sender: TObject);
begin
  matriculaAdd:= TmodalMatricula.Create(Self);
  matriculaAdd.indexMatriculaSelecionado := -1;
  matriculaAdd.qntMatriculas := listaMatriculas.Count;
  matriculaAdd.ShowModal;
  matriculaAdd.Free;

  if turmaAdd.novasTurmas > 0 then mostrarNovasTurmas;

end;


procedure Tpages.FormCreate(Sender: TObject);
begin
  puxarAlunos;
  puxarTurmas;
  puxarProfessores;
  puxarDisciplinas;
  puxarMatriculas;
end;

end.
