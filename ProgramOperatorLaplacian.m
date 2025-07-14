function ProgramOperatorLaplacian()
    % Baca gambar dari file
    img = imread('C:\Image\PasFotoHP.tif');

    % Terapkan operator Laplacian
    g = laplacian(img);

    % Tampilkan hasil
    subplot(1, 2, 1); imshow(img); title('Citra Input');
    subplot(1, 2, 2); imshow(g); title('Citra Operator Laplacian');
end

function g = laplacian(f)
    % Konversi ke grayscale jika RGB
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

    f = double(f);
    [m, n] = size(f);
    g = zeros(m, n);

    % Kernel Laplacian (8 arah)
    %      0 -1  0
    %     -1  4 -1   ← versi umum
    %      0 -1  0
    % Untuk versi yang kamu pakai (8 arah), gunakan:
    %      -1 -1 -1
    %      -1  8 -1
    %      -1 -1 -1
    kernel = [ -1 -1 -1; -1 8 -1; -1 -1 -1 ];

    % Konvolusi manual
    for y = 2 : m - 1
        for x = 2 : n - 1
            region = f(y-1:y+1, x-1:x+1);
            g(y, x) = sum(sum(kernel .* region));
        end
    end

    % Penyesuaian skala agar tidak jadi citra gelap/terang total
    g = uint8(mat2gray(g) * 255);
end

