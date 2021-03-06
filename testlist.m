function varargout = testlist(varargin)
% TESTLIST MATLAB code for testlist.fig
%      TESTLIST, by itself, creates a new TESTLIST or raises the existing
%      singleton*.
%
%      H = TESTLIST returns the handle to a new TESTLIST or the handle to
%      the existing singleton*.
%
%      TESTLIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTLIST.M with the given input arguments.
%
%      TESTLIST('Property','Value',...) creates a new TESTLIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before testlist_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to testlist_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help testlist

% Last Modified by GUIDE v2.5 20-Apr-2011 20:12:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @testlist_OpeningFcn, ...
                   'gui_OutputFcn',  @testlist_OutputFcn, ...
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


% --- Executes just before testlist is made visible.
function testlist_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to testlist (see VARARGIN)

% Choose default command line output for testlist
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes testlist wait for user response (see UIRESUME)
% uiwait(handles.figure1);
x=get(handles.list, 'String');
x=char(x);
x=strcat(x, 'hi');
x=cellstr(x);
z=length(x);
set(handles.list, 'String', x);

% --- Outputs from this function are returned to the command line.
function varargout = testlist_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in list.
function list_Callback(hObject, eventdata, handles)
% hObject    handle to list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list


% --- Executes during object creation, after setting all properties.
function list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
