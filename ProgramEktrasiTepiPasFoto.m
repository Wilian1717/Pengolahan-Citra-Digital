pkg load image; % Jika kamu pakai Octave
% Baca citra biner
f = imread('C:/Image/PasFotoHP.tif');

% Konversi ke grayscale jika masih RGB
if size(f, 3) == 3
    f = rgb2gray(f);
end

% Konversi ke citra biner
bw = im2bw(f);

% Ukuran gambar
[jum_baris, jum_kolom] = size(bw);

% Inisialisasi hasil
g = zeros(jum_baris, jum_kolom);

% Proses ekstraksi tepi berdasarkan 8 ketetanggaan
for q = 2 : jum_baris - 1
    for p = 2 : jum_kolom - 1
        p0 = bw(q, p+1);
        p1 = bw(q-1, p+1);
        p2 = bw(q-1, p);
        p3 = bw(q-1, p-1);
        p4 = bw(q, p-1);
        p5 = bw(q+1, p-1);
        p6 = bw(q+1, p);
        p7 = bw(q+1, p+1);

        sigma = p0 + p1 + p2 + p3 + p4 + p5 + p6 + p7;
        if sigma == 8
            g(q, p) = 0;
        else
            g(q, p) = bw(q, p);
        end
    end
end

% Tampilkan hasil
subplot(1,2,1); imshow(bw); title('Citra Asli');
subplot(1,2,2); imshow(g); title('Citra Output ');
