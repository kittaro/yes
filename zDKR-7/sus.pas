unit sus;
interface
uses graphABC;
procedure kurwa(x1,y1,x2,y2,depth: integer);
implementation
procedure kurwa(x1,y1,x2,y2,depth: integer);
begin
  if depth=0 then
    line(x1,y1,x2,y2)
  else
  begin
    var midX:=(x1+x2) div 2+(y2-y1) div 2;
    var midY:=(y1+y2) div 2-(x2-x1) div 2;

    kurwa(x1,y1,midX,midY, depth-1);
    kurwa(x2,y2,midX,midY, depth-1);
  end;
end;
end.