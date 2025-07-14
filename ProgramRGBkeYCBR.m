img = imread('C:\Image\PasFotoUPB.jpg');
[Y,Cb,Cr] = RGBkeYCB(img(:,:,1), img(:,:,2), img(:,:,3));
subplot(1,2,1);imshow(img),title('citra input')
subplot(1,2,2);imshow([Y,Cb,Cr]),title('citra output')

