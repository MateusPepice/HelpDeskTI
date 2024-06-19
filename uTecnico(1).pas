unit uTecnico;

interface

uses
  Global,

  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListBox, FMX.Edit, FMX.StdCtrls, FMX.ListView, FMX.Controls.Presentation,
  FMX.Layouts, FMX.TabControl, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

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


  TForm4 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Layout2: TLayout;
    btn_chamados: TSpeedButton;
    btn_historico: TSpeedButton;
    btn_logout: TSpeedButton;
    btn_usuario: TSpeedButton;
    Layout1: TLayout;
    btn_volta_login: TSpeedButton;
    Label8: TLabel;
    TabItem2: TTabItem;
    Layout4: TLayout;
    TabControl2: TTabControl;
    TabItem3: TTabItem;
    ListView1: TListView;
    btn_novo_chamado: TSpeedButton;
    Layout3: TLayout;
    btn_volta_menu: TSpeedButton;
    Label1: TLabel;
    btn_menu1: TSpeedButton;
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
    TabItem7: TTabItem;
    TabItem8: TTabItem;
    Layout10: TLayout;
    SpeedButton1: TSpeedButton;
    Label16: TLabel;
    SpeedButton2: TSpeedButton;
    Layout11: TLayout;
    Panel3: TPanel;
    lbl_tec_enc_nChamado: TLabel;
    edt_tec_enc_ra: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    edt_tec_enc_autor: TEdit;
    Label20: TLabel;
    edt_tec_enc_titulo: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edt_tec_enc_data: TEdit;
    Label23: TLabel;
    edt_tec_enc_tecnico: TEdit;
    Label24: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Layout12: TLayout;
    SpeedButton5: TSpeedButton;
    Label25: TLabel;
    SpeedButton6: TSpeedButton;
    ListView3: TListView;
    FDConnection1: TFDConnection;
    FDQUsuario: TFDQuery;
    FDQLogin: TFDQuery;
    edt_tec_enc_descricao: TMemo;
    edt_tec_enc_situacao: TEdit;
    edt_chamado_descricao: TMemo;
    edt_chamado_situacao: TEdit;
    Label17: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    FDQChamado: TFDQuery;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    TabControl3: TTabControl;
    TabItem9: TTabItem;
    TabItem10: TTabItem;
    Layout13: TLayout;
    btn_voltar_historico_vw: TSpeedButton;
    Label35: TLabel;
    btn_menu_historico_vw: TSpeedButton;
    Layout14: TLayout;
    Panel4: TPanel;
    edt_historico_vw_nchamado: TLabel;
    edt_historico_vw_ra: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    edt_historico_vw_autor: TEdit;
    Label38: TLabel;
    edt_historico_vw_titulo: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    edt_historico_vw_data: TEdit;
    Label41: TLabel;
    edt_historico_vw_situacao: TEdit;
    Label42: TLabel;
    edt_historico_vw_tecnico: TEdit;
    edt_historico_vw_descricao: TMemo;
    Layout7: TLayout;
    btn_volta_menu2: TSpeedButton;
    Label11: TLabel;
    btn_menu3: TSpeedButton;
    ListView2: TListView;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    procedure btn_volta_loginClick(Sender: TObject);
    procedure btn_chamadosClick(Sender: TObject);
    procedure btn_historicoClick(Sender: TObject);
    procedure btn_usuarioClick(Sender: TObject);
    procedure btn_logoutClick(Sender: TObject);
    procedure btn_volta_menuClick(Sender: TObject);
    procedure btn_menu1Click(Sender: TObject);
    procedure btn_volta_menu2Click(Sender: TObject);
    procedure btn_menu3Click(Sender: TObject);
    procedure btn_volta_menu3Click(Sender: TObject);
    procedure btn_menu4Click(Sender: TObject);
    procedure btn_novo_chamadoClick(Sender: TObject);
    procedure btn_Us_AtualizarClick(Sender: TObject);
    procedure btn_Us_CancelarClick(Sender: TObject);
    procedure ListView3ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btn_salvar_chamadoClick(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btn_volta_chamadoClick(Sender: TObject);
    procedure btn_menu2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btn_cancelar_chamadoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ListView2ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btn_voltar_historico_vwClick(Sender: TObject);
    procedure btn_menu_historico_vwClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    function BuscarUsuarioNoBanco(id_usuario: Integer): TUsuario;
    procedure PreencherCamposUsuario;
    procedure AtualizarUsuario(id_usuario: Integer; novoNome, novoRA,
      novoEmail: string);
    procedure buscarChamadosTecnico;
    procedure insereChamadoNaLista(chamado: TChamado);
    procedure buscarChamadosSemTecnico;
    procedure insereChamadoNaListaSemTecnico(chamado: TChamado);
    function buscarChamadoNoBanco(idChamado: Integer): TChamado;
    procedure PreencherCamposChamadoAtribuir(chamado: TChamado);
    procedure AtribuirChamado(id_Chamado: Integer; usuario: TUsuario);
    procedure PreencherCamposChamadoEncerrar(chamado: TChamado);
    procedure EncerrarChamado(id_Chamado: Integer);
    procedure buscarChamadosUsuario;
    procedure insereChamadoNaListaHistorico(chamado: TChamado);
    procedure PreencherCamposHistoricoView(chamado: TChamado);
    { Private declarations }
  public
    { Public declarations }
    idChamado : Integer;
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses uPrincipal, uCliente, uLogin;


procedure TForm4.btn_cancelar_chamadoClick(Sender: TObject);
begin
  Form4.TabControl2.TabIndex := 1;
end;

procedure TForm4.btn_chamadosClick(Sender: TObject);
begin

  Form4.TabControl1.TabIndex := 1;
  Form4.TabControl2.TabIndex := 0;
  buscarChamadosTecnico;

end;

procedure TForm4.btn_historicoClick(Sender: TObject);
begin


  Form4.TabControl1.TabIndex := 2;
  Form4.TabControl3.TabIndex := 0;
  buscarChamadosUsuario;

end;




procedure TForm4.btn_logoutClick(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm4.btn_menu1Click(Sender: TObject);
begin
  Form4.TabControl1.TabIndex := 0;
end;

procedure TForm4.btn_menu2Click(Sender: TObject);
begin
  Form4.TabControl1.TabIndex := 0;
end;

procedure TForm4.btn_menu3Click(Sender: TObject);
begin
  Form4.TabControl1.TabIndex := 0;
end;

procedure TForm4.btn_menu4Click(Sender: TObject);
begin
  Form4.TabControl1.TabIndex := 0;
end;

procedure TForm4.btn_menu_historico_vwClick(Sender: TObject);
begin
  Form4.TabControl1.TabIndex := 0;
end;

procedure TForm4.btn_novo_chamadoClick(Sender: TObject);
begin
  Form4.TabControl2.TabIndex := 1;
  buscarChamadosSemTecnico;
end;




procedure TForm4.btn_salvar_chamadoClick(Sender: TObject);
var vUsuario : TUsuario;
begin
 //aterar chamado
 vUsuario := BuscarUsuarioNoBanco(CurrentUserID);
 AtribuirChamado(StrToInt(lbnNumChamado.Text),  vUsuario);
 // voltar para lista e atualizar
  Form4.TabControl2.TabIndex := 0;
  buscarChamadosTecnico;
end;




procedure TForm4.AtribuirChamado(id_Chamado: Integer; usuario: TUsuario);
begin
    FDQChamado.Close;
    FDQChamado.SQL.Clear;
    FDQChamado.SQL.Add('UPDATE Chamado SET');
    FDQChamado.SQL.Add('Tecnico = :Tecnico,');
    FDQChamado.SQL.Add('IdTecnico = :IdTecnico');
    FDQChamado.ParamByName('Tecnico').AsString := usuario.Nome;
    FDQChamado.ParamByName('IdTecnico').AsInteger := usuario.ID;
    FDQChamado.SQL.Add('WHERE ID_Chamado = :ID');
    FDQChamado.ParamByName('ID').AsInteger := id_Chamado;

  try
    FDQChamado.ExecSQL;
    ShowMessage('Chamado atribuido com sucesso.');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atribuir chamado: ' + E.Message);
      Exit;
    end;
  end;
end;



procedure TForm4.EncerrarChamado(id_Chamado: Integer);
begin
    FDQChamado.Close;
    FDQChamado.SQL.Clear;
    FDQChamado.SQL.Add('UPDATE Chamado SET');
    FDQChamado.SQL.Add('Situacao = :Situacao,');
    FDQChamado.SQL.Add('Data_fin = :Data_fin');

    FDQChamado.ParamByName('Situacao').AsString := 'Encerrado';
    FDQChamado.ParamByName('Data_fin').AsString := DateToStr(Date);

    FDQChamado.SQL.Add('WHERE ID_Chamado = :ID');
    FDQChamado.ParamByName('ID').AsInteger := id_Chamado;

  try
    FDQChamado.ExecSQL;
    ShowMessage('Chamado atribuido com sucesso.');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atribuir chamado: ' + E.Message);
      Exit;
    end;
  end;
end;




function TForm4.BuscarUsuarioNoBanco(id_usuario: Integer): TUsuario;
var
  vUsuario: TUsuario;
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




procedure TForm4.PreencherCamposUsuario;
var
  vUsuario: TUsuario;
begin
  vUsuario := BuscarUsuarioNoBanco(CurrentUserID);
  edt_us_nome.Text := vUsuario.Nome;
  edt_us_ra.Text := vUsuario.RA;
  edt_us_email.Text := vUsuario.Email;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
  Form4.TabControl2.TabIndex := 0;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
  Form4.TabControl1.TabIndex := 0;
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
var vUsuario : TUsuario;
begin
 //Encerrar chamado
 EncerrarChamado(StrToInt(lbl_tec_enc_nChamado.Text));
 // voltar para lista e atualizar
  Form4.TabControl2.TabIndex := 0;
  buscarChamadosTecnico;
end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
begin
  Form4.TabControl2.TabIndex := 0;
end;

procedure TForm4.SpeedButton5Click(Sender: TObject);
begin
  Form4.TabControl2.TabIndex := 0;
end;

procedure TForm4.btn_usuarioClick(Sender: TObject);
begin

  Form4.TabControl1.TabIndex := 3;
  PreencherCamposUsuario;

end;

procedure TForm4.btn_Us_AtualizarClick(Sender: TObject);
begin

  AtualizarUsuario(CurrentUserID, edt_us_nome.Text, edt_us_ra.Text, edt_us_email.Text);
  PreencherCamposUsuario;

end;


procedure TForm4.btn_Us_CancelarClick(Sender: TObject);
begin

  Form4.TabControl1.TabIndex := 0;

end;

procedure TForm4.AtualizarUsuario(id_usuario: Integer; novoNome, novoRA, novoEmail: string);
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


procedure TForm4.btn_voltar_historico_vwClick(Sender: TObject);
begin
  Form4.TabControl3.TabIndex := 0;
end;

procedure TForm4.btn_volta_chamadoClick(Sender: TObject);
begin
  Form4.TabControl2.TabIndex := 1;
end;

procedure TForm4.btn_volta_loginClick(Sender: TObject);
begin

  Form1.Show;

end;

procedure TForm4.btn_volta_menu2Click(Sender: TObject);
begin

  Form4.TabControl1.TabIndex := 0;

end;

procedure TForm4.btn_volta_menu3Click(Sender: TObject);
begin

  Form4.TabControl1.TabIndex := 0;

end;

procedure TForm4.btn_volta_menuClick(Sender: TObject);
begin
  Form4.TabControl1.TabIndex := 0;;
end;




procedure TForm4.buscarChamadosTecnico;
var vChamado : TChamado;
begin
  //Efetuar a consulta no banco e trazer todos os chamados abertos do usuario
  //para a listView dos chamados

  FDQChamado.Close;
  FDQChamado.SQL.Clear;
  FDQChamado.SQL.Add('select * from Chamado ');
  FDQChamado.SQL.Add('where IdTecnico like :IdTecnico');
  FDQChamado.SQL.Add('AND Situacao LIKE ''Aberto''');
  FDQChamado.ParamByName('IdTecnico').AsString := IntToStr(Global.CurrentUserID);

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




procedure TForm4.insereChamadoNaLista(chamado: TChamado);
begin

  //Insere Chamados Abertos do usuario na lista
  //Inseri na ListView dos Chamados

  with ListView1.Items.Add do
  begin

    TListItemText(Objects.FindDrawable('txtId')).Text := IntToStr(chamado.ID_Chamado);
    TListItemText(Objects.FindDrawable('txtTitulo')).Text := chamado.Titulo;
    TListItemText(Objects.FindDrawable('TxtAutor')).Text := chamado.Autor;
    TListItemText(Objects.FindDrawable('txtData')).Text := chamado.Data_ini;

  end;

end;



 procedure TForm4.buscarChamadosSemTecnico;
var vChamado : TChamado;
begin
  //Efetuar a consulta no banco e trazer todos os chamados abertos do usuario
  //para a listView dos chamados

  FDQChamado.Close;
  FDQChamado.SQL.Clear;
  FDQChamado.SQL.Add('select * from Chamado ');
  FDQChamado.SQL.Add('where IdTecnico is null');
  FDQChamado.SQL.Add('AND Situacao LIKE ''Aberto''');
  //FDQChamado.ParamByName('IdTecnico').AsString := IntToStr(Global.CurrentUserID);

  FDQChamado.Open();

  FDQChamado.First;

  ListView3.Items.Clear;

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

    insereChamadoNaListaSemTecnico(vChamado);

    FDQChamado.Next;
  end;

end;



procedure TForm4.insereChamadoNaListaSemTecnico(chamado: TChamado);
begin

  //Insere Chamados Abertos do usuario na lista
  //Inseri na ListView dos Chamados

  with ListView3.Items.Add do
  begin

    TListItemText(Objects.FindDrawable('txtId')).Text := IntToStr(chamado.ID_Chamado);
    TListItemText(Objects.FindDrawable('txttitulo')).Text := chamado.Titulo;
    TListItemText(Objects.FindDrawable('txtAutor')).Text := chamado.Autor;
    TListItemText(Objects.FindDrawable('txtData')).Text := chamado.Data_ini;

  end;

end;




procedure TForm4.ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  var vChamado : TChamado;
begin
 ///
  TabControl2.TabIndex := 3;

   //Chamar a tela de atribuir

//pegar o indice do listview

  idChamado := strToInt(TListItemText(ListView1.Items[ItemIndex].Objects.FindDrawable('txtId')).Text);

  vChamado := buscarChamadoNoBanco(idChamado);

  PreencherCamposChamadoEncerrar(vChamado);

end;




procedure TForm4.ListView2ItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var vChamado : TChamado;
begin
 //Chamar a tela de edição

//pegar o indice do listview

  idChamado := strToInt(TListItemText(ListView2.Items[ItemIndex].Objects.FindDrawable('txtId')).Text);

  vChamado := buscarChamadoNoBanco(idChamado);

  PreencherCamposHistoricoView(vChamado); //historico

  Form4.TabControl3.TabIndex := 1;
end;




procedure TForm4.ListView3ItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var vChamado : TChamado;
begin
 //Chamar a tela de atribuir

//pegar o indice do listview

  idChamado := strToInt(TListItemText(ListView3.Items[ItemIndex].Objects.FindDrawable('txtId')).Text);

  vChamado := buscarChamadoNoBanco(idChamado);

  PreencherCamposChamadoAtribuir(vChamado);

  Form4.TabControl2.TabIndex := 2;
end;


function TForm4.buscarChamadoNoBanco(idChamado: Integer): TChamado;
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



procedure TForm4.PreencherCamposChamadoAtribuir(chamado: TChamado);
begin
  //Preenche os edits da tela do chamado que foi selecionado
  edt_chamado_ra.Text := chamado.RA;
  edt_chamado_autor.Text := chamado.Autor;
  edt_chamado_titulo.Text := chamado.Titulo;
  edt_chamado_descricao.Text := chamado.Descricao;
  edt_chamado_data.Text := chamado.Data_ini;
  edt_chamado_situacao.Text := chamado.situacao;
  edt_chamado_tecnico.Text := chamado.tecnico;
  lbnNumChamado.Text := IntToStr(chamado.ID_Chamado);

end;




procedure TForm4.PreencherCamposChamadoEncerrar(chamado: TChamado);
begin
  //Preenche os edits da tela do chamado que foi selecionado
  edt_tec_enc_ra.Text := chamado.RA;
  edt_tec_enc_autor.Text := chamado.Autor;
  edt_tec_enc_titulo.Text := chamado.Titulo;
  edt_tec_enc_descricao.Text := chamado.Descricao;
  edt_tec_enc_data.Text := chamado.Data_ini;
  edt_tec_enc_situacao.Text := chamado.situacao;
  edt_tec_enc_tecnico.Text := chamado.tecnico;
  lbl_tec_enc_nChamado.Text := IntToStr(chamado.ID_Chamado);

end;




procedure TForm4.buscarChamadosUsuario;
var vChamado : TChamado;
begin
  //Efetuar a consulta no banco e trazer todos os chamados do usuario
  //Para a listView do Historico

  FDQChamado.Close;
  FDQChamado.SQL.Clear;
  FDQChamado.SQL.Add('select * from Chamado ');
  FDQChamado.SQL.Add('where IdTecnico like :IdTecnico');
  FDQChamado.ParamByName('IdTecnico').AsString := IntToStr(Global.CurrentUserID);

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




procedure TForm4.insereChamadoNaListaHistorico(chamado: TChamado);
begin

  //Insere Todos os Chamados do usuario na lista
  //Inseri na ListView do historico
  with ListView2.Items.Add do
  begin

    TListItemText(Objects.FindDrawable('txtId')).Text := IntToStr(chamado.ID_Chamado);
    TListItemText(Objects.FindDrawable('txttitulo')).Text := chamado.Titulo;
    TListItemText(Objects.FindDrawable('txtAutor')).Text := chamado.Autor;
    TListItemText(Objects.FindDrawable('txtSituacao')).Text := chamado.situacao;

  end;

end;




procedure TForm4.PreencherCamposHistoricoView(chamado: TChamado);
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
end.
