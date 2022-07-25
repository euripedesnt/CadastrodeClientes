unit uCadastroBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.DBCtrls;

type
  TfCadastroBase = class(TForm)
    Panel1: TPanel;
    btnSair: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnCadastrar: TBitBtn;
    StatusBar1: TStatusBar;
    dsBase: TDataSource;
    btnEnviaEmail: TBitBtn;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsBaseStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure setReadOnly;
  public
    { Public declarations }
  end;

var
  fCadastroBase: TfCadastroBase;

implementation

{$R *.dfm}

uses uConfiguracoes;

procedure TfCadastroBase.btnCancelarClick(Sender: TObject);
begin
  if dsBase.DataSet <> nil then
    dsBase.DataSet.Cancel;
end;

procedure TfCadastroBase.btnEditarClick(Sender: TObject);
begin
  if dsBase.DataSet <> nil then
    dsBase.DataSet.Edit;
end;

procedure TfCadastroBase.btnSalvarClick(Sender: TObject);
begin
  if dsBase.DataSet <> nil then
    dsBase.DataSet.Post;
end;

procedure TfCadastroBase.dsBaseStateChange(Sender: TObject);
begin
  with dsBase do
   begin
    btnCadastrar.Enabled    :=  DataSet.State in [dsBrowse];
    btnEditar.Enabled       :=  (DataSet.State in [dsBrowse]) and (DataSet.RecordCount>0);
    btnSalvar.Enabled       :=  DataSet.State in [dsinsert, dsEdit];
    btnCancelar.Enabled     :=  DataSet.State in [dsinsert, dsEdit];
    btnEnviaEmail.Enabled   :=  (DataSet.State in [dsBrowse]) and (DataSet.RecordCount>0);
  end;

end;

procedure TfCadastroBase.FormCreate(Sender: TObject);
begin
  if dsBase.DataSet<>nil then
    begin
      if (dsBase.DataSet is TClientDataSet) then
        (dsBase.DataSet as TClientDataSet).CreateDataSet;
      (dsBase.DataSet as TClientDataSet).Open;
    end;

  setReadOnly;
end;

procedure TfCadastroBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfCadastroBase.setReadOnly;
var
 i:integer;
begin
  for  i:=  0 to ComponentCount-1 do
    begin
        if (Components[i]).Tag=1 then
          begin
             if (Components[i] is TLabel) then
               (Components[i] as TLabel).Enabled := false;
             if (Components[i] is TDBEdit) then
               (Components[i] as TDBEdit).Enabled := false;
          end;
    end;

end;

procedure TfCadastroBase.btnCadastrarClick(Sender: TObject);
begin
  if dsBase.DataSet <> nil then
    dsBase.DataSet.Insert;
end;

end.
