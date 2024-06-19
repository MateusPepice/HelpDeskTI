unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    btn_entrar: TSpeedButton;
    btn_cadastro: TSpeedButton;
    Label1: TLabel;
    procedure btn_entrarClick(Sender: TObject);
    procedure btn_cadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses uLogin;

procedure TForm1.btn_cadastroClick(Sender: TObject);
begin
  Form2.Show;
  Form2.TabControl1.TabIndex := 1;
end;

procedure TForm1.btn_entrarClick(Sender: TObject);
begin
  Form2.Show;
  Form2.TabControl1.TabIndex := 0;
end;

end.
