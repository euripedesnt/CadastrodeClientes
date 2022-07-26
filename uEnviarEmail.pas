unit uEnviarEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls;

type
  TfEnviarEmail = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    lb_edt_Email: TLabeledEdit;
    btnEviar: TButton;
    Button1: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnEviarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEnviarEmail: TfEnviarEmail;

implementation

{$R *.dfm}

uses uConfiguracoes, uCadastroCliente;

procedure TfEnviarEmail.btnEviarClick(Sender: TObject);
begin
 if not  validaEmail(lb_edt_Email.Text) then
  begin
    Messagedlg('E-mail inválido.',mterror,[mbok],0);
    lb_edt_Email.SetFocus;
  end
 else
  begin
   try
     Screen.Cursor := crHourGlass;
//     fCadastroCliente.SalvaXML;
     fCadastroCliente.CriaXML;
     if fCadastroCliente.EnviarEmail(lb_edt_Email.Text) then
        Messagedlg('E-mail enviado com sucesso.',mtcustom,[mbok],0);
   finally
     Screen.Cursor := crDefault;
   end;
  end;

 Close;
end;

procedure TfEnviarEmail.Button1Click(Sender: TObject);
begin
 Close;
end;

procedure TfEnviarEmail.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
