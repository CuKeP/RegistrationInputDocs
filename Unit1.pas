unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Label1: TLabel;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DateTimePicker3: TDateTimePicker;
    Button14: TButton;
    Button15: TButton;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button14Click(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
 uses unit2, unit3, unit4;
{$R *.dfm}
procedure viravnivanie_kolonok;
begin
  form1.DBGrid1.Columns[0].Width:=40  ;
  form1.DBGrid1.Columns[1].Width:=95  ;
  form1.DBGrid1.Columns[2].Width:=105  ;
  form1.DBGrid1.Columns[3].Width:=120  ;
  form1.DBGrid1.Columns[4].Width:=200  ;
  form1.DBGrid1.Columns[5].Width:=140  ;
  form1.DBGrid1.Columns[6].Width:=200  ;
  form1.DBGrid1.Columns[7].Width:=90  ;
  form1.DBGrid1.Columns[8].Width:=160  ;
  form1.DBGrid1.Columns[9].Width:=105  ;
  form1.DBGrid1.Columns[10].Width:=120  ;

  form1.dbgrid1.Columns[0].Title.caption:='№ рег';
  form1.dbgrid1.Columns[1].Title.caption:='дата поступления';
  form1.dbgrid1.Columns[2].Title.caption:='№ вход. документа';
  form1.dbgrid1.Columns[3].Title.caption:='дата вход. документа';
  form1.dbgrid1.Columns[4].Title.caption:='от кого поступило';
  form1.dbgrid1.Columns[5].Title.caption:='наименование документа';
  form1.dbgrid1.Columns[6].Title.caption:='краткое содержание';
  form1.dbgrid1.Columns[7].Title.caption:='резолюция';
  form1.dbgrid1.Columns[8].Title.caption:='исполнитель';
  form1.dbgrid1.Columns[9].Title.caption:='сроки исполнения';
  form1.dbgrid1.Columns[10].Title.caption:='отметка об исполнении';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  buttonSelected:integer;
begin
  buttonSelected := MessageDlg('Удалить выбранную строку?',mtCustom,[mbYes,mbNo], 0);
  if buttonSelected = mrYes    then
    begin
      datasource1.dataset.delete;
//      ShowMessage('Запись удалена');
    end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE ot_kogo_postupilo LIKE "%'+ComboBox1.Text+'%"');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE kratkoe_soderjanie LIKE "%'+Edit3.Text+'%"');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE ispolnitel LIKE "%'+ComboBox2.Text+'%"');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE sroki_ispolnenija LIKE "%'+DateToStr(DateTimePicker3.Date)+'%"');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  buttonSelected:integer;
begin
  buttonSelected := MessageDlg('Снять с контроля выделенную запись?',mtCustom,[mbYes,mbNo], 0);
  if buttonSelected = mrYes    then
    begin
      DataSource1.DataSet.Edit;
      DataSource1.DataSet.FieldValues['sroki_ispolnenija']:='';
      DataSource1.DataSet.Post;
      ShowMessage('Снято с контроля');
    end;

//  showmessage(datasource1.dataset.First);
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
//  if strtodate(DataSource1.DataSet.FieldByName('sroki_ispolnenija').AsString) > date() then
//  ShowMessage('sukaaaa');
  DataSource1.DataSet.edit;
  DataSource1.DataSet.Post;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE (sroki_ispolnenija <> "" and (otmeka_ob_ispolnenii = "" or otmeka_ob_ispolnenii is NULL)) ');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
//DataSource1.DataSet.Last;

//  form1.ADOQuery1.SQL.Clear;
//  form1.ADOQuery1.SQL.Add('select MAX (N_reg) FROM registration');
//  form1.ADOQuery1.Active:=true;

//  try
//  ADOQuery1.SQL.Text := 'insert into registration (N_reg) values("'+DataSet1.FieldByName("").ASString;+'")';
//  ADOQuery1.ExecSQL;
//  ADOQuery1.SQL.Clear;
//  ADOQuery1.SQL.Add('SELECT * FROM registration');
//  ADOQuery1.Active:=True;
//  ShowMessage('zbs');
//  finally
//    showmessage('Divide by zero not allowed!'); // обработка КОНКРЕТНОЙ исключителной ситуации
//  end;

//showmessage (ADODataSet1.FieldByName('N_reg').AsString);
//showmessage (datasource1.dataset.FieldByName('N_reg').AsString);


//  try
//  ADOQuery1.SQL.Text := 'insert into registration (ispolnitel) values("лох")';
//  ADOQuery1.ExecSQL;
//  ADOQuery1.SQL.Clear;
//  ADOQuery1.SQL.Add('SELECT * FROM registration');
//  ADOQuery1.Active:=True;
//  ShowMessage('zbs');
//  finally
//     ShowMessage('Неизвестная ошибка');
//  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DataSource1.DataSet.Insert;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  buttonSelected:integer;
begin
  buttonSelected := MessageDlg('Удалить выбранную строку?',mtCustom,[mbYes,mbNo], 0);
  if buttonSelected = mrYes    then
    begin
      datasource1.dataset.delete;
//      ShowMessage('Запись удалена');
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  form2.Show;
  form2.CheckBox1.Checked:=false;
  form2.CheckBox2.Checked:=false;

  form2.ADOQuery1.SQL.Clear;
  form2.ADOQuery1.SQL.Add('select MAX (N_reg) FROM registration');
  form2.ADOQuery1.Active:=true;
  form2.edit1.Text:=inttostr(form2.ADOQuery1.Fields[0].AsInteger+1);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
//  DataSource1.DataSet.edit;
//  DataSource1.DataSet.Post;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
  adoquery1.Sort:=dbgrid1.Columns[0].FieldName;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE N_reg = '+edit1.Text+'');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;




procedure TForm1.Button7Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE data_postuplenija = "'+DateToStr(DateTimePicker1.Date)+'"');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
//  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE N_vhod_doc = "'+edit2.Text+'"');
  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE N_vhod_doc LIKE "%'+edit2.Text+'%"');
//  SELECT * FROM Universities WHERE UniversityName LIKE '%State%'
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration WHERE data_vhod_doc = "'+DateToStr(DateTimePicker2.Date)+'"');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button10.Click;
end;

procedure TForm1.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button12.Click;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  form3.Show;
  form3.Edit1.Text:=datasource1.dataset.FieldByName('N_reg').AsString;
  form3.Edit2.Text:=datasource1.dataset.FieldByName('data_postuplenija').AsString;
  form3.Edit3.Text:=datasource1.dataset.FieldByName('N_vhod_doc').AsString;
  form3.Edit4.Text:=datasource1.dataset.FieldByName('data_vhod_doc').AsString;
  form3.RichEdit1.Text:=datasource1.dataset.FieldByName('ot_kogo_postupilo').AsString;
  form3.ComboBox3.Text:=datasource1.dataset.FieldByName('naimenovanie_doc').AsString;
  form3.RichEdit2.Text:=datasource1.dataset.FieldByName('kratkoe_soderjanie').AsString;
  form3.ComboBox1.Text:=datasource1.dataset.FieldByName('resolution').AsString;
  form3.ComboBox2.Text:=datasource1.dataset.FieldByName('ispolnitel').AsString;
  form3.Edit5.Text:=datasource1.dataset.FieldByName('sroki_ispolnenija').AsString;
  form3.Edit6.Text:=datasource1.dataset.FieldByName('otmeka_ob_ispolnenii').AsString;
  if (datasource1.dataset.FieldByName('otmeka_ob_ispolnenii').AsString <> '') then
  begin
    form3.CheckBox1.Checked:=true;
  end else form3.CheckBox1.Checked:=false;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  adoquery1.Sort:=dbgrid1.Columns[0].FieldName;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button6.Click;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then Button8.Click;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button11.Click;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataSource1.DataSet.edit;
  DataSource1.DataSet.Post;
  form4.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM registration');
  ADOQuery1.Active:=True;
  viravnivanie_kolonok;
  adoquery1.Sort:=dbgrid1.Columns[0].FieldName;
  DateTimePicker1.Date:= Date();
  DateTimePicker2.Date:= Date();
  DateTimePicker3.Date:= Date();
end;

end.
