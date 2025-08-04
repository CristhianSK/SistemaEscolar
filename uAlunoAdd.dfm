object alunosAdd: TalunosAdd
  Left = 0
  Top = 0
  Caption = 'Adicionar Aluno'
  ClientHeight = 401
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object b: TPanel
    Left = 0
    Top = 0
    Width = 296
    Height = 401
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 32
    object lblInputNome: TLabel
      Left = 73
      Top = 123
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblInputCodigo: TLabel
      Left = 73
      Top = 59
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object inputCodigo: TEdit
      Left = 73
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object inputNome: TEdit
      Left = 73
      Top = 144
      Width = 121
      Height = 23
      TabOrder = 1
    end
  end
end
