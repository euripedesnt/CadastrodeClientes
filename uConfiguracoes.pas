unit uConfiguracoes;

interface

uses
  SysUtils;

const
    c_Host             = 'smtp.gmail.com';
    c_Port             =  587;
    c_Username         = 'coletadadoscadastrais@gmail.com';
    c_Password         = 'lvvarqhpjeiwbejo';
    c_From_Address     = 'coletadadoscadastrais@gmail.com';
    c_From_Name        = 'Coleta de Dados';

function  validaEmail(email:String):Boolean;

implementation

function  validaEmail(email:String):Boolean;
 begin
  email := Trim(UpperCase(email));
  if Pos('@', email) > 1 then
    begin
     Delete(email, 1, pos('@', email));
     Result := (Length(email) > 0) and (Pos('.', email) > 2);
    end
  else
    Result := False;
 end;



end.
