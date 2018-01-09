unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm3 = class(TForm)
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RichEdit2: TRichEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Label10: TLabel;
    ComboBox3: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses unit1, unit2;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  buttonSelected:integer;
begin
buttonSelected := MessageDlg('Перезаписать данные?',mtCustom,[mbYes,mbNo], 0);
if buttonSelected = mrYes    then
  begin
    form1.DataSource1.DataSet.Edit;

    form1.DataSource1.DataSet.FieldValues['N_reg']:=edit1.Text;
    form1.DataSource1.DataSet.FieldValues['data_postuplenija']:=edit2.Text;
    form1.DataSource1.DataSet.FieldValues['N_vhod_doc']:=edit3.Text;
    form1.DataSource1.DataSet.FieldValues['data_vhod_doc']:=edit4.Text;
    form1.DataSource1.DataSet.FieldValues['ot_kogo_postupilo']:=RichEdit1.Text;
    form1.DataSource1.DataSet.FieldValues['naimenovanie_doc']:=ComboBox3.Text;
    form1.DataSource1.DataSet.FieldValues['kratkoe_soderjanie']:=RichEdit2.Text;
    form1.DataSource1.DataSet.FieldValues['resolution']:=ComboBox1.Text;
    form1.DataSource1.DataSet.FieldValues['ispolnitel']:=ComboBox2.Text;
    form1.DataSource1.DataSet.FieldValues['sroki_ispolnenija']:=Edit5.Text;
    form1.DataSource1.DataSet.FieldValues['otmeka_ob_ispolnenii']:=Edit6.Text;
    form1.DataSource1.DataSet.Post;
    ShowMessage('Запись сохранена');
    form3.Close;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  form3.Close;
end;

procedure TForm3.CheckBox1Click(Sender: TObject);
begin
  if  CheckBox1.Checked = true then
  begin
    edit6.Visible:=true;
    label10.Visible:=true;
  end;

  if  CheckBox1.Checked = false then
  begin
    edit6.Visible:=false;
    label10.Visible:=false;
  end;
end;

procedure TForm3.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

procedure TForm3.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

procedure TForm3.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

procedure TForm3.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

procedure TForm3.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

procedure TForm3.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

procedure TForm3.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

procedure TForm3.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key = #13 then Button1.Click;
//  if Key = #27 then form3.Close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  CheckBox1.Checked:=false;
end;

procedure TForm3.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

procedure TForm3.RichEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

end.
