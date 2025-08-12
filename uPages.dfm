object pages: Tpages
  Left = 0
  Top = 0
  Caption = 'Informa'#231#245'es'
  ClientHeight = 441
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object paginas: TPageControl
    Left = -8
    Top = 0
    Width = 633
    Height = 441
    ActivePage = tabProfessores
    TabOrder = 0
    object Alunos: TTabSheet
      Caption = 'Alunos'
      object pnlTitulo: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblTitAlunos: TLabel
          Left = 278
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
          OnClick = btnExcluirAlunoClick
        end
      end
    end
    object tabProfessores: TTabSheet
      Caption = 'Professores'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 41
        Width = 625
        Height = 370
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object ltbxProfessores: TListBox
          Left = 225
          Top = 6
          Width = 222
          Height = 321
          Align = alCustom
          ItemHeight = 15
          TabOrder = 0
          OnClick = ltbxProfessoresClick
        end
        object btnModalProfessor: TButton
          Left = 300
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 1
          OnClick = btnModalProfessorClick
        end
        object btnEditarProfessor: TButton
          Left = 219
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Editar'
          Enabled = False
          TabOrder = 2
          OnClick = btnEditarProfessorClick
        end
        object btnExcluirProfessor: TButton
          Left = 381
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Excluir'
          Enabled = False
          TabOrder = 3
          OnClick = btnExcluirProfessorClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lblTitProfessores: TLabel
          Left = 262
          Top = 20
          Width = 128
          Height = 15
          Margins.Left = 270
          Margins.Top = 12
          Align = alCustom
          Caption = 'Professores Cadastrados'
        end
      end
    end
    object tabDisciplinas: TTabSheet
      Caption = 'Disciplinas'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblTitDisciplina: TLabel
          Left = 278
          Top = 20
          Width = 123
          Height = 15
          Margins.Left = 270
          Margins.Top = 12
          Align = alCustom
          Caption = 'Disciplinas Cadastradas'
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 41
        Width = 625
        Height = 370
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object ltbxDisciplinas: TListBox
          Left = 225
          Top = 6
          Width = 222
          Height = 321
          Align = alCustom
          ItemHeight = 15
          TabOrder = 0
          OnClick = ltbxDisciplinasClick
        end
        object btnModalDisciplina: TButton
          Left = 300
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 1
          OnClick = btnModalDisciplinaClick
        end
        object btnEditarDisciplina: TButton
          Left = 219
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Editar'
          Enabled = False
          TabOrder = 2
          OnClick = btnEditarDisciplinaClick
        end
        object btnExcluirDisciplina: TButton
          Left = 381
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Excluir'
          Enabled = False
          TabOrder = 3
          OnClick = btnExcluirDisciplinaClick
        end
      end
    end
    object tabTurmas: TTabSheet
      Caption = 'Turmas'
      ImageIndex = 3
      object Panel3: TPanel
        Left = 0
        Top = 41
        Width = 625
        Height = 370
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object ltbxTurmas: TListBox
          Left = 225
          Top = 6
          Width = 222
          Height = 321
          Align = alCustom
          ItemHeight = 15
          TabOrder = 0
          OnClick = ltbxTurmasClick
        end
        object btnModalTurma: TButton
          Left = 300
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 1
          OnClick = btnModalTurmaClick
        end
        object btnEditarTurma: TButton
          Left = 219
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Editar'
          Enabled = False
          TabOrder = 2
          OnClick = btnEditarTurmaClick
        end
        object btnExcluirTurma: TButton
          Left = 381
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Excluir'
          Enabled = False
          TabOrder = 3
          OnClick = btnExcluirTurmaClick
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lblTitTurmas: TLabel
          Left = 278
          Top = 20
          Width = 107
          Height = 15
          Margins.Left = 270
          Margins.Top = 12
          Align = alCustom
          Caption = 'Turmas Cadastradas'
        end
      end
    end
    object tabMatriculas: TTabSheet
      Caption = 'Matr'#237'culas'
      ImageIndex = 4
      object Panel7: TPanel
        Left = 0
        Top = 41
        Width = 625
        Height = 370
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object ltbxMatriculas: TListBox
          Left = 225
          Top = 6
          Width = 222
          Height = 321
          Align = alCustom
          ItemHeight = 15
          TabOrder = 0
          OnClick = ltbxMatriculasClick
        end
        object btnModalMatricula: TButton
          Left = 300
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 1
          OnClick = btnModalMatriculaClick
        end
        object btnEditarMatricula: TButton
          Left = 219
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Editar'
          Enabled = False
          TabOrder = 2
          OnClick = btnEditarMatriculaClick
        end
        object btnExcluirMatricula: TButton
          Left = 381
          Top = 333
          Width = 75
          Height = 25
          Caption = 'Excluir'
          Enabled = False
          TabOrder = 3
          OnClick = btnExcluirMatriculaClick
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lblMatriculas: TLabel
          Left = 262
          Top = 20
          Width = 122
          Height = 15
          Margins.Left = 270
          Margins.Top = 12
          Align = alCustom
          Caption = 'Matr'#237'culas Cadastradas'
        end
      end
    end
  end
end
