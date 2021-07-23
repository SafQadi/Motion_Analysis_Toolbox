% The function Motion_Analysis is the main GUI window in the toolbox.
% In this window the desired analysis window(s):

%                               Gait analysis Right
%                               Gait analysis Left
%                               Forefoot tapping
%                               Heel tapping
%                               Hand tapping
%                               Paced tapping Right
%                               Paced tapping Left
% can be selected and started. 


% Program :  Motion-Analysis 
% Version :  1.
% Function:  Motion_Analysis
% Author  :  Dr. Safwan Al-Qadhi

%%
function varargout = Motion_Analysis(varargin)
% MOTION_ANALYSIS M-file for Motion_Analysis.fig
%      MOTION_ANALYSIS, by itself, creates a new MOTION_ANALYSIS or raises the existing
%      singleton*.
%
%      H = MOTION_ANALYSIS returns the handle to a new MOTION_ANALYSIS or the handle to
%      the existing singleton*.
%
%      MOTION_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOTION_ANALYSIS.M with the given input arguments.
%
%      MOTION_ANALYSIS('Property','Value',...) creates a new MOTION_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Motion_Analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Motion_Analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Motion_Analysis

% Last Modified by GUIDE v2.5 21-Oct-2008 23:04:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Motion_Analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Motion_Analysis_OutputFcn, ...
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


%% --- Executes just before Motion_Analysis is made visible.
function Motion_Analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Motion_Analysis (see VARARGIN)

% Choose default command line output for Motion_Analysis
handles.output = hObject;


% Parameter initialisaion:
handles.exit = 0;
handles.start = 0;
handles.analysisChanged = 0;


imgFile = 'logo_juelich_300x60.jpg';
img=imread(imgFile);
image(img,'parent',handles.LogoJuelich);
set(handles.LogoJuelich,'XTick',[],'YTick',[]);
set(handles.LogoJuelich,'box','off');
set(handles.LogoJuelich,'Visible','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Motion_Analysis wait for user response (see UIRESUME)
% uiwait(handles.Motion_Analysis_figure);


%% --- Outputs from this function are returned to the command line.
function varargout = Motion_Analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%% --- Executes on selection change in Analysis_Selection_List.
function Analysis_Selection_List_Callback(hObject, eventdata, handles)
% hObject    handle to Analysis_Selection_List (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.analysisChanged = 1;

% Update handles structure
guidata(hObject, handles);

% Hints: contents = get(hObject,'String') returns Analysis_Selection_List contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Analysis_Selection_List


% --- Executes during object creation, after setting all properties.
function Analysis_Selection_List_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Analysis_Selection_List (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Gait Analysis Right',...
          'Gait Analysis Left',...
          'Forefoot Tapping',...
          'Heel Tapping',...
          'Hand Tapping',...
          'Paced Tapping Right',...
          'Paced Tapping Left'});


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.start=1;

         str=get(handles.Analysis_Selection_List, 'String');
         val=get(handles.Analysis_Selection_List, 'value');
            
         switch str{val}
         case 'Gait Analysis Right' % User select.
             disp('Starting Gait Analysis Right GUI')
             disp('   ')
             Gait_Analysis_Right();
         case 'Gait Analysis Left' % User select.
             disp('Starting Gait Anaylsis Left GUI')
             disp('   ')
             Gait_Analysis_Left();
         case 'Forefoot Tapping' % User select.
             disp( 'Starting Forefoot Tapping Anaylsis GUI')
             disp('   ')
             Forefoot_tapping();
         case 'Heel Tapping' % User select.
             disp('Starting Heel Tapping Anaylsis GUI')
             disp('   ')
             Heel_tapping();
         case 'Hand Tapping' % User select.
             disp('Starting Hand Tapping Anaylsis GUI')
             disp('   ')
             Hand_tapping();
         case 'Paced Tapping Right' % User select.
             disp('Starting Paced Tapping Anaylsis Right GUI')
             disp('   ')
             Pace_Tapping_Right();
         case 'Paced Tapping Left' % User select.
             disp('Starting Paced Tapping Anaylsis Left GUI')
             disp('   ')
             Paced_Tapping_Left();
             otherwise
                 
         end

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.exit=1;

str1='Yes';
str2='No';

Qd=questdlg('do you realy want to exit','',str1,str2,str2);
if (strcmp(Qd,str1)==1)
try      
close(Motion_Analysis);
catch
end
close all


clc
fclose('all');
disp('***** END Motion_Analysis GUI *****');
disp(' ');
disp(' ');
clear all;

elseif (strcmp(Qd,str1)==0)
    
end

