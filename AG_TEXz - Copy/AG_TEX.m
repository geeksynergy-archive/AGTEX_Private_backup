clear all;
close all;
clc;
hwswLocked = 0; % nothing here
% if(~isWindowsAdmin())
%     errordlg('License renewal failed, Run as Administrator','AGTEX Licensor');
%     pause(2);
%     close all;
%     return;
% end

Local_Directory=[tempdir,'\License_Agreement.reg'];
regFileName = Local_Directory;

Keyone = '[HKEY_CURRENT_USER\GC_Punch]';
Variable_NameOne = 'Total_Cards';
Variable_NameTwo = 'LicensedDate';
Variable_NameThree = 'LicenseType';
Variable_NameFour = 'Expired';
Variable_NameFive = 'COMPORT';
Variable_NameSix = 'Entry_Distance';
Variable_NameSeven = 'ExpiryDate';
Variable_NameEight = 'MaxCards';
Variable_NameNine = 'LicenseCode';

try
    Variables = winqueryreg('name','HKEY_CURRENT_USER','GC_Punch');
    foundGC_Punch = 1;
catch exception
    disp (exception.message);  disp (exception.stack(1));
    foundGC_Punch = 0;
end

if foundGC_Punch == 1
    Variables = winqueryreg('name', 'HKEY_CURRENT_USER','GC_Punch');
    if length(Variables) > 0
        try
            X = winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', Variable_NameOne);
            Y = winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', Variable_NameTwo);
            Z = winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', Variable_NameThree);
            W = winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', Variable_NameFour);
            V = winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', Variable_NameFive);
            U = winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', Variable_NameSix);
            T = winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', Variable_NameSeven);
            S = winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', Variable_NameEight);
            R = winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', Variable_NameNine);
        catch exception
            disp (exception.message);  disp(exception.stack(1));
            prog_h = waitbar(1,'Currupt License');
            %errordlg('Licensing Error... ','Fatal Error!!');
            %close all;
            %return;
            delete(prog_h);
            if(~Licensor(hwswLocked))
                close all;
                return;
            else
                setappdata(0,'splashLoader', waitbar(0.10, 'Starting AGTEX'));
                Test_UI;
                return;
            end
        end
        if strcmp(Z,'Premium')==1
            prog_h = waitbar(1,'Premium License Found');
            pause(0.8);
            delete(prog_h);
            if(verifySystem(R))
                setappdata(0,'splashLoader', waitbar(0.10, 'Starting AGTEX'));
                Test_UI;
            else
                prog_h = waitbar(1,'License Verification Failed');
                pause(0.8);
                delete(prog_h);
                if(~Licensor(hwswLocked))
                    close all;
                    return;
                else
                    setappdata(0,'splashLoader', waitbar(0.10, 'Starting AGTEX'));Test_UI;
                    return;
                end
            end
            return;
        else
            if strcmp(W,'No')==1
                if (datetime(date) < datetime(T)) && ( str2num(X) < str2num(S))
                    prog_h = waitbar(1,'Freemium License Found, Upgrade your License');
                    pause(0.8);
                    delete(prog_h);
                    if(verifySystem(R))
                        setappdata(0,'splashLoader', waitbar(0.10, 'Starting AGTEX'));
                        Test_UI;
                    else
                        if(~Licensor(hwswLocked))
                            close all;
                            return;
                        else
                            setappdata(0,'splashLoader', waitbar(0.10, 'Starting AGTEX'));
                            Test_UI;
                            return;
                        end
                    end
                    return;
                else
                    disp 'Barred License';
                    fp = fopen(regFileName,'wt');
                    fprintf(fp,'REGEDIT4\n');
                    fprintf(fp,'%s\n',Keyone);
                    fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameFour, '"=', '"', 'Yes', '"' );
                    fclose(fp);
                    doscmd = ['C:\windows\regedit.exe /s "', Local_Directory,'"'];
                    [y, z]=dos(doscmd,'-echo');
                    if(y~=0)
                        errordlg('License renewal failed. rerun as administrator','AGTEX Licensor')
                        exit;
                    end
                    delete(Local_Directory);
                    prog_h = waitbar(1,'Your Licesne has Expired Renew Now');
                    pause(2);
                    delete(prog_h);
                    if(~Licensor(hwswLocked))
                        close all;
                        return;
                    else
                        setappdata(0,'splashLoader', waitbar(0.10, 'Starting AGTEX'));
                        Test_UI;
                        return;
                    end
                end
            else
                prog_h = waitbar(1,'Your Licesne has Expired Renew Now');
                pause(2);
                delete(prog_h);
                if(~Licensor(hwswLocked))
                    close all;
                    return;
                else
                    setappdata(0,'splashLoader', waitbar(0.10, 'Starting AGTEX'));
                    Test_UI;
                    return;
                end
            end
        end
        
    else
        close all;
        return;
    end
else
    prog_h = waitbar(1,'No License Found..!, Update License Now');
    pause(2);
    delete(prog_h);
    try
        %     disp('Creating DataBase Files Now')
        %     mkdir('c:\','AGTEX_FILES');
        %     mkdir('c:\AGTEX_FILES\','CustomCardTemplate');
        %     mkdir('c:\AGTEX_FILES\','FullPunch');
        %     copyfile([pwd,'\CustomCardTemplate'],'c:/AGTEX_FILES/CustomCardTemplate');
        %     copyfile([pwd,'\FullPunch'],'c:/AGTEX_FILES/FullPunch');
        if(~Licensor(hwswLocked))
            close all;
            return;
        else
            setappdata(0,'splashLoader', waitbar(0.10, 'Starting AGTEX'));
            Test_UI;
            return;
        end
    catch exception
        disp (exception.message);  disp(exception.stack(1));
        errordlg('Run as Administrator','Denied System Access');
        close all;
        return;
    end
end

%% coding for the test ui
% splashLoader = getappdata(0,'splashLoader');
% splashLoader = waitbar(0.10, splashLoader);