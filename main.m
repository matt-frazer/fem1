%main.m
%todo, degrees of freedom (currently: 2)

clear
eList = 0;
run ('initMaps.m');

gsmSize = nodeMap.Count * 2;

for e = 1:elementMap.Count
    elementMap(e) = kEff(elementMap(e));
end

run('GSM.m');

%build global force vector and global displacement vector
globalForceVector = zeros([nodeMap.Count * 2,1]);
globalDisplacementVector = globalForceVector;

for n = 1:nodeMap.Count
    toast = getBoundaryValues(nodeMap(n));
    globalForceVector(2*n-1) = toast(1,1);
    globalForceVector(2*n) = toast(2,1);
    globalDisplacementVector(2*n-1) = toast(1,2);
    globalDisplacementVector(2*n) = toast(2,2);
end

%solve mixed solution
run('mixedSolutionSolver');

%post process
%post processing

fprintf('Post-processing:\nID       Stress Magnitude     Stress Direction\n');

for e=1:elementMap.Count
    elementMap(e) = postProcess(elementMap(e),globalDisplacementVector);
    disp(elementMap(e));
end

