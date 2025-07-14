f = imread('c:\image\PasFotoHP.tif');
if size(f, 3) == 3
    f = rgb2gray(f);
end
[jum_baris, jum_kolom] = size(f);
sudut = 10;  % sudut pemutaran
rad = pi * sudut / 180;
cosa = cos(rad);
sina = sin(rad);

f2 = f;
g = zeros(jum_baris, jum_kolom);  % inisialisasi matriks hasil

for y = 1 : jum_baris
    for x = 1 : jum_kolom
        x2 = round(x * cosa + y * sina);
        y2 = round(y * cosa - x * sina);
        if (x2 >= 1) && (x2 <= jum_kolom) && ...
           (y2 >= 1) && (y2 <= jum_baris)
            g(y, x) = f2(y2, x2);
        else
            g(y, x) = 0;
        end
    end
end

h = uint8(g);

% Tambahkan subplot untuk menampilkan citra asli dan hasil rotasi
figure;
subplot(1, 2, 1);
imshow(f);,title('Citra Asli');

subplot(1, 2, 2);
imshow(h);,title(['Citra Hasil Rotasi ' num2str(sudut) '°']);

