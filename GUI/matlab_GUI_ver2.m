function varargout = matlab_GUI_ver2(varargin)
global obj1
% MATLAB_GUI_VER2 MATLAB code for matlab_GUI_ver2.fig
%      MATLAB_GUI_VER2, by itself, creates a new MATLAB_GUI_VER2 or raises the existing
%      singleton*.
%
%      H = MATLAB_GUI_VER2 returns the handle to a new MATLAB_GUI_VER2 or the handle to
%      the existing singleton*.
%
%      MATLAB_GUI_VER2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLAB_GUI_VER2.M with the given input arguments.
%
%      MATLAB_GUI_VER2('Property','Value',...) creates a new MATLAB_GUI_VER2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before matlab_GUI_ver2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      single.  All inputs are passed to matlab_GUI_ver2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help matlab_GUI_ver2

% Last Modified by GUIDE v2.5 12-Oct-2017 22:27:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @matlab_GUI_ver2_OpeningFcn, ...
                   'gui_OutputFcn',  @matlab_GUI_ver2_OutputFcn, ...
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


% --- Executes just before matlab_GUI_ver2 is made visible.
function matlab_GUI_ver2_OpeningFcn(hObject, eventdata, handles, varargin)

handles.out = hObject;

guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = matlab_GUI_ver2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.out;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0957::0x0588::CN53393620::0::INSTR', 'Tag', '');
global obj1
fprintf(obj1, ':KEY:TIME_INC');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0957::0x0588::CN53393620::0::INSTR', 'Tag', '');
global obj1
fprintf(obj1, ':KEY:TIME_DEC');


% --- Executes on button press in voldec.
function voldec_Callback(hObject, eventdata, handles)
% obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0957::0x0588::CN53393620::0::INSTR', 'Tag', '');
global obj1
ha=get(handles.ch,'Selectedobject');
s=get(ha,'String');
ok=strcat(':KEY:CH',strtrim(num2str(s)),'_VOLT_DEC')
fprintf(obj1,ok); 
% fprintf(obj1, ':KEY:CH1_VOLT_DEC');

% --- Executes on button press in cnt.
function cnt_Callback(hObject, eventdata, handles)

global obj1
% Find a VISA-USB object.
% % % % % % % % % % % % % % obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0957::0x0588::CN53232410::0::INSTR', 'Tag', '');
% % % % % % % % % % % % % % % Create the VISA-USB object if it does not exist
% % % % % % % % % % % % % % % otherwise use the object that was found.
% % % % % % % % % % % % % % if isempty(obj1)
% % % % % % % % % % % % % %     obj1 = visa('AGILENT', 'USB0::0x0957::0x0588::CN53232410::0::INSTR');
% % % % % % % % % % % % % % else
% % % % % % % % % % % % % %     fclose(obj1);
% % % % % % % % % % % % % %     obj1 = obj1(1)
% % % % % % % % % % % % % % end
% Find a VISA-USB object.
obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0957::0x0588::CN53232408::0::INSTR', 'Tag', '');

% Create the VISA-USB object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = visa('AGILENT', 'USB0::0x0957::0x0588::CN53232408::0::INSTR');
else
    fclose(obj1);
    obj1 = obj1(1)
end
% Connect to instrument object, obj1.
fopen(obj1);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

global obj1
fclose(obj1);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
global obj1

% obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0957::0x0588::CN53393620::0::INSTR', 'Tag', '');
fprintf(obj1, ':autoscale');



% --- Executes on button press in TRIGinc.
function TRIGinc_Callback(hObject, eventdata, handles)

% obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0957::0x0588::CN53232410::0::INSTR', 'Tag', '');
global obj1
fprintf(obj1, ':KEY:TRIG_LEVEL_INC');

% --- Executes on button press in TrigDec.
function TrigDec_Callback(hObject, eventdata, handles)

% obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0957::0x0588::CN53232410::0::INSTR', 'Tag', '');
global obj1
fprintf(obj1, ':KEY:TRIG_LEVEL_DEC');


% --- Executes on button press in capt.
function capt_Callback(hObject, eventdata, handles)

global obj1
n=str2num(get(handles.nooffiles,'String'));
po=get(handles.putout,'Selectedobject')
p=get(po,'String')
nm=(get(handles.name,'String'))

pause(5);
for i=1:n
%     pause(8);% 1 second delay
%     obj1=':SAVe:CSV:STARt "NewFile%0.f"';
    if po <252
%     fprintf(obj1,':single');
     pause(0.1);
%     filename=strcat(':SAVe:CSV:STARt ',' ',' "','NewFile',num2str(i),'"');
    filename=strcat(':SAVe:CSV:STARt ',' ',' "',nm,num2str(i),'"');
    pause(0.1);
    fprintf(obj1,filename); 
    fprintf(obj1,':single');
    %haha=' filename';
    else
%         fprintf(obj1,':single');
        %     filename=strcat(':SAVe:CSV:STARt ',' ',' "','NewFile',num2str(i),'"');
%         fprintf(obj1, ':SAVe:IMAGe:FORMat "png"');
        pause(0.1);
        filename=strcat('SAVe:IMAGe:STARt ',' ',' "',nm,num2str(i),'.png','"');
        fprintf(obj1,filename); 
        fprintf(obj1,':single');
    end
     pause(6.5);
    set(handles.printno,'String',i);
    
%     fprintf(obj1,filename); 
   
%     fprintf(obj1,':SINGLE');
end

function edit1_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in filter.
function filter_Callback(hObject, eventdata, handles)

global obj1
fprintf(obj1,':CHANnel1:FILTer 1')


% --- Executes on button press in measue.
function measue_Callback(hObject, eventdata, handles)

global obj1
ha=get(handles.ch,'Selectedobject');
s=get(ha,'String');

Vpp=get(handles.checkbox1,'Value');
freq=get(handles.checkbox2,'Value');
Vrms=get(handles.checkbox3,'Value');
if Vpp==1 
    ok1=strcat(':MEASure:VPP CHAnnel',strtrim(num2str(s)));
    fprintf(obj1,ok1)
end
% CHANnel2
if freq==1
    ok2=strcat(':MEASure:Frequency CHAnnel',strtrim(num2str(s)));
    fprintf(obj1,ok2)
  
end

if Vrms==1
   ok3=strcat(':MEASure:VAMP CHAnnel',strtrim(num2str(s)));
    fprintf(obj1,ok3)
end

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)

global obj1
fprintf(obj1,'*rst')


% --- Executes on button press in set_zero1.
function set_zero1_Callback(hObject, eventdata, handles)

global obj1
ha=get(handles.ch,'Selectedobject');
s=get(ha,'String');
ok=strcat(':KEY:CH',strtrim(num2str(s)),'_POS_Z');
fprintf(obj1,ok); 
% fprintf(obj1,':KEY:CH1_POS_Z')


% --- Executes on button press in posinc.
function posinc_Callback(hObject, eventdata, handles)

global obj1
ha=get(handles.ch,'Selectedobject');
s=get(ha,'String');
ok=strcat(':KEY:CH',strtrim(num2str(s)),'_POS_INC');
fprintf(obj1,ok); 
% fprintf(obj1,':KEY:CH1_POS_INC')

% --- Executes on button press in posdec.
function posdec_Callback(hObject, eventdata, handles)

global obj1
ha=get(handles.ch,'Selectedobject');
s=get(ha,'String');
ok=strcat(':KEY:CH',strtrim(num2str(s)),'_POS_DEC');
fprintf(obj1,ok); 
% fprintf(obj1,':KEY:CH1_POS_DEC')


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)



% --- Executes on button press in volinc.
function volinc_Callback(hObject, eventdata, handles)

global obj1
ha=get(handles.ch,'Selectedobject');
s=get(ha,'String');
ok=strcat(':KEY:CH',strtrim(num2str(s)),'_VOLT_INC');
fprintf(obj1,ok); 
% fprintf(obj1, ':KEY:CH1_VOLT_INC');



function nooffiles_Callback(hObject, eventdata, handles)
% hObject    handle to nooffiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nooffiles as text
%        str2double(get(hObject,'String')) returns contents of nooffiles as a double


% --- Executes during object creation, after setting all properties.
function nooffiles_CreateFcn(hObject, eventdata, handles)


% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)



% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)



% --- Executes on button press in clrmeasure.
function clrmeasure_Callback(hObject, eventdata, handles)

global obj1
fprintf(obj1,':MEASure:CLEar');


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)

global obj1
fprintf(obj1,':Run');

% --- Executes on button press in single.
function single_Callback(hObject, eventdata, handles)

global obj1
fprintf(obj1,':Single');


% --- Executes during object creation, after setting all properties.
function ch_CreateFcn(hObject, eventdata, handles)


% --- Executes when out is resized.
function out_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function name_Callback(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name as text
%        str2double(get(hObject,'String')) returns contents of name as a double


% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
