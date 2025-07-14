x = imread('c:\image\daun_bin.tif');
[tinggi, lebar] = size(x);
hasil = 0;
for p = 1 : tinggi
    for q = 1 : lebar
        if x(p, q) == 1
            hasil = hasil + 1;
        end
    end
end
luas_citra_daun_bin = hasil;
disp(['Luas citra daun biner: ', num2str(luas_citra_daun_bin)]);

