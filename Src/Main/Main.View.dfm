object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'Aurelius - Demo Code4D - v1.0.0'
  ClientHeight = 551
  ClientWidth = 719
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnTudo: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 551
    Cursor = crHandPoint
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 713
      Height = 41
      Margins.Bottom = 15
      Align = alTop
      BevelEdges = [beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 8
      Padding.Right = 5
      Padding.Bottom = 6
      TabOrder = 0
      object btnCriarAtualizarBD: TButton
        Left = 5
        Top = 8
        Width = 284
        Height = 25
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Criar / Atualizar Schema banco de dados'
        TabOrder = 0
        OnClick = btnCriarAtualizarBDClick
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 59
      Width = 719
      Height = 492
      ActivePage = TabSheet3
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Cadastro / Altera'#231#227'o de Produto'
        object Label1: TLabel
          Left = 16
          Top = 20
          Width = 39
          Height = 15
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel
          Left = 16
          Top = 69
          Width = 33
          Height = 15
          Caption = 'Nome'
        end
        object Label3: TLabel
          Left = 435
          Top = 69
          Width = 30
          Height = 15
          Caption = 'Pre'#231'o'
        end
        object Label4: TLabel
          Left = 16
          Top = 117
          Width = 51
          Height = 15
          Caption = 'Descri'#231#227'o'
        end
        object edtCodigo: TEdit
          Left = 16
          Top = 37
          Width = 89
          Height = 23
          NumbersOnly = True
          TabOrder = 0
        end
        object edtNome: TEdit
          Left = 16
          Top = 86
          Width = 414
          Height = 23
          TabOrder = 1
        end
        object edtPreco: TEdit
          Left = 435
          Top = 86
          Width = 150
          Height = 23
          TabOrder = 2
        end
        object edtDescricao: TEdit
          Left = 16
          Top = 138
          Width = 569
          Height = 23
          TabOrder = 3
        end
        object btnSalvarNovoProduto: TBitBtn
          Left = 16
          Top = 175
          Width = 125
          Height = 25
          Cursor = crHandPoint
          Caption = 'Salvar novo produto'
          TabOrder = 4
          OnClick = btnSalvarNovoProdutoClick
        end
        object btnBuscarProdutoPeloCodigo: TBitBtn
          Left = 111
          Top = 36
          Width = 159
          Height = 25
          Cursor = crHandPoint
          Caption = 'Buscar produto pelo c'#243'digo'
          TabOrder = 5
          OnClick = btnBuscarProdutoPeloCodigoClick
        end
        object btnSalvarAlteracaoProduto: TBitBtn
          Left = 147
          Top = 175
          Width = 170
          Height = 25
          Cursor = crHandPoint
          Caption = 'Salvar altera'#231#227'o do produto'
          TabOrder = 6
          OnClick = btnSalvarAlteracaoProdutoClick
        end
        object btnExcluirProduto: TBitBtn
          Left = 363
          Top = 207
          Width = 134
          Height = 25
          Cursor = crHandPoint
          Caption = 'Excluir produto'
          TabOrder = 7
          OnClick = btnExcluirProdutoClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Consultar produtos'
        ImageIndex = 1
        DesignSize = (
          711
          462)
        object Label5: TLabel
          Left = 16
          Top = 29
          Width = 294
          Height = 15
          Caption = 'Buscar produtos onde o nome ou descri'#231#227'o contenham'
        end
        object edtBuscar: TEdit
          Left = 16
          Top = 45
          Width = 414
          Height = 23
          TabOrder = 0
        end
        object btnBuscar: TBitBtn
          Left = 435
          Top = 44
          Width = 150
          Height = 25
          Cursor = crHandPoint
          Caption = 'Buscar produtos'
          TabOrder = 1
          OnClick = btnBuscarClick
        end
        object mmResultados: TMemo
          Left = 16
          Top = 88
          Width = 569
          Height = 359
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Dataset / DBGrid'
        ImageIndex = 2
        object DBGrid1: TDBGrid
          Left = 0
          Top = 41
          Width = 711
          Height = 421
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 711
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label6: TLabel
            Left = 223
            Top = 0
            Width = 294
            Height = 15
            Caption = 'Buscar produtos onde o nome ou descri'#231#227'o contenham'
          end
          object btnBuscarTodosProdutos: TButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 182
            Height = 35
            Align = alLeft
            Caption = 'Buscar todos os produtos'
            TabOrder = 0
            OnClick = btnBuscarTodosProdutosClick
          end
          object edtFiltrar: TEdit
            Left = 223
            Top = 16
            Width = 294
            Height = 23
            TabOrder = 1
          end
          object BitBtn1: TBitBtn
            Left = 523
            Top = 13
            Width = 134
            Height = 25
            Cursor = crHandPoint
            Caption = 'Filtrar produtos'
            TabOrder = 2
            OnClick = BitBtn1Click
          end
        end
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Utilitarios\TMS-Aurelius-Sample\BD\AureliusSampleCod' +
        'e4D'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 324
    Top = 195
  end
  object AureliusConnection1: TAureliusConnection
    AdapterName = 'FireDac'
    AdaptedConnection = FDConnection1
    SQLDialect = 'SQLite'
    Left = 316
    Top = 259
  end
  object AureliusDataset1: TAureliusDataset
    FieldDefs = <>
    Left = 588
    Top = 291
  end
  object DataSource1: TDataSource
    DataSet = AureliusDataset1
    Left = 576
    Top = 376
  end
  object AureliusManager1: TAureliusManager
    Connection = AureliusConnection1
    Left = 324
    Top = 323
  end
end
