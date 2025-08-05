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
  OnCreate = FormCreate
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
        object lblTitAlunos: TLabel
          Left = 270
          Top = 20
          Width = 105
          Height = 15
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
        object ltbxAlunos: TListBox
          Left = 225
          Top = 6
          Width = 222
          Height = 321
          Align = alCustom
          ItemHeight = 15
          TabOrder = 0
          OnClick = ltbxAlunosClick
        end
        object btnModalAluno: TButton
          Left = 300
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 1
          OnClick = btnModalAlunoClick
        end
        object btnEditarAluno: TButton
          Left = 219
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Editar'
          Enabled = False
          TabOrder = 2
          OnClick = btnEditarAlunoClick
        end
        object btnExcluirAluno: TButton
          Left = 381
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Excluir'
          Enabled = False
          TabOrder = 3
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
          Left = 240
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
        object lblTitProfessores: TLabel
          Left = 255
          Top = 15
          Width = 128
          Height = 15
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
