[i,map ] = imread("village.gif");
figure
imshow (i, "displayrange", [])

bw= im2bw(i,map,0.5);
figure
imshow (bw)
%imagesc(bw);
%colormap(gray); 
winsize = 3;
thr=5;
figure
UrbanDetec('village.gif','bwvillage.gif',winsize,thr);

se = strel('diamond', 12);
totophat = imdilate(imerode(i, se), se);
tophat =  i - totophat;
figure 
imshow (tophat)
bothat = imbothat(i,se);
figure 
imshow (bothat)
normtop = im2double(tophat);
normbot = im2double(bothat);
%figure 
%imshow (normtop)
thresh = graythresh(normtop);
bwth = im2bw(normtop, thresh);
figure 
imshow (bwth)
thresh = graythresh(normbot);
bwbh = im2bw(normbot, thresh);
figure 
imshow (bwbh)

se = strel('line', 2, 10);

opentop = imopen(bwth,se);
figure      
imshow (opentop)

closebot = imclose(bwbh,se);
figure      
imshow (closebot)
openbot = imopen(closebot,se);
figure      
imshow (openbot)

final = imfuse(opentop , openbot);
figure      
imshow (final)

