program AureliusSample;

uses
  Vcl.Forms,
  Main.View in 'Src\Main\Main.View.pas' {MainView},
  Produtos.Entity in 'Src\Produtos\Produtos.Entity.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
