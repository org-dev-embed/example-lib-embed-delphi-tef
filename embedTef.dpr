program embedTef;

uses
  Vcl.Forms,
  mainForm in 'mainForm.pas' {Form1},
  libEmbed in 'libEmbed.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
