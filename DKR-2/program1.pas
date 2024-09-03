const z=1000; //макс размер
var a: array[1..z] of integer; b: array[1..z] of boolean;
n, i, j, cnt: integer;

begin
  writeln('Введите размер массива (до ',z,'):');
  readln(n);
  if (n<1) or (n>z) then
  begin
    writeln('Неверный/слишком большой размер массива');
    exit;
  end;

  writeln('Введите элементы массива:');
  for i:=1 to n do read(a[i]);
  for i:=1 to n do
  begin
    cnt:=0;
    if not b[i] then //проверка на выведен ли
    begin
      for j:=1 to n do
      begin
        if (i<>j) and (a[i]=a[j]) then
        begin
          b[j]:=true; //уже выведены
          cnt:=cnt+1;
        end;
      end;
      b[i]:=true;
      cnt:=cnt+1;
      writeln('Элемент ', a[i], ' встречается ', cnt, ' раз(а)');
    end;
  end;
end.