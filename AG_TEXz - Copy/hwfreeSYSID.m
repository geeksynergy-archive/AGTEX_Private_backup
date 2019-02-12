function outBound = hwfreeSYSID(inBound)
%000C296B5AC24271ABC8A075D69742A4
%'00000000000000000000000000000000'
% disp('HW Opened');
% disp(inBound);
inBound(1:12) = '0';
outBound = inBound;