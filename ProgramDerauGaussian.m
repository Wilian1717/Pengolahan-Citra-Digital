clc; clear; close all;

% Fungsi untuk menambahkan derau gaussian
function [g] = gaussian(f, sigma, mu)
    if nargin < 3
        mu = 0;         % Nilai default mu
    end
    if nargin < 2
        sigma = 1;      % Nilai default standar deviasi
    end

    % Konversi citra ke double
    [m, n] = size(f);
    g = double(f);

    for i = 1 : m
        for j = 1 : n
            noise = randn * sigma + mu;
            g(i, j) = round(f(i, j) + noise);

            % Pastikan nilai dalam range 0–255
            if g(i, j) > 255
                g(i, j) = 255;
            elseif g(i, j) < 0
                g(i, j) = 0;
            end
        end
    end

    g = uint8(g);  % Ubah kembali ke uint8
end

% ==== MAIN PROGRAM ====

% Baca gambar
f = imread('c:\image\PasFotoHP.tif');

% Jika gambar berwarna (RGB), ubah ke grayscale
if ndims(f) == 3
    f = rgb2gray(f);
end

% Tambahkan derau Gaussian
g = gaussian(f, 20);   % sigma = 20

% Tampilkan hasil
figure;
subplot(1,2,1); imshow(f); title('Citra Asli (Grayscale)');
subplot(1,2,2); imshow(g); title('Citra dengan Derau Gaussian');
