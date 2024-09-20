unit libEmbed;

interface

uses
  Windows, SysUtils;

type
  TConfigSetup = function(Input: PAnsiChar): PAnsiChar; stdcall;

procedure LoadLibraryAndSetup;
 var
 ConfigSetup: TConfigSetup;

implementation

var
  hLib: HMODULE;


procedure LoadLibraryAndSetup;
begin
  hLib := LoadLibrary('lib-embed-x86.dll');  // Ajuste para o nome correto da DLL
  if hLib = 0 then
    raise Exception.Create('Erro ao carregar a DLL');

  @ConfigSetup := GetProcAddress(hLib, 'embed_configurar'); // Verifique se o nome está correto
  if not Assigned(ConfigSetup) then
  begin
    FreeLibrary(hLib);
    raise Exception.Create('Erro ao localizar a função embed_configurar');
  end;
end;

initialization
  LoadLibraryAndSetup;

finalization
  if hLib <> 0 then
    FreeLibrary(hLib);

end.

