unit uPages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, uAluno, uProfessor, uAlunoAdd, uData,
  Vcl.StdCtrls,FireDAC.Comp.Client, uConnection;

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

procedure Tpages.listarAlunos;
var textoAdicionado : String;
begin
  var getAlunos : TFDQuery;
  ltbxAlunos.Items.Clear;
  getAlunos := dbConnection.qrySelectAllAlunos;
  getAlunos.Open;

  while not getAlunos.Eof do begin
    textoAdicionado := getAlunos.FieldByName('aluno_id').AsString + ' - ' + getAlunos.FieldByName('aluno_nome').AsString;
    ltbxAlunos.Items.Add(textoAdicionado);
    getAlunos.Next;
  end;
  getAlunos.Close;
end;

procedure Tpages.ltbxAlunosClick(Sender: TObject);
begin
   if ltbxAlunos.ItemIndex <> -1 then begin
    btnEditarAluno.Enabled := True;
    btnExcluirAluno.Enabled := True;
    alunoAdd.indexAlunoSelecionado := ltbxAlunos.ItemIndex;
   end else begin
    alunoAdd.indexAlunoSelecionado := -1;
   end;

end;

procedure Tpages.btnEditarAlunoClick(Sender: TObject);
begin
  alunoAdd:= TmodalAluno.Create(Self);
  alunoAdd.ShowModal;

  alunoAdd.free;

  listarAlunos;
end;

procedure Tpages.btnModalAlunoClick(Sender: TObject);
begin
  alunoAdd := TmodalAluno.Create(Self);
  alunoAdd.indexAlunoSelecionado := -1; // novo aluno
  alunoAdd.ShowModal;
  alunoAdd.Free;
  listarAlunos;
end;

procedure Tpages.FormCreate(Sender: TObject);
begin
  listarAlunos;
end;



end.
