program Project1;
{$APPTYPE CONSOLE}
{$R *.res}
uses
  System.SysUtils;

var
  a: integer;

begin
  readln(a);
  var proiz:integer;
  proiz:=1;
  while a <> 0 do
  begin
    if ((a mod 10) mod 2 <> 0) then
      proiz:=proiz* (a mod 10);
    a := a div 10;
  end;
    writeln('������������ �������� ���� ���������� ����� = ',proiz);
  readln;
end.

