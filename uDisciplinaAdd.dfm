object modalDisciplina: TmodalDisciplina
  Left = 0
  Top = 0
  Caption = 'modalDisciplina'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlAdicionarDisciplina: TPanel
    AlignWithMargins = True
    Left = 221
    Top = 59
    Width = 185
    Height = 318
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 27
      Top = 6
      Width = 136
      Height = 15
      Caption = 'Adicionar Nova Disciplina'
    end
    object lblInputCodigo: TLabel
      Left = 32
      Top = 72
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblInputNome: TLabel
      Left = 32
      Top = 136
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object btnModalDisciplina: TButton
      Left = 54
      Top = 197
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = btnModalDisciplinaClick
    end
    object inputCodigo: TEdit
      Left = 32
      Top = 93
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 1
      TextHint = '999'
    end
    object inputNome: TEdit
      Left = 32
      Top = 157
      Width = 121
      Height = 23
      TabOrder = 2
      TextHint = 'Matem'#225'tica'
    end
  end
end
