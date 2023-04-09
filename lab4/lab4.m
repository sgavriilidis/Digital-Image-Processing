
im= imread('noisyimg.png');
figure
imshow(im)
k3 = ones(3);
k5 = ones(5);
k9 = ones(9);
filtered1 = Compute_Median(im, k3);
figure
imshow(filtered1)
filtered2 = Compute_Median(im, k5);
figure
imshow(filtered2)
filtered3 = Compute_Median(im, k9);
figure
imshow(filtered3)

max1 = Compute_Max(im, k3);
figure
imshow(max1)
max2= Compute_Max(im, k5);
figure
imshow(max2)
max3 = Compute_Max(im, k9);
figure
imshow(max3)

min1 = Compute_Min(im, k3);
figure
imshow(min1)
min2 = Compute_Min(im, k5);
figure
imshow(min2)
min3 = Compute_Min(im, k9);
figure
imshow(min3)

function medi = Compute_Median(image,kernel)
[r, c] = size(image);
[n, n] = size(kernel);

siz = 2*floor(n/2);
I = padarray(image ,[siz,siz],'replicate');
    for i=1:(r-1+siz)
        for j=1:(c-1+siz)
            patch= [];
            for k=1:n
                for l=1:n
                    patch = [patch , I(i+l,j+k)];
                end  
            end
             patch = sort(patch);
             m =median(patch);
             I(i-1+siz,j-1+siz) = m;
        end
    end
medi = I;
end

function maxi = Compute_Max(image,kernel)
[r, c] = size(image);
[n, n] = size(kernel);

siz = 2*floor(n/2);
I = padarray(image ,[siz,siz],'replicate');
    for i=1:(r-1+siz)
        for j=1:(c-1+siz)
            patch= [];
            for k=1:n
                for l=1:n
                    patch = [patch , I(i+k,j+l)];
                end  
            end
             patch = sort(patch);
             m =patch(9);
             I(i-1+siz,j-1+siz) = m;
        end
    end
maxi = I;
end

function mini = Compute_Min(image,kernel)
[r, c] = size(image);
[n, n] = size(kernel);

siz = 2*floor(n/2);
I = padarray(image ,[siz,siz],'replicate');
    for i=1:(r-1+siz)
        for j=1:(c-1+siz)
            patch= [];
            for k=1:n
                for l=1:n
                    patch = [patch , I(i+k,j+l)];
                end  
            end
             patch = sort(patch);
             m =patch(1);
             I(i-1+siz,j-1+siz) = m;
        end
    end
mini = I;
end

