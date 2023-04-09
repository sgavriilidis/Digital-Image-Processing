i = imread("cell.tif");
figure
imshow (i, "displayrange", [])

[~,thr] = edge(i,"Sobel");
fudge=0.6;
bw =edge(i,"sobel",thr*fudge);
figure
imagesc(bw);
colormap(gray); 


se0=strel("line",3,0);
se90=strel("line",3,90);
dil=imdilate(bw,[se90 se0]);
figure
imagesc(dil);
colormap(gray);

fill = imfill(dil,'holes');
figure
imagesc(fill);
colormap(gray);

bord = imclearborder(fill,4);
figure
imshow(bord)
seD = strel('diamond',1);
erode = imerode(bord,seD);
erode = imerode(erode,seD);
figure
imshow(erode)

figure
imshow(labeloverlay(i,erode))


outline = bwperim(erode);
se = strel('line',2,90);
outline = imdilate(outline,se);
SegoutR = i;
SegoutG = i;
SegoutB = i;

SegoutR(outline) = 255;
SegoutG(outline) = 0;
SegoutB(outline) = 0;
SegoutRGB = cat(3, SegoutR, SegoutG, SegoutB);
figure
imshow(SegoutRGB)

figure
subplot (1,4,1) , imshow(bw);
subplot (1,4,2) , imshow(dil);
subplot (1,4,3) , imshow(erode);
subplot (1,4,4) , imshow(SegoutRGB);


