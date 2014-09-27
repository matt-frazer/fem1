%swap rows and columns in global force vector, gsm, global displacement
%vector
   
%gfv
temp = globalForceVector(upper);
globalForceVector(upper) = globalForceVector(lower);
globalForceVector(lower) = temp;

%gdv
temp = globalDisplacementVector(upper);
globalDisplacementVector(upper) = globalDisplacementVector(lower);
globalDisplacementVector(lower) = temp;

%gsm rows
temp = gsm(upper,:);
gsm(upper,:) = gsm(lower,:);
gsm(lower,:) = temp;
%gsm col
temp = gsm(:, upper);
gsm(:, upper) = gsm(:,lower);
gsm(:, lower) = temp;
