clc
clear all
close all

n = 10; 
s = '';  
while n > 0
    m = mod(n, 2);  
    s = [num2str(m), s]; 
    n = floor(n / 2);  
end

s