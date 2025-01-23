clc
clear all
close all

n = 10; 

binaryString = dec2bin(n); 
binaryArray = double(binaryString) - '0';
disp(binaryArray);
disp(["number of bits:", length(binaryString)])
