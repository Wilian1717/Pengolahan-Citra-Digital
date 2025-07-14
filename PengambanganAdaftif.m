function PengambanganAdaptif()
    % Membaca citra ipomoea
    f = imread('c:\image\PasFotoHP.tif');  % Ganti path jika perlu
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

    figure;

    % (a) Gambar asli
    subplot(3,2,1); imshow(f); title('(a) Citra Input');

    % Daftar parameter (w, c) untuk 5 hasil
    params = [2 0; 2 -2; 3 -4; 7 -5; 10 5];

    for i = 1:size(params,1)
        w = params(i,1);
        c = params(i,2);
        g = adapmean(f, w, c);
        subplot(3,2,i+1);
        imshow(g);
        huruf = char('b' + i - 1); % b, c, d, e, f
        title(sprintf('(%c) w = %d, c = %d', huruf, w, c));
    end
end

% Fungsi pengambangan adaptif
function [g] = adapmean(f, w, c)
    [m, n] = size(f);
    delta = floor(w / 2);
    if c < 0
        g = zeros(m, n);
    else
        g = ones(m, n);
    end
    f = double(f);
    for y = 1+delta : m-delta
        for x = 1+delta : n-delta
            rerata = 0.0;
            for p = 1:w
                for q = 1:w
                    rerata = rerata + f(y-round(w/2)+p, x-round(w/2)+q);
                end
            end
            rerata = floor(rerata / (w * w)) - c;
            if f(y, x) >= rerata
                g(y, x) = 1;
            else
                g(y, x) = 0;
            end
        end
    end
end

