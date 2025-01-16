clc
clear all
close all

% Generate a 1x5 array with random integers between 0 and 6
array = round(6 * rand(1, 5));
array 

% Sorting the array using the built-in sort function
sort_matrix = sort(array);

% Cumulative sum of the sorted array
sortedsum = cumsum(sort_matrix);

% Custom bubble sort implementation
n = length(array);

for i = 1:n-1
    for j = 1:n-i
        if array(j) > array(j+1)
            % Swap the elements
            temp = array(j);
            array(j) = array(j+1);
            array(j+1) = temp;
        end
    end
end

% Display the final sorted array after bubble sort
disp('custom bubble sort:');
disp(array);

% Display the cumulative sum of the original and sorted arrays
disp('Cumulative sum of the original array:');
disp(b);

disp('Cumulative sum of the sorted array:');
sortedsum

unique_element=unique(array);
sz=length(unique_element);;

disp('Number of unique elemenets:')
sz
