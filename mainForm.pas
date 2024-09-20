unit mainForm;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, IniFiles,

type
  TForm1 = class(TForm)
    ConfigButton: TButton;
    debitButton: TButton;
    creditButton: TButton;
    confirmButton: TButton;
    undoButton: TButton;
    cancelButton: TButton;
    abortButton: TButton;
    logsMemo: TMemo;
    procedure ConfigButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure LogMessage(const Msg: string);
    function ConfigureProduct: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ConfigButtonClick(Sender: TObject);
var
  ResultMessage: string;
begin
  try
    ResultMessage := ConfigureProduct;
    LogMessage('Configuração realizada com sucesso: ' + ResultMessage);
  except
    on E: Exception do
      LogMessage('Erro ao configurar: ' + E.Message);
  end;
end;

procedure TForm1.LogMessage(const Msg: string);
begin
  logsMemo.Lines.Add(Msg);
end;

function TForm1.ConfigureProduct: string;
var
  InputString: AnsiString;
  ResultString: PAnsiChar;
  JSON: TJSONObject;
begin
  // Criação do JSON conforme o exemplo do Python
  JSON := TJSONObject.Create;
  try
    JSON.AddPair('produto', 'tef');
    JSON.AddPair('sub_produto', TJSONNumber.Create(1));
    JSON.AddPair('timeout', TJSONNumber.Create(300));
    JSON.AddPair('codigo_ativacao', '');
    JSON.AddPair('token_autorizacao', 'mk_kNv5ot7QU0KjGWXn6OZEQ');
    JSON.AddPair('nome_app', 'NomeDoApp');
    JSON.AddPair('versao_app', '1.0.0');
    JSON.AddPair('texto_pinpad', 'Texto do Pinpad');
    InputString := AnsiString(JSON.ToString);
    ResultString := ConfigSetup(PAnsiChar(InputString));

    if ResultString <> nil then
      Result := string(ResultString)
    else
      Result := 'Erro: Função retornou resultado nulo.';
  finally
    JSON.Free;
  end;
end;

end.

