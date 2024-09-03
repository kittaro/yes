const n=1000;
var orig:string; 
sus:array[1..n] of char;
b:array[1..n] of boolean;
i,j,cnt:integer;

begin
  writeln('Введите строку:');
  readln(orig);
  if (length(orig)<3) or (length(orig)>n) then begin
    writeln('Слишком большая/маленькая длина строки');
    exit;
  end;

  for i:=1 to length(orig) do sus[i]:=orig[i];
  cnt:=0;
  for i:=1 to length(orig)-2 do begin
    if not b[i] then begin
      for j:=i+1 to length(orig)-2 do begin
        if (sus[i]=sus[j]) and (sus[i+1]=sus[j+1]) and (sus[i+2]=sus[j+2]) then begin
          b[j]:=true;
          b[i]:=true;
        end;
      end;
      if not b[i] then begin
        cnt:=cnt+1;
        writeln('Уникальная подстрока: ', sus[i], sus[i+1], sus[i+2]);
      end;
    end;
  end;
  writeln('Количество уникальных подстрок из трех символов: ', cnt);
end.