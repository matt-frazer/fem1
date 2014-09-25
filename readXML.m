function [ output ] = readXML( xmlTag, fileName )
    
    %takes in the full path seperated by commas
    xmlDoc = xmlread(fullfile('C:', fileName) );

    xmlTagElement = xmlDoc.getElementsByTagName(xmlTag);
    for n = 0:xmlTagElement.getLength-1
        dataItem = xmlTagElement.item(n);
        output{n+1} = char(dataItem.getFirstChild.getData);
    end
end

 