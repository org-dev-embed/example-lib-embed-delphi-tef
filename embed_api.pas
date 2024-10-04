unit embed_api;

interface

uses
  SysUtils, Classes, embed_lib;

type
  TEmbedApi = class
  private
    { Private declarations }
    lib: TEmbedLib;
    const
      STATUS_CODE = 'resultado.status_code';
  public
    constructor Create;
    destructor Destroy;
    function Configurar: string;
    function Iniciar: string;
    function Debito(Valor: string): string;
    function Credito(Valor: string; Parcelas: string; Financiamento: string): string;
    function Cancelar(Valor: string; Data: string; NSU: string): string;
    function GetStatus: string;
    function Finalizar(Valor: string): string;
  end;

implementation

constructor TEmbedApi.Create;
begin
  lib := TEmbedLib.Create('lib-embed-x86.dll');
  inherited Create;
end;

destructor TEmbedApi.Destroy;
begin
  lib.Free;
end;

function TEmbedApi.Configurar: string;
begin
  var Produto := 'tef';
  var SubProduto := '1';
  var Timeout := '300';
  var CodigoAtivacao := '476333913';  // informação fornecida pelo time de integração
  var NomeApp := 'ogj13 ldta';        // informação da AC
  var VersaoApp := '1.0.0';           // informação da AC
  var TextoPinpad := 'ogj13';        // informação da AC
  var Input := Produto + ';'
            + SubProduto + ';'
            + Timeout + ';'
            + CodigoAtivacao + ';'
            + NomeApp + ';'
            + VersaoApp + ';'
            + TextoPinpad;
  var Output := lib.Configurar(Input);
end;

function TEmbedApi.Iniciar: string;
begin
  var Operacao := 'tef';
  var Output := lib.Iniciar(Operacao);
  Result := lib.ObterValor(Output, STATUS_CODE);
end;

function TEmbedApi.Debito(Valor: string): string;
begin
  var Operacao := 'debito';
  var Input := Operacao + ';' + Valor;
  var Output := lib.Processar(Input);
  Result := lib.ObterValor(Output, STATUS_CODE);
end;

function TEmbedApi.Credito(Valor: string; Parcelas: string; Financiamento: string): string;
begin
  var Operacao := 'credito';
  var Input := Operacao + ';'
            + Valor + ';'
            + Parcelas + ';'
            + Financiamento;
  var Output := lib.Processar(Input);
  Result := lib.ObterValor(Output, STATUS_CODE);
end;

function TEmbedApi.Cancelar(Valor: string; Data: string; NSU: string): string;
begin
  var Operacao := 'cancelar';
  var Input := Operacao + ';'
            + Valor + ';'
            + Data + ';'
            + NSU;
  var Output := lib.Processar(Input);
  Result := lib.ObterValor(Output, STATUS_CODE);
end;

function TEmbedApi.GetStatus: string;
begin
  var Operacao := 'get_status';
  var Output := lib.Processar(Operacao);
  Result := lib.ObterValor(Output, STATUS_CODE);
end;

function TEmbedApi.Finalizar(Valor: string): string;
begin
  var Operacao := 'confirmar';
  var Input := Operacao + ';'
            + Valor;
  var Output := lib.Finalizar(Input);
  Result := lib.ObterValor(Output, STATUS_CODE);
end;

end.

