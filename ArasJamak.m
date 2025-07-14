function ArasJamak()
    % Membaca gambar asli
    f = imread('c:\image\benda.png');  % Ganti path jika diperlukan

    % Konversi ke grayscale jika citra berwarna
    if size(f, 3) == 3
        f_gray = rgb2gray(f);
    else
        f_gray = f;
    end

    % Daftar nilai ambang: 6 set (b-f) dan citra asli (a)
    ambang = [
        50 100;
        175 200;
        220 230;
        235 250;
        220 250
    ];

    % Buat figure baru
    figure;

    % (a) Tampilkan citra asli
    subplot(3, 2, 1);
    imshow(f);
    title('(a) benda.png');

    % (b-f) Proses ambang dua nilai
    for k = 1:5
        t1 = ambang(k, 1);
        t2 = ambang(k, 2);
        g = fungsi_ArasJamak(f_gray, t1, t2);

        subplot(3, 2, k + 1);
        imshow(g);
        huruf = char('b' + k - 1);  % menghasilkan b, c, d, e, f
        title(sprintf('(%c) Nilai ambang t₁=%d dan t₂=%d', huruf, t1, t2));
    end
end

% Fungsi lokal ambang jamak
function [g] = fungsi_ArasJamak(f, t1, t2)
    [m, n] = size(f);
    g = zeros(m, n); % Inisialisasi

    for i = 1:m
        for j = 1:n
            if f(i,j) <= t1 || f(i,j) >= t2
                g(i,j) = 0;
            else
                g(i,j) = 1;
            end
        end
    end
end

