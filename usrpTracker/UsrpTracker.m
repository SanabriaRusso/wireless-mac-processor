function varargout = UsrpTracker(varargin)
% USRPTRACKER MATLAB code for UsrpTracker.fig
%      USRPTRACKER, by itself, creates a new USRPTRACKER or raises the existing
%      singleton*.
%
%      H = USRPTRACKER returns the handle to a new USRPTRACKER or the handle to
%      the existing singleton*.
%
%      USRPTRACKER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USRPTRACKER.M with the given input arguments.
%
%      USRPTRACKER('Property','Value',...) creates a new USRPTRACKER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UsrpTracker_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UsrpTracker_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UsrpTracker

% Last Modified by GUIDE v2.5 13-Aug-2012 10:15:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UsrpTracker_OpeningFcn, ...
                   'gui_OutputFcn',  @UsrpTracker_OutputFcn, ...
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


% --- Executes just before UsrpTracker is made visible.
function UsrpTracker_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UsrpTracker (see VARARGIN)

% Choose default command line output for UsrpTracker
handles.output = hObject;
handles.pause_val=1;

handles.pktlog_data=0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UsrpTracker wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UsrpTracker_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
   
    ch = get(handles.channelselect, 'Value');
    
    demo(ch,handles.pause_val,1000,handles);
    
    %ifs_analysis(ch)
		
    
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pause as text
%        str2double(get(hObject,'String')) returns contents of pause as a double
pause_val = str2double(get(hObject, 'String'));
if isnan(pause_val)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.pause_val=pause_val;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function pause_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
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
       setappdata(handles.tracker, 'run', false);



% --- Executes when entered data in editable cell(s) in pktinfo.
function pktinfo_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to pktinfo (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function channel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in channelselect.
function channelselect_Callback(hObject, eventdata, handles)
% hObject    handle to channelselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns channelselect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from channelselect


% --- Executes during object creation, after setting all properties.
function channelselect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
