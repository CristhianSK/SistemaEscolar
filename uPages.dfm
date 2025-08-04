object pages: Tpages
  Left = 0
  Top = 0
  Caption = 'Informa'#231#245'es'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PageControl1: TPageControl
    Left = -8
    Top = 0
    Width = 633
    Height = 441
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object pnlTitulo: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 208
        ExplicitTop = 200
        ExplicitWidth = 185
        object lblTitAlunos: TLabel
          Left = 262
          Top = 15
          Width = 107
          Height = 26
          Margins.Left = 270
          Margins.Top = 12
          Align = alCustom
          Caption = 'Alunos Cadastrados'
        end
      end
      object pnlAlunos: TPanel
        Left = 0
        Top = 41
        Width = 625
        Height = 370
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 433
        object ltbxAlunos: TListBox
          Left = 224
          Top = 6
          Width = 201
          Height = 321
          Align = alCustom
          ItemHeight = 15
          TabOrder = 0
        end
        object pnlAdicionarAluno: TPanel
          AlignWithMargins = True
          Left = 437
          Top = 3
          Width = 185
          Height = 364
          Align = alRight
          BevelOuter = bvNone
          Color = clSilver
          ParentBackground = False
          TabOrder = 1
          ExplicitHeight = 318
          object Label1: TLabel
            Left = 35
            Top = 6
            Width = 116
            Height = 15
            Caption = 'Adicionar Novo aluno'
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
          object btnModalAluno: TButton
            Left = 46
            Top = 205
            Width = 75
            Height = 25
            Caption = 'Adicionar'
            TabOrder = 0
            OnClick = btnModalAlunoClick
          end
          object inputCodigo: TEdit
            Left = 32
            Top = 93
            Width = 121
            Height = 23
            TabOrder = 1
            TextHint = '999'
          end
          object inputNome: TEdit
            Left = 32
            Top = 157
            Width = 121
            Height = 23
            TabOrder = 2
            TextHint = 'joao'
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object pnlProfessores: TPanel
        Left = 0
        Top = 41
        Width = 625
        Height = 370
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 433
        object ListBox1: TListBox
          Left = 224
          Top = 6
          Width = 201
          Height = 321
          Align = alCustom
          ItemHeight = 15
          TabOrder = 0
        end
        object btnModalProfessor: TButton
          Left = 288
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 1
        end
      end
      object pnlTituloProf: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 8
        object lblTitProfessores: TLabel
          Left = 255
          Top = 15
          Width = 128
          Height = 26
          Margins.Left = 255
          Margins.Top = 12
          Align = alCustom
          Caption = 'Professores Cadastrados'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
    end
  end
end
