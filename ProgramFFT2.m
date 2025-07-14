x=imread('c:\image\PasFotoHP.tif');
y=fft2(x);
subplot(1,2,1);imshow(x),title('Citra Input');
subplot(1,2,2);imshow(y),title('Citra Input');

