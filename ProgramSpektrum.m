% Membaca citra
x = imread('c:\image\PasFotoHP.Tif');

% Jika citra berwarna, konversi ke grayscale
if size(x, 3) == 3
    x = rgb2gray(x);  % Mengubah citra RGB menjadi grayscale
end

% Terapkan transformasi logaritmik
s2 = log(1 + abs(double(x)));  % Pastikan konversi ke tipe data ganda (double)

% Menampilkan citra
subplot(1, 2, 1);
imshow(x);
title('Citra Masukan');

subplot(1, 2, 2);
imshow(s2, []);
title('Citra dengan Transformasi Logaritmik');
