program uvp6_1;
{y:=sin(x)+sqr(x)+3}
uses Graph;
const
 a=-7; b=7;
 wm=50; wn=40;
var
 driver,mode: Integer;
 i,wx,wy: Integer;
 x,y: Real;
begin
  driver:=Detect;
  initgraph(driver,mode,'');
  wx:=getmaxX div 2;
 wy:=getmaxY div 2;
 setcolor(red);
 setlinestyle(1,0,3);
 line(0,wy,getmaxX,wy);
 line(wx,0,wx,getmaxY);
 setcolor(white);
 outtextXY(wx+7,15,'Y');
 outtextXY(getmaxX-25,wy+6,'X');
 setcolor(green);
 setlinestyle(0,0,1);
 i:=1;
 while (wx-i*wm>0) or
 (wx+i*wm <getmaxX) do
begin
 line(wx-i*wm,0,
 wx-i*wm,getmaxY);
 line(wx+i*wm,0,wx+i*wm,getmaxY);
 inc(i);
end;
 i:=1;
while (wy-i*wn>0) or
 (wy+i*wn <getmaxX) do
 begin
 line(0,wy-i*wn,getmaxX,
 wy-i*wn);
 line(0,wy+i*wn,getmaxX,
 wy+i*wn);
 inc(i);
 end;
 i:=a*wm;
 while i<=b*wm do
 begin
 x:=i/wm;
 y:=sqrt(x+3*abs(x));
 putpixel(round(wx+wm*x),
 round(wy-wn*y),white);
 i:=i+1;
end;
readln;
 closegraph;
end.