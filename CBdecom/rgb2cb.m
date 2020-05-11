function [C,B] =rgb2cb(I)
I=double(I);

% 计算亮度
B=sqrt(I(:,:,1).^2+I(:,:,2).^2+I(:,:,3).^2);
% 计算色度向量
C(:,:,1)=I(:,:,1)./(B+eps);
C(:,:,2)=I(:,:,2)./(B+eps);
C(:,:,3)=I(:,:,3)./(B+eps);

Bcolor(:,:,1) = mat2gray(B);
Bcolor(:,:,2) =Bcolor(:,:,1);
Bcolor(:,:,3)=Bcolor(:,:,1);
% 显示色度图像
 % figure,imshow(C,[]),title('Color on chromaticity')
% 显示亮度图像
 % figure,imshow(B,[]),title('Brightness');

imageB = mat2gray(B); % 变换到了[0,1]之间
imwrite(uint8(255*imageB),'br255.tif');
% figure,imshow(imageB),title('mat2b')


imageC(:,:,1) = mat2gray(C(:,:,1));
imageC(:,:,2) = mat2gray(C(:,:,2));
imageC(:,:,3) = mat2gray(C(:,:,3));
% figure,imshow(imageC),title('mat2C')

figure,imshow([uint8(I) uint8(255*C) uint8(255*Bcolor) ]),
title('RGB image, C image and Br image')
%figure,imshow([mat2gray(C(:,:,1)) mat2gray(C(:,:,2)) mat2gray(C(:,:,3))]),title('C1, C2 and B3')

% imwrite(B,'Brightness.png');
%  imwrite(imageB,'B.tif')
%imwrite(imageC,'C.tif')