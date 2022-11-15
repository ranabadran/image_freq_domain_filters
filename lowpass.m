clc; close all;
input_image = imread("Image1.png");
input_image = rgb2gray(input_image);

% Saving the size of the input_image in pixels-
% M : no of rows (height of the image)
% N : no of columns (width of the image)
[M, N] = size(input_image);

% Compute the 2D fft and shift it to the center
freq = fftshift(fft2(input_image));

% Get the values of u & v
u=0:(M-1);
v=0:(N-1);
%low pass filter
D1 = (u - (M/2)).^2;
D2 = (v - (N/2)).^2;
[U,V]=meshgrid(D2,D1);
D = sqrt(U+V);
figure,mesh(D);

% Assign Cut-off Frequency  
D0 = 20; 
H = D <= D0;
figure,mesh (H)
filter_out = times(H,freq);

% Filtered Image
output_image = abs(ifft2(ifftshift(filter_out)));
figure;imshowpair(input_image,output_image,'montage');
imsave;

  
