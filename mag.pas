uses events, graphabc;

type
 Tunit = record
 at,hp,hpp,df,mp,mpp,x,xx,yy,y:integer;
end;

var x,y,a,d,c,cp,b,e,T,i,q,p,j,z,xp,xpp,ll,lut,hil,man,time,sbros,uroven,k:integer;
    sav:text;
    lox:array [1..101] of tunit;
    musa, mus : System.Media.SoundPlayer;


procedure klak(key:integer); forward;
procedure shop(key:integer); forward;
procedure lvl(lv:integer); forward;
procedure dif(key:integer); forward;
procedure win; forward;

{procedure beg(key:integer);
 begin
  case key of
   87: d := d - 1;
   83: d := d + 1;
   vk_enter:
   begin
    if d = 0 then if FileExists('a.txt')=true then
    begin
     assign(t,'a.txt');
     reset(t);
     readln(t,a,b);
     close(t);
    end else
    begin
     assign(t,'a.txt');
     rewrite(t);
     readln(t,a,b);
     close(t);
    end;
    if d=1 then if FileExists('002.txt')=true then
    begin
     assign(t,'002.txt');
     reset(t);
     readln(t,a,b);
     close(t);
    end else
    begin
     assign(t,'002.txt');
     rewrite(t);
     readln(t,a,b);
     close(t);
    end;
    if d=2 then if FileExists('003.txt')=true then
    begin
     assign(t,'003.txt');
     reset(t);
     readln(t,a,b);
     close(t);
    end else
    begin
     assign(t,'003.txt');
     rewrite(t);
     readln(t,a,b);
     close(t);
    end;
  end;
  
  if d = -1 then d := 2;
  if d = 3 then d := 0;
  clearwindow;
  textout(530,200,'Выберите сохранение');
  if FileExists('a.txt')=true then
   textout(500,250,'save 1') else
   textout(500,250,'new');
  if FileExists('002.txt')=true then
   textout(500,30,'save 2') else
   textout(500,300,'new');
  if FileExists('003.txt')=true then
   textout(500,350,'save 3') else
   textout(500,350,'new');
  SetPenWidth(1);  
  setpencolor(clblue);
  line(700+x,258+d*50,700+x,278+d*50);
  line(680+x,268+d*50,700+x,278+d*50);
  line(680+x,268+d*50,700+x,258+d*50); 
  floodfill(699+x,268+d*50,clblue);
 end;}

procedure dif(key:integer);
 var i : integer;
 begin
  case key of
   87: d:=d-1;
   83: d:=d+1;
   vk_return:
   begin
    xpp:=50;
    t:=1;
    ll:=1;
    for i:=1 to 30 do
    begin
     lox[i].at:=10-2*d;lox[1].at:=5;lox[1].mp:=60;lox[1].x:=650;lox[1].y:=300;lox[1].hp:=60;lox[1].mpp:=60;lox[1].hpp:=60;c:=25;
    end;
    for i:=2  to 10 do lox[i].hp:=39-(5*d);
    for i:=11 to 20 do lox[i].hp:=79-(10*d);
    for i:=21 to 30 do lox[i].hp:=149-(20*d);
    for i:=2 to 30 do
    begin
     lox[i].x:=random(1190); lox[i].y:=random(590); //lox[i].hp:=-10;
    end;
    hil:=d;
    man:=d;
    e:=1;
    uroven:=1;
    onkeydown:=lvl; end;
   end;
  if d=-1 then d:=2;
  if d=3 then d:=0;
  if d=0 then x:=60;
  if d=1 then x:=60;
  if d=2 then x:=30;
  clearwindow;
  SetPenWidth(1);setpencolor(clblue);
  line(700+x,258+d*50,700+x,278+d*50);line(680+x,268+d*50,700+x,278+d*50);line(680+x,268+d*50,700+x,258+d*50); floodfill(699+x,268+d*50,clblue);
  textout(460,150,'выберите уровень сложности:');
  textout(600,250,'сложный');setpencolor(clred);circle(570,260,8);
  textout(600,300,'средний');setpencolor(clgreen);circle(570,310,8);
  textout(600,350,'легкий'); setpencolor(clblue);circle(570,360,8);
  if (e=1) and (d=0) then floodfill(570,260,clred);
  if (e=1) and (d=1) then floodfill(570,310,clgreen);
  if (e=1) and (d=2) then floodfill(570,360,clblue);
  if e=1 then begin 
   sleep(100);
   clearwindow;
   setfontsize(60);
   textout(350,300,'Нажмите Пробел');
   e:=0;
   setfontsize(20);
  end;
 end;
 
procedure save(key:integer);

 var i : integer;
 begin
 case key of
  vk_return:
   begin
    for i:=1 to 30 do
    begin
     lox[i].at:=20-5*d;lox[1].x:=650;lox[1].y:=300;
    end;
    for i:=2  to 10 do lox[i].hp:=200-(30*d);
    for i:=11 to 20 do lox[i].hp:=300-(40*d);
    for i:=21 to 30 do lox[i].hp:=400-(50*d);
    for i:=2 to 30 do
    begin
     lox[i].x:=random(1190); lox[i].y:=random(590);
    end;
    hil:=hil+d;
    man:=man+d;
    e:=1;
    onkeydown:=klak;
    assign(sav,'a.txt');
    rewrite(sav);
    uroven:=2;
    writeln(sav,'1',lox[1].hp,' ',lox[1].mp,' ',lox[1].hpp,' ',lox[1].mpp,' ',lox[1].at,' ',c,' ',d,' ',hil,' ',man);
    close(sav);
    p:=0;
    z:=0;
   end;
  end;
  textout(300,300,'Ваш процесс будет сохранён!');
  win;
 end;

procedure dead(key:integer);
 begin
  SetFontSize(60);
  clearwindow;
  setpencolor(clwhite);setpenwidth(1000);line(1300,0,1300,900);
  textout(450,260,'You Dead');
  floodfill(1,1,clred);
 end;

procedure win;
 var i : integer;
 begin
  SetFontSize(60);
  while i < 10000 do
   begin
    clearwindow;
    setpencolor(clwhite);
    setpenwidth(1000);
    line(1300,0,1300,900);
    for i:=1 to 100 do
    with lox[i] do
     begin
      textout(400,260,'You Win');
      x:=random(1400);
      y:=random(700);
      setpencolor(rgb(random(256), random(256),random(256)));
      setpenwidth(5);
      line(x,y-20,x-14,y+14);
      line(x-14,y+14,x+18,y-8);
      line(x+18,y-8,x-18,y-8);
      line(x-18,y-8,x+14,y+14);
      line(x+14,y+14,x,y-20);
     end;
   sleep(100);
  end;
 end;

procedure shop(key: integer);
 begin
  case key of
   87: q:=q-1;
   83: q:=q+1;
   vk_return:begin with lox[1] do begin
   if (q=0) and (lut>=100) then begin hil:=hil+1;lut:=lut-100;textout(870,150,'+1');end else
   if (q=1) and (lut>=100) then begin man:=man+1;lut:=lut-100;textout(870,200,'+1');end else
   if (q=2) and (lut>=50) then begin hpp:=hpp+10;lut:=lut-50;textout(870,250,'+10');end else
   if (q=3) and (lut>=50) then begin mpp:=mpp+10;lut:=lut-50;textout(870,300,'+10');end else
   if (q=4) and (lut>=50) then begin at:=at+3;lut:=lut-50;textout(870,350,'+3');end;end;end;
   70: begin onkeydown:=klak; e:=1;end;
   112:k:=100;
   72:if k = 100 then k:=1 else begin k:=0;j:=0;end;
   73:if k = 1 then k:=2 else begin k:=0;j:=0;end;
   76:if k = 2 then k:=3 else if k = 3 then if (hil=3) and (man=1) then begin lox[1].hpp:=9999;lox[1].hp:=lox[1].hpp;k:=0;p:=29;end else begin k:=0;j:=0;end;
   77:if k = 100 then j:=1 else begin j:=0;k:=0;end;
   78:if j = 1 then j:=2 else if j = 8 then j:=9 else begin j:=0;k:=0;end;
   79:if j = 2 then j:=3 else if j = 4 then j:=6 else begin j:=0;k:=0;end;
   71:if j = 3 then j:=4 else if j = 10 then lut:=99999 else begin j:=0;k:=0;end;
   68:if j = 6 then j:=7 else begin j:=0;k:=0;end;
   69:if j = 7 then j:=8 else if j = 9 then j:=10 else begin j:=0;k:=0;end;
  end;
  if q=-1 then q:=4;
  if q=5  then q:=0;
  if q=0  then x:=110;
  if q=1  then x:=100;
  if q=2  then x:=50;
  if q=3  then x:=50;
  if q=4  then x:=50;
  clearwindow;setpencolor(clwhite);setpenwidth(1000);line(1300,0,1300,1000);SetPenWidth(1);setpencolor(clred);
  line(500+x,158+q*50,500+x,178+q*50);line(480+x,168+q*50,500+x,178+q*50);line(480+x,168+q*50,500+x,158+q*50);floodfill(499+x,168+q*50,clred);
  textout(460,100,'ассортимент:');
  textout(350,150,'100 зелье жизни');textout(800,150,inttostr(hil));
  textout(350,200,'100 зелье маны');textout(800,200,inttostr(man));
  textout(362,250,'50 health up');textout(800,250,inttostr(lox[1].hpp));
  textout(362,300,'50 mana up');textout(800,300,inttostr(lox[1].mpp));
  textout(362,350,'50 attack up');textout(800,350,inttostr(lox[1].at));
  textout(500,400,'money');textout(600,400,inttostr(lut));
  if e=1 then begin clearwindow;setfontsize(60);textout(350,300,'Нажмите Пробел');e:=0; end;
 end;

procedure lvl(lv: integer);
 begin
  case lv of
   87:if e = 0 then q:=q-1;
   83:if e = 0 then q:=q+1;
   65:if e = 2 then q:=q-1;
   68:if e = 2 then q:=q+1;{
   Vk_shift:
            begin
             if (e = 0) and (cp = 0) then begin e:=1;end;
             if (e = 0) and (cp > 0) then e:=2;
            end;}
   vk_return:
   begin
    with lox[1] do
    begin
     if e = 0 then
     begin
      if (q = 0) and (c > 0) then begin mpp:=mpp+4; mp:=mp+4; textout(870,150,'+4'); sleep(100);c:=c-1; cp:=cp+1; lox[100].mp:=lox[100].mp+4; end;
      if (q = 1) and (c > 0) then begin hpp:=hpp+4; hp:=hp+4; textout(870,200,'+4'); sleep(100);c:=c-1; cp:=cp+1; lox[100].hp:=lox[100].hp+4; end;
      if (q = 2) and (c > 0) then begin at := at + 1; textout(870,250,'+1'); sleep(100); c:=c-1; cp:=cp+1;lox[100].at:=lox[100].at+1; end;
      if q = 3 then e:=2;
     end;
    if e = 2 then
     begin
      if q=1 then begin lox[1].hp:=lox[1].hp-lox[100].hp;lox[1].mp:=lox[1].mp-lox[100].mp;lox[1].hpp:=lox[1].hpp-lox[100].hp;lox[1].mpp:=lox[1].mpp-lox[100].mp;lox[1].at:=lox[1].at-lox[100].at;e:=0;c:=c+cp;cp:=0;lox[100].hp:=0;lox[100].mp:=0;lox[100].at:=0;end;
      if q=0 then begin e:=0;lox[100].hp:=0;lox[100].mp:=0;lox[100].at:=0;cp:=0;onkeydown:=klak;e:=1end;
     end;
    end;
   end;
  end;
  clearwindow;
  SetPenWidth(1);setpencolor(clred);
  if e = 0 then
  begin
   if q=-1 then q:=3;
   if q=4 then q:=0;
   if q=0 then x:=0;
   if q=1 then x:=60;
   if q=2 then x:=10;
   if q=3 then x:=195;
   line(500+x,158+q*50,500+x,178+q*50);line(480+x,168+q*50,500+x,178+q*50);line(480+x,168+q*50,500+x,158+q*50); floodfill(499+x,168+q*50,clred);
   textout(460,100,'Выберите улучшение:');
   textout(400,150,'Мана');textout(800,150,inttostr(lox[1].mpp));
   textout(400,200,'Здоровье');textout(800,200,inttostr(lox[1].hpp));
   textout(400,250,'Атака');textout(800,250,inttostr(lox[1].at));
   textout(550,300,'Принять');
   textout(650,335,'oy:');textout(700,335,inttostr(c));
  end;
  if e = 2 then
  begin
   if q = -1 then q:=1;
   if q = 2 then q:=0;
   if q = 3 then q:=0;
   if q = 4 then q:=0;
   line(530+q*300,308,530+q*300,328);line(510+q*300,318,530+q*300,328);line(510+q*300,318,530+q*300,308); floodfill(529+q*300,318,clred);
   textout(500,200,'Распределить очки?');
   textout(450,300,'Да');
   textout(750,300,'Нет');
  end;
  if e=1 then begin clearwindow;setfontsize(60);textout(350,300,'Нажмите Пробел');setfontsize(20);e:=0;q:=0;cp:=0; end;
 end;

procedure boy(n:integer;x1:integer;y1:integer;x2:integer;y2:integer;k:integer;mpi:integer);
var i:integer;
 begin
  lox[1].mp:=lox[1].mp-mpi;
  for i:=1 to 31 do
  if n<>i then
   with lox[i] do
    begin
     if (x2>x) and (x2<x+9) and (y1>y) and (y1<y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k
     else if (x2>=x) and (x2<=x+9) and (y2>=y) and (y2<=y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k
     else if (x1>=x) and (x1<=x+9) and (y1>=y) and (y1<=y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k
     else if (x1>=x) and (x1<=x+9) and (y2>=y) and (y2<=y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k
     else if (x1>=x) and (x1<=x+9) and (y2>=y) and (y2<=y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k
     else if (x1>=x) and (x1<=x+9) and (((y2-y1)/2)+y1>=y) and (((y2-y1)/2)+y1<=y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k
     else if (x2>=x) and (x2<=x+9) and (((y2-y1)/2)+y1>=y) and (((y2-y1)/2)+y1<=y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k
     else if (((x2-x1)/2)+x1>=x) and (((x2-x1)/2)+x1<=x+9) and (y1>y) and (y1<=y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k
     else if (((x2-x1)/2)+x1>=x) and (((x2-x1)/2)+x1<=x+9) and (y2>y) and (y2<=y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k
     else if (((x2-x1)/2)+x1>=x) and (((x2-x1)/2)+x1<=x+9) and (((y2-y1)/2)+y1>=y) and (((y2-y1)/2)+y1<=y+9) then lox[i].hp:=lox[i].hp-lox[n].at*k;
    end;
 end;

procedure klak(key:integer);
 var i : integer;
begin
with lox[1] do begin
 if (hp>0) then begin
 case key of
  83:begin setpencolor(clwhite);  rectangle(x,y,x+6,y+6);  rectangle(x+2,y+2,x+4,y+4);  y:=y+10;end;
  68:begin setpencolor(clwhite);  rectangle(x,y,x+6,y+6);  rectangle(x+2,y+2,x+4,y+4);  x:=x+10;end;
  87:begin setpencolor(clwhite);  rectangle(x,y,x+6,y+6);  rectangle(x+2,y+2,x+4,y+4);  y:=y-10;end;
  65:begin setpencolor(clwhite);  rectangle(x,y,x+6,y+6);  rectangle(x+2,y+2,x+4,y+4);  x:=x-10;end;
  //vk_space:begin if mp>19 then begin arc(x+3,y+3,10,0,35);sleep(100);arc(x+3,y+3,10,45,80);sleep(100);arc(x+3,y+3,10,90,125);sleep(100);arc(x+3,y+3,10,135,170);sleep(100);arc(x+3,y+3,10,180,215);sleep(100);arc(x+3,y+3,10,225,260);sleep(100);arc(x+3,y+3,10,270,315);sleep(100);arc(x+3,y+3,10,315,350);sleep(100);setpencolor(clwhite);circle(x+3,y+3,9);sleep(100);setpencolor(clblack);circle(x+3,y+3,18);sleep(100);circle(x+3,y+3,27);sleep(100);circle(x+3,y+3,36);sleep(100);circle(x+3,y+3,49);
  //{1}boy(1,x+3-49,y+3-49,x+3-31,y+3-31,3,0);boy(1,x+3-49,y+3-22,x+3-4,y+3-4,3,0);boy(1,x+3-31,y+3-49,x+3-4,y+3-31,3,0);boy(1,x+3-22,y+3-22,x+3-4,y+3-4,3,0);{2}boy(1,x+3+49,y+3-49,x+3+31,y+3-31,3,0);boy(1,x+3+49,y+3-22,x+3+4,y+3-4,3,0);boy(1,x+3+31,y+3-49,x+3+4,y+3-31,3,0);boy(1,x+3+22,y+3-22,x+3+4,y+3-4,3,0);{3}boy(1,x+3-49,y+3+49,x+3-31,y+3+31,3,0);boy(1,x+3-49,y+3+22,x+3-4,y+3+4,3,0);boy(1,x+3-31,y+3+49,x+3-4,y+3+31,3,0);boy(1,x+3-22,y+3+22,x+3-4,y+3+4,3,0);{4}boy(1,x+3+49,y+3+49,x+3+31,y+3+31,3,0);boy(1,x+3+49,y+3+22,x+3+4,y+3+4,3,0);boy(1,x+3+31,y+3+49,x+3+4,y+3+31,3,0);boy(1,x+3+22,y+3+22,x+3+4,y+3+4,3,20);end;end;
  vk_tab : begin onkeydown:=lvl;  e:=1;  setfontsize(20);  end;
  49:begin t:=1;  xx:=0;   yy:=0;end;
  50:begin t:=2;  xx:=60;  yy:=0;end;
  51:begin t:=3;  xx:=0;   yy:=60;end;
  52:begin t:=4;  xx:=60;  yy:=60;end;
  70:begin setpencolor(clwhite);  setpenwidth(1000);  line(1300,0,1300,1000);  setpenwidth(1);  onkeydown:=shop;  e:=1;  end;
  81:begin if hil>0 then begin lox[1].hp:=lox[1].hpp; hil:=hil-1;end;end;
  69:begin if man>0 then begin lox[1].mp:=lox[1].mpp; man:=man-1;end;end;
 end;
 if mp>4 then
 begin
  case t of
   1:
   begin
    case key of
     Vk_up:begin    mus := new system.Media.SoundPlayer; mus.SoundLocation:='1.wav';  mus.play;  setpencolor(clblue);  rectangle(x+1,y-32,x+5,y-2);  sleep(200);  boy(1,x+1,y-32,x+5,y-2-15,1,0);  boy(1,x+1,y-32+15,x+5,y-2,1,5);  end;
     Vk_down:begin  mus := new system.Media.SoundPlayer; mus.SoundLocation:='1.wav';  mus.play;  setpencolor(clblue);  rectangle(x+1,y+38,x+5,y+8);  sleep(200);  boy(1,x+1,y+38,x+5,y+8+15,1,0);  boy(1,x+1,y+38-15,x+5,y+8,1,5);  end;
     vk_right:begin mus := new system.Media.SoundPlayer; mus.SoundLocation:='1.wav';  mus.play;  setpencolor(clblue);  rectangle(x+38,y+1,x+8,y+5);  sleep(200);  boy(1,x+38,y+1,x+8+15,y+5,1,0);  boy(1,x+38-15,y+1,x+8,y+5,1,5);  end;
     vk_left:begin  mus := new system.Media.SoundPlayer; mus.SoundLocation:='1.wav';  mus.play;  setpencolor(clblue);  rectangle(x-32,y+1,x-2,y+5);  sleep(200);  boy(1,x-32,y+1,x-2-15,y+5,1,0);  boy(1,x-32+15,y+1,x-2,y+5,1,5);  end;{boy(1,1);}
    end;
   end;
   2:
   begin
    case key of
     Vk_up:begin    mus := new system.Media.SoundPlayer; mus.SoundLocation:='2.wav';  mus.play;  setpencolor(clred);circle(x+3,y+3-10,5);floodfill(x+3,y+3-10,clred);boy(1,x+3-5,y+3-10-5,x+3+5,y+3-10-5,1,1);sleep(100);floodfill(x+3,y+3-10,clwhite);circle(x+3,y+3-15,5);floodfill(x+3,y+3-15,clred);boy(1,x+3-5,y+3-15-5,x+3+5,y+3-15+5,1,1);sleep(100);floodfill(x+3,y+3-15,clwhite);circle(x+3,y+3-20,5);floodfill(x+3,y+3-20,clred);boy(1,x+3-5,y+3-20-5,x+3+5,y+3-20+5,1,3);sleep(100);end;
     vk_down:begin  mus := new system.Media.SoundPlayer; mus.SoundLocation:='2.wav';  mus.play;  setpencolor(clred);circle(x+3,y+3+10,5);floodfill(x+3,y+3+10,clred);boy(1,x+3-5,y+3+10-5,x+3+5,y+3+10-5,1,1);sleep(100);floodfill(x+3,y+3+10,clwhite);circle(x+3,y+3+15,5);floodfill(x+3,y+3+15,clred);boy(1,x+3-5,y+3+15-5,x+3+5,y+3+15+5,1,1);sleep(100);floodfill(x+3,y+3+15,clwhite);circle(x+3,y+3+20,5);floodfill(x+3,y+3+20,clred);boy(1,x+3-5,y+3+20-5,x+3+5,y+3+20+5,1,3);sleep(100);end;
     Vk_right:begin mus := new system.Media.SoundPlayer; mus.SoundLocation:='2.wav';  mus.play;  setpencolor(clred);circle(x+3+10,y+3,5);floodfill(x+3+10,y+3,clred);boy(1,x+3+10-5,y+3-5,x+3+10+5,y+3-5,1,1);sleep(100);floodfill(x+3+10,y+3,clwhite);circle(x+3+15,y+3,5);floodfill(x+3+15,y+3,clred);boy(1,x+3+15-5,y+3-5,x+3+15+5,y+3+5,1,1);sleep(100);floodfill(x+3+15,y+3,clwhite);circle(x+3+20,y+3,5);floodfill(x+3+20,y+3,clred);boy(1,x+3+20-5,y+3-5,x+3+20+5,y+3+5,1,3);sleep(100);end;
     Vk_left:begin  mus := new system.Media.SoundPlayer; mus.SoundLocation:='2.wav';  mus.play;  setpencolor(clred);circle(x+3-10,y+3,5);floodfill(x+3-10,y+3,clred);boy(1,x+3-10-5,y+3-5,x+3-10+5,y+3-5,1,1);sleep(100);floodfill(x+3-10,y+3,clwhite);circle(x+3-15,y+3,5);floodfill(x+3-15,y+3,clred);boy(1,x+3-15-5,y+3-5,x+3-15+5,y+3+5,1,1);sleep(100);floodfill(x+3-15,y+3,clwhite);circle(x+3-20,y+3,5);floodfill(x+3-20,y+3,clred);boy(1,x+3-20-5,y+3-5,x+3-20+5,y+3+5,1,3);sleep(100);end;
    end;
   end;
  end;
 end;
 case t of
  3:
  begin
   case key of
    Vk_up:   begin mus := new system.Media.SoundPlayer; mus.SoundLocation:='3.wav';  mus.play;  setpencolor(clred);  arc(x+3,y+3,15,45, 135);  sleep(200);setpencolor(clwhite);  arc(x+3,y+3,15,45 ,135);  boy(1,x+3-10,y+3-15,x+3+10,y+3-4,1,0);  end;
    Vk_left: begin mus := new system.Media.SoundPlayer; mus.SoundLocation:='3.wav';  mus.play;  setpencolor(clred);  arc(x+3,y+3,15,135,225);  sleep(200);setpencolor(clwhite);  arc(x+3,y+3,15,135,225);  boy(1,x+3-15,y+3-10,x+3-4,y+3+10,1,0);  end;
    Vk_down: begin mus := new system.Media.SoundPlayer; mus.SoundLocation:='3.wav';  mus.play;  setpencolor(clred);  arc(x+3,y+3,15,225,315);  sleep(200);setpencolor(clwhite);  arc(x+3,y+3,15,225,315);  boy(1,x+3-10,y+3+15,x+3+10,y+3+4,1,0);  end;
    Vk_right:begin mus := new system.Media.SoundPlayer; mus.SoundLocation:='3.wav';  mus.play;  setpencolor(clred);  arc(x+3,y+3,15,315,405 );  sleep(200);setpencolor(clwhite);  arc(x+3,y+3,15,315,405 );  boy(1,x+3+15,y+3-10,x+3+4,y+3+10,1,0);  end;
   end;
  end;
 end;
 end;
 end;
 clearwindow;setpencolor(clwhite);setpenwidth(1000);line(1300,0,1300,1000);setpenwidth(1);
 if (lox[31].hp<1) and (p=-1) then onkeydown:=save;
 if lox[1].hp<1 then onkeydown:=dead;
  with lox[1] do begin
   if x>1200 then begin x:=x-10;end;
   if y>700 then begin y:=y-10;end;
   if x<0 then begin x:=x+10;end;
   if y<0+z then begin y:=y+10;end;
   setpencolor(clblack);
   rectangle(x,y,x+6,y+6);
   setpencolor(clblue);
   rectangle(x+2,y+2,x+4,y+4);end;
 for i:=2 to 30 do
 if lox[i].hp>0 then
    begin
        if sqr(abs(lox[i].x-lox[1].x))+sqr(abs(lox[i].y-lox[1].y)) < 5000 then
        begin
              if lox[i].x-lox[1].x>0 then lox[i].xx:=-5 else lox[i].xx:=5;
              if lox[i].y-lox[1].y>0 then lox[i].yy:=-5 else lox[i].yy:=5;
        end;
    end;
  for i:=2 to 30 do
   if lox[i].hp>0 then
   begin
   lox[i].x:=lox[i].x+lox[i].xx;
   lox[i].y:=lox[i].y+lox[i].yy;
   end;
   for i:=2  to 10 do begin if lox[i].hp>0 then begin if uroven=1 then setpencolor(clblue) else setpencolor(clblue );rectangle(lox[i].x,lox[i].y,lox[i].x+9,lox[i].y+9);end;end;
   for i:=11 to 20 do begin if lox[i].hp>0 then begin if uroven=1 then setpencolor(clgreen) else setpencolor(clLime );rectangle(lox[i].x,lox[i].y,lox[i].x+9,lox[i].y+9);end;end;
   for i:=21 to 30 do begin if lox[i].hp>0 then begin if uroven=1 then setpencolor(clred) else setpencolor(clFuchsia);rectangle(lox[i].x,lox[i].y,lox[i].x+9,lox[i].y+9);end;end;
   for i:=2  to 30 do begin lox[i].xx:=0;lox[i].yy:=0;end;

 with lox[1] do begin
 setpencolor(clred);
 setpenwidth(20);
 line(1220,130,1320,130);
 setpencolor(clwhite);
 setpenwidth(18);
 line(1220,130,1320,130);
 setpencolor(clred);
 if lox[1].hp>0 then line(1220,130,1220+((hp*100) div (hpp)),130);
 setpencolor(clblue);
 setpenwidth(20);
 line(1220,170,1320,170);
 setpencolor(clwhite);
 setpenwidth(18);
 line(1220,170,1320,170);
 setpencolor(clblue);
 if lox[1].mp>0 then line(1220,170,1220+((mp*100) div (mpp)),170);
 setpencolor(clSKYBLUE);
 setpenwidth(10);
 line(1240,110,1320,110);
 setpencolor(clwhite);
 setpenwidth(8);
 line(1240,110,1320,110);
 setpencolor(clSKYBLUE);
 if xp>0 then line(1240,110,1240+((xp*80) div (xpp)),110);
 setpenwidth(2);
 end;
 setpencolor(clblack);
 line(0,0+z,1206,0+z);
 line(1206,0,1206,1000);
 SetFontSize(13);
 textout(1334,120,inttostr(lox[1].hp));textout(1334,160,inttostr(lox[1].mp)); textout(1310,200,inttostr(lut));textout(1240,200,'money'); SetFontSize(20);
 textout(1270,60,inttostr(ll));textout(1240,60,'lvl');SetFontSize(15);textout(1307,67,'oy:');textout(1338,67,inttostr(c));//textout(1240,30,inttostr(musa));
 textout(1230,220,'Инвентарь:');
 textout(1220,250,'Бут.жизни:');textout(1330,250,inttostr(hil));textout(1220,280,'Бут. маны:');textout(1330,280,inttostr(man));
 rectangle(1220,500,1270,550);rectangle(1220,560,1270,610);rectangle(1280,500,1330,550);rectangle(1280,560,1330,610);setpenwidth(3);setpencolor(clblue);rectangle(1220+lox[1].yy,500+lox[1].xx,1270+lox[1].yy,550+lox[1].xx);setpenwidth(1);setpencolor(clblack);rectangle(1240,510,1250,540);floodfill(1245,525,clblue);circle(1245,585,20);floodfill(1255,575,clred);setpenwidth(2);setpencolor(clred);arc(1290,540,35,10,80);setpencolor(clblue);arc(1290,540,30,10,80);setpenwidth(1);setpencolor(clblack);
 for i:=2  to 10 do begin if lox[i].hp>0 then boy(i,lox[i].x,lox[i].y,lox[i].x+9,lox[i].y+9,1,0);if (lox[i].hp<0) and (lox[i].hp>-100) then begin xp:=xp+uroven*10; lut:=lut+20*uroven;lox[i].hp:=(-1000);inc(p); end; end;
 for i:=11 to 20 do begin if lox[i].hp>0 then boy(i,lox[i].x,lox[i].y,lox[i].x+9,lox[i].y+9,1,0);if (lox[i].hp<0) and (lox[i].hp>-100) then begin xp:=xp+uroven*15; lut:=lut+30*uroven;lox[i].hp:=(-1000);inc(p); end; end;
 for i:=21 to 30 do begin if lox[i].hp>0 then boy(i,lox[i].x,lox[i].y,lox[i].x+9,lox[i].y+9,1,0);if (lox[i].hp<0) and (lox[i].hp>-100) then begin xp:=xp+uroven*20; lut:=lut+40*uroven;lox[i].hp:=(-1000);inc(p); end; end;
 if xp>=xpp then begin c:=c+5;xp:=xp-xpp;xpp:=xpp+10*(ll+1);ll:=ll+1;end;
 textout(1,1,p);
  //boss
 if p = 29 then if uroven = 1 then
 begin
  with lox[31] do
  begin hp:=2500-(500*d);at:=25-(5*d);x:=600;y:=300;z:=70;p:=-1;xp:=xpp;lut:=lut+65;end;
 end
 else
 begin
  with lox[31] do
  begin hp:=5000-(1000*d);at:=50-(10*d);x:=600;y:=300;z:=70;p:=-2;xp:=xpp;lut:=lut+100;end;
 end;
 //1
 if p = -1 then
 begin
  if lox[31].x-lox[1].x>0 then lox[31].xx:=-5 else lox[31].xx:=5;
  if lox[31].y-lox[1].y>0 then lox[31].yy:=-5 else lox[31].yy:=5;
  with lox[31] do
  begin
   x:=x+xx;y:=y+yy;setpencolor(clblack);rectangle(x,y,x+11,y+11);rectangle(x+2,y+2,x+9,y+9);rectangle(x+4,y+4,x+7,y+7);boy(31,x,y,x+11,y+11,1,0);time:=time+1;
   textout(1250,600,inttostr(lox[31].hp));
   rectangle(100,20,1100,50);if hp>0 then begin rectangle(100,20,100+((hp*1000) div (2500-(500*d))),50);floodfill(103,23,clred);end;
   if time = 4 then begin
   time:=0;
    rectangle(x-59,y,x-4,y+11);floodfill(x-6,y+1,clred);
     boy(31,x-59,y,x-49,y+10,1,0);boy(31,x-44,y,x-36,y+34,1,0);boy(31,x-29,y,x-19,y+10,1,0);boy(31,x-14,y,x-4,y+10,1,0);
    rectangle(x+70,y,x+15,y+11);floodfill(x+16,y+1,clred);
     boy(31,x+70,y,x+60,y+10,1,0);boy(31,x+55,y,x+45,y+10,1,0);boy(31,x+40,y,x+30,y+10,1,0);boy(31,x+25,y,x+15,y+10,1,0);
    rectangle(x,y-59,x+11,y-4);floodfill(x+1,y-6,clred);
     boy(31,x,y-59,x+10,y-49,1,0);boy(31,x,y-44,x+10,y-34,1,0);boy(31,x,y-29,x+10,y-19,1,0);boy(31,x,y-14,x+10,y-4,1,0);
    rectangle(x,y+70,x+11,y+15);floodfill(x+1,y+16,clred);
     boy(31,x,y+70,x+10,y+60,1,0);boy(31,x,y+55,x+10,y+45,1,0);boy(31,x,y+40,x+10,y+30,1,0);boy(31,x,y+25,x+10,y+15,1,0);
  end;end;end;
  //2 boss
  if p = -2 then
  begin

  end;
  if e=1 then begin clearwindow;setfontsize(60);textout(350,300,'Нажмите Пробел');e:=0;setfontsize(20);setpencolor(clwhite);setpenwidth(500);line(1300,0,1300,1000);setpenwidth(1); end;
 end;
begin
 setwindowsize(1366,768);
 setfontsize(20);
 musa := new System.Media.SoundPlayer;
 musa.SoundLocation:='background.wav';
 musa.Play;
 onkeydown := dif;
end.

