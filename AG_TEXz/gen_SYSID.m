function SYSID = gen_SYSID ()
% Define an arbitrary 16-byte cipher key in hexadecimal (string) representation
% The following two specific keys are used as examples 
% in the AES-Specification (draft)

% This is for mac
%[status,result] = dos('ifconfig en1 | grep ether');
% if( ~status == 0 || strcmp(result,'') || length(strfind(result, ':')) ~= 5)
%         disp 'System will now exit'; 
%         %exit;
% end
% macid = strfind(result, ':');
% result = [result(macid(1)-2:macid(5)+2),':']
% macid = strfind(result, ':');

% This is for Windows
[status,result] = dos('getmac');
n=strfind([status,result],'=')-1;
mac=result(n(end)+2:n(end)+18);
%%%%%%%%%%%%%%%%%%%% using IpConfig %%%%%%%%%%%%%%%%%%%%%%%%%%%%
[status,result]=dos('ipconfig/all');
n=findstr([status,result],'Physical Address')-1;
while result(n(1)) ~= ':';
    n(1)=n(1)+1;
end;
mac=result(n(1)+2:n(1)+18);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if( ~status == 0 || strcmp(mac,'') || length(strfind(mac, '-')) ~= 5)
        disp 'Error Occured while fetching SYSID, System will now exit'; 
        %exit;
end
macid = strfind(mac, '-');
result = [mac(macid(1)-2:macid(5)+2),'-'];
macid = strfind(result, '-');

key_hex = {'00' '00' '00' '00' '00' '00' 'FF' '00' ...
           'FF' '00' 'FF' '00' 'FF' '00' 'FF' '00'};
for i = 1:6
key_hex{i} = result(macid(i)-2:macid(i)-1);
end
%disp(key_hex);

%Fetch GUID from the system
machineID = winqueryreg('HKEY_LOCAL_MACHINE','SOFTWARE\Microsoft\Cryptography','MachineGuid');
machineID = [machineID(1:8),machineID(10:13),machineID(15:18),machineID(20:23),machineID(25:36)];

resolvedmachineID = '';
for u=1:2:32
    resolvedmachineID = [resolvedmachineID,machineID(u:u+1),':'];
end
winid = strfind(resolvedmachineID, ':');
%%9aa1ab26-1a76-4271-abc8-a075d69742a4
for i = 7:16
key_hex{i} = resolvedmachineID(winid(i)-2:winid(i)-1);
end
%disp(key_hex);
msg_str = '';
for m = 1:16
    msg_str = [msg_str,char(key_hex(m))];
end
SYSID = upper(msg_str);
%h = msgbox(upper(msg_str),'SYS ID');