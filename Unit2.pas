unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls, Buttons, ExtCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit4: TEdit;
    Edit6: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    Button3: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    DateTimePicker3: TDateTimePicker;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit2: TEdit;
    Label9: TLabel;
    Button2: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Timer1: TTimer;
    CheckBox3: TCheckBox;
    Label3: TLabel;
    ComboBox4: TComboBox;
    Label10: TLabel;
    procedure CheckBox3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses Unit1, DBGrids;
{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  s:string;
begin

if CheckBox3.Checked = true then
begin
  if (CheckBox1.Checked = true) and (CheckBox2.Checked = true) then
    begin
      s:='"'+Edit1.Text+'","'+DateToStr(DateTimePicker1.Date)+'","'+DateToStr(DateTimePicker2.Date)+'","'+edit4.Text+'","'+ComboBox1.Text+'","'+ComboBox4.Text+'","'+edit6.Text+'","'+ComboBox2.Text+'","'+ComboBox3.Text+'","'+DateToStr(DateTimePicker3.Date)+', '+Edit2.Text+'"';
    end;

  if (CheckBox1.Checked = true) and (CheckBox2.Checked = false) then
    begin
      s:='"'+Edit1.Text+'","'+DateToStr(DateTimePicker1.Date)+'","'+DateToStr(DateTimePicker2.Date)+'","'+edit4.Text+'","'+ComboBox1.Text+'","'+ComboBox4.Text+'","'+edit6.Text+'","'+ComboBox2.Text+'","'+ComboBox3.Text+'","'+DateToStr(DateTimePicker3.Date)+'"';
    end;

  if (CheckBox1.Checked = false) and (CheckBox2.Checked = false) then
    begin
      s:='"'+Edit1.Text+'","'+DateToStr(DateTimePicker1.Date)+'","'+DateToStr(DateTimePicker2.Date)+'","'+edit4.Text+'","'+ComboBox1.Text+'","'+ComboBox4.Text+'","'+edit6.Text+'","'+ComboBox2.Text+'","'+ComboBox3.Text+'",""';
    end;
end;

if CheckBox3.Checked = false then
begin
  if (CheckBox1.Checked = true) and (CheckBox2.Checked = true) then
    begin
      s:='"'+Edit1.Text+'","'+DateToStr(DateTimePicker1.Date)+'","","'+edit4.Text+'","'+ComboBox1.Text+'","'+ComboBox4.Text+'","'+edit6.Text+'","'+ComboBox2.Text+'","'+ComboBox3.Text+'","'+DateToStr(DateTimePicker3.Date)+', '+Edit2.Text+'"';
    end;

  if (CheckBox1.Checked = true) and (CheckBox2.Checked = false) then
    begin
      s:='"'+Edit1.Text+'","'+DateToStr(DateTimePicker1.Date)+'","","'+edit4.Text+'","'+ComboBox1.Text+'","'+ComboBox4.Text+'","'+edit6.Text+'","'+ComboBox2.Text+'","'+ComboBox3.Text+'","'+DateToStr(DateTimePicker3.Date)+'"';
    end;

  if (CheckBox1.Checked = false) and (CheckBox2.Checked = false) then
    begin
      s:='"'+Edit1.Text+'","'+DateToStr(DateTimePicker1.Date)+'","","'+edit4.Text+'","'+ComboBox1.Text+'","'+ComboBox4.Text+'","'+edit6.Text+'","'+ComboBox2.Text+'","'+ComboBox3.Text+'",""';
    end;
end;

    ADOQuery1.SQL.Text := 'insert into registration (N_reg,data_postuplenija,data_vhod_doc,N_vhod_doc,ot_kogo_postupilo,naimenovanie_doc,kratkoe_soderjanie,resolution,ispolnitel,sroki_ispolnenija) values('+s+')';
    ADOQuery1.ExecSQL;
    showmessage ('Запись добавлена!');
    edit1.Clear;
    edit2.Clear;
    edit4.Clear;
    edit6.Clear;
    ComboBox1.Clear;
    ComboBox2.Clear;
    ComboBox3.Clear;
    ComboBox4.Clear;
    CheckBox1.Checked:=false;
    CheckBox2.Checked:=false;

  form2.ADOQuery1.SQL.Clear;
  form2.ADOQuery1.SQL.Add('select MAX (N_reg) FROM registration');
  form2.ADOQuery1.Active:=true;
  form2.edit1.Text:=inttostr(form2.ADOQuery1.Fields[0].AsInteger+1);
  form1.Button5.Click;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  edit1.Clear;
  Edit2.clear;
  Edit4.clear;
  edit6.Clear;
  ComboBox1.clear;
  ComboBox2.clear;
  ComboBox3.clear;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  form2.close;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  s:string;
begin
  if (CheckBox1.Checked = true) and (CheckBox2.Checked = true) then
  begin
    s:='"'+Edit1.Text+'","'+DateToStr(DateTimePicker1.Date)+'","'+DateToStr(DateTimePicker2.Date)+'","'+edit4.Text+'","'+ComboBox1.Text+'","'+edit6.Text+'","'+ComboBox2.Text+'","'+ComboBox3.Text+'","'+DateToStr(DateTimePicker3.Date)+', '+Edit2.Text+'"';
  end;
  if (CheckBox1.Checked = true) and (CheckBox2.Checked = false) then
  begin
    s:='"'+Edit1.Text+'","'+DateToStr(DateTimePicker1.Date)+'","'+DateToStr(DateTimePicker2.Date)+'","'+edit4.Text+'","'+ComboBox1.Text+'","'+edit6.Text+'","'+ComboBox2.Text+'","'+ComboBox3.Text+'","'+DateToStr(DateTimePicker3.Date)+'"';
  end;

  if (CheckBox1.Checked = false) and (CheckBox2.Checked = false) then
  begin
    s:='"'+Edit1.Text+'","'+DateToStr(DateTimePicker1.Date)+'","'+DateToStr(DateTimePicker2.Date)+'","'+edit4.Text+'","'+ComboBox1.Text+'","'+edit6.Text+'","'+ComboBox2.Text+'","'+ComboBox3.Text+'",""';
  end;

    ADOQuery1.SQL.Text := 'insert into registration (N_reg,data_postuplenija,data_vhod_doc,N_vhod_doc,ot_kogo_postupilo,kratkoe_soderjanie,resolution,ispolnitel,sroki_ispolnenija) values('+s+')';
    ADOQuery1.ExecSQL;
    showmessage ('Запись добавлена!');
    edit1.Clear;
    edit2.Clear;
    edit4.Clear;
    edit6.Clear;
    ComboBox1.Clear;
    ComboBox2.Clear;
    ComboBox3.Clear;
    CheckBox1.Checked:=false;
    CheckBox2.Checked:=false;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  edit1.Clear;
  Edit2.clear;
  Edit4.clear;
  edit6.Clear;
  ComboBox1.clear;
  ComboBox2.clear;
  ComboBox3.clear;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  form2.close;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if  CheckBox1.Checked = true then
  begin
    DateTimePicker3.Visible:=true;
    CheckBox2.Visible:=true;
  end;

  if  CheckBox1.Checked = false then
  begin
    DateTimePicker3.Visible:=false;
    CheckBox2.Checked:=false;
    CheckBox2.Visible:=false;
  end;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked = true then
  begin
    Edit2.Visible:=true;
    Label9.Visible:=true;
  end;

  if CheckBox2.Checked = false then
  begin
    Edit2.Visible:=false;
    Label9.Visible:=false;
  end;
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked = true then
    begin
      DateTimePicker2.Visible:=true;
    end;
  if CheckBox3.Checked = false then
    begin
      DateTimePicker2.Visible:=false;
    end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date:= Date();
  DateTimePicker2.Date:= Date();
  DateTimePicker3.Date:= Date();
end;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key = #27 then form2.Close;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
//  if Key = #27 then form2.Close;
end;

end.
