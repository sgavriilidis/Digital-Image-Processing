clc ;
%1
g0  =  imread('cameraman.tif');
g0 = im2double(g0);
G = fspecial('gaussian',[5 5],1);
g1 = conv2(g0,G,'same');
g1 =  imresize(g1,0.5,'bicubic');
g2 = conv2(g1,G,'same');
g2 =  imresize(g2,0.5,'bicubic');
g3 = conv2(g2,G,'same');
g3 =  imresize(g3,0.5,'bicubic');
g4 = conv2(g3,G,'same');
g4 =  imresize(g4,0.5,'bicubic');
figure
subplot (5,1,1) , imshow(g4);
subplot (5,1,2) , imshow(g3);
subplot (5,1,3) , imshow(g2);
subplot (5,1,4) , imshow(g1);
subplot (5,1,5) , imshow(g0);


figure
imshow(g4);
figure
imshow(g3);
figure
imshow(g2);
figure
imshow(g1);
figure
imshow(g0);
%2

l4= g4;
l3= imresize(g4,2,'bicubic');
l3= g3 - l3;
l2= imresize(g3,2,'bicubic');
l2 =g2-l2;
l1= imresize(g2,2,'bicubic');
l1=g1-l1;
l0=imresize(g1,2,'bicubic');
l0=g0-l0;
figure
imshow(l4);
figure
imshow(l3);
figure
imshow(l2);
figure
imshow(l1);
figure
imshow(l0);

l4 = imresize(l4,2,'bicubic');
l3 = l3+l4;
l3 =imresize(l3,2,'bicubic');
l2=l2+l3;
l2 = imresize(l2,2,'bicubic');
l1=l1+l2;
l1 =imresize(l1,2,'bicubic');
l0=l0+l1;
figure
imshow(l4);
figure
imshow(l3);
figure
imshow(l2);
figure
imshow(l1);
figure
imshow(l0);
figure
imshowpair(l0,g0,'montage')
figure
imshowpair(l0,g0,'diff')
err  = uint8(immse(l0,g0))

