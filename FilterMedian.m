f = imread('c:\image\boneka2.tif');
[jum_baris, jum_kolom] = size(f);
g = f;

for baris = 2 : jum_baris - 1
    for kolom = 2 : jum_kolom - 1
        data = [f(baris - 1, kolom - 1), ...
                f(baris - 1, kolom), ...
                f(baris - 1, kolom + 1), ...
                f(baris,     kolom - 1), ...
                f(baris,     kolom), ...
                f(baris,     kolom + 1), ...
                f(baris + 1, kolom - 1), ...
                f(baris + 1, kolom), ...
                f(baris + 1, kolom + 1)];

        for i = 1 : 8
            for j = i + 1 : 9
                if data(i) > data(j)
                    temp = data(i);
                    data(i) = data(j);
                    data(j) = temp;
                end
            end
        end

        g(baris, kolom) = data(5);
    end
end

figure;
subplot(1, 2, 1);
imshow(f);,title('Citra Asli');

subplot(1, 2, 2);
imshow(g);,title('Citra Filter Median ');

