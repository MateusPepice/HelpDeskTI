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
    function ValidarRA(const RA: string): Boolean;
    function ValidarNome(const Nome: string): Boolean;
    function ValidarEmail(const Email: string): Boolean;
    function ValidarSenha(const Senha: string): Boolean;
    function VerificarRACadastrado(RA: string): Boolean;
    function ObterTipoUsuario(email: string): Integer;


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
var
  vCadastro: TCadastro;
begin
  vCadastro.Nome := edt_cd_nome.Text;
  vCadastro.RA := edt_cd_ra.Text;
  vCadastro.Email := edt_cd_email.Text;
  vCadastro.Senha := edt_cd_senha.Text;
  vCadastro.Tecnico := False;

  // Validar os campos antes de inserir no banco
  if not ValidarNome(vCadastro.Nome) then
  begin
    ShowMessage('Nome inválido. Por favor, insira um nome válido.');
    Exit;
  end;

  if not ValidarRA(vCadastro.RA) then
  begin
    ShowMessage('RA inválido. O RA deve ser uma sequência numérica de 6 dígitos.');
    Exit;
  end;

  if not ValidarEmail(vCadastro.Email) then
  begin
    ShowMessage('E-mail inválido. Por favor, insira um e-mail válido.');
    Exit;
  end;

  if not ValidarSenha(vCadastro.Senha) then
  begin
    ShowMessage('Senha inválida. A senha deve ter pelo menos 8 caracteres, incluindo letras maiúsculas, letras minúsculas e números.');
    Exit;
  end;

  // Verificar se o RA já existe no banco de dados
  if VerificarRACadastrado(vCadastro.RA) then
  begin
    ShowMessage('O RA informado já está cadastrado. Por favor, insira um RA diferente.');
    Exit;
  end;

  // Verificar se o Email já existe no banco de dados
  if VerificarEmailCadastrado(vCadastro.Email) then
  begin
    ShowMessage('O e-mail informado já está cadastrado. Por favor, insira um e-mail diferente.');
    Exit;
  end;

  // Chamar procedimento para inserir o cliente no banco
  inserUsuarioNoBanco(vCadastro);

  // Jogar para a tela de entrada
  Form2.TabControl1.TabIndex := 0;
end;


//////////////////Validar dados de entrada do cadastro/////////////////
function TForm2.ValidarRA(const RA: string): Boolean;
var
  I: Integer;
begin
  Result := (Length(RA) = 6);
  if Result then
  begin
    for I := 1 to Length(RA) do
    begin
      if not CharInSet(RA[I], ['0'..'9']) then
      begin
        Result := False;
        Break;
      end;
    end;
  end;
end;

function TForm2.ValidarNome(const Nome: string): Boolean;
var
  I: Integer;
begin
  Result := (Length(Nome) > 0);
  if Result then
  begin
    for I := 1 to Length(Nome) do
    begin
      if not CharInSet(Nome[I], ['A'..'Z', 'a'..'z', ' ']) then
      begin
        Result := False;
        Break;
      end;
    end;
  end;
end;

function TForm2.ValidarEmail(const Email: string): Boolean;
begin
  // Simples validação de email
  Result := Pos('@', Email) > 1;
end;

function TForm2.ValidarSenha(const Senha: string): Boolean;
var
  TemMaiuscula, TemMinuscula, TemNumero: Boolean;
  I: Integer;
begin
  TemMaiuscula := False;
  TemMinuscula := False;
  TemNumero := False;

  if Length(Senha) >= 8 then
  begin
    for I := 1 to Length(Senha) do
    begin
      if CharInSet(Senha[I], ['A'..'Z']) then TemMaiuscula := True;
      if CharInSet(Senha[I], ['a'..'z']) then TemMinuscula := True;
      if CharInSet(Senha[I], ['0'..'9']) then TemNumero := True;
    end;
  end;

  Result := TemMaiuscula and TemMinuscula and TemNumero;
end;


/////////////////Verificar se RA existe////////////////////////////
function TForm2.VerificarRACadastrado(RA: string): Boolean;
begin
  FDQUsuario.Close;
  FDQUsuario.SQL.Clear;
  FDQUsuario.SQL.Add('SELECT COUNT(*) AS Total FROM Usuario WHERE RA = :RA');
  FDQUsuario.ParamByName('RA').AsString := RA;
  FDQUsuario.Open;

  Result := FDQUsuario.FieldByName('Total').AsInteger > 0;

  FDQUsuario.Close;
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


function TForm2.VerificarSeUsuarioETecnico(email: string): Boolean;
begin

end;

///////////////Verifica se o usuario é tecnico//////////////////////////////
function TForm2.ObterTipoUsuario(email: string): Integer;
begin
  Result := -1; // -1 indica que o usuário não foi encontrado
  FDQUsuario.Close;
  FDQUsuario.SQL.Clear;
  FDQUsuario.SQL.Add('SELECT Tecnico FROM Usuario WHERE UPPER(Email) = UPPER(:Email)');
  FDQUsuario.ParamByName('Email').AsString := email;
  FDQUsuario.Open;
  if not FDQUsuario.IsEmpty then
  begin
    Result := FDQUsuario.FieldByName('Tecnico').AsInteger;
  end;
  FDQUsuario.Close;
end;



/////////////Entrar no sistema//////////////////////////
procedure TForm2.btn_entrar_fnClick(Sender: TObject);
var
  email, senha: string;
  UserID: Integer;
  UserTipo: Integer;
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

  // Obter o tipo de usuário
  UserTipo := ObterTipoUsuario(email);

  if (UserTipo = 1) or (UserTipo = 2) then
  begin
    // Redirecionar para a tela de técnico
    Form4.Show;
    Form4.TabControl1.TabIndex := 0;
  end
  else if UserTipo = 0 then
  begin
    // Redirecionar para a tela de usuário comum
    Form3.Show;
    Form3.TabControl1.TabIndex := 0;
  end
  else
  begin
    ShowMessage('Tipo de usuário desconhecido.');
    Exit;
  end;
end;




procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  Form1.show;

end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin

  Form1.show;

end;

end.
