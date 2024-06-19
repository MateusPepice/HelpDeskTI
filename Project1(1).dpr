program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uLogin in 'uLogin.pas' {Form2},
  uCliente in 'uCliente.pas' {Form3},
  uTecnico in 'uTecnico.pas' {Form4},
  Global in 'Global.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
