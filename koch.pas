uses CRT, GraphABC, KochModule;

var
  scale: Real = 1.0; // Масштаб
  depth: Integer = 6; // Глубина прорисовки
  offsetX: Integer = 1;
  offsetY: Integer = 1; // Смещение фигуры

procedure HandleInput;
var
  ch: Char;
begin
  repeat
    ch := ReadKey;
    case ch of
      #43: // Клавиша "+"
      begin
        depth := depth + 1; // Увеличиваем глубину
        DrawSnowflake(scale, offsetX, offsetY, depth);
      end;
      #45: // Клавиша "-"
      begin
        if depth > 0 then
          depth := depth - 1; // Уменьшаем глубину
        DrawSnowflake(scale, offsetX, offsetY, depth);
      end;
      #119, #87: // Клавиши "W" или "w"
      begin
        offsetY := offsetY - 10; // Перемещение вверх
        DrawSnowflake(scale, offsetX, offsetY, depth);
      end;
      #115, #83: // Клавиши "S" или "s"
      begin
        offsetY := offsetY + 10; // Перемещение вниз
        DrawSnowflake(scale, offsetX, offsetY, depth);
      end;
      #97, #65: // Клавиши "A" или "a"
      begin
        offsetX := offsetX - 10; // Перемещение влево
        DrawSnowflake(scale, offsetX, offsetY, depth);
      end;
      #100, #68: // Клавиши "D" или "d"
      begin
        offsetX := offsetX + 10; // Перемещение вправо
        DrawSnowflake(scale, offsetX, offsetY, depth);
      end;
      #122, #90: // Клавиши "Z" или "z"
      begin
        scale := scale * 1.1; // Увеличение масштаба
        DrawSnowflake(scale, offsetX, offsetY, depth);
      end;
      #120, #88: // Клавиши "X" или "x"
      begin
        scale := scale / 1.1; // Уменьшение масштаба
        DrawSnowflake(scale, offsetX, offsetY, depth);
      end;
    end;
  until ch = #27; // Выход по нажатию Esc
end;

begin
  SetWindowSize(1000, 800); // Устанавливаем размер окна
  SetWindowCaption('Фракталы: Снежинка Коха (Управление: +/-, W/A/S/D, Z/X, Esc)');
  
  DrawSnowflake(scale, offsetX, offsetY, depth); // Первоначальная отрисовка
  
  HandleInput; // Обработка ввода
end.

