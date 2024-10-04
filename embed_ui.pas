unit embed_ui;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Imaging.pngimage, embed_api;

type
  TEmbedUi = class(TForm)
    BtnDebito: TButton;
    BtnCredito: TButton;
    BtnCancelar: TButton;
    ImgEmbed: TImage;
    procedure BtnDebitoClick(Sender: TObject);
    procedure BtnCreditoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure ShowStatus(Status: string);
  private
    { Private declarations }
    api: TEmbedApi;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  EmbedUi: TEmbedUi;

implementation

{$R *.dfm}

constructor TEmbedUi.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  api := TEmbedApi.Create;
  api.Configurar;
end;

procedure TEmbedUi.BtnDebitoClick(Sender: TObject);
var
  ValorStr, Output: string;
begin
  ValorStr := InputBox('Débito', 'Digite o valor (em centavos):', '');
  api.Iniciar();
  ShowStatus('[TEF] Iniciado');
  Output := api.Debito(ValorStr);
  if Output = '1' then
  begin
    ShowStatus('[TEF] Débito');
    while Output = '1' do
    begin
      Output := api.GetStatus;
      if Output = '0' then
        ShowStatus('[TEF] Autorizado')
      else if Output = '-1' then
        ShowStatus('[TEF] Falha no processamento')
      else
        ShowStatus('[TEF] Processando');
    end;
    Output := api.Finalizar('1');
    if Output = '0' then
        ShowStatus('[TEF] Finalizado')
    else
      ShowStatus('[TEF] Falha na confirmação');
  end
  else
  begin
    ShowStatus('[TEF] Falha ao iniciar pagamento');
  end;
end;

procedure TEmbedUi.BtnCreditoClick(Sender: TObject);
var
  ValorStr, ParcelasStr, FinanciamentoStr, Output: string;
begin
  ValorStr := InputBox('Crédito', 'Digite o valor (em centavos):', '');
  ParcelasStr := InputBox('Crédito', 'Digite a quantidade de parcelas (1 a 99):', '');
  FinanciamentoStr := InputBox('Crédito', 'Digite o financiamento (0 - a vista; 1 - loja; 2 - adm):', '');
  api.Iniciar();
  ShowStatus('[TEF] Iniciado');
  Output := api.Credito(ValorStr, ParcelasStr, FinanciamentoStr);
  if Output = '1' then
  begin
    ShowStatus('[TEF] Crédito');
    while Output = '1' do
    begin
      Output := api.GetStatus;
      if Output = '0' then
        ShowStatus('[TEF] Autorizado')
      else if Output = '-1' then
        ShowStatus('[TEF] Falha no processamento')
      else
        ShowStatus('[TEF] Processando');
    end;
    Output := api.Finalizar('1');
    if Output = '0' then
        ShowStatus('[TEF] Finalizado')
    else
      ShowStatus('[TEF] Falha na confirmação');
  end
  else
  begin
    ShowStatus('[TEF] Falha ao iniciar pagamento');
  end;
end;

procedure TEmbedUi.BtnCancelarClick(Sender: TObject);
var
  ValorStr, DataStr, NsuStr, Output: string;
begin
  ValorStr := InputBox('Cancelamento', 'Digite o valor (em centavos):', '');
  DataStr := InputBox('Cancelamento', 'Digite a data da transação (DDMMAAAA):', '');
  NsuStr := InputBox('Cancelamento', 'Digite o NSU da transação (igual o comprovante):', '');
  api.Iniciar();
  ShowStatus('[TEF] Iniciado');
  Output := api.Cancelar(ValorStr, DataStr, NsuStr);
  if Output = '1' then
  begin
    ShowStatus('[TEF] Cancelar');
    while Output = '1' do
    begin
      Output := api.GetStatus;
      if Output = '0' then
        ShowStatus('[TEF] Autorizado')
      else if Output = '-1' then
        ShowStatus('[TEF] Falha no processamento')
      else
        ShowStatus('[TEF] Processando');
    end;
    Output := api.Finalizar('1');
    if Output = '0' then
        ShowStatus('[TEF] Finalizado')
    else
      ShowStatus('[TEF] Falha na confirmação');
  end
  else
  begin
    ShowStatus('[TEF] Falha ao iniciar pagamento');
  end;
end;

procedure TEmbedUi.ShowStatus(Status: string);
begin
  ShowMessage(Status);
end;

end.
