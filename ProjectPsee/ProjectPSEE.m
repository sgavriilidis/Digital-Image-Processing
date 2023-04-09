%A
fx = [];
for i=-255:256 
  fx(i+256)=i;
end
 q0 = uni_scalar(0,255,fx); %l=1
 q1 = uni_scalar(1,255,fx);%l=2
 q2 = uni_scalar(2,255,fx);%l=4
 q3 = uni_scalar(3,255,fx);%l=8
 q4 = uni_scalar(4,255,fx);%l=16
 q5 = uni_scalar(5,255,fx);%l=32
 q6 = uni_scalar(6,255,fx);%l=64
 q7 = uni_scalar(7,255,fx);%l=128
 q8 = uni_scalar(8,255,fx);%l=256

figure
subplot (3,3,1), plot (q0)
subplot (3,3,2), plot (q1) 
subplot (3,3,3), plot (q2)
subplot (3,3,4), plot (q3) 
subplot (3,3,5), plot (q4)
subplot (3,3,6), plot (q5) 
subplot (3,3,7), plot (q6)
subplot (3,3,8), plot (q7) 
subplot (3,3,9), plot (q8)

i=imread("lena_gray_512.tif");

%R=0
usqlena0 = uni_scalar(0,255,i) ;
figure
imshow(usqlena0)

%R=1
usqlena1 = uni_scalar(1,255,i) ;
figure
imshow(usqlena1)

%R=2
usqlena2 = uni_scalar(2,255,i) ;
figure
imshow(usqlena2)

%R=3
usqlena3 = uni_scalar(3,255,i) ;
figure
imshow(usqlena3)

%R=4
usqlena4 = uni_scalar(4,255,i) ;
figure
imshow(usqlena4)

%R=5
usqlena5 = uni_scalar(5,255,i) ;
figure
imshow(usqlena5)

%R=6
usqlena6 = uni_scalar(6,255,i) ;
figure
imshow(usqlena6)

%R=7
usqlena7 = uni_scalar(7,255,i) ;
figure
imshow(usqlena7)

%R=8
usqlena8 = uni_scalar(8,255,i) ;
figure
imshow(usqlena8)

figure
subplot (3,3,1), imshow(usqlena0)
subplot (3,3,2), imshow (usqlena1) 
subplot (3,3,3), imshow(usqlena2)
subplot (3,3,4), imshow(usqlena3) 
subplot (3,3,5), imshow(usqlena4)
subplot (3,3,6), imshow (usqlena5) 
subplot (3,3,7), imshow (usqlena6)
subplot (3,3,8), imshow(usqlena7) 
subplot (3,3,9), imshow(usqlena8)

%B
%B.1 B.2 

v = VideoReader('xylophone.mp4')

%b.3
frames=[];
while hasFrame(v)
    frame = readFrame(v);
    frames=[frames,frame];
end
figure
imshow(frames)
%B.4
frame50 = read(v,50);
%Grayscale
frame50gray = rgb2gray(frame50);
figure 
subplot (1,2,1), imshow(frame50)
subplot (1,2,2),imshow(frame50gray)

%C

frame50gray = imresize(frame50gray , [256 256]);
%C.3
[a , h , v ,d] = haart2( frame50gray,2);
%C.4
a = uni_scalar(4,64,a);
h{2} = uni_scalar(4,64,h{2});
v{2} = uni_scalar(4,64,v{2});
d{2} = uni_scalar(4,64,d{2});
h{1} = uni_scalar(4,128,h{1});
v{1} = uni_scalar(4,128,v{1});
d{1} = uni_scalar(4,128,d{1});
%C.5
h1 = entropy(h{1})
h2 = entropy(d{1})
h3 = entropy(v{1})
h4 = entropy(h{2})
h5 = entropy(d{2})
h6 = entropy(v{2})
h7 = entropy(a)
%C.6
inverse2image = uint8(ihaart2(a,h,v,d));
htotal = entropy(inverse2image)
figure
imshow(inverse2image)
peaksnr1 = psnr(frame50gray , inverse2image)
%C.7
[a1 , h1 , v1 ,d1] = haart2( frame50gray,2);

a1 = uni_scalar(5,64,a1);
h1{2} = uni_scalar(5,64,h1{2});
v1{2} = uni_scalar(5,64,v1{2});
d1{2} = uni_scalar(5,64,d1{2});
h1{1} = uni_scalar(3,128,h1{1});
v1{1} = uni_scalar(3,128,v1{1});
d1{1} = uni_scalar(3,128,d1{1});
%C.8
e1 = entropy(h1{1})
e2 = entropy(d1{1})
e3 = entropy(v1{1})
e4 = entropy(h1{2})
e5 = entropy(d1{2})
e6 = entropy(v1{2})
e7 = entropy(a1)
%C.9
inverse2image2 = uint8(ihaart2(a1,h1,v1,d1));
etotal = entropy(inverse2image2)
figure
imshow(inverse2image2)
peaksnr2 = psnr(frame50gray , inverse2image2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function usq = uni_scalar(R,A,X)
    Level = 2^R;
    Dlength = 2*A/Level;
    fl = floor( (abs(X)/Dlength) + 0.5);
    usq= Dlength*fl.*sign(X); 
end


