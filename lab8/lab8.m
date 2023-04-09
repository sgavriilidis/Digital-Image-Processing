%1
i = imread("cameraman.tif");
%2
inew = imresize(i, [ 30 30]);
%3
 fftnew = fft2(inew, 37 ,37);
%4
 figure 
 imshow(inew)
 shifted =  abs(fftshift(fftnew));
 figure 
 imagesc(shifted)
 figure 
 mesh(shifted)
%5
sigma=0.8;
nx=9;
ny=9;
[x,y]=meshgrid(-nx:0.5:nx,-ny:0.5:ny);
G=(0.5./(pi.*(sigma.^2))).*exp(-0.5.*((y.^2+x.^2)./(sigma.^2)));  
figure
mesh(x,y,G)
%6
G_fft=fft2(G);
%7
figure
mesh(x,y,abs(G_fft))
%8
gauss_conv = conv2(i, G);
gauss_conv_mse = imresize(gauss_conv , [ 512 512]);
%9
fftmulti = shifted.*G;
%10
inversefft = ifft2(ifftshift(fftmulti));
inversefft = imresize(inversefft , [ 30 30]);

%11
toeplitz = convmtx2( G,30,30);
final = reshape(toeplitz*double(inew(:)), size(G)+[30 30]-1);
targetSize = [30  30];
r = centerCropWindow2d(size(final),targetSize);
final = imcrop(final,r);
%12
figure
imagesc(gauss_conv)
colormap(gray)
inversefft = uint8(abs(inversefft));
figure
colormap(gray(256));
imagesc(inversefft);

%colormap(gray)
figure
imagesc(final);
colormap(gray);

%13
 mse8 = immse(i ,uint8(gauss_conv_mse ))
 mse10=immse(inew ,inversefft )
 mse11=immse(inew ,uint8(final))
 
 
 