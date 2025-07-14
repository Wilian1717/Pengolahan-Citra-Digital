f = imread('c:\image\PasFotoHP.tif');

% Ubah ke grayscale jika citra berwarna (RGB)
if size(f, 3) == 3
    f = rgb2gray(f);
end

[jum_baris, jum_kolom] = size(f);
sx = 50;   % penggeseran arah horizontal
sy = 100;  % penggeseran arah vertikal

f2 = double(f);
g = zeros(size(f2));

for baris = 1 : jum_baris
    for kolom = 1 : jum_kolom
        xlama = baris - sx;
        ylama = kolom - sy;
        if (xlama >= 1) && (xlama <= jum_baris) && ...
           (ylama >= 1) && (ylama <= jum_kolom)
            g(baris, kolom) = f2(xlama, ylama);
        else
            g(baris, kolom) = 0;
        end
    end
end

h = uint8(g);

% Tampilkan dengan subplot
figure;
subplot(1, 2, 1);
imshow(f);
title('Citra Asli');

subplot(1, 2, 2);
imshow(h);
title('Citra Hasil Pergeseran');

