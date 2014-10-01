%Mixed Solution Sorter, A ranger 

maxRow = nodeMap.Count*2;
upper = 1;
lower = maxRow;
reverseSwapCount = 0;

%this while loop moves the upper limit down until it reaches a force that
%is known. It then moves the lower bound up until it reaches a force that
%is unknown. upper and lower then swap. This repeats until all upper is
%below lower, meaning all unknown forces are at the top of the force
%vector, implying all unknown displacements are at the bottom of the global
%displacement vector, and the swap script ensures the global stiffness
%matrix values are coordinated.

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

%upper represents the highest row that has an unknown displacement
while(isnan(globalForceVector(upper)))
   upper = upper+1; 
end

%all submatricies can be defined based on the value of upper
Ke = gsm(1:upper-1, 1:upper-1);
Kef = gsm(1:upper-1,upper:maxRow);
Kfe = gsm(upper:maxRow,1:upper-1);
Kf = gsm(upper:maxRow,upper:maxRow);
Xe = globalDisplacementVector(1:upper-1);
Be = globalForceVector(1:upper-1);
Bf = globalForceVector(upper:maxRow);

%gFV and gDV can be completely solved using the mixed solution method
Xf = Kf\(Bf - Kfe*Xe);
globalDisplacementVector(upper:maxRow) = Xf;
globalForceVector(1:upper-1) = Ke*Xe + Kef*Xf;

%swap operations are reversed so that row 1 corresponds with f1x, and u1,
%etc.
for i=reverseSwapCount:-1:1
    upper = reverseSwapMatrix(i,1);
    lower = reverseSwapMatrix(i,2);
    run('swap');
end