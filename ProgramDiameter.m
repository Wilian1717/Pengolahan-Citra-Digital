objek = imread('C:\Image\PasFotoHP.tif');

% Jika gambar RGB, ubah ke grayscale dulu
if ndims(objek) == 3
    objek = rgb2gray(objek);
end

% Binarisasi gambar dengan threshold (misal 128)
BW = objek > 128;

[tinggi, lebar] = size(BW);
pusat_x = 0;
pusat_y = 0;
luas = 0;

for q = 1 : tinggi
   for p = 1 : lebar
      if BW(q, p) == 1
         luas = luas + 1;
         pusat_x = pusat_x + p;
         pusat_y = pusat_y + q;
      end
   end
end

% Cek agar luas tidak nol (untuk mencegah error pembagian nol)
if luas == 0
    error('Objek tidak ditemukan, periksa threshold binarisasi');
end

pusat_x = pusat_x / luas;
pusat_y = pusat_y / luas;

imshow(BW);
[panjang, lebar] = size(BW);

line([0 lebar], [round(pusat_y) round(pusat_y)], 'Color', 'r')
line([round(pusat_x) round(pusat_x)], [0 panjang], 'Color', 'b')

