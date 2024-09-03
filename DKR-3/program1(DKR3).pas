uses Crt;

function f(x:real):real;
begin f:=2*power(x,3)+(-2)*sqr(x)+3*x+9; end;

function lev_r(a, b:real; n:integer): real; //левые квадраты
var h,sum:real; i:integer;
begin
  h:=(b-a)/n;
  sum:=0;
  for i:=0 to n-1 do sum:=sum+f(a+i*h);
  result:=sum*h;
end;

function erawr(a, b: real): real; //погрешность
begin
  result:=2*power(b,4)/4-2*power(b,3)/3+3*sqr(b)/2+9*b 
          -
         (2*power(a,4)/4-2*power(a,3)/3+3*sqr(a)/2+9*a);
end;

procedure result; //ввод и вывод
var a,b,s,y:real; n,g:integer;
begin
  repeat
    writeln('Введите границы интегрирования (до 1000): ');
    readln(a,b);
  until (a<=1000) or (b<=1000);

  repeat
    write('Введите число промежутков (до 1000): ');
    readln(n);
  until (n<=1000);

  s:=lev_r(a,b,n);
  y:=erawr(a,b);

  writeln('Приблизительное значение площади = ', abs(s):1:7);
  writeln('Точное значение площади = ', abs(y):1:7);
  writeln('Абсолютная погрешность = ', abs(y-s):1:7);
//  writeln('Относительная погрешность = ', abs(y-s)/y);
  writeln;
end;


var g:integer;
begin
  repeat
    writeln('1. Вычисление площади фигуры, ограниченной кривой');
    writeln('2. Выход');
    write('Выберите действие: ');
    readln(g);
    case g of
      1: result;
      2: halt;
    end;
  until g=2;
end.