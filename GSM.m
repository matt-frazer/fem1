%create global stiffness matrix "Assembly and Boundary Conditions"

gsm = zeros(gsmSize);

for e = 1:elementMap.Count;
    
    %this is gross
    %topLeft
    row = 2*nodeMap(elementMap(e).node1_).globalId_ - 1;
    col = row;
    
    gsm(row,col) = gsm(row,col) + elementMap(e).kEff_(1,1);
    gsm(row+1,col) = gsm(row+1,col) + elementMap(e).kEff_(2,1);
    gsm(row,col+1) = gsm(row,col+1) + elementMap(e).kEff_(1,2);
    gsm(row+1,col+1) = gsm(row+1,col+1) + elementMap(e).kEff_(2,2);

    %topRight
    row = 2*nodeMap(elementMap(e).node1_).globalId_ - 1;
    col = 2*nodeMap(elementMap(e).node2_).globalId_ - 1;
    
    gsm(row,col) = gsm(row,col) + elementMap(e).kEff_(1,3);
    gsm(row+1,col) = gsm(row+1,col) + elementMap(e).kEff_(2,3);
    gsm(row,col+1) = gsm(row,col+1) + elementMap(e).kEff_(1,4);
    gsm(row+1,col+1) = gsm(row+1,col+1) + elementMap(e).kEff_(2,4);
    
    %botLeft
    row = 2*nodeMap(elementMap(e).node2_).globalId_ - 1;
    col = 2*nodeMap(elementMap(e).node1_).globalId_ - 1;
    
    gsm(row,col) = gsm(row,col) + elementMap(e).kEff_(3,1);
    gsm(row+1,col) = gsm(row+1,col) + elementMap(e).kEff_(4,1);
    gsm(row,col+1) = gsm(row,col+1) + elementMap(e).kEff_(3,2);
    gsm(row+1,col+1) = gsm(row+1,col+1) + elementMap(e).kEff_(4,2);
    
    %botRight
    row = 2*nodeMap(elementMap(e).node2_).globalId_ - 1;
    col = row;
    
    gsm(row,col) = gsm(row,col) + elementMap(e).kEff_(3,3);
    gsm(row+1,col) = gsm(row+1,col) + elementMap(e).kEff_(4,3);
    gsm(row,col+1) = gsm(row,col+1) + elementMap(e).kEff_(3,4);
    gsm(row+1,col+1) = gsm(row+1,col+1) + elementMap(e).kEff_(4,4);
    
end