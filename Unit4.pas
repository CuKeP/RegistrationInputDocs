unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses unit1;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
  login,pass:string;
begin
login:= 'Альбина';
pass:= '123456';
if (edit1.Text = login) and (edit2.Text = pass)then
  begin
    form1.Show;
    form4.hide;
  end else showmessage ('Неверный логин или пароль!');
end;

procedure TForm4.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Button1.Click;
end;

end.
