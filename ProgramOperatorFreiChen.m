function ProgramOperatorFreiChen()
    % Baca gambar dari direktori
    img = imread('C:\Image\PasFotoHP.tif');

    % Terapkan operator Frei-Chen
    g = freiChen(img);

    % Tampilkan gambar asli dan hasil deteksi tepi
    subplot(1, 2, 1); imshow(img); title('Citra Input');
    subplot(1, 2, 2); imshow(g); title('Citra Operator Frei-Chen');
end

function g = freiChen(f)
    % Konversi ke grayscale jika RGB
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

    f = double(f);
    [m, n] = size(f);
    g = zeros(m, n);

    % Konstanta akar(2)
    a2 = sqrt(2);

    % Kernel Frei-Chen
    Gx = [-1 0 1; -a2 0 a2; -1 0 1];
    Gy = [-1 -a2 -1; 0 0 0; 1 a2 1];

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

