unit uCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TfCadastroCliente = class(TfCadastroBase)
    cdsClientes: TClientDataSet;
    cdsClientescpf: TStringField;
    cdsClientestelefone: TStringField;
    cdsClientesemail: TStringField;
    cdsClientesendereco_cep: TStringField;
    cdsClientesendereco_logradouro: TStringField;
    cdsClientesendereco_numero: TStringField;
    cdsClientesendereco_complemento: TStringField;
    cdsClientesendereco_bairro: TStringField;
    cdsClientesendereco_cidade: TStringField;
    cdsClientesendereco_estado: TStringField;
    cdsClientesendereco_pais: TStringField;
    cdsClientesnome: TStringField;
    cdsClientesidentidade: TStringField;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    db_edtNome: TDBEdit;
    db_edtIdentidade: TDBEdit;
    db_edtCpf: TDBEdit;
    db_edtTelefone: TDBEdit;
    db_edEmail: TDBEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    db_edtCep: TDBEdit;
    db_edtEndLogradouro: TDBEdit;
    db_edtEndNumero: TDBEdit;
    db_edtEndComplemento: TDBEdit;
    db_edtBairro: TDBEdit;
    db_edtEndCidade: TDBEdit;
    db_edtEndEstado: TDBEdit;
    db_edtEndPais: TDBEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    btnLocalizaEndereco: TBitBtn;
    procedure btnEnviaEmailClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure dsBaseStateChange(Sender: TObject);
    procedure btnLocalizaEnderecoClick(Sender: TObject);
    procedure db_edEmailExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SalvaXML;
    function EnviarEmail(p_destinatario:string):Boolean;
  end;

var
  fCadastroCliente: TfCadastroCliente;

implementation

uses
  idHTTP,
  IdSSLOpenSSL,
  System.JSON,
  IdSMTP,
  IdMessage,
  IdAttachmentFile,
  IdText,
  IdExplicitTLSClientServerBase,
  uConfiguracoes,
  uEnviarEmail;

{$R *.dfm}

procedure TfCadastroCliente.btnCadastrarClick(Sender: TObject);
begin
  inherited;
 db_edtNome.SetFocus;
end;

procedure TfCadastroCliente.btnEnviaEmailClick(Sender: TObject);
begin
  inherited;

 if fEnviarEmail = nil  then
   fEnviarEmail := TfEnviarEmail.Create(nil);
 fEnviarEmail.ShowModal;
 FreeAndNil(fEnviarEmail);

end;

procedure TfCadastroCliente.btnLocalizaEnderecoClick(Sender: TObject);
var
   v_HTTP: TIdHTTP;
   v_IDSSLHandler : TIdSSLIOHandlerSocketOpenSSL;
   v_Response: TStringStream;
   v_ResponseJsonObj: TJSONObject;
   v_Cep:String;
begin
  inherited;
     v_Cep := db_edtCep.Text;

     try
      v_HTTP                                := TIdHTTP.Create;
      v_IDSSLHandler                        := TIdSSLIOHandlerSocketOpenSSL.Create;
      v_IDSSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      v_HTTP.IOHandler                      := v_IDSSLHandler;
      v_Response                            := TStringStream.Create('');

      v_HTTP.Get('https://viacep.com.br/ws/' + v_CEP + '/json', v_Response);

      if (v_HTTP.ResponseCode = 200) and not(Utf8ToAnsi(v_Response.DataString) = '{'#$A'  "erro": "true"'#$A'}') then
       begin
        v_ResponseJsonObj                   :=  TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(v_Response.DataString)), 0) as TJSONObject;
        db_edtEndLogradouro.Text            :=  v_ResponseJsonObj.Get('logradouro').JsonValue.Value;
        db_edtEndComplemento.Text           :=  v_ResponseJsonObj.Get('complemento').JsonValue.Value;
        db_edtBairro.Text                   :=  v_ResponseJsonObj.Get('bairro').JsonValue.Value;
        db_edtEndCidade.Text                :=  v_ResponseJsonObj.Get('localidade').JsonValue.Value;
        db_edtEndEstado.Text                :=  v_ResponseJsonObj.Get('uf').JsonValue.Value;
        db_edtEndPais.Text                  :=  'Brasil';
       end
      else
        begin
         ShowMessage('CEP não localizado ou inválido!');
         db_edtEndLogradouro.Text           :=  '';
         db_edtEndComplemento.Text          :=  '';
         db_edtBairro.Text                  :=  '';
         db_edtEndCidade.Text               :=  '';
         db_edtEndEstado.Text               :=  '';
         db_edtEndPais.Text                 :=  '';
        end;
   finally
      FreeAndNil(v_HTTP);
      FreeAndNil(v_IDSSLHandler);
      FreeAndNil(v_ResponseJsonObj);
      v_Response.Destroy;
   end;

end;

procedure TfCadastroCliente.db_edEmailExit(Sender: TObject);
begin
  inherited;
 if (dsBase.DataSet.State in [dsinsert, dsEdit]) then
   if not  validaEmail(db_edEmail.Text) then
      ShowMessage('E-mail inválido.');
end;

procedure TfCadastroCliente.dsBaseStateChange(Sender: TObject);
begin
  inherited;
  btnLocalizaEndereco.Enabled    :=  dsBase.DataSet.State in [dsinsert, dsEdit];
end;

function TfCadastroCliente.EnviarEmail(p_destinatario:string):Boolean;
var
 v_SMTP: TIdSMTP;
 v_Message: TIdMessage;
 v_SocketSSL: TIdSSLIOHandlerSocketOpenSSL;
 v_AttachmentFile  : TIdAttachmentFile;
 v_TextPart: TIdText;
 v_ArquivoAnexo: String;
begin

 v_SMTP             := TIdSMTP.Create(nil);
 v_Message          := TIdMessage.Create(nil);
 v_SocketSSL        := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

 with v_SocketSSL do
  begin
   with SSLOptions do
    begin
     Mode   := sslmClient;
     Method := sslvTLSv1_2;
    end;
    Host := c_Host;
    Port := c_Port;
  end;

 with v_SMTP do
  begin
   IOHandler    :=  v_SocketSSL;
   Host         :=  c_Host;
   Port         :=  c_Port;
   AuthType     :=  satDefault;
   Username     :=  c_Username;
   Password     :=  c_Password;
   UseTLS       :=  utUseExplicitTLS;
  end;

 with v_Message do
  begin
   from.Address                 := c_From_Address;
   from.Name                    := 'Coleta de Dados' ;
   Recipients.Add;
   Recipients.Items[0].Address  := p_destinatario;
   Subject                      := 'Dados cadastrais - ' +DateTimeToStr(now);
   ContentType                  := 'multipart/mixed';
  end;


 v_TextPart := TIdText.Create(v_Message.MessageParts, nil);
 with v_TextPart do
   begin
     ContentType := 'text/html; charset=iso-8859-1';
     Body.Add('<html><body>');
     Body.Add('<center><b>Dados do Cliente</b><br></p></center>');
     Body.Add('<b>Nome: </b>'+cdsClientesnome.AsString+'<br>');
     Body.Add('<b>Identidade: </b>'+cdsClientesidentidade.AsString+'<br>');
     Body.Add('<b>CPF: </b>'+cdsClientescpf.AsString+'<br>');
     Body.Add('<b>Telefone: </b>'+cdsClientestelefone.AsString+'<br>');
     Body.Add('<b>E=mail: </b>'+cdsClientesemail.AsString+'<br>');
     Body.Add('<b>Endereço</br></b>');
     Body.Add('<b>CEP: </b>'+cdsClientesendereco_cep.AsString+'<br>');
     Body.Add('<b>Logradouro: </b>'+cdsClientesendereco_logradouro.AsString+'<br>');
     Body.Add('<b>Número: </b>'+cdsClientesendereco_numero.AsString+'<br>');
     Body.Add('<b>Complemento: </b>'+cdsClientesendereco_complemento.AsString+'<br>');
     Body.Add('<b>Bairro: </b>'+cdsClientesendereco_bairro.AsString+'<br>');
     Body.Add('<b>Cidade: </b>'+cdsClientesendereco_cidade.AsString+'<br>');
     Body.Add('<b>Estado: </b>'+cdsClientesendereco_estado.AsString+'<br>');
     Body.Add('<b>Pais: </b>'+cdsClientesendereco_pais.AsString+'<br>');
     Body.Add('</body></html>');
   end;


 v_ArquivoAnexo                        := GetCurrentDir()+'\DadosCadastrais.xml'; // 'C:\Users\euripedes\Documents\Embarcadero\Studio\Projects\Win32\Debug\dados.xml';
 v_AttachmentFile                      :=  TIdAttachmentFile.Create(v_Message.MessageParts,v_ArquivoAnexo);
 v_AttachmentFile.ContentDisposition   := 'attachment';
 v_AttachmentFile.ContentType          :=  'text/xml';
 v_AttachmentFile.FileName             := v_ArquivoAnexo;

 Result := false;

 try
   v_SMTP.Connect;
   v_SMTP.Send(v_Message);
   Result := true;
 Except
   On E : Exception do
     ShowMessage('Erro '+e.Message);
 end;


end;

procedure TfCadastroCliente.SalvaXML;
var
 cdsTemp:TClientDataSet;
 i : Integer;
begin
 // Criando ClientDataSet em tempo de execução para receber apenas o registro corrente
 cdsTemp := TClientDataSet.Create(nil);
 with cdsTemp do
  begin
     FieldDefs := cdsClientes.FieldDefs;
     CreateDataSet;
     Open;
     Insert;
     for i := 0 to FieldCount-1 do
        fields[i].Value := cdsClientes.fields[i].Value;
     Post;
     // Salvando os dados do registro corrente no XML (DadosCadastrais.xml)
     SaveToFile(GetCurrentDir()+'\DadosCadastrais.xml',dfXML);
  end;
 FreeAndNil(cdsTemp);
end;

end.
