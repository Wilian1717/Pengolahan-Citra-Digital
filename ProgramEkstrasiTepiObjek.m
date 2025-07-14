f=imread('c:\image\daun_bin.tif');
[jum_baris, jum_kolom] = size(f);
g=f;
g = zeros(jum_baris, jum_kolom);
for q = 2 : jum_baris - 1
    for p = 2 : jum_kolom - 1
        p0 = f(q, p+1);
        p1 = f(q-1, p+1);
        p2 = f(q-1, p);
        p3 = f(q-1, p-1);
        p4 = f(q, p-1);
        p5 = f(q+1, p-1);
        p6 = f(q+1, p);
        p7 = f(q+1, p+1);
        sigma = p0 + p1 + p2 + p3 + p4 + p5 + p6 + p7;
        if sigma == 8
            g(q, p) = 0;
        else
            g(q, p) = f(q, p);
        end
    end
end
subplot(1,2,1);imshow(f),title 'Citra Input'
subplot(1,2,2);imshow(g),title 'Citra Ouput'


