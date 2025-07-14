f = imread('c:\image\Mobil.tif');
[jum_baris, jum_kolom] = size(f);
g = f;

for baris = 2 : jum_baris - 1
    for kolom = 2 : jum_kolom - 1
        minpiksel = min([f(baris-1, kolom-1), f(baris-1, kolom), f(baris-1, kolom+1), ...
                         f(baris, kolom-1),                     f(baris, kolom+1), ...
                         f(baris+1, kolom-1), f(baris+1, kolom), f(baris+1, kolom+1)]);

        makspiksel = max([f(baris-1, kolom-1), f(baris-1, kolom), f(baris-1, kolom+1), ...
                          f(baris, kolom-1),                     f(baris, kolom+1), ...
                          f(baris+1, kolom-1), f(baris+1, kolom), f(baris+1, kolom+1)]);

        if f(baris, kolom) < minpiksel
            g(baris, kolom) = minpiksel;
        elseif f(baris, kolom) > makspiksel
            g(baris, kolom) = makspiksel;
        else
            g(baris, kolom) = f(baris, kolom);
        end
    end
end

% Menampilkan hasil dengan subplot
figure;
subplot(1, 2, 1);
imshow(f);,title('Citra Berderau');

subplot(1, 2, 2);
imshow(g);,title('Citra Filter Batas');

