program uvp5;
{
Вариант 15 Орловский
Запись содержит сведения о продаже автомобилей. Структура
записи: номер магазина, марка автомобиля, количество , стоимость.
Обработка: распечатать сведения о автомобилях стоимостью более 40000.
}
uses crt;

const
  filename: string[10] = 'stud.dat';

type
  Sved = record
    Name: String[50];
    Store_number, Name_item, Number_of_product_units, Price_of_one_unit: integer;
  end;

var
  Rv: Sved;
  Fv, Fv1: file of Sved;
  i, n, rejim: byte;
  Store_number: 0..100;
  Name: String[50];
  Number_of_product_units: 1..100000; {100 000}
  Price_of_one_unit: 1..100000;{100 000}

procedure Sozd;
begin
  Assign(Fv, filename);
  Rewrite(Fv);
  while true do
    with Rv do
    begin
      clrscr;
      Write('Номер магазина (Окончание ввода "00")-->');
      Readln(Store_number);
      if Store_number = 00 then begin
        Close(fv);
        Exit; end;
      Write('Марка автомобиля -->');
      ReadLn(Name);
      Write('Количество единиц товара -->');
      ReadLn(Number_of_product_units);
      Write('Цена одной единицы-->');
      ReadLn(Price_of_one_unit);
      Write(Fv, Rv);
    end;
end;

procedure Vivod;
begin
  clrscr;
  WriteLn('Сведения:');
  WriteLn('┌──────────────────────┬─────────────────┬──────────────────────────┬─────────────┐');
  WriteLn('│ Номер магазина │ Название товара │ Количество единиц товара │ Цена товара │');
  WriteLn('├──────────────────────┼─────────────────┼──────────────────────────┼─────────────┤');
  Assign(Fv, filename);
  Reset(Fv);
  while not EOF(Fv) do
    with Rv do
    begin
      Read(Fv, Rv);
      WriteLn('│', Store_number:11, '│':12,
      Name:13, '│':5,
      Number_of_product_units:15, '│':12,
      Price_of_one_unit:10, '│':4);
    end;
  WriteLn('└──────────────────────┴─────────────────┴──────────────────────────┴─────────────┘');
  Close(Fv);
  repeat until KeyPressed;
end;

procedure Obr;
begin
  clrscr;
  WriteLn('список магазинов, имеющих заданный товар на общую сумму более 9 000 руб :');
  WriteLn('┌──────────────────────┬─────────────────┬──────────────────────────┬─────────────┐');
  WriteLn('│ Номер магазина │Марка автомобиля │ Количество единиц товара │ Цена товара │');
  WriteLn('├──────────────────────┼─────────────────┼──────────────────────────┼─────────────┤');
  Assign(Fv, filename);
  Reset(Fv);
  while not EOF(Fv) do
    with Rv do
    begin
      Read(Fv, Rv);
      if Price_of_one_unit > 40000 then
        WriteLn('│', Store_number:11, '│':12,
        Name:13, '│':5,
        Number_of_product_units:15, '│':12,
        Price_of_one_unit:10, '│':4);
    end;
  WriteLn('└──────────────────────┴─────────────────┴──────────────────────────┴─────────────┘');
  Close(Fv);
  repeat until KeyPressed;
end;

procedure Dobavl;
begin
  Assign(Fv, filename);
  Reset(Fv);
  Seek(Fv, FileSize(Fv));
  while true do
    with Rv do
    begin
      clrscr;
      Write('Номер магазина (Окончание ввода ++) -->');
      Readln(Store_number);
      if Store_number = 00 then
      begin
        Close(fv);
        Exit;
      end;
      Write('Марка автомобиля -->');
      ReadLn(Name);
      Write('количество единиц товара -->');
      ReadLn(Number_of_product_units);
      Write('цена одной единицы -->');
      ReadLn(Price_of_one_unit);
      Write(Fv, Rv);
    end;
end;

procedure Zam_zapisi;
begin
  clrscr;
  Assign(Fv, filename); Reset(Fv);
  Write('Введите номер заменяемой записи n=');
  ReadLn(n);
  with Rv do
  begin
    Write('номер магазина : ', Store_number, ' -->');
    ReadLn(Store_number);
    Write('Марка автомобиля: ', Name, ' -->');
    ReadLn(Name);
    Write('количество единиц товара : ', Number_of_product_units, ' -->');
    ReadLn(Number_of_product_units);
    Write('цена одной единицы: ', Price_of_one_unit, ' -->');
    ReadLn(Price_of_one_unit);
    Write(Fv, Rv);
  end;
  Seek(Fv, n - 1);
  Write(Fv, Rv);
  Close(Fv);
end;

procedure Zam_pol_zapisi;
var
  nom_pol: 1..5;
begin
  clrscr;
  Assign(Fv, filename); Reset(Fv);
  Write('Введите номер заменяемой записи n=');
  ReadLn(n);
  Seek(Fv, n - 1);
  Read(Fv, Rv);
  with Rv do
  begin
    Writeln('1 - номер магазина :', Store_number);
    Writeln('2 - марка автомобиля : ', Name);
    Writeln('3 - количество единиц товара : ', Number_of_product_units);
    Writeln('4 - цена одной единицы:', Price_of_one_unit);
    Writeln('Укажите номер заменяемого поля -->');
    ReadLn(nom_pol);
    case nom_pol of
      1:
        begin
          Write('номер магазина-->');
          ReadLn(Store_number);
        end;
      2:
        begin
          Write('марка автомобиля -->');
          ReadLn(Name);
        end;
      3:
        begin
          Write('количество единиц товара -->');
          ReadLn(Number_of_product_units);
        end;
      4:
        begin
          Write('цена одной единицы -->');
          ReadLn(Price_of_one_unit);
        end;
    end;
  end;
  Seek(Fv, n - 1);
  Write(Fv, Rv);
  Close(Fv);
end;

procedure Udal_zapisi;
begin
  clrscr;
  Assign(Fv, filename);
  Reset(Fv);
  Write('Введите номер удаляемой записи n = ');
  ReadLn(n);
  Assign(Fv1, 'temp.dat');
  Rewrite(fv1);
  i := 0;
  while not EOF(Fv) do
  begin
    Read(fv, rv);
    i := i + 1;
    if i <> n then write(Fv1, Rv);
  end;
  Close(Fv);
  Close(Fv1);
  Erase(Fv);
  Rename(Fv1, filename);
end;

begin
  while true do
  begin
    clrscr;
    WriteLn('Меню:');
    WriteLn('1 - Создание файла');
    WriteLn('2 - Вывод файла');
    WriteLn('3 - Обработка файла');
    WriteLn('4 - Расширение файла');
    WriteLn('5 - Замена записи');
    WriteLn('6 - Замена поля записи');
    WriteLn('7 - Удаление записи');
    WriteLn('8 - Выход');
    Write('Выберите режим ->');
    ReadLn(rejim);
    case rejim of
      1:
        begin
          Sozd;
        end;
      2:
        begin
          WriteLn('Исходный файл');
          Vivod;
        end;
      3:
        begin
          WriteLn('Обработка файла');
          Obr;
        end;
      4:
        begin
          dobavl;
        end;
      5:
        begin
          Zam_zapisi;
        end;
      6:
        begin
          Zam_pol_zapisi;
        end;
      7:
        begin
          Udal_zapisi;
        end;
      8: Exit;
    end;
  end;
end.
