# **Aurelius ORM**

## O que é um ORM?

Mapeamento Objeto-Relacional (Object-Relational Mapping): é uma técnica para aproximar o paradigma de desenvolvimento de aplicações orientadas a objetos ao paradigma do banco de dados relacional.

| Tabela do banco de dados | ——————-> | Classes |
| --- | --- | --- |
| Registro do banco | ——————-> | Objetos |

![ORM](https://github.com/user-attachments/assets/9bc388be-dd8f-4cba-931f-a830402dd829)

## Como ficaria esse exemplo no Delphi
```
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
```

## O que ele faz e quais vantagens

- Possibilidade de troca de motor de busca de forma rápida e segura
- Cria automaticamente a tabela no banco caso ela ainda não exista, independente do banco
- Banco de dados suportados: Firebird, Interbase, Microsoft SQL Server, MySQL, NexusDB, Oracle, SQLite, PostgreSQL, DB2, ElevateDB server, Absolute Database
- Componentes de acesso ao banco de dados suportados: dbExpress, dbGo (ADO), FIBPlus, Interbase Express (IBX), SQLite - Native Support, AnyDac, NexusDB, SQL-Direct, IBObjects, ElevateDB, UniDac, UIB, Direct Oracle Access, FireDac, ZeosLib
- Solução multiplataforma - Win32, Win64, macOS, VCL, FireMonkey
- **Mapeamento direto em classes** usando atributos personalizados (custom attributes)
- Escolha entre a abordagem classes-to-database (criando a estrutura do banco de dados a partir de classes) ou abordagem de banco de dados para classes (criando código-fonte de classes a partir do banco de dados, usando [TMS Data Modeler](https://www.tmssoftware.com/site/tmsdm.asp)

## Onde baixar

- [https://www.tmssoftware.com/site/aurelius.asp](https://www.tmssoftware.com/site/aurelius.asp?r=popup)


## 📞 Contatos

[![Telegram](https://img.shields.io/badge/Telegram-Join-blue?logo=telegram)](https://t.me/Code4Delphi)
[![YouTube](https://img.shields.io/badge/YouTube-Join-red?logo=youtube&logoColor=red)](https://www.youtube.com/@code4delphi)
[![Instagram](https://img.shields.io/badge/Intagram-Follow-red?logo=instagram&logoColor=pink)](https://www.instagram.com/code4delphi/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://www.linkedin.com/in/cesar-cardoso-dev)
[![Blog](https://img.shields.io/badge/Blog-Code4Delphi-F00?logo=delphi)](https://code4delphi.com.br/blog/)
[![Course](https://img.shields.io/badge/Course-Delphi-F00?logo=delphi)](https://go.hotmart.com/U81331747Y?dp=1)
[![E-mail](https://img.shields.io/badge/E--mail-Send-yellowgreen?logo=maildotru&logoColor=yellowgreen)](mailto:contato@code4delphi.com.br)
