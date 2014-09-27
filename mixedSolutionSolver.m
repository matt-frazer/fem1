%Mixed Solution Sorter, A ranger

maxRow = nodeMap.Count*2;
upper = 1;
lower = maxRow;
reverseSwapCount = 0;

while( upper < lower )
   if( ~isnan( globalForceVector(upper) ) )
       while( lower > upper && ~isnan( globalForceVector(lower) ))
           lower = lower - 1;
       end
       if( lower > upper )
           reverseSwapCount = reverseSwapCount + 1;
           reverseSwapMatrix(reverseSwapCount,:) = [upper lower];
           run('swap');
       end
   end
   upper = upper + 1;
end

%Mixed Solution Solver... solver? I 'ardly know 'er!
upper = 1;
while(isnan(globalForceVector(upper)))
   upper = upper+1; 
end

Ke = gsm(1:upper-1, 1:upper-1);
Kef = gsm(1:upper-1,upper:maxRow);
Kfe = gsm(upper:maxRow,1:upper-1);
Kf = gsm(upper:maxRow,upper:maxRow);
Xe = globalDisplacementVector(1:upper-1);
Be = globalForceVector(1:upper-1);
Bf = globalForceVector(upper:maxRow);

Xf = Kf\(Bf - Kfe*Xe);
globalDisplacementVector(upper:maxRow) = Xf;
globalForceVector(1:upper-1) = Ke*Xe + Kef*Xf;

for i=reverseSwapCount:-1:1
    upper = reverseSwapMatrix(i,1);
    lower = reverseSwapMatrix(i,2);
    run('swap');
end