%main.m
%todo, degrees of freedom (currently: 2)
%nodes should be read before elements

% n1 = node(1,1,2,0,0,0,0);
% n2 = node(2,0,0,0,0,0,0);
% n3 = node(3,0,0,0,0,0,0);
% n4 = node(4,0,0,0,0,0,0);
% 
% nodeMap(1) = n1;
% nodeMap(2) = n2;
% nodeMap(3) = n3;
% nodeMap(4) = n4;

% e1 = element(1,1,4,nodeMap,200,0.0025);
% elementMap(1) = e1;

clear
eList = 0;
run ('initMaps.m');

gsmSize = nodeMap.Count * 2;

for e = 1:elementMap.Count;
    elementMap(e) = kEff(elementMap(e));
end

run('GSM.m');
