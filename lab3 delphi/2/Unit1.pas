unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    fsdf1: TMenuItem;
    fsdfsd1: TMenuItem;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    Button1: TButton;
    N1: TMenuItem;
    Panel2: TPanel;
    StringGrid2: TStringGrid;
    Button2: TButton;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fsdf1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure fsdfsd1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
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
  n = 4;

type
  matrix = array of array of Integer;
    type vector = array of integer;
var
  mat: matrix;

var
  i, j: Integer;

function GetDoubledAverage(z: matrix): double;
var
  i, j, sum, counter: Integer;
begin
  for j := 0 to n - 1 do
    for i := 0 to n - 1 do
      if j < i then
      begin
        sum := sum + z[i, j];
        counter := counter + 1;
      end;
  result := 2 * (sum / counter);
end;

function GetSumOfPositiveNumberInColumn(a: array of Integer): Integer;
var
  sum, i: Integer;
begin
  for i := 0 to n - 1 do
    if a[i] > 0 then
      sum := sum + a[i];
  result := sum;
end;

function GetMaxInMatrix(z: matrix): Integer;
var
  i, j, max: Integer;
begin
  max := z[1][1];
  for j := 0 to n - 1 do
    for i := 0 to n - 1 do
      if max < z[i][j] then
        max := z[i][j];

  result := max;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  for var j := 0 to n - 1 do
    for var i := 0 to n - 1 do
      mat[i, j] := StringGrid1.Cells[i, j].ToInteger();
  Panel1.Hide();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Panel2.Hide();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Panel2.Hide();
  Panel1.Hide();
  setlength(mat, n);
  for var i := 0 to n - 1 do
    setlength(mat[i], n);

end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  var
    p: Tpoint;
  getcursorpos(p);
  if Button = mbRight then
    PopupMenu1.Popup(p.X, p.Y);

end;

procedure TForm1.fsdf1Click(Sender: TObject);
begin
  Panel1.Show();
end;

procedure TForm1.fsdfsd1Click(Sender: TObject);
begin
  Panel2.Show();
  for var j := 0 to n - 1 do
  begin
    for var i := 0 to n - 1 do
    begin
      StringGrid2.Cells[i, j] := mat[i, j].ToString();
    end;

  end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
  min, r: array of integer;
var
  i_min, i: Integer;
begin
  if GetMaxInMatrix(mat) < GetDoubledAverage(mat) then
  begin
    for i := 0 to n - 2 do
    begin
      min := mat[i];
      i_min := i;
      for j := i + 1 to n - 1 do
        if GetSumOfPositiveNumberInColumn(mat[j]) <
          GetSumOfPositiveNumberInColumn(min) then
        begin
          min := mat[j];
          i_min := j;
        end;
      r := mat[i_min];
      mat[i_min] := mat[i];
      mat[i] := r;
    end;
  end;

end.