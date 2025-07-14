function ProgramOperatorRobert()
    % Baca gambar dari file
    img = imread('C:\Image\PasFotoHP.tif');

    % Terapkan operator Roberts
    g = roberts(img);

    % Tampilkan hasil asli dan hasil deteksi tepi
    subplot(1, 2, 1); imshow(img); title('Citra Input');
    subplot(1, 2, 2); imshow(g); title('Citra Operator Robert');
end

function g = roberts(f)
    % Pastikan gambar dalam grayscale
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

    f = double(f);
    [jum_baris, jum_kolom] = size(f);
    g = zeros(jum_baris, jum_kolom);  % Inisialisasi output

    for y = 1 : jum_baris - 1
        for x = 1 : jum_kolom - 1
            gx = f(y, x) - f(y+1, x+1);
            gy = f(y+1, x) - f(y, x+1);
            g(y, x) = sqrt(gx^2 + gy^2);
        end
    end

    g = uint8(g);
end

