clear all
clear
clc

resim=imread('�r�n_1.jpg');   %

%%
R=resim(:,:,1);
gri_R=rgb2gray(resim);
gri_R=gri_R+50;
tespit_R=imsubtract(R,gri_R);
ort_R=graythresh(tespit_R);
bw_R=im2bw(tespit_R,ort_R);

%%
G=resim(:,:,2);
gri_G=rgb2gray(resim);
gri_G=gri_G+50;
tespit_G=imsubtract(G,gri_G);
ort_G=graythresh(tespit_G);
bw_G=im2bw(tespit_G,ort_G);

%%
B=resim(:,:,3);
gri_B=rgb2gray(resim);
gri_B=gri_B+50;
tespit_B=imsubtract(B,gri_B);
ort_B=graythresh(tespit_B);
bw_B=im2bw(tespit_B,ort_B);

%%
subplot(2,2,1); imshow(resim); title('�r�nler');
subplot(2,2,2); imshow(bw_R); title('K�rm�z� �r�nler');
subplot(2,2,3); imshow(bw_G); title('Ye�il �r�nler');
subplot(2,2,4); imshow(bw_B); title('Mavi �r�nler');

%%
[satir_R sutun_R]=size(bw_R);
Red_value=0;
for i=1:satir_R
    for j=1:sutun_R
        if bw_R(i,j)>0
            Red_value=Red_value+1;
        end
    end
end

%%
[satir_G sutun_G]=size(bw_G);
Green_value=0;
for i=1:satir_G
    for j=1:sutun_G
        if bw_G(i,j)>0
            Green_value=Green_value+1;
        end
    end
end

%%
[satir_B sutun_B]=size(bw_B);
Blue_value=0;
for i=1:satir_B
    for j=1:sutun_B
        if bw_B(i,j)>0
            Blue_value=Blue_value+1;
        end
    end
end

%%
value=0;
if Red_value>Green_value && Red_value>Blue_value
    value=1;
elseif Green_value>Red_value && Green_value>Blue_value
    value=2;
elseif Blue_value>Red_value && Blue_value>Green_value
    value=3;
end

%%
if value==1
    resim_bw=bw_R;

elseif value==2
    resim_bw=bw_G;
    
elseif value==3
    resim_bw=bw_B;
end

%%
fprintf('K�rm�z� de�eri : %d \nYe�il de�eri : %d \nMavi de�eri : %d',Red_value, Green_value, Blue_value);

figure;imshow(resim_bw);



% rgb=rgb2gray(resim_bw);
% umbral =graythresh(resim_bw); % Bw resme d�n��t�rmek i�in e�ik hesaplamas�
% imag_bw=im2bw(resim_bw, umbral);% e�ik kullanarak d�n���m veya ikili g�r�nt�
imag_bw=bwareaopen(resim_bw,50);


[B,L]=bwboundaries(imag_bw,'noholes');disp(B);
imshow(label2rgb(L, @jet, [.5 .5 .5]));
hold on;
%% Resimde mevcut olan nesnelerin tan�mlanmas� ve etiketlenmesi
imag_bw_label=bwlabel(imag_bw);% bw g�r�nt�s�nde bulunan nesneleri tan�mlar.
figure;imshow(label2rgb(imag_bw_label));%etiketli g�r�nt�n�n g�sterimi
propiedadies= regionprops(imag_bw_label ,'Area','Centroid','BoundingBox');%g�r�nt�deki nesnelerin �zelliklerini belirler
Area=propiedadies.Area(1,1);

% Area = Alan 
% Centroid= A��rl�k merkezi
% Bounding box= S�n�rlay�c� kutu

for k = 1:length(B)
    boundary = B{k};
    
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth',2)
end

fprintf('Nesneler belirlenmi�tir. Toplam nesne say�s�=%d\n',k);

stats=regionprops(L,'Area','Centroid','BoundingBox');
