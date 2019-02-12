function outBound = swfreeSYSID(inBound)
%000C296B5AC24271ABC8A075D69742A4
%'00000000000000000000000000000000'
% 
% disp('SW Opened');
inBound(13:end) = '0';
outBound = inBound;