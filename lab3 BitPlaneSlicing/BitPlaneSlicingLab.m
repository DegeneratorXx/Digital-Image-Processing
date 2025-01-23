clc
clear all
close all

img= imread("lena.png");
img=rgb2gray(img);

% Display the original image
figure;
imshow(img);
title('Original Image');

[rows, cols] = size(img);
bit_planes = zeros(rows, cols, 8, 'uint8');

% Loop through each pixel and extract binary bits
for i = 1:rows
    for j = 1:cols
        % Convert the pixel value to an 8-bit binary number
        pixel_binary = dec2bin(img(i, j), 8); % Returns a string of 8 bits
        
        % Extract each bit and store it in the corresponding bit-plane
        for bit = 1:8
            bit_planes(i, j, bit) = str2double(pixel_binary(bit)); % Convert char to number
        end
    end
end

% Display all bit-planes in one figure
figure;
for bit = 1:8
    % Scale the bit-plane to 0-255 for visualization
    bit_plane_image = bit_planes(:, :, bit) * 255;
    
    % Create a subplot for each bit-plane
    subplot(2, 4, bit); % Arrange in a 2x4 grid (2 rows, 4 columns)
    imshow(uint8(bit_plane_image));
    title(['Bit-Plane ', num2str(bit)]);
end

% Add a main title for the figure
sgtitle('All Bit-Planes'); % For MATLAB R2018b or newer
