unit Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  Produtos.Entity,
  Aurelius.Engine.DatabaseManager,
  Aurelius.Engine.ObjectManager,
  Aurelius.Drivers.Interfaces,
  Aurelius.Drivers.FireDac,
  Aurelius.Criteria.Base,
  Aurelius.Criteria.Linq,
  Aurelius.Sql.Sqlite,
  Aurelius.Schema.Sqlite,
  Aurelius.Comp.Connection, Vcl.Grids, Vcl.DBGrids, Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, Aurelius.Linq,
  Aurelius.Comp.Manager;

type
  TMainView = class(TForm)
    pnTudo: TPanel;
    Panel1: TPanel;
    btnCriarAtualizarBD: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtPreco: TEdit;
    edtDescricao: TEdit;
    btnSalvarNovoProduto: TBitBtn;
    btnBuscarProdutoPeloCodigo: TBitBtn;
    btnSalvarAlteracaoProduto: TBitBtn;
    Label5: TLabel;
    edtBuscar: TEdit;
    btnBuscar: TBitBtn;
    mmResultados: TMemo;
    btnExcluirProduto: TBitBtn;
    FDConnection1: TFDConnection;
    AureliusConnection1: TAureliusConnection;
    TabSheet3: TTabSheet;
    AureliusDataset1: TAureliusDataset;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnBuscarTodosProdutos: TButton;
    Label6: TLabel;
    edtFiltrar: TEdit;
    BitBtn1: TBitBtn;
    AureliusManager1: TAureliusManager;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCriarAtualizarBDClick(Sender: TObject);
    procedure btnSalvarNovoProdutoClick(Sender: TObject);
    procedure btnBuscarProdutoPeloCodigoClick(Sender: TObject);
    procedure btnSalvarAlteracaoProdutoClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure btnBuscarTodosProdutosClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FConnection: IDBConnection;
    //PARA MANIPULACAO DOS OBJETOS
    FManager: TObjectManager;
    FUltimoProdutoBuscado: TProduto;
    procedure LimparCampos;
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FConnection := AureliusConnection1.CreateConnection;
  TDatabaseManager.Update(FConnection);

  FManager := TObjectManager.Create(FConnection);
end;

procedure TMainView.FormDestroy(Sender: TObject);
begin
  FManager.Free;
end;

procedure TMainView.btnCriarAtualizarBDClick(Sender: TObject);
begin
  //CRIA / ATUALIZAR TABELAS NO BANCO DE DADOS
  TDatabaseManager.Update(FConnection);
  ShowMessage('Processo finalizado');
end;

procedure TMainView.btnBuscarProdutoPeloCodigoClick(Sender: TObject);
begin
  FUltimoProdutoBuscado := FManager.Find<TProduto>(StrToInt(edtCodigo.Text));

  if FUltimoProdutoBuscado = nil then
  begin
    ShowMessage('Produto não localizado');
    Exit;
  end;

  edtNome.Text := FUltimoProdutoBuscado.Nome;
  edtPreco.Text := FloatToStr(FUltimoProdutoBuscado.Preco);
  edtDescricao.Text := FUltimoProdutoBuscado.Descricao;
end;

procedure TMainView.LimparCampos;
begin
  edtNome.Clear;
  edtPreco.Clear;
  edtDescricao.Clear;
end;

procedure TMainView.btnSalvarNovoProdutoClick(Sender: TObject);
var
  LProduto: TProduto;
begin
  LProduto := TProduto.Create;
  LProduto.Nome := edtNome.Text;
  LProduto.Preco := StrToFloatDef(edtPreco.Text, 0);
  LProduto.Descricao := edtDescricao.Text;

  FManager.Save(LProduto);

  ShowMessage('Produto salvo com código: ' + LProduto.Id.ToString);
  Self.LimparCampos;
end;

procedure TMainView.btnSalvarAlteracaoProdutoClick(Sender: TObject);
begin
  if FUltimoProdutoBuscado = nil then
  begin
    ShowMessage('Nenhum produto carregado para ser alterado');
    Exit;
  end;

  FUltimoProdutoBuscado.Nome := edtNome.Text;
  FUltimoProdutoBuscado.Preco := StrToFloatDef(edtPreco.Text, 0);
  FUltimoProdutoBuscado.Descricao := edtDescricao.Text;
  FManager.Flush;
  ShowMessage('Produto alterado');
  Self.LimparCampos;
end;

procedure TMainView.btnBuscarClick(Sender: TObject);
var
  LStrBuscar: string;
  LProdutosList: TList<TProduto>;
  LProduto: TProduto;
begin
  LStrBuscar := Trim(edtBuscar.Text);

  LProdutosList := FManager.Find<TProduto>
    .Where(
      Linq['nome'].Contains(LStrBuscar)
      or Linq['descricao'].Contains(LStrBuscar)
    )
    .OrderBy('nome')
    .List;
  try
    mmResultados.Lines.Clear;

    for LProduto in LProdutosList do
    begin
      mmResultados.Lines.Add('Id: ' + LProduto.Id.ToString);
      mmResultados.Lines.Add('Nome: ' + LProduto.Nome);
      mmResultados.Lines.Add('Preço: ' + FloatToStr(LProduto.Preco));
      mmResultados.Lines.Add('Descrição: ' + LProduto.Descricao);
      mmResultados.Lines.Add('------------------------');
    end;
  finally
    LProdutosList.Free;
  end;
end;

procedure TMainView.btnExcluirProdutoClick(Sender: TObject);
begin
  if FUltimoProdutoBuscado = nil then
  begin
    ShowMessage('Nenhum produto carregado para ser excluído');
    Exit;
  end;

  FManager.Remove(FUltimoProdutoBuscado);
  ShowMessage('Produto excluído');
  Self.LimparCampos;
end;

procedure TMainView.btnBuscarTodosProdutosClick(Sender: TObject);
begin
  AureliusDataset1.Close;
  AureliusDataset1.SetSourceCriteria(FManager.Find<TProduto>.OrderBy('nome'));
  AureliusDataset1.Open;
end;

procedure TMainView.BitBtn1Click(Sender: TObject);
begin
  AureliusDataset1.Close;
  AureliusDataset1.SetSourceCriteria(
    FManager.Find<TProduto>
    .Where(
      Linq['nome'].Contains(edtFiltrar.Text)
      or Linq['descricao'].Contains(edtFiltrar.Text)
    ));
  AureliusDataset1.Open;
end;

end.
