function validLicense = verifySystem(licenseKey)
try
    %Check the HW-SW Locked License
    licenseData = licenseHelper(licenseKey,gen_SYSID);
    if (length(licenseData) == 16 && strcmp(licenseData(1),'AA') && strcmp(licenseData(16),'EE'))
        [x1,status1] = str2num([char(licenseData(2)),char(licenseData(3)),char(licenseData(4)),char(licenseData(5))]);
        [x2,status2] = str2num([char(licenseData(6)),char(licenseData(7)),char(licenseData(8)),char(licenseData(9))]);
        [x3,status3] = str2num([char(licenseData(12)),char(licenseData(13)),char(licenseData(14)),char(licenseData(15))]);
    else
        %Check the HW Locked License
        licenseData = licenseHelper(licenseKey,swfreeSYSID(gen_SYSID));
            if (length(licenseData) == 16 && strcmp(licenseData(1),'AA') && strcmp(licenseData(16),'EE'))
                [x1,status1] = str2num([char(licenseData(2)),char(licenseData(3)),char(licenseData(4)),char(licenseData(5))]);
                [x2,status2] = str2num([char(licenseData(6)),char(licenseData(7)),char(licenseData(8)),char(licenseData(9))]);
                [x3,status3] = str2num([char(licenseData(12)),char(licenseData(13)),char(licenseData(14)),char(licenseData(15))]);
            end 
    end
    if(status1 && status2 && status3)
        validLicense = true;
    else
        validLicense = false;
    end
catch
    validLicense = false;
end
