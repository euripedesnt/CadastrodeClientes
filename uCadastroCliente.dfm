inherited fCadastroCliente: TfCadastroCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 550
  ClientWidth = 765
  WindowState = wsMaximized
  ExplicitWidth = 781
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 765
    ExplicitWidth = 765
    inherited btnSair: TBitBtn
      Left = 686
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      TabStop = False
      ExplicitLeft = 686
    end
    inherited btnCancelar: TBitBtn
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = False
    end
    inherited btnSalvar: TBitBtn
      Font.Style = [fsBold]
      ParentFont = False
      TabStop = False
    end
    inherited btnEditar: TBitBtn
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = False
    end
    inherited btnCadastrar: TBitBtn
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
    end
    inherited btnEnviaEmail: TBitBtn
      Left = 512
      Width = 174
      Caption = '&Enviar Registro por E-mail'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = btnEnviaEmailClick
      ExplicitLeft = 512
      ExplicitWidth = 174
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 531
    Width = 765
    ExplicitTop = 531
    ExplicitWidth = 765
  end
  object GroupBox2: TGroupBox [2]
    Left = 0
    Top = 50
    Width = 765
    Height = 153
    Align = alTop
    Caption = 'Identifica'#231#227'o do Cliente'
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = db_edtNome
    end
    object Label2: TLabel
      Left = 11
      Top = 56
      Width = 52
      Height = 13
      Caption = 'Identidade'
      FocusControl = db_edtIdentidade
    end
    object Label3: TLabel
      Left = 160
      Top = 56
      Width = 19
      Height = 13
      Caption = 'CPF'
      FocusControl = db_edtCpf
    end
    object Label4: TLabel
      Left = 308
      Top = 56
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = db_edtTelefone
    end
    object Label5: TLabel
      Left = 11
      Top = 96
      Width = 28
      Height = 13
      Caption = 'E-mail'
      FocusControl = db_edEmail
    end
    object db_edtNome: TDBEdit
      Left = 11
      Top = 32
      Width = 493
      Height = 21
      DataField = 'Nome'
      DataSource = dsBase
      TabOrder = 0
    end
    object db_edtIdentidade: TDBEdit
      Left = 11
      Top = 72
      Width = 136
      Height = 21
      DataField = 'Identidade'
      DataSource = dsBase
      TabOrder = 1
    end
    object db_edtCpf: TDBEdit
      Left = 160
      Top = 72
      Width = 130
      Height = 21
      DataField = 'cpf'
      DataSource = dsBase
      TabOrder = 2
    end
    object db_edtTelefone: TDBEdit
      Left = 308
      Top = 72
      Width = 196
      Height = 21
      DataField = 'telefone'
      DataSource = dsBase
      TabOrder = 3
    end
    object db_edEmail: TDBEdit
      Left = 11
      Top = 112
      Width = 493
      Height = 21
      CharCase = ecLowerCase
      DataField = 'email'
      DataSource = dsBase
      TabOrder = 4
      OnExit = db_edEmailExit
    end
  end
  object GroupBox1: TGroupBox [3]
    Left = 0
    Top = 203
    Width = 765
    Height = 198
    Align = alTop
    Caption = 'Endere'#231'o do Cliente'
    TabOrder = 2
    object Label6: TLabel
      Left = 11
      Top = 16
      Width = 19
      Height = 13
      Caption = 'CEP'
      FocusControl = db_edtCep
    end
    object Label7: TLabel
      Tag = 1
      Left = 11
      Top = 56
      Width = 55
      Height = 13
      Caption = 'Logradouro'
      Color = clSilver
      FocusControl = db_edtEndLogradouro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 304
      Top = 56
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = db_edtEndNumero
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Tag = 1
      Left = 11
      Top = 101
      Width = 65
      Height = 13
      Caption = 'Complemento'
      FocusControl = db_edtEndComplemento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Tag = 1
      Left = 304
      Top = 101
      Width = 28
      Height = 13
      Caption = 'Bairro'
      FocusControl = db_edtBairro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Tag = 1
      Left = 11
      Top = 144
      Width = 33
      Height = 13
      Caption = 'Cidade'
      FocusControl = db_edtEndCidade
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Tag = 1
      Left = 224
      Top = 144
      Width = 33
      Height = 13
      Caption = 'Estado'
      FocusControl = db_edtEndEstado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Tag = 1
      Left = 304
      Top = 144
      Width = 19
      Height = 13
      Caption = 'Pais'
      FocusControl = db_edtEndPais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object db_edtCep: TDBEdit
      Left = 11
      Top = 32
      Width = 97
      Height = 21
      DataField = 'endereco_cep'
      DataSource = dsBase
      TabOrder = 0
    end
    object db_edtEndLogradouro: TDBEdit
      Tag = 1
      Left = 11
      Top = 72
      Width = 279
      Height = 21
      TabStop = False
      DataField = 'endereco_logradouro'
      DataSource = dsBase
      TabOrder = 3
    end
    object db_edtEndNumero: TDBEdit
      Left = 304
      Top = 72
      Width = 121
      Height = 21
      DataField = 'endereco_numero'
      DataSource = dsBase
      TabOrder = 2
    end
    object db_edtEndComplemento: TDBEdit
      Tag = 1
      Left = 11
      Top = 117
      Width = 279
      Height = 21
      TabStop = False
      DataField = 'endereco_complemento'
      DataSource = dsBase
      TabOrder = 4
    end
    object db_edtBairro: TDBEdit
      Tag = 1
      Left = 304
      Top = 117
      Width = 200
      Height = 21
      TabStop = False
      DataField = 'endereco_bairro'
      DataSource = dsBase
      TabOrder = 5
    end
    object db_edtEndCidade: TDBEdit
      Tag = 1
      Left = 11
      Top = 160
      Width = 200
      Height = 21
      TabStop = False
      DataField = 'endereco_cidade'
      DataSource = dsBase
      TabOrder = 6
    end
    object db_edtEndEstado: TDBEdit
      Tag = 1
      Left = 224
      Top = 160
      Width = 66
      Height = 21
      TabStop = False
      DataField = 'endereco_estado'
      DataSource = dsBase
      TabOrder = 7
    end
    object db_edtEndPais: TDBEdit
      Tag = 1
      Left = 304
      Top = 160
      Width = 200
      Height = 21
      TabStop = False
      DataField = 'endereco_pais'
      DataSource = dsBase
      TabOrder = 8
    end
    object btnLocalizaEndereco: TBitBtn
      Left = 109
      Top = 30
      Width = 99
      Height = 25
      Cursor = crHandPoint
      Caption = 'Consultar CEP'
      TabOrder = 1
      OnClick = btnLocalizaEnderecoClick
    end
  end
  object Panel3: TPanel [4]
    Left = 0
    Top = 401
    Width = 765
    Height = 15
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Rela'#231#227'o de Clientes'
    Color = 8404992
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object DBGrid1: TDBGrid [5]
    Left = 0
    Top = 416
    Width = 765
    Height = 115
    TabStop = False
    Align = alClient
    DataSource = dsBase
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'identidade'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco_cep'
        Visible = True
      end>
  end
  inherited dsBase: TDataSource
    AutoEdit = True
    DataSet = cdsClientes
    Left = 528
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 88
    object cdsClientesnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 120
    end
    object cdsClientesidentidade: TStringField
      DisplayLabel = 'Identidade'
      FieldName = 'identidade'
    end
    object cdsClientescpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      Size = 14
    end
    object cdsClientestelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
    end
    object cdsClientesemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 120
    end
    object cdsClientesendereco_cep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'endereco_cep'
      EditMask = '99999-999;0'
      Size = 9
    end
    object cdsClientesendereco_logradouro: TStringField
      FieldName = 'endereco_logradouro'
      Size = 120
    end
    object cdsClientesendereco_numero: TStringField
      FieldName = 'endereco_numero'
    end
    object cdsClientesendereco_complemento: TStringField
      FieldName = 'endereco_complemento'
      Size = 60
    end
    object cdsClientesendereco_bairro: TStringField
      FieldName = 'endereco_bairro'
      Size = 60
    end
    object cdsClientesendereco_cidade: TStringField
      FieldName = 'endereco_cidade'
      Size = 60
    end
    object cdsClientesendereco_estado: TStringField
      FieldName = 'endereco_estado'
      Size = 2
    end
    object cdsClientesendereco_pais: TStringField
      FieldName = 'endereco_pais'
    end
  end
end
