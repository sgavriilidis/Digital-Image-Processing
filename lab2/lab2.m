K = (1/16)*[ 1 2 1; 2 4 2 ;1 2 1];
K = rot90(K,2);


I = imread("lena_gray_512.tif");
figure
imshow(I)
%1
%zero
Z = padarray(I ,[1,1]);
convImage = uint8( convolution(Z,K));
figure
imshow(convImage)

%replicate
R = padarray(I ,[1,1],'replicate');
convImagerep =uint8( convolution(R,K));
figure
imshow(convImagerep)
err = immse(I,convImagerep)
peaksnr = psnr(I,convImagerep)


%2.1zero
convImage2 = uint8( conv2(I,K,'same') );
figure
imshow(convImage2)
err = immse(I,convImage2)
peaksnr = psnr(I,convImage2)
%2.2 replicate
R2 = padarray(I ,[1,1],'replicate');
convImage22 = uint8( conv2(R2,K,'same') );
convImage22 = imresize(convImage22,[512,512]);
figure
imshow(convImage22)
err = immse(I,convImage22)
peaksnr = psnr(I,convImage22)
%3 zero

convImage3 = uint8( imfilter(I,K,'same'));
figure
imshow(convImage3)
err = immse(I,convImage3)
peaksnr = psnr(I,convImage3)

%replicate
convImage4 = uint8( imfilter(I,K,'replicate', 'same'));
figure
imshow(convImage4)
err = immse(I,convImage4)
peaksnr = psnr(I,convImage4)

function convIm = convolution(image,kernel);
[r, c] = size(image);
[m, n] = size(kernel);
result = zeros(512,512);
    for x = (1+m) : (r+m-2)
        for y = (1+n) :(c+n-2)
            value =0;
            for i=1:m
                for j=1:n
                 value = value + kernel(i,j)*image(x-i,y-j);
                end
            end
            result(x-m,y-n) = value;
        end
    end
    convIm = result;   
end