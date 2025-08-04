unit uPages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, uAluno, uProfessor,
  Vcl.StdCtrls;

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
    btnModalAluno: TButton;
    btnModalProfessor: TButton;
    pnlAdicionarAluno: TPanel;
    Label1: TLabel;
    inputCodigo: TEdit;
    inputNome: TEdit;
    lblInputCodigo: TLabel;
    lblInputNome: TLabel;
    procedure btnModalAlunoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pages: Tpages;


implementation

{$R *.dfm}

procedure Tpages.btnModalAlunoClick(Sender: TObject);
var aluno : TAluno;
var textoExibido : String;

begin
  if (inputNome.Text = '') or (inputCodigo.Text = '') then begin
    ShowMessage('Preencha todos os campos!');
  end else begin
     aluno := TAluno.Create(strToInt(inputCodigo.Text), inputNome.Text);
     textoExibido :=' Nome: ' + aluno.getNome + ' Código: ' + aluno.getCodigo.ToString ;
     ltbxAlunos.Items.AddObject(textoExibido, aluno);
  end;

end;

end.
