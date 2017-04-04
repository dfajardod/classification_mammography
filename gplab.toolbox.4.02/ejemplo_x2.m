fprintf('Running symbolic regression demo...');
p=resetparams;

p=setoperators(p,'crossover',2,2,'mutation',1,1);
p.operatorprobstype='variable';
p.minprob=0;

p=setfunctions(p, 'myif', 2);
%p=addfunctions(p, 'minus', 2);

p=setterminals(p,'8','3');

p.datafilex='datosX_ejemplo_x2.txt';
p.datafiley='datosY_ejemplo_x2.txt';

%p.usetestdata=1;
%p.testdatafilex='exp_x.txt';
%p.testdatafiley='exp_y.txt';

%p.calcdiversity={'uniquegen'};
%p.calccomplexity=1;
%p.graphics={'plotfitness','plotdiversity','plotcomplexity','plotoperators'};
p.depthnodes='1';

% gplab (# generaciones, tamaño población, conjunto de parametros)
[v,b]=gplab(25,50,p);

%desired_obtained(v,[],1,0,[]);
%accuracy_complexity(v,[],0,[]);

%figure
%plotpareto(v);

drawtree(b.tree);