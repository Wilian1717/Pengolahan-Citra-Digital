function ProgramOperatorPrewitt()
    % Baca gambar
    img = imread('C:\Image\PasFotoHP.tif');

    % Terapkan operator Prewitt
    g = prewitt(img);

    % Tampilkan gambar asli dan hasil deteksi tepi
    subplot(1, 2, 1); imshow(img); title('Citra Input');
    subplot(1, 2, 2); imshow(g); title('Citra Operator Prewitt');
end

function g = prewitt(f)
    % Konversi ke grayscale jika RGB
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

    f = double(f);
    [jum_baris, jum_kolom] = size(f);
    g = zeros(jum_baris, jum_kolom);

    % Kernel Prewitt
    Gx = [-1 0 1; -1 0 1; -1 0 1];
    Gy = [-1 -1 -1; 0 0 0; 1 1 1];

    % Operasi konvolusi manual
    for y = 2 : jum_baris-1
        for x = 2 : jum_kolom-1
            region = f(y-1:y+1, x-1:x+1);
            gx = sum(sum(Gx .* region));
            gy = sum(sum(Gy .* region));
            g(y, x) = sqrt(gx^2 + gy^2);
        end
    end

    g = uint8(g);
end

