function varargout = database2(varargin)
% DATABASE2 MATLAB code for database2.fig
%      DATABASE2, by itself, creates a new DATABASE2 or raises the existing
%      singleton*.
%
%      H = DATABASE2 returns the handle to a new DATABASE2 or the handle to
%      the existing singleton*.
%
%      DATABASE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATABASE2.M with the given input arguments.
%
%      DATABASE2('Property','Value',...) creates a new DATABASE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before database2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to database2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help database2

% Last Modified by GUIDE v2.5 17-Jul-2013 15:19:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @database2_OpeningFcn, ...
                   'gui_OutputFcn',  @database2_OutputFcn, ...
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


% --- Executes just before database2 is made visible.
function database2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to database2 (see VARARGIN)
handles.sf=0.8;
handles.if=0.99999;
handles.et=0.05;

set(handles.sf_box,'String',handles.sf);
set(handles.if_box,'String',handles.if);
set(handles.et_box,'String',handles.et);
set(handles.status,'String','Waiting for a folder to be selected');
set(handles.p_mean,'Value',1);
set(handles.male,'Value',1);
set(handles.female,'Value',1);
set(handles.disgust,'Value',1);
set(handles.joy,'Value',1);
set(handles.fear,'Value',1);
set(handles.anger,'Value',1);
set(handles.surprise,'Value',1);
set(handles.sadness,'Value',1);
set(handles.neutral,'Value',1);
handles.sel='mean';
set(handles.set,'Enable','off');
set(handles.start,'Enable','off');
set(handles.save,'Enable','off');
set(handles.p_cor,'Enable','off');
set(handles.p_ceps,'Enable','off');
set(handles.p_mean,'Enable','off');
set(handles.male,'Enable','off');
set(handles.female,'Enable','off');
set(handles.disgust,'Enable','off');
set(handles.joy,'Enable','off');
set(handles.fear,'Enable','off');
set(handles.anger,'Enable','off');
set(handles.surprise,'Enable','off');
set(handles.sadness,'Enable','off');
set(handles.neutral,'Enable','off');

% Choose default command line output for database2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes database2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = database2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sex=handles.sex;
feat_speech=handles.feat_speech;
gt_speech=handles.gt_speech;
sp_n=handles.sp_n;
em_n=handles.em_n;
gt_sent=handles.sent;

uisave({'sex','feat_speech','gt_speech','sp_n','em_n','gt_sent'},'Results.mat');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in p_cor.
function p_cor_Callback(hObject, eventdata, handles)
% hObject    handle to p_cor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
    handles.sel='corr';
    set(handles.p_ceps,'Value',0);
    set(handles.p_mean,'Value',0);
end
% Hint: get(hObject,'Value') returns toggle state of p_cor
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in p_ceps.
function p_ceps_Callback(hObject, eventdata, handles)
% hObject    handle to p_ceps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
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
if get(hObject,'Value')
    handles.sel='mean';
    set(handles.p_cor,'Value',0);
    set(handles.p_ceps,'Value',0);
end
% Hint: get(hObject,'Value') returns toggle state of p_ceps
% Update handles structure
guidata(hObject, handles);


function et_box_Callback(hObject, eventdata, handles)
% hObject    handle to et_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_box as text
%        str2double(get(hObject,'String')) returns contents of et_box as a double


% --- Executes during object creation, after setting all properties.
function et_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sf_box_Callback(hObject, eventdata, handles)
% hObject    handle to sf_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sf_box as text
%        str2double(get(hObject,'String')) returns contents of sf_box as a double


% --- Executes during object creation, after setting all properties.
function sf_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sf_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function if_box_Callback(hObject, eventdata, handles)
% hObject    handle to if_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of if_box as text
%        str2double(get(hObject,'String')) returns contents of if_box as a double


% --- Executes during object creation, after setting all properties.
function if_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to if_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in set.
function set_Callback(hObject, eventdata, handles)
% hObject    handle to set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.et=str2double(get(handles.et_box,'String'));
handles.sf=str2double(get(handles.sf_box,'String'));
handles.if=str2double(get(handles.if_box,'String'));

set(handles.set,'Enable','off');
set(handles.status,'String','Procedure selected, ready to start');
set(handles.start,'Enable','on');


% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.status,'String','Error in main function');

f_s=dir([handles.path,'\f*']);

flag=0;
fs=48000;
nn=1;
database='emovo';

for k = 1 : length(f_s) % cicla sui parlatori
    
    f_em=dir([handles.path,'\',f_s(k).name,'\em*']);
for l = 1 : length(f_em) % cicla sulle emozioni
    
    f=dir([handles.path,'\',f_s(k).name,'\',f_em(l).name,'\*.wav']);
for i = 1 : length(f) % cicla sulle frasi
    
    [k l i]
nome=[handles.path,'\',f_s(k).name,'\',f_em(l).name,'\',f(i).name];
[y,fs]=wavread(nome);
%sound(y,fs);
y=y(:,1); % è in stereo prendo il primo canale

sent=select_sentence(f(i).name);
if isempty(sent)==0
gt_sent(nn)=0;
else
gt_sent(nn)=1;
end

a=feat_sound(y,fs,handles.sel,handles.sf,handles.et,handles.if); 
feat_speech(nn,:)=a;

[gt_speech(nn),int(nn),em_n(nn,:),sp_n(nn)]=set_emotion(f(i).name,f_s(k).name,database);
sex(nn)=setB_sex(f_s(k).name,database);
nn=nn+1;
end
end
end

feat_speech=feat_speech';
em_n=em_n';

ind=[];

if(not(get(handles.male,'Value')))
    for i=1:length(sex)
        j='M';
        if(sex(i)==j)
            ind=[ind, i];
        end
    end
end

if(not(get(handles.female,'Value')))
    for i=1:length(sex)
        j='F';
        if(sex(i)==j)
            ind=[ind, i];
        end
    end
end

if(not(get(handles.disgust,'Value')))
    for i=1:length(gt_speech)
        for j=1
            if (gt_speech(i)==j)
            ind=[ind, i];
            end
        end
    end
end

if(not(get(handles.joy,'Value')))
    for i=1:length(gt_speech)
        for j=2
            if (gt_speech(i)==j)
            ind=[ind, i];
            end
        end
    end
end

if(not(get(handles.neutral,'Value')))
    for i=1:length(gt_speech)
        for j=3
            if (gt_speech(i)==j)
            ind=[ind, i];
            end
        end
    end
end

if(not(get(handles.fear,'Value')))
    for i=1:length(gt_speech)
        for j=4
            if (gt_speech(i)==j)
            ind=[ind, i];
            end
        end
    end
end

if(not(get(handles.anger,'Value')))
    for i=1:length(gt_speech)
        for j=5
            if (gt_speech(i)==j)
            ind=[ind, i];
            end
        end
    end
end

if(not(get(handles.surprise,'Value')))
    for i=1:length(gt_speech)
        for j=6
            if (gt_speech(i)==j)
            ind=[ind, i];
            end
        end
    end
end

if(not(get(handles.sadness,'Value')))
    for i=1:length(gt_speech)
        for j=7
            if (gt_speech(i)==j)
            ind=[ind, i];
            end
        end
    end
end

ind=unique(ind);
ind=sort(ind);

for i=length(ind):-1:1 
    feat_speech(:,ind(i))=[];
    sex(:,ind(i))=[];
    gt_speech(:,ind(i))=[];
    gt_sent(:,ind(i))=[];
    em_n(:,ind(i))=[];
    sp_n(:,ind(i))=[];
end

set(handles.status,'String','Process completed!');
handles.sex=sex;
handles.feat_speech=feat_speech;
handles.gt_speech=gt_speech;
handles.sp_n=sp_n;
handles.em_n=em_n;
handles.sent=gt_sent;

set(handles.out_tab,'Data',feat_speech');
set(handles.start,'Enable','off');
set(handles.save,'Enable','on');
% Update handles structure
guidata(hObject, handles);


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


% --- Executes on button press in acquire.
function acquire_Callback(hObject, eventdata, handles)
% hObject    handle to acquire (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.path=uigetdir('Select a folder');
set(handles.path_box,'String',handles.path);
set(handles.set,'Enable','on');
set(handles.p_cor,'Enable','on');
set(handles.p_ceps,'Enable','on');
set(handles.p_mean,'Enable','on');
set(handles.male,'Enable','on');
set(handles.female,'Enable','on');
set(handles.disgust,'Enable','on');
set(handles.joy,'Enable','on');
set(handles.fear,'Enable','on');
set(handles.anger,'Enable','on');
set(handles.surprise,'Enable','on');
set(handles.sadness,'Enable','on');
set(handles.neutral,'Enable','on');
set(handles.status,'String','Folder selected, select a procedure');
% Update handles structure
guidata(hObject, handles);




function path_box_Callback(hObject, eventdata, handles)
% hObject    handle to path_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path_box as text
%        str2double(get(hObject,'String')) returns contents of path_box as a double


% --- Executes during object creation, after setting all properties.
function path_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in neural.
function neural_Callback(hObject, eventdata, handles)
% hObject    handle to neural (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path]=uigetfile();

load([path,file]);
inputs = feat_speech;
label_speech=zeros(7,length(gt_speech));

for i=1:length(gt_speech)
    for j=1:7
        if (gt_speech(i)==j)
        label_speech(j,i)=1;
        end
    end
end

targets = label_speech;

for i=1:1
hiddenLayerSize = 45;
net = patternnet([93 36 18]);

net.divideParam.trainRatio = 60/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 25/100;
net.layers{1}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'logsig';
net.layers{3}.transferFcn = 'logsig';


%net.outputs{6}.processFcns = 'purelin';


[net,tr] = train(net,inputs,targets);

outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)

view(net)


end
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in female.
function female_Callback(hObject, eventdata, handles)
% hObject    handle to female (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of female


% --- Executes on button press in male.
function male_Callback(hObject, eventdata, handles)
% hObject    handle to male (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of male


% --- Executes on button press in joy.
function joy_Callback(hObject, eventdata, handles)
% hObject    handle to joy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of joy


% --- Executes on button press in anger.
function anger_Callback(hObject, eventdata, handles)
% hObject    handle to anger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of anger


% --- Executes on button press in neutral.
function neutral_Callback(hObject, eventdata, handles)
% hObject    handle to neutral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of neutral


% --- Executes on button press in sadness.
function sadness_Callback(hObject, eventdata, handles)
% hObject    handle to sadness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sadness


% --- Executes on button press in surprise.
function surprise_Callback(hObject, eventdata, handles)
% hObject    handle to surprise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of surprise


% --- Executes on button press in fear.
function fear_Callback(hObject, eventdata, handles)
% hObject    handle to fear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fear


% --- Executes on button press in disgust.
function disgust_Callback(hObject, eventdata, handles)
% hObject    handle to disgust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of disgust
