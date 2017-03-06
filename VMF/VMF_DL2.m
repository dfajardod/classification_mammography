%function [FilteredI,PC] = VMF_DL2(Image,WSize)
function FilteredI = VMF_DL2(Image,WSize)
%
%
%funcion que realiza un filtrado de mediana vectorial usando como medida
%de distancias para la distancia acumulada la metrica DL2 
%

[a,b,c] = size(Image);
%calculamos limites de exploracion
delta = fix(WSize/2);
i0 = 1 + delta;
j0 = 1 + delta;
in = a - delta;
jn = b - delta;

FilteredI = zeros(a,b,c);
FilteredI = Image; %esto solo vale para copiar los bordes, que no se tratan
PC = 0;
%para cada elemento de la imagen a considerar (2 for)
for i=i0:in
    for j=j0:jn
        %'pixel en consideracion'
        dist = zeros(WSize); %matriz auxiliar de distancia acumulada
        %para cada vector de la ventana (2 minifor)
        for k=i-delta:i+delta
            for l=j-delta:j+delta
                %[k l]
                v1 = [Image(k,l,1) Image(k,l,2) Image(k,l,3)]; %vector (k,l) de la ventana
                %con respecto a cada vector de la ventana (2 minifor)
                for m=i-delta:i+delta
                    for n=j-delta:j+delta
                        %[m n]
                        v2 = [Image(m,n,1) Image(m,n,2) Image(m,n,3)];
                        aux = DL2(v1,v2);
                        dist(k-i+i0,l-j+j0) = dist(k-i+i0,l-j+j0) + aux; %sumamos a la distancia acumulada                       
                        %pause
                    end
                end    
            end
        end
        %dist
        %calculamos la posicion de minima distancia
        [imin,jmin]=find(dist==min(min(dist)));
        imin = imin(1);
        jmin = jmin(1);
        isel = i-i0+imin;
        jsel = j-j0+jmin;
        %sustituimos el vector central (i,j) por el de minima distancia acumulada       
        FilteredI(i,j,1)=Image(isel,jsel,1);
        FilteredI(i,j,2)=Image(isel,jsel,2);
        FilteredI(i,j,3)=Image(isel,jsel,3);
        %if ((isel == i) && (jsel == j)) 'Este no se cambia'      
        %end         
        if ((isel~=i)||(jsel~=j))
            PC = PC+1;
        end
    end
end
PC = PC/(a*b);

end