nodeMap = containers.Map('KeyType', 'int32', 'ValueType', 'any');
forceMap = containers.Map('KeyType', 'int32', 'ValueType', 'any');
elementMap = containers.Map('KeyType', 'int32', 'ValueType', 'any');

fileName = 'toast2.xml';

%Node Data
globalIds = readXML('GlobalId',fileName);
cordX = readXML('CordX',fileName);
cordY = readXML('CordY',fileName);
forceRef = readXML('ForceRef',fileName);
support = readXML('Support', fileName);

numNodes = numel(globalIds);

%Construct Nodes
for n = 1:numNodes
    nodeMap(str2double(globalIds{n})) =  node(str2double(globalIds{n}), str2double(cordX{n}), str2double(cordY{n}),...
        forceMap,str2double(forceRef{n}),elementMap,eList, support{n});
end

%Force Data
forceId = readXML('ForceId',fileName);
forceMag = readXML('ForceMag',fileName);
forceDir = readXML('ForceDir',fileName);

numForces = numel(forceId);

%Construct Forces
for m = 1:numForces
    forceMap( str2double(forceId{m}) ) = appForce( str2double(forceId{m}), str2double(forceMag{m}), str2double(forceDir{m}));
end


%Element Data
elementId = readXML('ElementId',fileName);
node1 = readXML('LocalNode1',fileName);
node2 = readXML('LocalNode2',fileName);
yngMod = readXML('YoungsModulus',fileName);
area = readXML('Area',fileName);

numElement = numel(elementId);

%Contruct Elements
for p = 1:numElement
    elementMap(str2double(elementId{p})) = element( str2double(elementId{p}), str2double(node1{p}), str2double(node2{p}),...
        nodeMap, str2double(yngMod{p}), str2double(area{p}));
end