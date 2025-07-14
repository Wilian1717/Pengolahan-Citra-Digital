function [C,M,Y,K] = RGBkeCMY(R,G,B)
% RGBkeCMY digunakan untuk mengonversi RGB ke CMYK
% Berdasarkan Pratt (2001)

% Normalisasi RGB ke [0, 1]
R = double(R);
G = double(G);
B = double(B);

if max(R(:)) > 1.0 || max(G(:)) > 1.0 || max(B(:)) > 1.0
    R = R / 255;
    G = G / 255;
    B = B / 255;
end

u = 0.5;
b = 1;
[tinggi, lebar] = size(R);

% Inisialisasi matriks hasil
C = zeros(tinggi, lebar);
M = zeros(tinggi, lebar);
Y = zeros(tinggi, lebar);
K = zeros(tinggi, lebar);

for m = 1:tinggi
    for n = 1:lebar
        Kb = min([1 - R(m,n), 1 - G(m,n), 1 - B(m,n)]);
        if Kb == 1
            C(m,n) = 0;
            M(m,n) = 0;
            Y(m,n) = 0;
            K(m,n) = 1;
        else
            C(m,n) = (1 - R(m,n) - u * Kb);
            M(m,n) = (1 - G(m,n) - u * Kb);
            Y(m,n) = (1 - B(m,n) - u * Kb);
            K(m,n) = b * Kb;
        end
    end
end

% Konversikan ke jangkauan [0,255]
C = uint8(C * 255);
M = uint8(M * 255);
Y = uint8(Y * 255);
K = uint8(K * 255);
end

