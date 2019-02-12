function licenseString = licenseHelper (licenseKey,SYSID)

%AES_INIT  Initialisation of AES-components.
%
%   [S_BOX, INV_S_BOX, W, POLY_MAT, INV_POLY_MAT] = AES_INIT
%   initializes AES-components 
%   to be used by subsequent functions.
%
%   In the initialization step the S-boxes (S_BOX and INV_S_BOX) 
%   and the polynomial matrices (POLY_MAT and INV_POLY_MAT)
%   are created and
%   an example cipher key is expanded into 
%   the round key schedule (W).

%   Copyright 2001-2005, J. J. Buchholz, Hochschule Bremen, buchholz@hs-bremen.de

%   Version 1.0     30.05.2001

% Clear the command window
clc;
% Add the Work folder and all its subfolders to the search path.
% addpath(genpath([pwd,'AGTEX_V2/AES']));
% cd 'AGTEX_V2/AES';

% Create the S-box and the inverse S-box
[s_box, inv_s_box] = s_box_gen ();

% Create the round constant array
rcon = rcon_gen ();

key_hex = {'00' '01' '02' '03' '04' '05' '06' '07' ...
           '08' '09' '0a' '0b' '0c' '0d' '0e' '0f'};
format_key = SYSID;
for i = 1:16
    key_hex{i} = format_key((2*i)-1:(2*i));
end

%key_hex = {'00' '01' '02' '03' '04' '05' '06' '07' ...
%           '08' '09' '0a' '0b' '0c' '0d' '0e' '0f'};
%key_hex = {'2b' '7e' '15' '16' '28' 'ae' 'd2' 'a6' ...
%           'ab' 'f7' '15' '88' '09' 'cf' '4f' '3c'};

% Convert the cipher key from hexadecimal (string) to decimal representation
key = hex2dec(key_hex);

% Create the expanded key (schedule)
w = key_expansion (key, s_box, rcon);

% Create the polynomial transformation matrix and the inverse polynomial matrix
% to be used in MIX_COLUMNS
[poly_mat, inv_poly_mat] = poly_mat_gen ();


%%%%%%%%%%%%%%%%%%%%%%%%%% AES %%%%%%%%%%%%%%%%%%%%%%%%

%[s_box, inv_s_box, w, poly_mat, inv_poly_mat] = aes_init;

mylicenseKey = {'00' '11' '22' '33' '44' '55' '66' '77' '88' '99' 'aa' 'bb' 'cc' 'dd' 'ee' 'ff'}; 
for i=1:16
    mylicenseKey{i} = licenseKey(i*2-1:i*2);
end
%plaintext_hex = licenseKey;
%plaintext_hex = {'00' '11' '22' '33' '44' '55' '66' '77' ...
%                 '88' '99' 'aa' 'bb' 'cc' 'dd' 'ee' 'ff'};

%plaintext_hex = {'32' '43' 'f6' 'a8' '88' '5a' '30' '8d' ...
%                 '31' '31' '98' 'a2' 'e0' '37' '07' '34'};

% Convert plaintext from hexadecimal (string) to decimal representation
%plaintext = hex2dec (plaintext_hex);

% This is the real McCoy.
% Convert the plaintext to ciphertext,
% using the expanded key, the S-box, and the polynomial transformation matrix
%ciphertext = cipher (plaintext, w, s_box, poly_mat, 1);
declicenseKey=hex2dec(mylicenseKey);
% Convert the ciphertext back to plaintext
% using the expanded key, the inverse S-box, 
% and the inverse polynomial transformation matrix
re_plaintext = inv_cipher (declicenseKey, w, inv_s_box, inv_poly_mat);
%disp(dec2hex(ciphertext));
% cd ../../
decodedString = dec2hex(re_plaintext);
licenseString = {};
for i = 1:length(decodedString)
    licenseString = [licenseString,decodedString(i,:)];
end