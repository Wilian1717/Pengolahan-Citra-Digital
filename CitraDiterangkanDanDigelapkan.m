%Program Mencerahkan dan menggelapkan Citra%
img=imread('c:\image\PasFotoHP.tif');
x=img + 80
y=x - 120;
subplot(1,3,1);imshow(img),title('Citra masukan')
subplot(1,3,2);imshow(x),title('Citra setelah dicerahkan')
subplot(1,3,3);imshow(y),title('Citra setelah digelapkan')
