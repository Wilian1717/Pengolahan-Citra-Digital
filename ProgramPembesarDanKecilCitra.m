f = imread('c:\image\PasFotoHP.tif');

% Ubah ke grayscale jika citra berwarna
if size(f, 3) == 3
    f = rgb2gray(f);
end

[baris, kolom] = size(f);

% Faktor skala
sy = 1.5;  % Misal: sy 1.5 sx 2.5 = perbesar | sy & sx 0.10 = perkecil
sx = 2.5;

% Ukuran citra baru (dibulatkan ke bawah)
baris_baru = floor(baris * sy);
kolom_baru = floor(kolom * sx);

% Inisialisasi citra baru sebagai uint8
g = zeros(baris_baru, kolom_baru, 'uint8');

for y = 1 : baris_baru
    y2 = ((y - 1) / sy) + 1;
    y2 = min(baris, max(1, floor(y2)));  % Batas aman
    for x = 1 : kolom_baru
        x2 = ((x - 1) / sx) + 1;
        x2 = min(kolom, max(1, floor(x2)));  % Batas aman
        g(y, x) = f(y2, x2);
    end
end

% Tampilkan hasil
subplot(1, 2, 1); imshow(f); title('Citra Masukan');
subplot(1, 2, 2); imshow(g); title(sprintf('Citra Skala sy=%.2f, sx=%.2f', sy, sx));

