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

procedure SortArray(var A: array of integer; n: integer);
var
  i, j, temp: integer;
begin
  for i := 0 to n do
    for j := i + 1 to n do
    begin

      if (A[i] > A[j]) then
      begin
        temp := A[i];
        A[i] := A[j];
        A[j] := temp;
      end;
    end;

end;


exports SortArray;

begin






end.
