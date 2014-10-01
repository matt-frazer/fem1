function [ output ] = readXML( xmlTag, fileName )
    
    %takes the full path seperated by commas:
    %C:\myfile.xml is:
    %           xmlDoc = xmlread(fullfile('C:', fileName) );
    %C:\my\dir\path\myfile.xml is     
    %   xmlDoc = xmlread(fullfile('C:','my','dir','path',fileName) );
    %with filename being set in initMaps.m

    xmlDoc = xmlread(fullfile('C:', fileName) );

    xmlTagElement = xmlDoc.getElementsByTagName(xmlTag);
    for n = 0:xmlTagElement.getLength-1
        dataItem = xmlTagElement.item(n);
        output{n+1} = char(dataItem.getFirstChild.getData);
    end
end

 