unit uLogin;

interface

uses
  Global,

  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCadastro = record
      ID : Integer;
      Nome, RA, Email, Senha : String;
      Tecnico : boolean;
  end;


  TForm2 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Layout1: TLayout;
    Panel1: TPanel;
    edt_ent_email: TEdit;
    edt_ent_senha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Layout2: TLayout;
    Panel2: TPanel;
    edt_cd_email: TEdit;
    btn_cadastro_fn: TSpeedButton;
    edt_cd_senha: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_cd_ra: TEdit;
    Label6: TLabel;
    edt_cd_nome: TEdit;
    Layout3: TLayout;
    SpeedButton3: TSpeedButton;
    Label7: TLabel;
    Layout4: TLayout;
    SpeedButton4: TSpeedButton;
    Label8: TLabel;
    btn_entrar_fn: TSpeedButton;
    FDConnection1: TFDConnection;
    FDQUsuario: TFDQuery;
    FDQLogin: TFDQuery;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btn_cadastro_fnClick(Sender: TObject);
    procedure btn_entrar_fnClick(Sender: TObject);
  private
    procedure inserUsuarioNoBanco(usuario: TCadastro);
    function VerificarEmailCadastrado(email: string): Boolean;
    function VerificarSenhaCorreta(email, senha: string; out UserID: Integer): Boolean;
    function VerificarSeUsuarioETecnico(email: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses uPrincipal, uCliente, uTecnico;


/////////////Inserir Usuario ///////////////////////////
procedure TForm2.inserUsuarioNoBanco(usuario: TCadastro);
var UserID: Integer;
begin

  //Inserir na tabela usuario
  FDQUsuario.Close;
  FDQUsuario.SQL.Clear;
  FDQUsuario.SQL.Add('INSERT INTO USUARIO (NOME, RA, EMAIL, TECNICO)');
  FDQUsuario.SQL.Add(' VALUES (:NOME, :RA, :EMAIL, :TECNICO)');
  FDQUsuario.ParamByName('NOME').AsString := usuario.Nome;
  FDQUsuario.ParamByName('RA').AsString := usuario.RA ;
  FDQUsuario.ParamByName('EMAIL').AsString := usuario.Email ;
  FDQUsuario.ParamByName('TECNICO').AsInteger := 0 ;

  FDQUsuario.ExecSQL;

  // Obter o ID do usuário recém-inserido
  FDQUsuario.SQL.Text := 'SELECT last_insert_rowid()';
  FDQUsuario.Open;
  UserID := FDQUsuario.Fields[0].AsInteger;
  FDQUsuario.Close;
  // Inserir na tabela login
  FDQLogin.Close;
  FDQLogin.SQL.Clear;
  FDQLogin.SQL.Add('INSERT INTO LOGIN (USERID, SENHA)');
  FDQLogin.SQL.Add(' VALUES (:USERID, :SENHA)');
  FDQLogin.ParamByName('USERID').AsInteger := UserID;
  FDQLogin.ParamByName('SENHA').AsString := usuario.Senha;
  FDQLogin.ExecSQL;

end;
/////////////Inserir Usuario Fim ///////////////////////////



procedure TForm2.btn_cadastro_fnClick(Sender: TObject);
var vCadastro : TCadastro;
begin

  vCadastro.Nome := edt_cd_nome.Text;
  vCadastro.RA := edt_cd_ra.Text;
  vCadastro.Email := edt_cd_email.Text;
  vCadastro.Senha := edt_cd_senha.Text;
  vCadastro.Tecnico := False;

  //Chamar procedimento para inserir o cliente no banco
  inserUsuarioNoBanco(vCadastro);

  //Jogar para a tela de entrada
  Form2.TabControl1.TabIndex := 0;

end;


/////////////////Verificar se email existe////////////////////////////
function TForm2.VerificarEmailCadastrado(email: string): Boolean;
begin
  FDQUsuario.Close;
  FDQUsuario.SQL.Clear;
  FDQUsuario.SQL.Add('SELECT COUNT(*) AS Total FROM Usuario WHERE UPPER(Email) = UPPER(:Email)');
  FDQUsuario.ParamByName('Email').AsString := email;
  FDQUsuario.Open;

  Result := FDQUsuario.FieldByName('Total').AsInteger > 0;

  FDQUsuario.Close;
end;
/////////////////Verificar se email existe Fim///////////////////////////


////////////////Verificar se senha esta correta/////////////////////////
function TForm2.VerificarSenhaCorreta(email, senha: string; out UserID: Integer): Boolean;
var
  StoredSenha: string;
begin
  Result := False;
  UserID := -1; // Inicializa com um valor inválido

  // Obter o ID do usuário com base no email
  FDQUsuario.Close;
  FDQUsuario.SQL.Clear;
  FDQUsuario.SQL.Add('SELECT ID FROM Usuario WHERE UPPER(Email) = UPPER(:Email)');
  FDQUsuario.ParamByName('Email').AsString := email;
  FDQUsuario.Open;

  if not FDQUsuario.IsEmpty then
  begin
    UserID := FDQUsuario.FieldByName('ID').AsInteger;
    FDQUsuario.Close;

    // Verificar a senha com base no UserID
    FDQLogin.Close;
    FDQLogin.SQL.Clear;
    FDQLogin.SQL.Add('SELECT Senha FROM Login WHERE UserID = :UserID');
    FDQLogin.ParamByName('UserID').AsInteger := UserID;
    FDQLogin.Open;

    if not FDQLogin.IsEmpty then
    begin
      StoredSenha := FDQLogin.FieldByName('Senha').AsString;

      // Verificar se a senha fornecida corresponde à senha armazenada
      if StoredSenha = senha then
        Result := True;
    end;

    FDQLogin.Close;
  end;
end;


////////////////Verificar se senha esta correta Fim/////////////////////////


///////////////Verifica se o usuario é tecnico//////////////////////////////
function TForm2.VerificarSeUsuarioETecnico(email: string): Boolean;
begin
  Result := False;
  FDQUsuario.Close;
  FDQUsuario.SQL.Clear;
  FDQUsuario.SQL.Add('SELECT Tecnico FROM Usuario WHERE UPPER(Email) = UPPER(:Email)');
  FDQUsuario.ParamByName('Email').AsString := email;
  FDQUsuario.Open;
  if not FDQUsuario.IsEmpty then
  begin
    Result := FDQUsuario.FieldByName('Tecnico').AsInteger = 1;
  end;
  FDQUsuario.Close;
end;
///////////////Verifica se o usuario é tecnicoc Fim//////////////////////////////


/////////////Entrar no sistema//////////////////////////
procedure TForm2.btn_entrar_fnClick(Sender: TObject);
var
  email, senha: string;
  UserID: Integer;
begin
  email := edt_ent_email.Text;
  senha := edt_ent_senha.Text;

  // Verificar se o email está cadastrado
  if not VerificarEmailCadastrado(email) then
  begin
    ShowMessage('Email não cadastrado.');
    Exit;
  end;

   // Verificar se a senha está correta
  if not VerificarSenhaCorreta(email, senha, UserID) then
  begin
    ShowMessage('Senha incorreta.');
    edt_ent_senha.Text := ''; // Limpar o campo de senha
    Exit;
  end;
  // Armazenar o ID do usuário na variável global
  CurrentUserID := UserID;

  // Verificar se o usuário é técnico
  if VerificarSeUsuarioETecnico(email) then
  begin
    Form4.Show;
    Form4.TabControl1.TabIndex := 0;
  end
  else
  begin
    // Redirecionar para a tela de usuário comum
    Form3.Show;
    Form3.TabControl1.TabIndex := 0;
  end;
end;
/////////////Entrar no sistema Fim//////////////////////////



procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  Form1.show;

end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin

  Form1.show;

end;

end.
