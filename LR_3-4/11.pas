﻿program z11;
var
  n, i: int64;
  p: real;
begin
  Write('Введите N только положительные: ');
  ReadLn(n);
  p := 1;
  for i := 2 to n do
    p := p * i;
Write(n, '! = ', p)

end.