unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    Button2: TButton;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  n = 5;

var
  arr, arrold: array of integer;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to n - 1 do
    arr[i] := StringGrid1.Cells[i, 0].ToInteger();
  arrold := arr;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  for var i := 0 to n - 1 do
    StringGrid2.Cells[i, 0] := arrold[i].ToString();

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  for var i := 0 to n - 1 do
    StringGrid3.Cells[i, 0] := arr[i].ToString();

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  close;
end;

procedure SortArray(var A: array of integer; n: integer); external 'Project1.dll';


procedure TForm1.Button5Click(Sender: TObject);
begin
  if (((arr[0] + arr[n-1]) / 2) < 8) then
    SortArray(arr, n - 1)
  else
    Showmessage
      ('??????? ?????????????? ??????? ? ?????????? ???????? ??????? ?????? ??? ????? 8');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  setlength(arr, n);
end;

end.
