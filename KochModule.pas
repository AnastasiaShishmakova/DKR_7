unit KochModule;

interface

uses GraphABC;

procedure DrawSnowflake(scale: Real; offsetX, offsetY: Integer; depth: Integer);//параметризация

implementation

procedure Draw(x, y, l, u: Real; t: Integer);//параметризация
procedure Draw2(var x, y: Real; l, u: Real; t: Integer);//параметризация
begin
  Draw(x, y, l, u, t);
  x := x + l * cos(u);
  y := y - l * sin(u);
end;
begin
  if t > 0 then //базовый случай
  begin
    l := l / 3;//декомпозиция,рекурсивный шаг
    Draw2(x, y, l, u, t - 1);//декомпозиция, рекурсивный вызов
    Draw2(x, y, l, u + pi / 3, t - 1);//декомпозиция, рекурсивный вызов
    Draw2(x, y, l, u - pi / 3, t - 1);//декомпозиция, рекурсивный вызов
    Draw2(x, y, l, u, t - 1);//декомпозиция, рекурсивный вызов
  end
  else//базовый случай
    Line(Round(x), Round(y), Round(x + cos(u) * l), Round(y - sin(u) * l));
end;

procedure DrawSnowflake(scale: Real; offsetX, offsetY: Integer; depth: Integer);//параметризация
begin
  ClearWindow; // Очистка окна перед перерисовкой
  // Рисуем три стороны снежинки Коха
  Draw(10 * scale + offsetX, 354 * scale + offsetY, 400 * scale, pi / 3, depth);
  Draw(410 * scale + offsetX, 354 * scale + offsetY, 400 * scale, pi, depth);
  Draw(210 * scale + offsetX, 8 * scale + offsetY, 400 * scale, -pi / 3, depth);
end;

end.
