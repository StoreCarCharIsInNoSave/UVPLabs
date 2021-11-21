{
Орловский пм 12 вариант 15
Если максимальный элемент матрицы меньше удвоенного
среднего арифметического элементов, расположенных над главной
диагональю, то отсортируйте столбцы матрицы по возрастанию сумм
положительных элементов столбцов методом линейного выбора с обменом. 
}
const
  n = 3;

type
  matrix = array of array of integer;






function GetSumOfNegativeNumberInColumn(a: array of integer): integer;
var
  sum, i: integer;
begin
  for i := 0 to n - 1 do if a[i] < 0 then sum := sum + a[i];
  result := sum;   
end;

function GetMaxInMatrix(z: matrix): integer;
var
  i, j, max: integer;
begin
  max := z[1][1];
  for j := 0 to n - 1 do
    for i := 0 to n - 1 do
      if max < z[i][j] then max := z[i][j];
  
  result := max;    
end;



var
  mat: matrix;

var
  i, j, max: integer;

begin
  setlength(mat, n);
  for i := 0 to n - 1 do setlength(mat[i], n);
  for j := 0 to n - 1 do
    for i := 0 to n - 1 do
      readln(mat[i][j]);
  
  
  writeln('Введенная матрица:');
  for j := 0 to n - 1 do
  begin
    for i := 0 to n - 1 do
    begin
      write(mat[i][j]:4)
    end;
    writeln;
  end;
  
  
  
  max := getMaxInMatrix(mat);
  
  if ((max > 4) and (max < 15)) then begin
    var min, r: array of integer;
    var i_min: integer;
    
    
    for i := 0 to n - 2 do
    begin
      min := mat[i];
      i_min := i;
      for j := i + 1 to n - 1 do
        if GetSumOfNegativeNumberInColumn(mat[j]) < GetSumOfNegativeNumberInColumn(min) then
        begin
          min := mat[j];
          i_min := j;
        end;
      r := mat[i_min];
      mat[i_min] := mat[i];
      mat[i] := r;
    end;
    
    
    
    
    writeln('Полученная матрица:');
    for j := 0 to n - 1 do
    begin
      for i := 0 to n - 1 do
      begin
        write(mat[i][j]:4)
      end;
      writeln;
    end;
  end else writeln('Максимальный элемент матрицы больше или равен среднему удвоенному среднему арифметическому чисел расположенных выше главной диагонали');
  
  
end.