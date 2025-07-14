img=imread('c:\image\PasFotoHP.tif');
[jum_baris,jum_kolom]=size(img);
histogram=zeros(256,1);
for baris=1 : jum_baris
for kolom=1 : jum_kolom
 histogram(img(baris,kolom) + 1) = ...
 histogram(img(baris,kolom) + 1) + 1;
end
end
horijontal=(0:255) ;
bar(horijontal,histogram);
subplot(1,2,1);imshow(img), title ('citra abu-abu')
subplot(1,2,2);bar(horijontal,histogram), title ('Hitogram Citra')
