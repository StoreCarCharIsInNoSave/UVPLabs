program Project1;
{$APPTYPE CONSOLE}
{$R *.res}
 uses math;
const
  eps = 0.001;
  k = 10;

var
  a, b, h, x, s, q, u, f: Real;
  n: Integer;

function Factorial(n: Integer): Integer;
begin
  if n = 1 then
    result := 1
  else if n = 2 then
    result := 2
  else
  begin
  result:=n*factorial(n-1);
  end;
end;

begin

  Write('Введите отрезок [a,b]->');
  ReadLn(a, b);
  h := (b - a) / k;
  x := a;
  WriteLn(' Таблица значений функции ');
  WriteLn('┌────┬────────┬────────┬───────┬────┐');
  WriteLn('│ x  │      S │   f    │    Q  │  n │');
  WriteLn('├────┼────────┼────────┼───────┼────┤');
  repeat
    s := 0;
    n := 1;
    u := 1;
    q := u;
    while (abs(q) > eps) do
    begin
      s := s + q;
      n := n + 1;
      u := u*(power(-1,n)*power(x,2*n));
      q := u / Factorial(2*n+1)
    end;
    f := sin(x)/x;
    WriteLn('│', x:4:2, '│', s:8:4, '│', f:8:4, '│', q:7:4, '│', n:3, ' │');
    x := x + h;
  until (x > b);
  WriteLn('└────┴────────┴────────┴───────┴────┘');
  ReadLn;

End.
