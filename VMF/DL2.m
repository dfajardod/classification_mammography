function dist=DL2(V1,V2)
%
%function dist=DL2(V1,V2)
%funcion que calcula la distancia entre los vectores V1 y V2
%segun la metrica de distancia euclidea o L2-Norma
%

%dv1 = double(V1);
%dv2 = double(V2);

%E = dv1 - dv2;

%E = E.^2;

%E = sum(E);

%dist = sqrt(E);

dist = sqrt(sum((double(V1) - double(V2)).^2));