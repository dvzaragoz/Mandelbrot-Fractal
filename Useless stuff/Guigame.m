function varargout = Guigame(varargin)
% GUIGAME MATLAB code for Guigame.fig
%      GUIGAME, by itself, creates a new GUIGAME or raises the existing
%      singleton*.
%
%      H = GUIGAME returns the handle to a new GUIGAME or the handle to
%      the existing singleton*.
%
%      GUIGAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIGAME.M with the given input arguments.
%
%      GUIGAME('Property','Value',...) creates a new GUIGAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Guigame_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Guigame_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Guigame

% Last Modified by GUIDE v2.5 27-Mar-2011 23:21:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Guigame_OpeningFcn, ...
                   'gui_OutputFcn',  @Guigame_OutputFcn, ...
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


% --- Executes just before Guigame is made visible.
function Guigame_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Guigame (see VARARGIN)

% Choose default command line output for Guigame
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Guigame wait for user response (see UIRESUME)
% uiwait(handles.figure1);




% --- Outputs from this function are returned to the command line.
function varargout = Guigame_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function betText_Callback(hObject, eventdata, handles)
% hObject    handle to betText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of betText as text
%        str2double(get(hObject,'String')) returns contents of betText as a double


% --- Executes during object creation, after setting all properties.
function betText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to betText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in betButton.
function betButton_Callback(hObject, eventdata, handles)
% hObject    handle to betButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
THEM(handles);