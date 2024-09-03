﻿type
 PNode = ^Node; // Определяем новый тип PNode, который является указателем на тип Node
 Node = record // Определяем новый тип Node, который является записью, состоящей из:
   _Word: string; // Поле для хранения строки (слова)
   Counter: integer; // Поле для хранения целочисленного счетчика 
   Next: PNode; // Поле для хранения указателя на следующий узел типа PNode
 end;

var
 Head, NewNode, q: PNode; // Объявляем три указателя Head, NewNode, q типа PNode
 Counter: integer; // Объявляем целочисленную переменную Counter
 w: string; // Объявляем строковую переменную w
 f: text; // Объявляем файловую переменную f типа text

// Функция для получения слова из файла
function GetWord(f: text): string;
var
 c: char; // Объявляем символьную переменную c
begin
 Result := ''; // Инициализируем результирующую строку пустой строкой
 c := ' '; // Инициализируем символьную переменную c пробелом
 while not (EOF(f)) and (c <= ' ') do // Пока не достигнут конец файла и текущий символ - пробел или меньше
   Read(f, c); // Читаем следующий символ из файла f в переменную c
 while not (EOF(f)) and (c > ' ') do // Пока не достигнут конец файла и текущий символ - не пробел
 begin
   Result += c; // Добавляем текущий символ c к результирующей строке
   Read(f, c); // Читаем следующий символ из файла f в переменную c
 end;
end;

// Функция для поиска слова в списке
function Find(Head: PNode; NewWord: string): PNode;
var
 q: PNode; // Объявляем временный указатель q типа PNode
begin
 q := Head; // Инициализируем указатель q указателем Head (начало списка)
 while (q <> nil) and (q^._Word <> NewWord) do // Пока не достигнут конец списка и текущее слово не равно искомому
   q := q^.Next; // Переходим к следующему узлу списка
 Result := q; // Возвращаем найденный узел (или nil, если слово не найдено)
end;

// Функция для создания нового узла
function CreateNode(NewWord: string): PNode;
var
 NewNode: PNode; // Объявляем временный указатель NewNode типа PNode
begin
 New(NewNode); // Выделяем динамическую память для нового узла
 NewNode^._Word := NewWord; // Записываем переданное слово в поле _Word нового узла
 NewNode^.Counter := 1; // Инициализируем счетчик нового узла единицей
 NewNode^.Next := nil; // Устанавливаем поле Next нового узла в nil (указатель на следующий узел пока отсутствует)
 Result := NewNode; // Возвращаем созданный новый узел
end;

// Функция для поиска места для нового узла в отсортированном списке 
function FindPlace(Head: PNode; NewWord: string): PNode;
var
 q: PNode; // Объявляем временный указатель q типа PNode
begin
 q := Head; // Инициализируем указатель q указателем Head (начало списка)
 while (q <> nil) and (NewWord > q^._Word) do // Пока не достигнут конец списка и новое слово больше текущего слова в узле
   q := q^.Next; // Переходим к следующему узлу списка
 Result := q; // Возвращаем найденное место для вставки нового узла (или nil, если новый узел должен быть первым)
end;

// Процедура для добавления нового узла в начало списка
procedure AddFirst(var Head: PNode; NewNode: PNode);
begin
 NewNode^.Next := Head; // Устанавливаем указатель Next нового узла на текущую голову списка
 Head := NewNode; // Обновляем указатель Head, чтобы он указывал на новый узел (новая голова списка)
end;

// Процедура для добавления нового узла после указанного узла
procedure AddAfter(p, NewNode: PNode);
begin
 NewNode^.Next := p^.Next; // Устанавливаем указатель Next нового узла на следующий узел после p
 p^.Next := NewNode; // Устанавливаем указатель Next узла p на новый узел
end;

// Процедура для добавления нового узла перед указанным узлом
procedure AddBefore(var Head: PNode; p, NewNode: PNode);
var
 q: PNode; // Объявляем временный указатель q типа PNode
begin
 q := Head; // Инициализируем указатель q указателем Head (начало списка)
 if (p = Head) then // Если указанный узел p является головой списка
   AddFirst(Head, NewNode) // Добавляем новый узел в начало списка
 else
 begin
   while (q <> nil) and (q^.Next <> p) do // Пока не достигнут конец списка и следующий узел не равен p
     q := q^.Next; // Переходим к следующему узлу списка
   if (q <> nil) then // Если предыдущий узел найден
     AddAfter(q, NewNode); // Добавляем новый узел после найденного предыдущего узла q
 end;
end;

begin
 Head := nil; // Инициализируем указатель Head как nil (пустой список)
 Assign(f, 'a.txt'); Reset(f); // Связываем файловую переменную f с файлом 'a.txt' и открываем его для чтения

 // Цикл для чтения слов из файла и добавления их в список
 while True do
 begin
   w := GetWord(f); // Получаем следующее слово из файла с помощью функции GetWord
   if (w = '') then // Если слово пустое
     break; // Выходим из цикла
   q := Find(Head, w); // Ищем слово w в списке с помощью функции Find
   if (q <> nil) then // Если слово найдено в списке
     Inc(q^.Counter) // Увеличиваем счетчик найденного узла
   else // Если слово не найдено в списке
   begin
     NewNode := CreateNode(w); // Создаем новый узел для слова w с помощью функции CreateNode
     q := FindPlace(Head, w); // Находим место для вставки нового узла в отсортированном списке с помощью функции FindPlace
     AddBefore(Head, q, NewNode); // Добавляем новый узел перед найденным местом q с помощью процедуры AddBefore
   end;
 end;
 Close(f); // Закрываем файл 'a.txt'

 Assign(f, 'output.txt'); Rewrite(f); // Связываем файловую переменную f с файлом 'output.txt' и открываем его для записи
 q := Head; // Устанавливаем указатель q на начало списка (Head)
 Counter := 0; // Инициализируем счетчик уникальных слов нулем

 // Цикл для записи каждого слова и его счетчика в файл
 while (q <> nil) do // Пока не достигнут конец списка
 begin
   Inc(Counter); // Увеличиваем счетчик уникальных слов
   Writeln(f, q^._Word, ': ', q^.Counter); // Записываем в файл текущее слово и его счетчик
   q := q^.Next; // Переходим к следующему узлу списка
 end;

 // Запись общего количества уникальных слов
 Writeln(f, Counter, ' уникальных слова '); // Записываем в файл общее количество уникальных слов
 Writeln(Counter, ' уникальных слова '); // Выводим в консоль общее количество уникальных слов

 Close(f); // Закрываем файл 'output.txt'
end.