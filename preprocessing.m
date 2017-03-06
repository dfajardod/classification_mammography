function [ BW ] = preprocessing( imgO )

   
    % proceso de smooth
    cd VMF;
    imgSmoothed = VMF_DL1(imgO, 3); 
    cd ..;
    
    % se convierte a escala de grises
    imgGray = rgb2gray(imgSmoothed);
    
    % se ejecuta el método de Otsu para obtener el fondo
    level = graythresh(imgGray);
    BW = im2bw(imgGray, level);
       
end

