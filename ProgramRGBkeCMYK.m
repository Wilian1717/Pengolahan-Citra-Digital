img = imread('C:\Image\PasFotoUPB.jpg');

% Pisahkan channel RGB
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Konversi ke CMYK
[C, M, Y, K] = RGBkeCMY(R, G, B);

% Tampilkan gambar asli dan kanal CMYK
figure;
subplot(1,5,1); imshow(img); title('Gambar Asli');
subplot(1,5,2); imshow(C); title('Gambar Cyan');
subplot(1,5,3); imshow(M); title('Gambar Magenta');
subplot(1,5,4); imshow(Y); title('Gambar Yellow');
subplot(1,5,5); imshow(K); title('Gambar Black');

