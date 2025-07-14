function ProgramOperatorSobel()
    % Baca gambar
    img = imread('C:\Image\PasFotoHP.tif');

    % Terapkan operator Sobel
    g = sobel(img);

    % Tampilkan hasil
    subplot(1, 2, 1); imshow(img); title('Citra Input');
    subplot(1, 2, 2); imshow(g); title('Citra Operator Sobel');
end

function g = sobel(f)
    % Konversi ke grayscale jika RGB
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

    f = double(f);
    [m, n] = size(f);
    g = zeros(m, n);

    % Kernel Sobel
    Gx = [-1 0 1; -2 0 2; -1 0 1];
    Gy = [-1 -2 -1; 0 0 0; 1 2 1];

    % Konvolusi manual
    for y = 2 : m-1
        for x = 2 : n-1
            region = f(y-1:y+1, x-1:x+1);
            gx = sum(sum(Gx .* region));
            gy = sum(sum(Gy .* region));
            g(y, x) = sqrt(gx^2 + gy^2);
        end
    end

    g = uint8(g);
end

