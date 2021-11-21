library Project1;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes;

{$R *.res}
type matrix = array of array of integer;
const n=4;
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

procedure cpy(var a1, a2: array of Integer; const n: Integer);

var

  i: Integer;

begin
  for i := 0 to n - 1 do
    a1[i] := a2[i];

end;
exports cpy,GetMaxInMatrix, GetSumOfPositiveNumberInColumn, GetDoubledAverage;

begin
end.
