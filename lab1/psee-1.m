%CAMERMAN
%0.5
A = imread('cameraman.tif');
B= imresize(A,0.5,'nearest');
C= imresize(B,2,'nearest'); %default is with Nearest-neighbor interpolation/ Antialiasing false
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.5,'nearest','antialiasing',true);
C= imresize(B,2,'nearest','antialiasing',true); %default is with Nearest-neighbor interpolation/ Antialiasing false
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.5,'bilinear','antialiasing',false);
C= imresize(B,2,'bilinear','antialiasing',false); 
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.5,'bilinear');
C= imresize(B,2,'bilinear'); %default is with bilinear interpolation/ Antialiasing true
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off


A = imread('cameraman.tif');
B= imresize(A,0.5,'bicubic','antialiasing',false);
C= imresize(B,2,'bicubic','antialiasing',false); 
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.5,'bicubic');
C= imresize(B,2,'bicubic'); %default is with bicubic interpolation/ Antialiasing true
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off




%0.25

A = imread('cameraman.tif');
B= imresize(A,0.25,'nearest');
C= imresize(B,4,'nearest'); %default is with Nearest-neighbor interpolation/ Antialiasing false
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.25,'nearest','antialiasing',true);
C= imresize(B,4,'nearest','antialiasing',true); %default is with Nearest-neighbor interpolation/ Antialiasing false
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.25,'bilinear','antialiasing',false);
C= imresize(B,4,'bilinear','antialiasing',false); 
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.25,'bilinear');
C= imresize(B,4,'bilinear'); %default is with bilinear interpolation/ Antialiasing true
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off


A = imread('cameraman.tif');
B= imresize(A,0.25,'bicubic','antialiasing',false);
C= imresize(B,4,'bicubic','antialiasing',false); 
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.25,'bicubic');
C= imresize(B,4,'bicubic'); %default is with bicubic interpolation/ Antialiasing true
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

%0.125

A = imread('cameraman.tif');
B= imresize(A,0.125,'nearest');
C= imresize(B,8,'nearest'); %default is with Nearest-neighbor interpolation/ Antialiasing false
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.125,'nearest','antialiasing',true);
C= imresize(B,8,'nearest','antialiasing',true); %default is with Nearest-neighbor interpolation/ Antialiasing false
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.125,'bilinear','antialiasing',false);
C= imresize(B,8,'bilinear','antialiasing',false); 
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure;
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.125,'bilinear');
C= imresize(B,8,'bilinear'); %default is with bilinear interpolation/ Antialiasing true
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off


A = imread('cameraman.tif');
B= imresize(A,0.125,'bicubic','antialiasing',false);
C= imresize(B,8,'bicubic','antialiasing',false); 
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

A = imread('cameraman.tif');
B= imresize(A,0.125,'bicubic');
C= imresize(B,8,'bicubic'); %default is with bicubic interpolation/ Antialiasing true
err = immse(A,C);
fprintf('\n The mean-squared error is %0.4f\n', err);
figure
imshowpair(A,C,'montage')
axis off

