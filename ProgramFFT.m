x=imread('c:\image\PasFotoHP.tif');
y=fft(x);
subplot(1,2,1);imshow(x),title('Citra Input');
subplot(1,2,2);imshow(y),title('Citra Output');

