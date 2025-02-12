object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'Aurelius - Demo Code4D'
  ClientHeight = 551
  ClientWidth = 621
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
    Width = 621
    Height = 551
    Cursor = crHandPoint
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 621
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 8
      Padding.Right = 5
      Padding.Bottom = 6
      TabOrder = 0
      object btnCriarAtualizarBD: TButton
        Left = 5
        Top = 8
        Width = 265
        Height = 27
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Criar / Atualizar Schema banco de dados'
        TabOrder = 0
        OnClick = btnCriarAtualizarBDClick
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 41
      Width = 621
      Height = 510
      ActivePage = TabSheet1
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
          Left = 323
          Top = 175
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
          613
          480)
        object Label5: TLabel
          Left = 16
          Top = 28
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
          Caption = 'Buscar produto pelo c'#243'digo'
          TabOrder = 1
          OnClick = btnBuscarClick
        end
        object mmResultados: TMemo
          Left = 16
          Top = 88
          Width = 569
          Height = 377
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
        end
      end
    end
  end
end
