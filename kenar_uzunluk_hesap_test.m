clear all
clear
clc

resim=imread('ürün_1.jpg');   %
% resim=urun;
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
if Red_value>0
    urun=bw_R;
end
if Green_value>0
    urun=bw_G;
end
if Blue_value>0
    urun=bw_B;
end

%%

imshow(urun);
[satir sutun]=size(urun);

gelensekil=0;
for i=1:satir
    for j=1:sutun
        gelensekil=length(find(urun(i,:)));
           deger1=urun(i,j);
            if deger1==1
                birx=j;
                biry=i;
                break
            end
    end
    if deger1 ==1
        break
    end
end

%%
if gelensekil > 20
   
    for  j=sutun:-1:1
    for  i=1:satir 
           deger1=urun(i,j);
            if deger1==1
                ikix=j;
                ikiy=i;
                break
            end
    end
    if deger1 ==1
        break
    end
end
%%
 for  j=sutun:-1:1
    for  i=satir:-1:1
           deger1=urun(i,j);
            if deger1==1
                ucx=j;
                ucy=i;
                break
            end
    end
    if deger1 ==1
        break
    end
end

%%

for i=satir:-1:1
    for j=1:sutun
           deger1=urun(i,j);
            if deger1==1
                dortx=j;
                dorty=i;
                break
            end
    end
    if deger1 ==1
        break
    end
end
    
%%
else 
    
    for i=1:satir
    for j=1:sutun
        
           deger1=urun(i,j);
            if deger1==1
                birx=j;
                biry=i;
                break
            end
    end
    if deger1 ==1
        break
    end
    end
    
     %% 
    for j=sutun:-1:1
    for i=1:satir
        
           deger1=urun(i,j);
            if deger1==1
                ikix=j;
                ikiy=i;
                break
            end
    end
    if deger1 ==1
        break
    end
    end 
    
    %%
    for   i=satir:-1:1
    for   j=sutun:-1:1
        
           deger1=urun(i,j);
            if deger1==1
                ucx=j;
                ucy=i;
                break
            end
    end
    if deger1 ==1
        break
    end
    end
    
    %%
    for  j=1:sutun
    for    i=satir:-1:1
        
           deger1=urun(i,j);
            if deger1==1
                dortx=j;
                dorty=i;
                break
            end
    end
    if deger1 ==1
        break
    end
     end   
end

 %%
 
kenar1=sqrt((birx-ikix)*(birx-ikix)+(biry-ikiy)*(biry-ikiy));
kenar2=sqrt((ucx-ikix)*(ucx-ikix)+(ucy-ikiy)*(ucy-ikiy));


