function varargout = RRR_Robot(varargin)
% RRR_ROBOT MATLAB code for RRR_Robot.fig
%      RRR_ROBOT, by itself, creates a new RRR_ROBOT or raises the existing
%      singleton*.
%
%      H = RRR_ROBOT returns the handle to a new RRR_ROBOT or the handle to
%      the existing singleton*.
%
%      RRR_ROBOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RRR_ROBOT.M with the given input arguments.
%
%      RRR_ROBOT('Property','Value',...) creates a new RRR_ROBOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RRR_Robot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RRR_Robot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RRR_Robot

% Last Modified by GUIDE v2.5 28-Nov-2017 15:22:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RRR_Robot_OpeningFcn, ...
                   'gui_OutputFcn',  @RRR_Robot_OutputFcn, ...
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


% --- Executes just before RRR_Robot is made visible.
function RRR_Robot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RRR_Robot (see VARARGIN)

% Choose default command line output for RRR_Robot
handles.output = hObject;
L_1 = 20;
L_2 = 50;
L_3 = 40;

L (1) = Link([0 L_1 0 pi/2]);
L (2) = Link([0 0 L_2 0]);
L (3) = Link([0 0 L_3 0]);
L(3).offset = -pi/2;

Robot = SerialLink(L);
Robot.name = 'RRR_Robot';

handles.Theta_1.String = '90';
handles.Theta_2.String = '90';
handles.Theta_3.String = '90';

J = Robot.fkine([ pi/2 pi/2 pi/2]);

handles.CurrentT1 = pi/2;
handles.CurrentT2 = pi/2;
handles.CurrentT3 = pi/2;

handles.Pos_X.String = num2str(floor(J(1,4)));
handles.Pos_Y.String = num2str(floor(J(2,4)));
handles.Pos_Z.String = num2str(floor(J(3,4)));

Robot.plot([pi/2 pi/2 pi/2]);
view(45,30);
handles.Robot = Robot;
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes RRR_Robot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RRR_Robot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_1 as text
%        str2double(get(hObject,'String')) returns contents of Theta_1 as a double


% --- Executes during object creation, after setting all properties.
function Theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_2 as text
%        str2double(get(hObject,'String')) returns contents of Theta_2 as a double


% --- Executes during object creation, after setting all properties.
function Theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_3 as text
%        str2double(get(hObject,'String')) returns contents of Theta_3 as a double


% --- Executes during object creation, after setting all properties.
function Theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_Forward.
function btn_Forward_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Th_1 = str2double(handles.Theta_1.String)*pi/180;
Th_2 = str2double(handles.Theta_2.String)*pi/180;
Th_3 = str2double(handles.Theta_3.String)*pi/180;

%cla(handles.axes1);
handles.Robot.plot([Th_1 Th_2 Th_3]);

T = handles.Robot.fkine([Th_1 Th_2 Th_3]);
handles.CurrentT1 = Th_1;
handles.CurrentT2 = Th_2;
handles.CurrentT3 = Th_3;

handles.Pos_X.String = num2str(floor(T(1,4)));
handles.Pos_Y.String = num2str(floor(T(2,4)));
handles.Pos_Z.String = num2str(floor(T(3,4)));

function Pos_X_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_X as text
%        str2double(get(hObject,'String')) returns contents of Pos_X as a double


% --- Executes during object creation, after setting all properties.
function Pos_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Y_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Y as text
%        str2double(get(hObject,'String')) returns contents of Pos_Y as a double


% --- Executes during object creation, after setting all properties.
function Pos_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Z_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Z as text
%        str2double(get(hObject,'String')) returns contents of Pos_Z as a double


% --- Executes during object creation, after setting all properties.
function Pos_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_Inverse.
function btn_Inverse_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PX = str2double(handles.Pos_X.String);
PY = str2double(handles.Pos_Y.String);
PZ = str2double(handles.Pos_Z.String);

T = [ 1 0 0 PX;
      0 1 0 PY;
      0 0 1 PZ;
      0 0 0 1];
  
J = handles.Robot.ikine(T, [0 handles.CurrentT2 handles.CurrentT3], [1 1 1 0 0 0]) * 180/pi;
handles.Theta_1.String = num2str(floor(J(1)));
handles.Theta_2.String = num2str(floor(J(2)));
handles.Theta_3.String = num2str(floor(J(3)));

%cla(handles.axes1);
handles.Robot.plot(J*pi/180);


% --- Executes on button press in btnDemo.
function btnDemo_Callback(hObject, eventdata, handles)
% hObject    handle to btnDemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
State = 0;
x = handles.txtStep.String;
if( strcmp(x, '') )
    Step = 10;
else
    Step = str2double(x);
end
Start = 0;
End = 180;
%PauseTime = 0;

cla(handles.axes1);
handles.Robot.plot([0 pi/2 pi/2]);
view(45,30);
hold on;

t_1 = Start:Step:End;
Points = zeros(length(t_1), length(t_1) , 3);


for t1 = 1:1:length(t_1)
    if (State == 0)
        for t2 = 1:1:length(t_1)
            % handles.Robot.plot([0 t1 t2]*pi/180);
            P = handles.Robot.fkine([0 t_1(t1) t_1(t2)]*pi/180);
            Points(t1,t2,1) = P(1,4);
            Points(t1,t2,2) = P(2,4);
            Points(t1,t2,3) = P(3,4);
            % plot3(P(1,4),P(2,4),P(3,4),'r*');
            % pause(PauseTime);
        end
        State = 1;
    else
        for t2 = length(t_1):-1:1
            % handles.Robot.plot([0 t1 t2]*pi/180);
            P = handles.Robot.fkine([0 t_1(t1) t_1(t2)]*pi/180);
            Points(t1,t2,1) = P(1,4);
            Points(t1,t2,2) = P(2,4);
            Points(t1,t2,3) = P(3,4);
            % plot3(P(1,4),P(2,4),P(3,4),'r*');
            % pause(PauseTime);
        end
        State = 0;
    end
end

plot3(Points(:,:,1), Points(:,:,2), Points(:,:,3), 'r.');



function txtStep_Callback(hObject, eventdata, handles)
% hObject    handle to txtStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtStep as text
%        str2double(get(hObject,'String')) returns contents of txtStep as a double


% --- Executes during object creation, after setting all properties.
function txtStep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
