img = imread('Screenshot (184).png');
img = rgb2gray(img);

subplot(1,2,1);
imshow(img);
title('Original Image');

%built in function
equalized_img = histeq(img);

subplot(1,2,2);
imshow(equalized_img);
title('Heq Image');