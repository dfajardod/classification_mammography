function [ mean, stdDev, smoothness, skewness, energy, entropy  ] = featuresExtract( muestra )
	[freq,zi] = imhist(muestra, 256);
    n = sum(freq);
    mean = 0;
    energy = 0;
    entropy = 0;
    for i = 1:256
        prob_zi = freq(i) / n;
        if(prob_zi ~= 0)
            mean = mean + (zi(i) * prob_zi);
            energy = energy + prob_zi.^2;
            entropy = entropy + prob_zi * log2(prob_zi);
        end 
    end
    entropy = entropy * -1;
    skewness = 0;
    for i = 1:256
        skewness = skewness + ((zi(i) - mean).^3 * (freq(i) / n));
    end

    stdDev = std(double(muestra), 0);
    smoothness = 1 - 1 / (1 + stdDev.^2);
end