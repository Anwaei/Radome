function rhTable = rhTableSym(chaeq,order)
%% Initialization
% Taking coefficients vector and organizing the first two rows
syms n K Ta Tg N s
% chaeq = ((1/n*s+1)^n + K*(Ta*s+1))*s*Tg + N;
% 
% n=5; N=4;
% chaeq_n = ((1/n*s+1)^n + K*(Ta*s+1))*s*Tg + N;
chaeq_n = subs(chaeq,n,order);
coefficients = fliplr(coeffs(chaeq_n, s));

coeffVector = coefficients;
ceoffLength = length(coeffVector);
rhTableColumn = round(ceoffLength/2);
%  Initialize Routh-Hurwitz table with empty zero array
rhTable = sym(zeros(ceoffLength,rhTableColumn));
%  Compute first row of the table
rhTable(1,:) = coeffVector(1,1:2:ceoffLength);
%  Check if length of coefficients vector is even or odd
if (rem(ceoffLength,2) ~= 0)
    % if odd, second row of table will be
    rhTable(2,1:rhTableColumn - 1) = coeffVector(1,2:2:ceoffLength);
else
    % if even, second row of table will be
    rhTable(2,:) = coeffVector(1,2:2:ceoffLength);
end
%% Calculate Routh-Hurwitz table's rows
%  Set epss as a small value
epss = sym(0.01);
%  Calculate other elements of the table
for i = 3:ceoffLength    
    for j = 1:rhTableColumn - 1
        %  first element of upper row
        firstElemUpperRow = rhTable(i-1,1);
        
        %  compute each element of the table
        rhTable(i,j) = ((rhTable(i-1,1) * rhTable(i-2,j+1)) - ....
            (rhTable(i-2,1) * rhTable(i-1,j+1))) / firstElemUpperRow;
    end    
    %  special case: zero in the first column
    if rhTable(i,1) == 0
        rhTable(i,1) = epss;
    end
end
% fprintf('\n Routh-Hurwitz Table:\n')
end