strImgO = 'mx.png';
imgO = imread(strImgO);
imgGray = rgb2gray(imgO);

[width, height, dim] = size(imgO);
BW = preprocessing(imgO);

k = 1;
for i = 1:width
    for j = 1:height
        if(BW(i,j) == 0)
            imgO(i,j,1) = 255;
            imgO(i,j,2) = 0;
            imgO(i,j,3) = 0;
        else
            pixelesEval(k) = imgGray(i,j); 
            k = k + 1;
        end
        
    end
end

imshow(imgO);

% extraction of features

[ mean, stdDev, smoothness, skewness, energy, entropy ] = featuresExtract(pixelesEval);

mean
stdDev
smoothness
skewness
energy
entropy

