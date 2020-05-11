function im = CBtoRGB(C,br)

 im(:,:,1) = C(:,:,1).*br;
 im(:,:,2) = C(:,:,2).*br;
 im(:,:,3) = C(:,:,3).*br; 
im = uint8(im);
