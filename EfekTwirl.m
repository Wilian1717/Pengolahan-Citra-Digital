f=imread('c:\image\PasFotoHP.tif');
dimensi   =size(f);
tinggi      =dimensi(1);
lebar       =dimensi(2);
xc=round(lebar / 2);
yc=round(tinggi / 2);
alpha= 60 * pi /180;
rmaks= 0.5 *sqrt (xc^2 + yc^2);  % 1/2 diagonal citra

for y=1  : tinggi
   for x= 1 : lebar
r=sqrt((x - xc)^2 + (y -yc)^2);
beta=atan2(y- yc, x-xc) + ...
        alpha * (rmaks - r ) / rmaks;

x2=xc + r * cos(beta);
y2=yc + r * sin(beta);

if (x2 >= 1) && (x2 <=lebar) && ...
    (y2 >=1) && (y2 <=tinggi)

%lakukan interpolasi bilinear
p=floor(y2);
q=floor(x2);
a=y2 - p;
b=x2 - q;

  if (floor (x2) == lebar) ||  ...
    (floor (y2) == tinggi)
  g(y,x)=f(floor(y2), floor(x2));
  else
  intensitas = (1-a) * ((1-b) * f (p,q) + ...
  b * f(p, q+1)) + ...
  a * ((1 - b) * f(p +1, q) + ...
  b * f(p + 1,  q+1));

  g(y,x)=intensitas;
  end
else
g(y,x)=0;
end
end
end
g=uint8(g);
subplot(1,2,1);imshow(f),title('Citra Input');
subplot(1,2,2);imshow(g),title('Citra Efek Twirl');





