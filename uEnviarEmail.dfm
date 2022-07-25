object fEnviarEmail: TfEnviarEmail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Enviar dados por e-mail'
  ClientHeight = 183
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 164
    Width = 409
    Height = 19
    Panels = <>
    ExplicitLeft = -308
    ExplicitTop = 192
    ExplicitWidth = 765
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 164
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 200
    ExplicitTop = 96
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lb_edt_Email: TLabeledEdit
      Left = 24
      Top = 48
      Width = 353
      Height = 21
      CharCase = ecLowerCase
      EditLabel.Width = 158
      EditLabel.Height = 13
      EditLabel.Caption = 'Informe o e-mail do Destinat'#225'rio:'
      TabOrder = 0
    end
    object btnEviar: TButton
      Left = 80
      Top = 104
      Width = 75
      Height = 25
      Caption = '&Enviar'
      TabOrder = 1
      OnClick = btnEviarClick
    end
    object Button1: TButton
      Left = 224
      Top = 104
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
