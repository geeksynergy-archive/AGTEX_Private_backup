function varargout = GB_AGTEX_Licensor(varargin)
% GB_AGTEX_LICENSOR MATLAB code for GB_AGTEX_Licensor.fig
%      GB_AGTEX_LICENSOR, by itself, creates a new GB_AGTEX_LICENSOR or raises the existing
%      singleton*.
%
%      H = GB_AGTEX_LICENSOR returns the handle to a new GB_AGTEX_LICENSOR or the handle to
%      the existing singleton*.
%
%      GB_AGTEX_LICENSOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GB_AGTEX_LICENSOR.M with the given input arguments.
%
%      GB_AGTEX_LICENSOR('Property','Value',...) creates a new GB_AGTEX_LICENSOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GB_AGTEX_Licensor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GB_AGTEX_Licensor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GB_AGTEX_Licensor

% Last Modified by GUIDE v2.5 09-May-2016 21:06:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GB_AGTEX_Licensor_OpeningFcn, ...
    'gui_OutputFcn',  @GB_AGTEX_Licensor_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GB_AGTEX_Licensor is made visible.
function GB_AGTEX_Licensor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GB_AGTEX_Licensor (see VARARGIN)

% Choose default command line output for GB_AGTEX_Licensor
handles.output = hObject;

% Lets add the calendar here
% Initialize JIDE's usage within Matlab
com.mathworks.mwswing.MJUtilities.initJIDE;
%
% % Display a DateChooserPanel
global jPanel_dateExp;
jPanel_dateExp = com.jidesoft.combobox.DateSpinnerComboBox;
[hPanel,hContainer] = javacomponent(jPanel_dateExp,[350,117,90,22],gcf);

%jPanel_dateExp = com.jidesoft.combobox.DateSpinnerComboBox;

%javaMethod('getDate',jPanel_dateExp)
% Set todays date programatically
javaMethod('setDate',jPanel_dateExp, java.util.Date(date));

%


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GB_AGTEX_Licensor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GB_AGTEX_Licensor_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function systemID_Callback(hObject, eventdata, handles)
% hObject    handle to systemID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of systemID as text
%        str2double(get(hObject,'String')) returns contents of systemID as a double


% --- Executes during object creation, after setting all properties.
function systemID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to systemID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
maxstr=get(hObject,'String');
if (isnan(str2double(maxstr)))
    set(hObject,'string','99999999');
    uiwait(warndlg('Input must be numerical'));
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    
    global jPanel_dateExp;
    selectedDate = javaMethod('getDate',jPanel_dateExp);
    expDate = datetime(selectedDate.get('Year')+1900, selectedDate.get('Month')+1, selectedDate.get('Date'));
    disp(expDate);
    sysID=get(handles.systemID,'string');
    if(length(sysID)==32)
        disp(sysID); % Check that system ID is valid and within regexpression limits
    else
        uiwait(warndlg('The System ID appears to be incorrect'));
        return
    end
    
    if(get(handles.checkbox2,'value')==0)
        sysID = hwfreeSYSID(sysID);
        uiwait(warndlg('This License is now HW Unlocked'));
    end
    if(get(handles.checkbox3,'value')==0)
        sysID = swfreeSYSID(sysID);
        uiwait(warndlg('This License is now SW Unlocked'));
    end
    if(length(sysID)==32)
        disp(sysID); % Check that system ID is valid and within regexpression limits
    else
        uiwait(warndlg('The System ID appears to be incorrect'));
        return
    end
    if (get(handles.radiobutton11,'Value') == 0 && get(handles.radiobutton12,'Value') == 0 &&  get(handles.radiobutton13,'Value') == 0 && get(handles.radiobutton14,'Value') == 0)
        %user did not select any radio button, then do this
        uiwait(warndlg('You must select a license type'));
        return
    else
        %do this if a user selected a radio button
        
        switch get(get(handles.uibuttongroup3,'SelectedObject'),'Tag')
            
            case 'radiobutton11',  license_type = '11'; % Expired
                
            case 'radiobutton12',  license_type = '33'; % Fremium
                
            case 'radiobutton13',  license_type = '44'; % Premium
                
            case 'radiobutton14',  license_type = '22'; % Free
        end
    end
    disp(license_type);
    maxCardstxt=get(handles.edit2,'string');
    if (isnan(str2double(maxCardstxt)))
        set(hObject,'string','99999999');
        uiwait(warndlg('Input must be numerical'));
        return
    else
        maxcrd = str2double(maxCardstxt);
        disp(maxcrd);
    end
    
catch ex
    errordlg(getReport(ex,'basic'));
    return;
end
% encodedLicense = ['AA',datetime('now','Format','ddMMyyyy'),maxCardstxt,'FF',license_type,datetime(expDate,'Format','ddMMyyyy'),'EE'];
encodedLicense = ['AA',datestr(now,'ddmmyyyy'),maxCardstxt,'FF',license_type,datestr(expDate,'ddmmyyyy'),'EE'];
disp(encodedLicense);
cryptKey = crypter(encodedLicense,sysID);%000C296B5AC24271ABC8A075D69742A4
set(handles.edit6,'string',cryptKey);
disp(cryptKey);




%AA<LicensedDate><MaxCardsPunched>FF<LICENSETYPE><ExpiryDate>EE
%licenseData='AA3112201699999999FF0031122016EE'; % Get this as Decoded License






function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uibuttongroup3.
function uibuttongroup3_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup3
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global jPanel_dateExp;
switch get(get(handles.uibuttongroup3,'SelectedObject'),'Tag')
    
    case 'radiobutton11', javaMethod('disable',jPanel_dateExp); % Expired
        
    case 'radiobutton12', javaMethod('enable',jPanel_dateExp); % Fremium
        
    case 'radiobutton13', javaMethod('disable',jPanel_dateExp); % Premium
        
    case 'radiobutton14', javaMethod('enable',jPanel_dateExp); % Free
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sysID = gen_SYSID();
set(handles.systemID,'string',sysID);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
