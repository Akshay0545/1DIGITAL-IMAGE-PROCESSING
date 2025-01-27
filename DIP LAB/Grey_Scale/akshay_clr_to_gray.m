clc;
clear aal;
close all;

% Reading the image
I = imread('landscape.jpg');

% Get image dimensions
[rows, cols, ~] = size(I);

% Displaying value of a specified pixel
row = 1010; % Desired row
col = 505;  % Desired column

if row <= rows && col <= cols
    disp(['Pixel value at (', num2str(row), ',', num2str(col), '): ', num2str(I(row, col, :))]);
else
    disp('Specified pixel coordinates are out of bounds.');
end

% Grayscale img using single layer of color img
I_gray1 = I(:,:,1);

% Grayscale img using average method
I_r = I(:,:,1); % Red channel
I_g = I(:,:,2); % Green channel
I_b = I(:,:,3); % Blue channel
I_gray2 = round((I_r + I_g + I_b) / 3);

% Grayscale img using luminosity method
I_gray3 = round(0.299 * I_r + 0.587 * I_g + 0.114 * I_b);

% Red version of image
Ired = I;
Ired(:,:,2:3) = 0; % Remove Green and Blue channels

% Green version of image
Igreen = I;
Igreen(:,:,[1,3]) = 0; % Remove Red and Blue channels

% Blue version of image
Iblue = I;
Iblue(:,:,1:2) = 0; % Remove Red and Green channels

% Displaying grayscale versions using different methods
figure(1)
subplot(2,2,1), imshow(I); xlabel('Reference Image');
subplot(2,2,2), imshow(I_gray1); xlabel('Grayscale Image #1');
subplot(2,2,3), imshow(I_gray2); xlabel('Grayscale Image #2');
subplot(2,2,4), imshow(I_gray3); xlabel('Grayscale Image #3');

% Displaying RGB-separated versions
figure(2)
subplot(2,2,1), imshow(I); xlabel('Reference Image');
subplot(2,2,2), imshow(Ired); xlabel('Red Image');
subplot(2,2,3), imshow(Igreen); xlabel('Green Image');
subplot(2,2,4), imshow(Iblue); xlabel('Blue Image');
