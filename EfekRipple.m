f=imread('c:\image\PasFotoHP.tif');
dimensi=size(f);
tinggi=dimensi(1);
lebar=dimensi(2);
ax= 10;   % amplitudo gelombang sinus pada kolom
ay= 15;  % amplitudo gelombang sinus pada baris
tx=120; % periode gelombang sinus pada kolom
ty=250;  %periode gelombang sinus pada baris

for y=1 : tinggi
  for x=1 : lebar
x2=x + ax * sin(2 * pi * y / tx);
y2=y + ay * sin(2 * pi * x / ty );
   if (x2>=1) && (x2<=lebar) && ...
   (y2 >=1) && (y2<=tinggi)

  %Lakukan interpolasi Bilinier
  p=floor(y2);
  q=floor(x2);
  a=y2- p;
  b=x2-q;
   if (floor(x2) ==lebar) || ...
   (floor (y2) == tinggi)
   g(y,x)=f(floor(y2), floor(x2));
   else
   intensitas= (1 -a ) * ((1-b) * f(p,q) + ...
   b * f(p, q + 1)) + ...
   a * ((1 - b) * f(p +1, q) + ...
   b * f(p+1, q + 1));
   g(y,x)= intensitas;
   end
    else
    g(y,x)=0;
 end
end
end
g=uint8(g);
 subplot(1,2,1);imshow(f),title('Citra Input');
 subplot(1,2,2);imshow(g),title('Citra Efek Ripple');

