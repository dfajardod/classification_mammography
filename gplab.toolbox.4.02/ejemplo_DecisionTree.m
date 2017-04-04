fprintf('Decision tree demo...');
p=resetparams;

p.sampling='roulette';
%p.survival='keepbest';

p=setoperators(p,'crossover',2,2,'mutation',1,1);
p.operatorprobstype='variable';
p.minprob=0;

%p=setfunctions(p, 'le', 2, 'gt', 2);
p=setfunctions(p,'gt',2,'le',2,'myif',3);
%p=addfunctions(p, 'minus', 2);

%p=setterminals(p,'0','1');
p=setterminals(p);

p.datafilex='dataX_eg_decisionTree.txt';
p.datafiley='dataY_eg_decisionTree.txt';

%p.usetestdata=1;
%p.testdatafilex='exp_x.txt';
%p.testdatafiley='exp_y.txt';

%p.calcdiversity={'uniquegen'};
%p.calccomplexity=1;
%p.graphics={'plotfitness','plotdiversity','plotcomplexity','plotoperators'};
p.depthnodes='1';

% gplab (# generaciones, tamaño población, conjunto de parametros)
[v,b]=gplab(25,20,p);

%desired_obtained(v,[],1,0,[]);
%accuracy_complexity(v,[],0,[]);

%figure
%plotpareto(v);

drawtree(b.tree);