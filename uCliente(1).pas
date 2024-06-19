unit uCliente;

interface

uses
  Global,

  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.TabControl, FMX.ListBox, FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Dialogs, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TUsuario = record
    ID: Integer;
    Nome: string;
    RA: string;
    Email: string;
  end;

  TChamado = record
    ID_Chamado, IdUsuario : Integer;
    RA, Autor, Titulo, Descricao, Data_ini, Data_fin, tecnico, situacao : string;
  end;


  TForm3 = class(TForm)
    Layout2: TLayout;
    Layout1: TLayout;
    btn_volta_login: TSpeedButton;
    Label8: TLabel;
    btn_chamados: TSpeedButton;
    btn_historico: TSpeedButton;
    btn_logout: TSpeedButton;
    btn_usuario: TSpeedButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Layout3: TLayout;
    btn_volta_menu: TSpeedButton;
    Label1: TLabel;
    btn_menu1: TSpeedButton;
    Layout4: TLayout;
    ListView1: TListView;
    btn_novo_chamado: TSpeedButton;
    TabControl2: TTabControl;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    Layout5: TLayout;
    btn_volta_chamado: TSpeedButton;
    Label2: TLabel;
    btn_menu2: TSpeedButton;
    Layout6: TLayout;
    Panel1: TPanel;
    lbnNumChamado: TLabel;
    edt_chamado_ra: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edt_chamado_autor: TEdit;
    Label5: TLabel;
    edt_chamado_titulo: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edt_chamado_data: TEdit;
    Label9: TLabel;
    edt_chamado_tecnico: TEdit;
    Label10: TLabel;
    cb_chamado_situacao: TComboBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    btn_salvar_chamado: TSpeedButton;
    btn_cancelar_chamado: TSpeedButton;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    Layout8: TLayout;
    btn_volta_menu3: TSpeedButton;
    Label12: TLabel;
    btn_menu4: TSpeedButton;
    Layout9: TLayout;
    Panel2: TPanel;
    Label13: TLabel;
    edt_us_ra: TEdit;
    Label14: TLabel;
    edt_us_nome: TEdit;
    Label15: TLabel;
    edt_us_email: TEdit;
    btn_Us_Atualizar: TSpeedButton;
    btn_Us_Cancelar: TSpeedButton;
    FDConnection1: TFDConnection;
    FDQUsuario: TFDQuery;
    FDQLogin: TFDQuery;
    FDQChamado: TFDQuery;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    TabItem7: TTabItem;
    Layout10: TLayout;
    SpeedButton1: TSpeedButton;
    Label20: TLabel;
    btn_voltar_menu: TSpeedButton;
    Layout11: TLayout;
    Panel3: TPanel;
    lbl_vw_nchamado: TLabel;
    edt_vw_ra: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    edt_vw_autor: TEdit;
    Label24: TLabel;
    edt_vw_titulo: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    edt_vw_data: TEdit;
    Label27: TLabel;
    edt_vw_situacao: TEdit;
    Label28: TLabel;
    edt_vw_tecnico: TEdit;
    edt_vw_descricao: TMemo;
    edt_chamado_descricao: TMemo;
    TabControl3: TTabControl;
    TabItem8: TTabItem;
    TabItem9: TTabItem;
    Label21: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Layout7: TLayout;
    btn_volta_menu2: TSpeedButton;
    Label11: TLabel;
    btn_menu3: TSpeedButton;
    ListView2: TListView;
    Layout12: TLayout;
    btn_voltar_historico_vw: TSpeedButton;
    Label32: TLabel;
    btn_menu_historico_vw: TSpeedButton;
    Layout13: TLayout;
    Panel4: TPanel;
    edt_historico_vw_nchamado: TLabel;
    edt_historico_vw_ra: TEdit;
    Label34: TLabel;
    Label35: TLabel;
    edt_historico_vw_autor: TEdit;
    Label36: TLabel;
    edt_historico_vw_titulo: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    edt_historico_vw_data: TEdit;
    Label39: TLabel;
    edt_historico_vw_situacao: TEdit;
    Label40: TLabel;
    edt_historico_vw_tecnico: TEdit;
    edt_historico_vw_descricao: TMemo;
    procedure btn_chamadosClick(Sender: TObject);
    procedure btn_volta_loginClick(Sender: TObject);
    procedure btn_volta_chamadoClick(Sender: TObject);
    procedure btn_menu2Click(Sender: TObject);
    procedure btn_novo_chamadoClick(Sender: TObject);
    procedure btn_volta_menuClick(Sender: TObject);
    procedure btn_menu1Click(Sender: TObject);
    procedure btn_volta_menu2Click(Sender: TObject);
    procedure btn_menu3Click(Sender: TObject);
    procedure btn_historicoClick(Sender: TObject);
    procedure btn_logoutClick(Sender: TObject);
    procedure btn_usuarioClick(Sender: TObject);
    procedure btn_Us_AtualizarClick(Sender: TObject);
    procedure btn_Us_CancelarClick(Sender: TObject);
    procedure btn_salvar_chamadoClick(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_voltar_menuClick(Sender: TObject);
    procedure btn_voltar_historico_vwClick(Sender: TObject);
    procedure btn_menu_historico_vwClick(Sender: TObject);
    procedure ListView2ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    function BuscarUsuarioNoBanco(id_usuario: Integer): TUsuario;
    procedure PreencherCamposUsuario;
    procedure AtualizarUsuario(id_usuario: Integer; novoNome, novoRA,
      novoEmail: string);
    procedure PreencherCamposChamado;
    procedure InserirChamadoNoBanco(RA, Autor, Titulo, Descricao, Data_ini,
      Tecnico, Situacao: string);
    procedure LimparCamposChamado;
    procedure buscarChamadosUsuario;
    procedure insereChamadoNaLista(chamado: TChamado);
    function buscarChamadoNoBanco(idChamado: Integer): TChamado;
    procedure PreencherCamposChamadoView(chamado: TChamado);
    procedure buscarChamadosAbertos;
    procedure insereChamadoNaListaHistorico(chamado: TChamado);
    procedure PreencherCamposHistoricoView(chamado: TChamado);
    { Private declarations }
  public
    { Public declarations }
    idChamado : Integer;

  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

uses uLogin, uPrincipal;


//////////////Botões (voltar, acessar menu, mudar tala////////////////
procedure TForm3.btn_chamadosClick(Sender: TObject);
begin
  Form3.TabControl1.TabIndex := 1;
  Form3.TabControl2.TabIndex := 0;
  // Chamar metodo de consulta no banco de dados

  buscarChamadosAbertos;

end;

procedure TForm3.btn_historicoClick(Sender: TObject);
begin
  Form3.TabControl1.TabIndex := 2;
  Form3.TabControl3.TabIndex := 0;

  buscarChamadosUsuario;

end;

procedure TForm3.btn_logoutClick(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm3.btn_menu3Click(Sender: TObject);
begin
  Form3.TabControl1.TabIndex :=0;
end;

procedure TForm3.btn_menu_historico_vwClick(Sender: TObject);
begin
  Form3.TabControl1.TabIndex :=0;
end;

procedure TForm3.btn_volta_menuClick(Sender: TObject);
begin
  Form3.TabControl1.TabIndex :=0;
end;


procedure TForm3.btn_menu1Click(Sender: TObject);
begin
  Form3.TabControl1.TabIndex :=0;
end;

procedure TForm3.btn_novo_chamadoClick(Sender: TObject);
begin
  Form3.TabControl2.TabIndex := 1;
  PreencherCamposChamado;
end;

procedure TForm3.btn_Us_CancelarClick(Sender: TObject);
begin
  Form3.TabControl1.TabIndex :=0;
end;

procedure TForm3.btn_salvar_chamadoClick(Sender: TObject);
var
  situacao: String;
begin
  situacao := 'Aberto';
  InserirChamadoNoBanco(
    edt_chamado_ra.Text,
    edt_chamado_autor.Text,
    edt_chamado_titulo.Text,
    edt_chamado_descricao.Text,
    edt_chamado_data.Text,
    edt_chamado_tecnico.Text,
    situacao
  );
  buscarChamadosAbertos;
  Form3.TabControl2.TabIndex :=0;
end;

procedure TForm3.btn_usuarioClick(Sender: TObject);
begin
  Form3.TabControl1.TabIndex := 3;
  PreencherCamposUsuario;
end;

procedure TForm3.btn_Us_AtualizarClick(Sender: TObject);
begin
  AtualizarUsuario(CurrentUserID, edt_us_nome.Text, edt_us_ra.Text, edt_us_email.Text);
  PreencherCamposUsuario;
end;

procedure TForm3.btn_volta_loginClick(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm3.btn_voltar_historico_vwClick(Sender: TObject);
begin
  Form3.TabControl3.TabIndex := 0;
end;

procedure TForm3.btn_volta_chamadoClick(Sender: TObject);
begin
  Form3.TabControl2.TabIndex :=0;
end;

procedure TForm3.btn_menu2Click(Sender: TObject);
begin
  Form3.TabControl1.TabIndex :=0;
end;

procedure TForm3.btn_volta_menu2Click(Sender: TObject);
begin
  Form3.TabControl1.TabIndex :=0;
end;




///////////////////////Funções e procedures///////////////////////////

function TForm3.BuscarUsuarioNoBanco(id_usuario: Integer): TUsuario;
var
  vUsuario: TUsuario;
  //Inseri na tela usuario as informações do usuario logado
begin
  FDQUsuario.Close;
  FDQUsuario.SQL.Clear;
  FDQUsuario.SQL.Add('SELECT * FROM Usuario WHERE ID = :ID');
  FDQUsuario.ParamByName('ID').AsInteger := id_usuario;
  FDQUsuario.Open;
  if not FDQUsuario.IsEmpty then
  begin
    vUsuario.ID := id_usuario;
    vUsuario.Nome := FDQUsuario.FieldByName('Nome').AsString;
    vUsuario.RA := FDQUsuario.FieldByName('RA').AsString;
    vUsuario.Email := FDQUsuario.FieldByName('Email').AsString;
  end;
  Result := vUsuario;
end;



procedure TForm3.PreencherCamposUsuario;
var
  vUsuario: TUsuario;
  //Preenche tela de usuario com as informações do usuario logado
begin
  vUsuario := BuscarUsuarioNoBanco(CurrentUserID);
  edt_us_nome.Text := vUsuario.Nome;
  edt_us_ra.Text := vUsuario.RA;
  edt_us_email.Text := vUsuario.Email;
end;




procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  Form3.TabControl2.TabIndex :=0;
end;

procedure TForm3.btn_voltar_menuClick(Sender: TObject);
begin
  Form3.TabControl1.TabIndex :=0;
end;

procedure TForm3.PreencherCamposChamado;
var
  vUsuario: TUsuario;
begin
  vUsuario := BuscarUsuarioNoBanco(CurrentUserID);
  edt_chamado_autor.Text := vUsuario.Nome;
  edt_chamado_ra.Text := vUsuario.RA;
  cb_chamado_situacao.ItemIndex := 0;
  edt_chamado_tecnico.Text := 'Nenhum';
  edt_chamado_data.Text := DateToStr(Date);
end;






procedure TForm3.AtualizarUsuario(id_usuario: Integer; novoNome, novoRA, novoEmail: string);
begin
    FDQUsuario.Close;
    FDQUsuario.SQL.Clear;
    FDQUsuario.SQL.Add('UPDATE Usuario SET');
    FDQUsuario.SQL.Add('Nome = :Nome,');
    FDQUsuario.SQL.Add('RA = :RA,');
    FDQUsuario.SQL.Add('Email = :Email');
    FDQUsuario.SQL.Add('WHERE ID = :ID');
    FDQUsuario.ParamByName('Nome').AsString := edt_us_nome.Text;
    FDQUsuario.ParamByName('RA').AsString := edt_us_ra.Text;
    FDQUsuario.ParamByName('Email').AsString := edt_us_email.Text;
    FDQUsuario.ParamByName('ID').AsInteger := CurrentUserID;

  try
    FDQUsuario.ExecSQL;
    ShowMessage('Usuário atualizado com sucesso.');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar usuário: ' + E.Message);
      Exit;
    end;
  end;
end;




procedure TForm3.InserirChamadoNoBanco(RA, Autor, Titulo, Descricao, Data_ini, Tecnico, Situacao: string);
begin
  try
    FDQChamado.Close;
    FDQChamado.SQL.Clear;
    FDQChamado.SQL.Add('INSERT INTO Chamado (IdUsuario, RA, Autor, Titulo, Descricao, Data_ini, Tecnico, Situacao)');
    FDQChamado.SQL.Add('VALUES (:IdUsuario, :RA, :Autor, :Titulo, :Descricao, :Data_ini, :Tecnico, :Situacao)');
    FDQChamado.ParamByName('IdUsuario').AsString := IntToStr(Global.CurrentUserID);
    FDQChamado.ParamByName('RA').AsString := RA;
    FDQChamado.ParamByName('Autor').AsString := Autor;
    FDQChamado.ParamByName('Titulo').AsString := Titulo;
    FDQChamado.ParamByName('Descricao').AsString := Descricao;
    FDQChamado.ParamByName('Data_ini').AsString := Data_ini;
    FDQChamado.ParamByName('Tecnico').AsString := Tecnico;
    FDQChamado.ParamByName('Situacao').AsString := Situacao;
    FDQChamado.ExecSQL;
    ShowMessage('Chamado inserido com sucesso.');
    LimparCamposChamado;
  except
    on E: Exception do
      ShowMessage('Erro ao inserir chamado: ' + E.Message);
  end;
end;




procedure TForm3.LimparCamposChamado;
begin
  edt_chamado_titulo.Text := '';
  edt_chamado_descricao.Text := '';
end;




procedure TForm3.ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var vChamado : TChamado;
begin
 //Chamar a tela de edição

//pegar o indice do listview

  idChamado := strToInt(TListItemText(ListView1.Items[ItemIndex].Objects.FindDrawable('txtId')).Text);

  vChamado := buscarChamadoNoBanco(idChamado);

  PreencherCamposChamadoView(vChamado);

  Form3.TabControl2.TabIndex := 2;
end;


procedure TForm3.ListView2ItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var vChamado : TChamado;
begin
 //Chamar a tela de edição

//pegar o indice do listview

  idChamado := strToInt(TListItemText(ListView2.Items[ItemIndex].Objects.FindDrawable('txtId')).Text);

  vChamado := buscarChamadoNoBanco(idChamado);

  PreencherCamposHistoricoView(vChamado); //historico

  Form3.TabControl3.TabIndex := 1;
end;




procedure TForm3.PreencherCamposHistoricoView(chamado: TChamado);
begin
  //Preenche os edits da tela do chamado que foi selecionado
  edt_historico_vw_ra.Text := chamado.RA;
  edt_historico_vw_autor.Text := chamado.Autor;
  edt_historico_vw_titulo.Text := chamado.Titulo;
  edt_historico_vw_descricao.Text := chamado.Descricao;
  edt_historico_vw_data.Text := chamado.Data_ini;
  edt_historico_vw_situacao.Text := chamado.situacao;
  edt_historico_vw_tecnico.Text := chamado.tecnico;
  edt_historico_vw_nchamado.Text := 'Chamado N°'+ IntToStr(chamado.ID_Chamado);

end;




procedure TForm3.PreencherCamposChamadoView(chamado: TChamado);
begin
  //Preenche os edits da tela do chamado que foi selecionado
  edt_vw_ra.Text := chamado.RA;
  edt_vw_autor.Text := chamado.Autor;
  edt_vw_titulo.Text := chamado.Titulo;
  edt_vw_descricao.Text := chamado.Descricao;
  edt_vw_data.Text := chamado.Data_ini;
  edt_vw_situacao.Text := chamado.situacao;
  edt_vw_tecnico.Text := chamado.tecnico;
  lbl_vw_nchamado.Text := 'Chamado N°'+ IntToStr(chamado.ID_Chamado);

end;




function TForm3.buscarChamadoNoBanco(idChamado: Integer): TChamado;
var vChamado : TChamado;
   //Buscar Chamado por ID para exibir informações de um chamado

begin

  FDQChamado.Close;
  FDQChamado.SQL.Clear;
  FDQChamado.SQL.Add('select * from chamado');
  FDQChamado.SQL.Add('where ID_Chamado = :ID_Chamado');
  FDQChamado.ParamByName('ID_Chamado').AsInteger := idChamado;

  FDQChamado.Open();

  vChamado.ID_Chamado := idChamado;
  vChamado.IdUsuario := FDQChamado.FieldByName('IdUsuario').AsInteger;
  vChamado.RA := FDQChamado.FieldByName('RA').AsString;
  vChamado.Autor := FDQChamado.FieldByName('Autor').AsString;
  vChamado.Titulo := FDQChamado.FieldByName('Titulo').AsString;
  vChamado.Descricao := FDQChamado.FieldByName('Descricao').AsString;
  vChamado.Data_ini := FDQChamado.FieldByName('Data_ini').AsString;
  vChamado.Data_fin := FDQChamado.FieldByName('Data_fin').AsString;
  vChamado.tecnico := FDQChamado.FieldByName('tecnico').AsString;
  vChamado.situacao := FDQChamado.FieldByName('situacao').AsString;

  result := vChamado;

end;




procedure TForm3.buscarChamadosAbertos;
var vChamado : TChamado;
begin
  //Efetuar a consulta no banco e trazer todos os chamados abertos do usuario
  //para a listView dos chamados

  FDQChamado.Close;
  FDQChamado.SQL.Clear;
  FDQChamado.SQL.Add('select * from Chamado ');
  FDQChamado.SQL.Add('where IdUsuario like :IdUsuario');
  FDQChamado.SQL.Add('AND Situacao LIKE ''Aberto''');
  FDQChamado.ParamByName('IdUsuario').AsString := IntToStr(Global.CurrentUserID);

  FDQChamado.Open();

  FDQChamado.First;

  ListView1.Items.Clear;

  while not FDQChamado.Eof do
  begin

    vChamado.ID_Chamado := FDQChamado.FieldByName('ID_Chamado').AsInteger;
    vChamado.IdUsuario := FDQChamado.FieldByName('IdUsuario').AsInteger;
    vChamado.RA := FDQChamado.FieldByName('RA').AsString;
    vChamado.Autor := FDQChamado.FieldByName('Autor').AsString;
    vChamado.Titulo := FDQChamado.FieldByName('titulo').AsString;
    vChamado.Descricao := FDQChamado.FieldByName('Descricao').AsString;
    vChamado.Data_ini := FDQChamado.FieldByName('Data_ini').AsString;
    vChamado.Data_fin := FDQChamado.FieldByName('Data_fin').AsString;
    vChamado.tecnico := FDQChamado.FieldByName('Tecnico').AsString;
    vChamado.situacao := FDQChamado.FieldByName('Situacao').AsString;

    insereChamadoNaLista(vChamado);

    FDQChamado.Next;
  end;

end;




procedure TForm3.buscarChamadosUsuario;
var vChamado : TChamado;
begin
  //Efetuar a consulta no banco e trazer todos os chamados do usuario
  //Para a listView do Historico

  FDQChamado.Close;
  FDQChamado.SQL.Clear;
  FDQChamado.SQL.Add('select * from Chamado ');
  FDQChamado.SQL.Add('where IdUsuario like :IdUsuario');
  FDQChamado.ParamByName('IdUsuario').AsString := IntToStr(Global.CurrentUserID);

  FDQChamado.Open();

  FDQChamado.First;

  ListView2.Items.Clear;

  while not FDQChamado.Eof do
  begin

    vChamado.ID_Chamado := FDQChamado.FieldByName('ID_Chamado').AsInteger;
    vChamado.IdUsuario := FDQChamado.FieldByName('IdUsuario').AsInteger;
    vChamado.RA := FDQChamado.FieldByName('RA').AsString;
    vChamado.Autor := FDQChamado.FieldByName('Autor').AsString;
    vChamado.Titulo := FDQChamado.FieldByName('titulo').AsString;
    vChamado.Descricao := FDQChamado.FieldByName('Descricao').AsString;
    vChamado.Data_ini := FDQChamado.FieldByName('Data_ini').AsString;
    vChamado.Data_fin := FDQChamado.FieldByName('Data_fin').AsString;
    vChamado.tecnico := FDQChamado.FieldByName('Tecnico').AsString;
    vChamado.situacao := FDQChamado.FieldByName('Situacao').AsString;

    insereChamadoNaListaHistorico(vChamado);

    FDQChamado.Next;
  end;

end;




procedure TForm3.insereChamadoNaLista(chamado: TChamado);
begin

  //Insere Chamados Abertos do usuario na lista
  //Inseri na ListView dos Chamados

  with ListView1.Items.Add do
  begin

    TListItemText(Objects.FindDrawable('txtId')).Text := IntToStr(chamado.ID_Chamado);
    TListItemText(Objects.FindDrawable('txtTitulo')).Text := chamado.Titulo;
    TListItemText(Objects.FindDrawable('txtTecnico')).Text := chamado.tecnico;
    TListItemText(Objects.FindDrawable('txtSituacao')).Text := chamado.situacao;

  end;

end;




procedure TForm3.insereChamadoNaListaHistorico(chamado: TChamado);
begin

  //Insere Todos os Chamados do usuario na lista
  //Inseri na ListView do historico
  with ListView2.Items.Add do
  begin

    TListItemText(Objects.FindDrawable('txtId')).Text := IntToStr(chamado.ID_Chamado);
    TListItemText(Objects.FindDrawable('txtTitulo')).Text := chamado.Titulo;
    TListItemText(Objects.FindDrawable('txttecnico')).Text := chamado.tecnico;
    TListItemText(Objects.FindDrawable('txtSituacao')).Text := chamado.situacao;

  end;

end;





end.
