function ProgramDerauPeriodik()
% PROGRAMDERAUPERIODIK Menambahkan derau periodik pada citra grayscale

    % Baca citra
    f = imread('C:\image\PasFotoHP.tif');

    % Ubah ke grayscale jika RGB
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

    % Panggil fungsi derau
    g = drperiodik(f, 10, 3, 4);

    % Tampilkan
    subplot(1,2,1); imshow(f); title('Citra Masukan');
    subplot(1,2,2); imshow(g); title('Citra Derau Periodik');
end

% Fungsi lokal
function [g] = drperiodik(f, a, bx, by)
    if nargin < 4
        a = 3; bx = 3; by = 5;
    end

    [m, n] = size(f);
    [X, Y] = meshgrid(1:n, 1:m);

    derau = a * sin(X / bx + Y / by) + 1;
    g = uint8(double(f) + derau);
end

