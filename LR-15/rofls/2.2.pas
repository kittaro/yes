type
  PNode = ^Node; // Определяем новый тип PNode, который является указателем на тип Node
  Node = record // Определяем новый тип Node, который является записью, состоящей из:
    data: integer; // Поле для хранения целочисленных данных
    next: PNode; // Поле для хранения указателя на следующий узел типа PNode
  end;

var
  Head, Temp: PNode; // Объявляем два указателя Head и Temp типа PNode
  f: TextFile; // Объявляем файловую переменную f типа TextFile
  value: integer; // Объявляем целочисленную переменную value

// Функция создания узла
function CreateNode(value: integer): PNode;
var
  NewNode: PNode; // Объявляем временный указатель NewNode типа PNode
begin
  New(NewNode); // Выделяем динамическую память для нового узла
  NewNode^.data := value; // Записываем переданное значение value в поле data нового узла
  NewNode^.next := nil; // Устанавливаем поле next нового узла в nil (указатель на следующий узел пока отсутствует)
  Result := NewNode; // Возвращаем созданный новый узел
end;

// Процедура добавления узла в список
procedure AddNode(var Head: PNode; NewNode: PNode);
var
  Temp: PNode; // Объявляем временный указатель Temp типа PNode
begin
  if Head = nil then // Если список пустой
    Head := NewNode // Новый узел становится головой списка
  else
  begin
    Temp := Head; // Инициализируем указатель Temp указателем Head (начало списка)
    while Temp^.next <> nil do // Пока не достигнут конец списка
      Temp := Temp^.next; // Переходим к следующему узлу списка
    Temp^.next := NewNode; // Устанавливаем указатель next последнего узла на новый узел
  end;
end;

// Процедура вывода списка на экран
procedure PrintList(Head: PNode);
var
  Temp: PNode; // Объявляем временный указатель Temp типа PNode
begin
  Temp := Head; // Инициализируем указатель Temp указателем Head (начало списка)
  while Temp <> nil do // Пока не достигнут конец списка
  begin
    Write(Temp^.data, ' '); // Выводим значение data текущего узла
    Temp := Temp^.next; // Переходим к следующему узлу списка
  end;
  Writeln; // Переходим на новую строку
end;

// Процедура добавления узлов из файла в список
procedure AddNodesFromFile(var Head: PNode; var f: TextFile);
var
  NewNode: PNode; // Объявляем временный указатель NewNode типа PNode
begin
  while not EOF(f) do // Пока не достигнут конец файла
  begin
    Read(f, value); // Читаем следующее значение из файла f в переменную value
    NewNode := CreateNode(value); // Создаем новый узел с прочитанным значением value с помощью функции CreateNode
    AddNode(Head, NewNode); // Добавляем новый узел в список с помощью процедуры AddNode
  end;
end;

begin
  AssignFile(f, '1337.txt'); // Связываем файловую переменную f с файлом '1337.txt'
  Reset(f); // Открываем файл '1337.txt' для чтения
  Head := nil; // Инициализируем указатель Head как nil (пустой список)

  // Добавление чисел из файла в список
  AddNodesFromFile(Head, f); // Вызываем процедуру для добавления узлов из файла в список

  CloseFile(f); // Закрываем файл '1337.txt'

  if Head = nil then // Если список пустой
  begin
    writeln('чето пусто как-то'); // Выводим сообщение о пустом списке
    exit // Завершаем программу
  end
  else
  begin
    // Вывод списка на экран
    PrintList(Head); // Вызываем процедуру для вывода списка на экран

    // Вывод только четных элементов списка
    Temp := Head; // Инициализируем указатель Temp указателем Head (начало списка)
    Writeln('Четные элементы:');
    while Temp <> nil do // Пока не достигнут конец списка
    begin
      if Temp^.data mod 2 = 0 then // Если значение data текущего узла четное
        Write(Temp^.data, ' '); // Выводим это значение
      Temp := Temp^.next; // Переходим к следующему узлу списка
    end;
  end;
end.