x=imread('c:\image\gembala.tif');
c=x - 45;
k=c * 11;
subplot(1,2,1);imshow(x),title('Citra Input')
subplot(1,2,2);imshow(k),title('Citra Output Kombinasi Kecerahan Dan Kontras')

