const MAXSIZE = 50; // Объявляем константу MAXSIZE со значением 50

type Stack = record // Определяем новый тип Stack, который является записью, состоящей из:
  tags: array[1..MAXSIZE] of integer; // Массива целочисленных значений размером MAXSIZE
  size: integer; // Поля для хранения количества элементов в стеке
end;

procedure Push(var S: Stack; x: integer); // Процедура для добавления элемента в стек
begin
  if S.size = MAXSIZE then Exit; // Если стек заполнен, выходим из процедуры
  S.size := S.size + 1; // Увеличиваем количество элементов в стеке
  S.tags[S.size] := x; // Добавляем элемент x в конец стека
end;

function Pop(var S: Stack): integer; // Функция для извлечения элемента из стека
begin
  if S.size = 0 then begin // Если стек пуст
    Result := 0; // Возвращаем 0
    Exit; // Выходим из функции
  end;
  Result := S.tags[S.size]; // Присваиваем Result значение последнего элемента стека
  S.size := S.size - 1; // Уменьшаем количество элементов в стеке
end;

function isEmptyStack(S: Stack): Boolean; // Функция для проверки, пуст ли стек
begin
  Result := (S.size = 0); // Возвращаем True, если количество элементов в стеке равно 0
end;

var
  input, output: text; // Объявляем файловые переменные input и output типа text
  x: integer; // Объявляем целочисленную переменную x
  S: Stack; // Объявляем переменную S типа Stack

begin
  S.size := 0; // Инициализируем размер стека как 0 (пустой стек)
  Assign(input, '1.txt'); // Связываем файловую переменную input с файлом '1.txt'
  Assign(output, '2.txt'); // Связываем файловую переменную output с файлом '2.txt'
  Reset(input); // Открываем файл '1.txt' для чтения
  Rewrite(output); // Открываем файл '2.txt' для записи

  while not EOF(input) do begin // Цикл для чтения элементов из файла '1.txt'
    Readln(input, x); // Считываем элемент x из файла '1.txt'
    Push(S, x); // Добавляем элемент x в стек с помощью процедуры Push
  end;

  If isEmptyStack(S) then writeln('Стек пуст') // Если стек пуст, выводим сообщение
  Else
  Begin
    While (S.size > 0) do // Цикл для извлечения элементов из стека
      writeln(output, Pop(s)); // Извлекаем элемент из стека с помощью функции Pop и записываем его в файл '2.txt'
  end;

  Close(input); // Закрываем файл '1.txt'
  Close(output); // Закрываем файл '2.txt'
end.