% By Bibo Lu
% Decomposite a RGB image to CB space and correct its brighness 
% Reconstruct a RGB image with corrected brightness and original chromatic
% information

%% Read images
clc
clear
close all
a0 = imread('skirt.jpg');
a1 = imread('kodim17.png');



%% Create an four block image with the same chromatic information
% 成比例的RGB颜色对应同样的色度信息
m1(:,:,1) = 10*ones(128,128);
m1(:,:,2) = 30*ones(128,128);
m1(:,:,3) = 50*ones(128,128);
m2 =2*m1;
m3 = 3*m1;
m4= 5*m1;
M=[m1,m2; m3,m4];
[Cm,Bm] = rgb2cb(M); 



%% Chromatic and brightness information for skirte image
[C0,B0] = rgb2cb(a0);


%% RGB2CB and  Gamma correct on brightness
[C1,B1] = rgb2cb(a1);
r = 2.0;
w = 441.6730;
B1new = w * [(B1/w).^(1/r)];
% CB2RGB
im = CBtoRGB(C1,B1new);

%%
figure,imshow([uint8(a1) uint8(im)]),title('input vs output');
imwrite(uint8(im),'im8.png');
