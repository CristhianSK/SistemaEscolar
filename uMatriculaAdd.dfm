object modalMatricula: TmodalMatricula
  Left = 0
  Top = 0
  Caption = 'modalMatricula'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlAdicionarTurma: TPanel
    AlignWithMargins = True
    Left = 221
    Top = 67
    Width = 185
    Height = 318
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 27
      Top = 14
      Width = 135
      Height = 15
      Caption = 'Adicionar Nova Matricula'
    end
    object lblInputCodigo: TLabel
      Left = 32
      Top = 40
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblInputAluno: TLabel
      Left = 33
      Top = 90
      Width = 32
      Height = 15
      Caption = 'Aluno'
    end
    object lblInputTurma: TLabel
      Left = 32
      Top = 140
      Width = 35
      Height = 15
      Caption = 'Turma'
    end
    object btnModalMatricula: TButton
      Left = 54
      Top = 269
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = btnModalMatriculaClick
    end
    object inputCodigo: TEdit
      Left = 32
      Top = 61
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 1
      TextHint = '999'
    end
    object slcAlunos: TComboBox
      Left = 32
      Top = 111
      Width = 121
      Height = 23
      Style = csDropDownList
      TabOrder = 2
    end
    object slcTurmas: TComboBox
      Left = 32
      Top = 161
      Width = 121
      Height = 23
      Style = csDropDownList
      TabOrder = 3
    end
  end
end
