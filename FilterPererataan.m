f = imread('c:\image\boneka2.tif');
[jum_baris, jum_kolom] = size(f);

f2 = double(f);
g = f;

for baris = 2 : jum_baris - 1
    for kolom = 2 : jum_kolom - 1
        jumlah = f2(baris - 1, kolom - 1) + ...
                 f2(baris - 1, kolom)     + ...
                 f2(baris - 1, kolom + 1) + ...
                 f2(baris,     kolom - 1) + ...
                 f2(baris,     kolom)     + ...
                 f2(baris,     kolom + 1) + ...
                 f2(baris + 1, kolom - 1) + ...
                 f2(baris + 1, kolom)     + ...
                 f2(baris + 1, kolom + 1);

        g(baris, kolom) = uint8(1/9 * jumlah);
    end
end

figure;
subplot(1, 2, 1);
imshow(f);,title('Citra Asli');

subplot(1, 2, 2);
imshow(g);,title('Citra Filter Pererataan');

