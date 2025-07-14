function ambang_main()
    % Membaca gambar
    f = imread('c:\image\PasFotoHP.tif');  % Ganti path sesuai gambar kamu

    % Jika citra berwarna, ubah jadi grayscale
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

    % Nilai ambang
    t = 100;

    % Panggil fungsi ambang
    g = ambang(f, t);

    % Tampilkan hasil
    subplot(1,2,1); imshow(f), title('Citra Input');
    subplot(1,2,2); imshow(1-g), title('Citra Dwi Aras');
end

% Fungsi ambang sebagai fungsi lokal di bawah fungsi utama
function [g] = ambang(f, t)
    % fungsi ambang Menentukan nilai ambang
    [m, n] = size(f);
    g = zeros(m, n); % Inisialisasi citra keluaran

    for i = 1:m
        for j = 1:n
            if f(i, j) <= t
                g(i, j) = 0;
            else
                g(i, j) = 1;
            end
        end
    end
end

