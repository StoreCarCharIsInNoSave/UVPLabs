program Project1;
{$APPTYPE CONSOLE}
{$R *.res}
uses
  System.SysUtils;
var
  a: integer;
var
  vec: array of integer;
begin
  readln(a);
  var
    temp, size: integer;
  temp := a;
  size := 0;
  while temp <> 0 do
  begin
    if ((temp mod 10) mod 2 <> 0) then
      inc(size);
    temp := temp div 10;
  end;
  writeln(size);
  setlength(vec, size);
  var
  j := size - 1;
  while a <> 0 do
  begin
    if ((a mod 10) mod 2 <> 0) then
    begin
      vec[j] := a mod 10;
      dec(j)
    end;
    a := a div 10;
  end;
  var proiz:integer;
  proiz:=1;
  for var i := 0 to size - 1 do
    proiz:=proiz*vec[i];
    writeln('������������ �������� ���� ���������� ����� = ',proiz);
  readln;
end.
