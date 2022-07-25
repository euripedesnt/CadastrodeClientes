program CadastrodeClientes;

uses
  Vcl.Forms,
  uCadastroBase in 'uCadastroBase.pas' {fCadastroBase},
  uConfiguracoes in 'uConfiguracoes.pas',
  uCadastroCliente in 'uCadastroCliente.pas' {fCadastroCliente},
  uEnviarEmail in 'uEnviarEmail.pas' {fEnviarEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfCadastroCliente, fCadastroCliente);
  Application.CreateForm(TfCadastroBase, fCadastroBase);
  Application.Run;
end.
