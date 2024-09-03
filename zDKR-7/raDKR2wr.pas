uses GraphABC, sus;
//q,e - глубина
//w,a,s,d - сдвиг
//r,f - vfcinf,
var
  scale:real=1.0;
  depth:integer=4;
  x:real=0.0;
  y:real=0.0;
  start_x:integer=200;
  start_y:integer=400;
  end_x:integer=700;
  end_y:integer=400;
procedure redraw;
begin
  ClearWindow;
  kurwa(round(start_x*scale+x), round(start_y*scale+y), round(end_x*scale+x), round(end_y*scale+y), depth);
end;

procedure kay(key:integer);
begin
  case key of
    VK_s: begin y:=y-50; redraw; end;
    VK_w: begin y:=y+50; redraw; end;
    VK_d: begin x:=x-50; redraw; end;
    VK_a: begin x:=x+50; redraw; end;
    VK_r: begin scale:=scale*2; redraw; end;
    VK_f: begin scale:=scale/2; redraw; end;
    VK_e: begin depth:=depth+1; redraw; end;
    VK_q: if depth>0 then begin depth:=depth-1; redraw; end;
  end;
end;

begin
  SetWindowSize(800, 800);
  SetWindowCaption('Фрактал: Кривая дракона');
  OnKeyDown:=kay;
  redraw;
end.
