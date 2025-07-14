function ProgramRGBkeYIQ  % Nama fungsi harus sama persis dengan nama file

    % ================= PROGRAM KONVERSI RGB KE YIQ =================

    % Baca gambar
    img = imread('C:\Image\PasFotoUPB.jpg');  % Pastikan path-nya benar
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);

    % Konversi citra ke YIQ
    [Y,I,Q] = RGBkeYIQ(R, G, B);

    % Tampilkan hasil
    figure;
    subplot(1,2,1); imshow(img); title('Citra Input Berwarna');
    subplot(1,2,2); imshow(cat(2, Y, I, Q)); title('Citra Output YIQ');

    % Contoh Manual
    [Y_test,I_test,Q_test] = RGBkeYIQ(171, 20, 250);
    disp('Hasil konversi RGB(171,20,250) ke YIQ:');
    disp(['Y = ', num2str(Y_test), ', I = ', num2str(I_test), ', Q = ', num2str(Q_test)]);

end

% ================= FUNGSI RGBkeYIQ =================
function [Y, I, Q] = RGBkeYIQ(R,G,B)
    % RGBkeYIQ digunakan untuk mengonversi RGB ke YIQ

    % Normalisasi RGB ke [0, 1]
    R = double(R);
    G = double(G);
    B = double(B);

    if max(R(:)) > 1.0 || max(G(:)) > 1.0 || max(B(:)) > 1.0
        R = R / 255;
        G = G / 255;
        B = B / 255;
    end

    [tinggi, lebar] = size(R);
    Y = zeros(tinggi, lebar);
    I = zeros(tinggi, lebar);
    Q = zeros(tinggi, lebar);

    for m = 1:tinggi
        for n = 1:lebar
            Y(m,n) = 0.299 * R(m,n) + 0.587 * G(m,n) + 0.114 * B(m,n);
            I(m,n) = 0.596 * R(m,n) - 0.274 * G(m,n) - 0.322 * B(m,n);
            Q(m,n) = 0.211 * R(m,n) - 0.523 * G(m,n) + 0.312 * B(m,n);
        end
    end

    % Skala ke [0, 255]
    Y = uint8(Y * 255);
    I = uint8(I * 255);
    Q = uint8(Q * 255);
end

