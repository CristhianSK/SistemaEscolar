object modalTurma: TmodalTurma
  Left = 0
  Top = 0
  Caption = 'Turma'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlAdicionarTurma: TPanel
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
      Left = 35
      Top = 6
      Width = 120
      Height = 15
      Caption = 'Adicionar Nova Turma'
    end
    object lblInputCodigo: TLabel
      Left = 32
      Top = 40
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblInputNome: TLabel
      Left = 32
      Top = 88
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblInputProf: TLabel
      Left = 32
      Top = 144
      Width = 49
      Height = 15
      Caption = 'Professor'
    end
    object lblInputDisc: TLabel
      Left = 32
      Top = 200
      Width = 51
      Height = 15
      Caption = 'Disciplina'
    end
    object btnModalTurma: TButton
      Left = 54
      Top = 269
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
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
    object inputNome: TEdit
      Left = 32
      Top = 109
      Width = 121
      Height = 23
      TabOrder = 2
      TextHint = 'joao'
    end
    object inputCodigoProf: TEdit
      Left = 32
      Top = 165
      Width = 121
      Height = 23
      TabOrder = 3
      TextHint = 'carlos'
    end
    object inputCodigoDisc: TEdit
      Left = 32
      Top = 221
      Width = 121
      Height = 23
      TabOrder = 4
      TextHint = 'matem'#225'tica'
    end
  end
end
