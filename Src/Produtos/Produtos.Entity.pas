unit Produtos.Entity;

interface

uses
  Aurelius.Mapping.Attributes;

type
  [Entity]
  [Automapping]
  TProduto = class
  private
    FId: Integer;
    FNome: string;
    FPreco: Double;
    FDescricao: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Preco: Double read FPreco write FPreco;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

initialization
  RegisterEntity(TProduto);

end.
