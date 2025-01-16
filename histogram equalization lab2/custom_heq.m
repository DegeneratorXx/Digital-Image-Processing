img = imread('Screenshot (184).png');
img = rgb2gray(img); % Convert to grayscale if the image is in color

subplot(1,2,1);
imshow(img);
title('Original Image');

% Step 1: Compute the histogram of the image
[rows, cols] = size(img);
histogram = zeros(1, 256); % Array to store frequency of each intensity value (0-255)

% Calculate the histogram
for r = 1:rows
    for c = 1:cols
        intensity = img(r,c);
        histogram(intensity + 1) = histogram(intensity + 1) + 1; % Increment count for the intensity
    end
end

% Step 2: Calculate the cumulative distribution function (CDF)
cdf = cumsum(histogram) / (rows * cols); % Normalize CDF

% Step 3: Map the CDF to new intensity values (0-255)
new_values = round(cdf * 255);

% Step 4: Create the equalized image
equalized_img = zeros(rows, cols);

for r = 1:rows
    for c = 1:cols
        intensity = img(r,c);
        equalized_img(r,c) = new_values(intensity + 1); % Map the original intensity to the new intensity
    end
end

subplot(1,2,2);
imshow(uint8(equalized_img)); % Convert to uint8 for display
title('Equalized Image');
