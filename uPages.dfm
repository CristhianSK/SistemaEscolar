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
          AlignWithMargins = True
          Left = 270
          Top = 12
          Width = 352
          Height = 26
          Margins.Left = 270
          Margins.Top = 12
          Align = alClient
          Caption = 'Alunos Cadastrados'
          ExplicitWidth = 147
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
          AlignWithMargins = True
          Left = 255
          Top = 12
          Width = 128
          Height = 26
          Margins.Left = 255
          Margins.Top = 12
          Align = alLeft
          Caption = 'Professores Cadastrados'
          ExplicitLeft = 8
          ExplicitHeight = 15
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
    end
  end
end
