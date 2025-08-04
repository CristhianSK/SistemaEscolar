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
    procedure btnModalAlunoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure Tpages.btnModalAlunoClick(Sender: TObject);
begin


  alunoAdd:= TmodalAluno.Create(alunoAdd);
  alunoAdd.ShowModal;
  alunoAdd.free;



end;


procedure Tpages.FormCreate(Sender: TObject);
begin
  var getAlunos : TFDQuery;
  getAlunos := dbConnection.qrySelectAllAlunos;
  getAlunos.Open;
  while not getAlunos.Eof do begin
    ltbxAlunos.Items.Add(getAlunos.FieldByName('aluno_nome').AsString);
    getAlunos.Next;
  end;
  getAlunos.Close;
end;

end.
