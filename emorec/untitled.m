function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 07-Jul-2013 10:56:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)
handles.count=0;
handles.sigma=str2double(get(handles.smooth,'String'));
handles.ener=str2double(get(handles.energy,'String'));
handles.intfa=str2double(get(handles.interpolation,'String'));
set(handles.txt_directory,'String','Undefined!');
set(handles.start,'Enable','off');
set(handles.acquire,'Enable','off');
set(handles.save,'Enable','off');
set(handles.clear,'Enable','off');
set(handles.play,'Enable','off');
set(handles.pause,'Enable','off');
set(handles.stop,'Enable','off');
set(handles.resume,'Enable','off');
set(handles.p_set,'Enable','off');
set(handles.p_cor_plot,'Enable','off');
set(handles.p_ceps_plot,'Enable','off');
set(handles.p_mean_plot,'Enable','off');
set(handles.p_cor,'Enable','off');
set(handles.p_ceps,'Enable','off');
set(handles.p_mean,'Enable','off');

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in acquire.
function acquire_Callback(hObject, eventdata, handles)
% hObject    handle to acquire (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, path]=uigetfile('*.wav','Select a file');
set(handles.txt_directory,'String',file);
[y, fs] = wavread([path,file]);
y=y(:,1);
handles.y=y; 
handles.fs=fs;

if (get(handles.male,'Value'))
     sex='M';
elseif (get(handles.female,'Value'))
     sex='F';
end
handles.sex=sex;
handles.player=audioplayer(handles.y,handles.fs);
set(handles.gender,'String',handles.sex);
set(handles.status,'String','Sound file acquired, set the procedure');

set(handles.male,'Enable','off');
set(handles.female,'Enable','off');

set(handles.play,'Enable','on');
set(handles.pause,'Enable','on');
set(handles.stop,'Enable','on');
set(handles.resume,'Enable','on');

set(handles.p_cor_plot,'Enable','on');
set(handles.p_ceps_plot,'Enable','on');
set(handles.p_mean_plot,'Enable','on');
set(handles.p_cor,'Enable','on');
set(handles.p_ceps,'Enable','on');
set(handles.p_mean,'Enable','on');
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%wavplay(handles.y,handles.fs);
play(handles.player);
% Update handles structure
guidata(hObject, handles);



function txt_directory_Callback(hObject, eventdata, handles)
% hObject    handle to txt_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_directory as text
%        str2double(get(hObject,'String')) returns contents of txt_directory as a double


% --- Executes during object creation, after setting all properties.
function txt_directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function status_Callback(hObject, eventdata, handles)
% hObject    handle to status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of status as text
%        str2double(get(hObject,'String')) returns contents of status as a double



% --- Executes during object creation, after setting all properties.
function status_CreateFcn(hObject, eventdata, handles)
% hObject    handle to status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.player)

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.count=handles.count+1;

set(handles.status,'String','Error in main function!')
handles.a((handles.count),:)=feat_sound(handles.y,handles.fs,handles.sel,handles.sigma,handles.ener,handles.intfa);
handles.sex_vector((handles.count),:)=handles.sex;

set(handles.status,'String','Process completed!');
set(handles.output_table,'Data',handles.a);

set(handles.start,'Enable','off');
set(handles.acquire,'Enable','off');
set(handles.save,'Enable','on');
set(handles.clear,'Enable','on');
set(handles.play,'Enable','off');
set(handles.pause,'Enable','off');
set(handles.stop,'Enable','off');
set(handles.resume,'Enable','off');
set(handles.p_set,'Enable','off');
set(handles.p_cor_plot,'Enable','off');
set(handles.p_ceps_plot,'Enable','off');
set(handles.p_mean_plot,'Enable','off');
set(handles.p_cor,'Enable','off');
set(handles.p_ceps,'Enable','off');
set(handles.p_mean,'Enable','off');

set(handles.male,'Enable','on');
set(handles.female,'Enable','on');

set(handles.male,'Value',0);
set(handles.female,'Value',0);

set(handles.p_cor,'Value',0);
set(handles.p_ceps,'Value',0);
set(handles.p_mean,'Value',0);


% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in male.
function male_Callback(hObject, eventdata, handles)
% hObject    handle to male (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
    set(handles.acquire,'Enable','on');
    set(handles.female,'Value',0);
end
% Hint: get(hObject,'Value') returns toggle state of male

% Update handles structure
guidata(hObject, handles)

% --- Executes on button press in female.
function female_Callback(hObject, eventdata, handles)
% hObject    handle to female (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
    set(handles.acquire,'Enable','on');
    set(handles.male,'Value',0);
end
% Hint: get(hObject,'Value') returns toggle state of female

% Update handles structure
guidata(hObject, handles)


function gender_Callback(hObject, eventdata, handles)
% hObject    handle to gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gender as text
%        str2double(get(hObject,'String')) returns contents of gender as a double


% --- Executes during object creation, after setting all properties.
function gender_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause(handles.player);

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in resume.
function resume_Callback(hObject, eventdata, handles)
% hObject    handle to resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resume(handles.player)

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in p_cor_plot.
function p_cor_plot_Callback(hObject, eventdata, handles)
% hObject    handle to p_cor_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.sigma=str2double(get(handles.smooth,'String'));
handles.ener=str2double(get(handles.energy,'String'));
handles.intfa=str2double(get(handles.interpolation,'String'));
[f0_corr,f0_ceps,tw,t_init,form,bwf,en,val,val2,x]=my_speech_proc(handles.y,handles.fs,handles.ener);
sel=not(val);
[f01_corr,te11,f02_corr,te21,sel21]=smooth_pitch(tw,f0_corr,sel,handles.sigma,handles.intfa);
figure('Name','Correlation','NumberTitle','off'),plot(te11,f01_corr,'k-');
hold on; plot(te21,f02_corr,'ro');
xlabel('Time(s)'),ylabel('Frequency(Hz)');



% --- Executes on button press in p_ceps_plot.
function p_ceps_plot_Callback(hObject, eventdata, handles)
% hObject    handle to p_ceps_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.sigma=str2double(get(handles.smooth,'String'));
handles.ener=str2double(get(handles.energy,'String'));
handles.intfa=str2double(get(handles.interpolation,'String'));
[f0_corr,f0_ceps,tw,t_init,form,bwf,en,val,val2,x]=my_speech_proc(handles.y,handles.fs,handles.ener);
sel=not(val);
[f01_ceps,te12,f02_ceps,te22,sel22]=smooth_pitch(tw,f0_ceps,sel,handles.sigma,handles.intfa);
figure('Name','Cepstrum','NumberTitle','off'),plot(te12,f01_ceps,'k-');
hold on; plot(te22,f02_ceps,'ro');
xlabel('Time(s)'),ylabel('Frequency(Hz)');


% --- Executes on button press in p_mean_plot.
function p_mean_plot_Callback(hObject, eventdata, handles)
% hObject    handle to p_mean_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.sigma=str2double(get(handles.smooth,'String'));
handles.ener=str2double(get(handles.energy,'String'));
handles.intfa=str2double(get(handles.interpolation,'String'));
[f0_corr,f0_ceps,tw,t_init,form,bwf,en,val,val2,x]=my_speech_proc(handles.y,handles.fs,handles.ener);
sel=not(val);
[f01_corr,te11,f02_corr,te21,sel21]=smooth_pitch(tw,f0_corr,sel,handles.sigma,handles.intfa);
[f01_ceps,te12,f02_ceps,te22,sel22]=smooth_pitch(tw,f0_ceps,sel,handles.sigma,handles.intfa);
f0_mix=mean([f0_corr',f0_ceps']');
[f01_mix,te1_mix,f02_mix,te2_mix,sel2_mix]=smooth_pitch(tw,f0_mix,sel,handles.sigma,handles.intfa);

figure('Name','Mean','NumberTitle','off'),plot(te1_mix,f01_mix,'k-');
hold on; plot(te2_mix,f02_mix,'ro');
xlabel('Time(s)'),ylabel('Frequency(Hz)');

% --- Executes on button press in p_cor.
function p_cor_Callback(hObject, eventdata, handles)
% hObject    handle to p_cor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value'))
    set(handles.p_set,'Enable','on');
    handles.sel='corr';
    set(handles.p_ceps,'Value',0);
    set(handles.p_mean,'Value',0);
end
% Hint: get(hObject,'Value') returns toggle state of p_cor
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in p_set.
function p_set_Callback(hObject, eventdata, handles)
% hObject    handle to p_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.sigma=str2double(get(handles.smooth,'String'));
handles.ener=str2double(get(handles.energy,'String'));
handles.intfa=str2double(get(handles.interpolation,'String'));
set(handles.status,'String','Procedure selected, ready to start');
set(handles.start,'Enable','on');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in p_ceps.
function p_ceps_Callback(hObject, eventdata, handles)
% hObject    handle to p_ceps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value'))
    set(handles.p_set,'Enable','on');
    handles.sel='ceps';
    set(handles.p_cor,'Value',0);
    set(handles.p_mean,'Value',0);
end
% Hint: get(hObject,'Value') returns toggle state of p_ceps
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in p_mean.
function p_mean_Callback(hObject, eventdata, handles)
% hObject    handle to p_mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value'))
    set(handles.p_set,'Enable','on');
    handles.sel='mean';
    set(handles.p_cor,'Value',0);
    set(handles.p_ceps,'Value',0);
end
% Hint: get(hObject,'Value') returns toggle state of p_cor
% Update handles structure
guidata(hObject, handles);



function smooth_Callback(hObject, eventdata, handles)
% hObject    handle to smooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of smooth as text
%        str2double(get(hObject,'String')) returns contents of smooth as a double
% Update handles structure
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function smooth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to smooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function energy_Callback(hObject, eventdata, handles)
% hObject    handle to energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of energy as text
%        str2double(get(hObject,'String')) returns contents of energy as a double
% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function energy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function interpolation_Callback(hObject, eventdata, handles)
% hObject    handle to interpolation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interpolation as text
%        str2double(get(hObject,'String')) returns contents of interpolation as a double


% --- Executes during object creation, after setting all properties.
function interpolation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interpolation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
feat_file=handles.a;
sex=handles.sex_vector;

uisave({'feat_file','sex'},'Output.mat');
% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clearvars handles.a handles.sex_vector
handles.count=0;

set(handles.output_table,'Data',NaN);
% Update handles structure
guidata(hObject, handles);
