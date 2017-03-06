function dist=DL1(V1,V2)
%
%function dist=DL1(V1,V2)
%funcion que calcula la distancia entre los vectores V1 y V2
%segun la metrica City-Block distance
%

dist = sum(abs(double(V1)-double(V2)));
