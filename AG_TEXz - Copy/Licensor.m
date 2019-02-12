function outcome = Licensor(hwswLocked)
%AA<LicensedDate><MaxCardsPunched>FF<LICENSETYPE><ExpiryDate>EE
%licenseData='AA3112201699999999FF0031122016EE'; % Get this as Decoded License
licenseData='11111111111111111111111111111111'; % Get this as Decoded License
outcome = false;


validLicense = false;
LicenseDLG = true;

sysID = gen_SYSID();

while (validLicense == false && LicenseDLG)
    try
        %% Call a window here to get the input from the User while displaying System
        % ID
        hw_sw_Type = questdlg('Which License Key do you have ?','License Chooser','HW Locked','HW-SW Locked','HW-SW Locked');
        if(strcmp(hw_sw_Type,'HW-SW Locked'))
            sysID = gen_SYSID();
        elseif(strcmp(hw_sw_Type,'HW Locked'))
            sysID = swfreeSYSID(gen_SYSID);
        else
            outcome = false;
            return;
        end
        
        prompt={['Your System ID : ', gen_SYSID]};
        disp(gen_SYSID);
        name = 'AG_TEX Licensing';
        defaultans = {['Enter your License Key here : ', gen_SYSID]};
        options.Interpreter = 'tex';
        licenseKey = inputdlg(prompt,name,[1 40],defaultans,options);
        if(length(licenseKey) == 0)
            LicenseDLG=false;
            outcome = false;
            break;
        end
        licenseKey = char(licenseKey);
        if(length(licenseKey) ~= 32)
            LicenseDLG=true;
            outcome = false;
            disp 'Your License key is invalid, please try again';
            prog_h = waitbar(1,'Your License key is invalid, please try again');%'You have successfully renewed your license')
            pause(1);
            delete(prog_h);
            continue;
        end
        %% Decode License Data from License Key
        %licesnestring='765421D723A7C4AD20CE86BCAC212FDB'; % Get this as user Inpu
        try
            prog_h = waitbar(0.3,'Please wait... Licensing AGTEX')
            licenseData = licenseHelper(licenseKey,sysID);
            pause(0.3);
            prog_h = waitbar(0.8,prog_h)
            pause(0.3);
            prog_h = waitbar(1,prog_h)
            delete(prog_h);
        catch ex
            getReport(ex)
            delete(prog_h);
        end
        %disp (licenseData);
        %% Verify License Key Valid or Not
        if (length(licenseData) == 16 && strcmp(licenseData(1),'AA') && strcmp(licenseData(16),'EE'))
            [x1,status1] = str2num([char(licenseData(2)),char(licenseData(3)),char(licenseData(4)),char(licenseData(5))]);
            [x2,status2] = str2num([char(licenseData(6)),char(licenseData(7)),char(licenseData(8)),char(licenseData(9))]);
            [x3,status3] = str2num([char(licenseData(12)),char(licenseData(13)),char(licenseData(14)),char(licenseData(15))]);
            if(status1 && status2 && status3)
                validLicense = true;
                disp 'License Validated';
                prog_h = waitbar(1,'License Validated');%'You have successfully renewed your license')
                pause(0.7);
                delete(prog_h);
                break;
            else
                validLicense = false;
                disp 'Your License key is invalid, please try again';
                prog_h = waitbar(1,'Your License key is invalid, please try again');%'You have successfully renewed your license')
                pause(1);
                delete(prog_h);
                break;
            end
        else
            validLicense = false;
            disp 'Your License key is invalid, please try again';
            prog_h = waitbar(1,'Your License key is invalid, please try again');%'You have successfully renewed your license')
            pause(1);
            delete(prog_h);
            break;
        end
    catch ey
        getReport(ey)
    end
end

if(validLicense)
    try
        %% If License Key is valid then update the content
        %%
        disp('Creating DataBase Files Now')
        mkdir('c:\','AGTEX_FILES');
        mkdir('c:\AGTEX_FILES\','CustomCardTemplate');
        mkdir('c:\AGTEX_FILES\','FullPunch');
        mkdir('c:\AGTEX_FILES\','DesignBlocks');
        copyfile([pwd,'\CustomCardTemplate'],'c:/AGTEX_FILES/CustomCardTemplate');
        copyfile([pwd,'\FullPunch'],'c:/AGTEX_FILES/FullPunch');
        copyfile([pwd,'\DesignBlocks'],'c:/AGTEX_FILES/DesignBlocks');
    
        Local_Directory=[tempdir,'\License_Agreement.reg'];
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
        regFileName = Local_Directory;
          
        % Default Values
        VarOne = '0';
        VarTwo = datestr(date);
        VarThree = 'Free';
        VarFour = 'No'; % Expire it so only licensed system can run it
        VarFive = '15';
        VarSix = '13';
        VarSeven = datestr(date);
        VarEight = '0';
        VarNine = '';
        
        [initDate,status1] = str2num([char(licenseData(2)),char(licenseData(3)),char(licenseData(4)),char(licenseData(5))]);
        VarTwo = datetime(str2num([char(licenseData(4)),char(licenseData(5))]),str2num(char(licenseData(3))),str2num(char(licenseData(2))));
        
        [maxCards,status2] = str2num([char(licenseData(6)),char(licenseData(7)),char(licenseData(8)),char(licenseData(9))]);
        VarEight = num2str(maxCards);
        
        [licType,status3] = str2num(char(licenseData(11)));
        if(licType == 11)
            VarThree = 'Expired';
            VarFour = 'YES';
        elseif(licType == 22)
            VarThree = 'Free';
            VarFour = 'No';
       elseif (licType == 33)
            VarThree = 'Fremium';
            VarFour = 'No';
        elseif (licType == 44)
            VarThree = 'Premium';
            VarFour = 'No';
        end
        
        
        
        [expiDate,status3] = str2num([char(licenseData(12)),char(licenseData(13)),char(licenseData(14)),char(licenseData(15))]);
        VarSeven = datetime(str2num([char(licenseData(14)),char(licenseData(15))]),str2num(char(licenseData(13))),str2num(char(licenseData(12))));
        
        VarNine = licenseKey;
        
        fp = fopen(regFileName,'wt');
      
        
        fprintf(fp,'REGEDIT4\n');
        fprintf(fp,'%s\n',Keyone);
        fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameOne, '"=', '"', VarOne, '"' );
        fprintf(fp,'%s\n',Keyone);
        fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameTwo, '"=', '"', datestr(VarTwo), '"' );
        fprintf(fp,'%s\n',Keyone);
        fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameThree, '"=', '"', VarThree, '"' );
        fprintf(fp,'%s\n',Keyone);
        fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameFour, '"=', '"', VarFour, '"' );
        fprintf(fp,'%s\n',Keyone);
        fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameFive, '"=', '"', VarFive, '"' );
        fprintf(fp,'%s\n',Keyone);
        fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameSix, '"=', '"', VarSix, '"' );
        fprintf(fp,'%s\n',Keyone);
        fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameSeven, '"=', '"', datestr(VarSeven), '"' );
        fprintf(fp,'%s\n',Keyone);
        fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameEight, '"=', '"', VarEight, '"' );
        fprintf(fp,'%s\n',Keyone);
        fprintf(fp,'%s%s%s%s%s%s\n','"', Variable_NameNine, '"=', '"', VarNine, '"' );
        fclose(fp);
        doscmd = ['C:\windows\regedit.exe /s "', Local_Directory,'"'];
        [y, z]=dos(doscmd,'-echo');
        if(y~=0)
            errordlg('License renewal failed while updating license','AGTEX Licensor')
            outcome = false;
            exit;
        end
        delete (Local_Directory);
        
        if(strcmp(licenseKey,winqueryreg('HKEY_CURRENT_USER', 'GC_Punch', 'LicenseCode')))
            % nothing here yet
        else
            errordlg('License renewal failed, Run as Administrator','AGTEX Licensor');
            pause(2);
            outcome = false;
            return;
        end
        
        
        %% verify that new license is infact valid with all aspects..
        if(~strcmp(VarThree,'Premium'))
            if((VarSeven <= date )|| strcmp(VarThree,'Expired'))
            prog_h = waitbar(1,'It appears that the new license is already expired');%'You have successfully renewed your license')
            pause(3);
            delete(prog_h);
            outcome =false;
            end
        else
            prog_h = waitbar(1,'You have successfully renewed your license');%'You have successfully renewed your license')
            pause(1);
            delete(prog_h);
            if(~strcmp(VarThree,'Premium'))
                prog_h = waitbar(1,['Your license will expire in ',num2str(daysact(date, VarSeven)), ' Days']);%'You have successfully renewed your license')
                pause(1);
                delete(prog_h);
            else
                prog_h = waitbar(1,'Thanks for buying Unlimited License, this will never expire ');%'You have successfully renewed your license')
                pause(1);
                delete(prog_h);
            end
            outcome =true;
        end
    catch
        errordlg('License renewal failed','AGTEX Licensor');
        outcome = false;
    end
end