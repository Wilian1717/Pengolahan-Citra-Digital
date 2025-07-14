f = imread('c:\image\PasFotoHP.tif');

% Ubah ke grayscale jika citra berwarna
if size(f, 3) == 3
    f = rgb2gray(f);
end

[jum_baris, jum_kolom] = size(f);
g = zeros(jum_baris, jum_kolom, 'uint8'); % Inisialisasi citra hasil

for baris = 1 : jum_baris
    for kolom = 1 : jum_kolom
        x2 = kolom;
        y2 = jum_baris - baris + 1;
        g(baris, kolom) = f(y2, x2);
    end
end

subplot(1, 2, 1); imshow(f); title('Citra Masukan');
subplot(1, 2, 2); imshow(g); title('Citra Cermin Vertikal');

