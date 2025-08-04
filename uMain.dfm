object home: Thome
  Left = 0
  Top = 0
  Caption = 'Home'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 400
    ExplicitTop = 280
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 224
      Top = 188
      Width = 196
      Height = 15
      Caption = 'Bem vindo ao nosso sistema escolar!!'
    end
    object abrirModal: TButton
      Left = 280
      Top = 209
      Width = 75
      Height = 25
      Caption = 'Entrar'
      TabOrder = 0
      OnClick = abrirModalClick
    end
  end
end
