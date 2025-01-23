clc
clear all
close all

% Read and preprocess the input image
inputImage = imread('lena.png'); 
inputImage = rgb2gray(inputImage); 


% Get image dimensions
[rows, cols] = size(inputImage);

% Calculate original histogram and PDF
histogramOriginal = zeros(256, 1); 
for i = 1:rows
    for j = 1:cols
        intensity = inputImage(i, j);
        histogramOriginal(intensity + 1) = histogramOriginal(intensity + 1) + 1;
    end
end
pdfOriginal = histogramOriginal / (rows * cols);

% Compute CDF and intensity mapping
cdfOriginal = cumsum(pdfOriginal);
equalizedValues = round(cdfOriginal * 255);

% Create equalized image
equalizedImage = zeros(size(inputImage));
for i = 1:rows
    for j = 1:cols
        equalizedImage(i, j) = equalizedValues(inputImage(i, j) + 1);
    end
end
equalizedImage = uint8(equalizedImage);

% Calculate histogram and PDF for equalized image
histogramEqualized = zeros(256, 1); 
for i = 1:rows
    for j = 1:cols
        intensity = equalizedImage(i, j);
        histogramEqualized(intensity + 1) = histogramEqualized(intensity + 1) + 1;
    end
end
pdfEqualized = histogramEqualized / (rows * cols);
cdfEqualized = cumsum(pdfEqualized);

% Display results
figure;
subplot(2, 2, 1); imshow(inputImage); title('Original Image');
subplot(2, 2, 2); imhist(inputImage); hold on;
plot(cdfOriginal * max(histogramOriginal), 'r', 'LineWidth', 2); legend('Histogram', 'CDF'); title('Histogram & CDF (Original)');
subplot(2, 2, 3); imshow(equalizedImage); title('Equalized Image');
subplot(2, 2, 4); imhist(equalizedImage); hold on;
plot(cdfEqualized * max(histogramEqualized), 'r', 'LineWidth', 2); legend('Histogram', 'CDF'); title('Histogram & CDF (Equalized)');
