function ProgramGaramDanMerica
    clc;
    clear;
    close all;

    % --- KODE UTAMA ---
    f = imread('c:/image/PasFotoHP.tif');

    % Konversi ke grayscale jika RGB
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

    % Tambahkan derau garam dan merica
    g = gamer(f, 0.05);

    % Tampilkan hasil
    subplot(1,2,1); imshow(f); title('Citra Masukan');
    subplot(1,2,2); imshow(g); title('Citra Garam dan Merica');
end

% --- FUNGSI TAMBAHAN DI LUAR FUNGSI UTAMA (BOLEH DI OCTAVE) ---
function g = gamer(f, probabilitas)
    if nargin < 2
        probabilitas = 0.05;
    end

    [m, n] = size(f);
    g = double(f);

    for i = 1:m
        for j = 1:n
            r = rand;
            if r < probabilitas / 2
                g(i,j) = 0;        % Noise hitam
            elseif r < probabilitas
                g(i,j) = 255;      % Noise putih
            end
        end
    end

    g = uint8(g);
end

