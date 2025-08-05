unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uPages, Vcl.ExtCtrls;

type
  Thome = class(TForm)
    abrirModal: TButton;
    Panel1: TPanel;
    Label1: TLabel;

    procedure abrirModalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pages: Tpages;

implementation




{$R *.dfm}



procedure Thome.abrirModalClick(Sender: TObject);
begin

  pages:= Tpages.Create(Self);
  pages.ShowModal;
  pages.free;
end;

end.
