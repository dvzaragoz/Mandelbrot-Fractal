function varargout = ProjectGui(varargin)
% PROJECTGUI MATLAB code for ProjectGui.fig
%      PROJECTGUI, by itself, creates a new PROJECTGUI or raises the existing
%      singleton*.
%
%      H = PROJECTGUI returns the handle to a new PROJECTG`UI or the handle to
%      the existing singleton*.
%
%      PROJECTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTGUI.M with the given input arguments.
%
%      PROJECTGUI('Property','Value',...) creates a new PROJECTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjectGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjectGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjectGui

% Last Modified by GUIDE v2.5 25-Apr-2011 13:25:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @ProjectGui_OpeningFcn, ...
    'gui_OutputFcn',  @ProjectGui_OutputFcn, ...
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


% --- Executes just before ProjectGui is made visible.
function ProjectGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjectGui (see VARARGIN)

% Choose default command line output for ProjectGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjectGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
blank=imread('Cards/blank.jpg');
card=image(blank, 'Parent',handles.c1);
axis(handles.c1, 'off');
card=image(blank, 'Parent',handles.c2);
axis(handles.c2, 'off');
card=image(blank, 'Parent',handles.c3);
axis(handles.c3, 'off');
card=image(blank, 'Parent',handles.c4);
axis(handles.c4, 'off');
card=image(blank, 'Parent',handles.c5);
axis(handles.c5, 'off');
card=image(blank, 'Parent',handles.c6);
axis(handles.c6, 'off');
card=image(blank, 'Parent',handles.c7);
axis(handles.c7, 'off');
card=image(blank, 'Parent',handles.c8);
axis(handles.c8, 'off');
card=image(blank, 'Parent',handles.c9);
axis(handles.c9, 'off');
card=image(blank, 'Parent',handles.c10);
axis(handles.c10, 'off');
card=image(blank, 'Parent',handles.c11);
axis(handles.c11, 'off');
card=image(blank, 'Parent',handles.c12);
axis(handles.c12, 'off');
card=image(blank, 'Parent',handles.c13);
axis(handles.c13, 'off');
card=image(blank, 'Parent',handles.c14);
axis(handles.c14, 'off');
card=image(blank, 'Parent',handles.c15);
axis(handles.c15, 'off');
list=get(handles.actionsList, 'string');
temp = char(list);
antestring='The ante is 50.';
list=strvcat(temp, antestring);
set(handles.actionsList, 'string', cellstr(list));



% --- Outputs from this function are returned to the command line.
function varargout = ProjectGui_OutputFcn(hObject, eventdata, handles)
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
global deck;
global yourstring;
global compstring;
global comp2string;
global comp3string;
global comp4string;
global winner;
global tie;
global userfold
global betval;
global raise;
global call;
r=deck;
s=get(handles.betButton, 'String');
set(handles.betButton, 'String', 'Please Wait');
switch s
    case 'Ante'
        ante(handles, r);
    case 'Bet (1)'
        if userfold==false;
            bet1(handles, r);
        else
            folded(handles);
        end
    case 'Raise(1)'
        raise1Fplayer(handles, r);
    case 'Bet (2)'
        if userfold==false;
            bet2(handles, r);
        else
            folded(handles);
        end
    case 'Raise(2)'
        raise2Fplayer(handles, r);
    case 'Bet (3)'
        if userfold==false;
            bet3(handles, r);
        else
            folded(handles);
        end
    case 'Raise(3)'
        raise3Fplayer(handles, r);
    case 'Bet (4)'
        if userfold==false;
            bet4(handles, r);
        else
            folded(handles);
        end
    case 'Raise(4)'
        raise4Fplayer(handles, r);
    case 'You folded'
        winner=Endwinner(handles);
        gameover(handles, r, yourstring, compstring, comp2string, comp3string, comp4string, winner, tie);
    case 'New Hand'
        newhand(handles);
end


% --- Executes on button press in foldButton.
function foldButton_Callback(hObject, eventdata, handles)
% hObject    handle to foldButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fold(handles);


% --- Executes on selection change in oddsPopup.
function oddsPopup_Callback(hObject, eventdata, handles)
% hObject    handle to oddsPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns oddsPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from oddsPopup
s=get(handles.oddsPopup, 'Value');
z=get(handles.betButton, 'String');
global roddsyou;
global riverwinOddsp;
global turnwinOddsp;
if s~=9
    switch z
        case 'Bet (3)'
            set(handles.oddsText, 'String', roddsyou(s));
        case 'Raise(3)'
            set(handles.oddsText, 'String', roddsyou(s));
        case 'Bet (4)'
            set(handles.oddsText, 'String', roddsyou(s));
        case 'Raise(4)'
            set(handles.oddsText, 'String', roddsyou(s));
        case 'New Hand'
            set(handles.oddsText, 'String', roddsyou(s));
        otherwise
            set(handles.oddsText, 'String', 'Unavailable');
    end
elseif s==9
    switch z
        case 'Bet (3)'
            set(handles.oddsText, 'String', riverwinOddsp);
            
        case 'Raise(3)'
            set(handles.oddsText, 'String', riverwinOddsp);
            
        case 'Bet (4)'
            set(handles.oddsText, 'String', riverwinOddsp);
            
        case 'Raise(4)'
            set(handles.oddsText, 'String', riverwinOddsp);
        case 'New Hand'
            set(handles.oddsText, 'String', riverwinOddsp);
        otherwise
            set(handles.oddsText, 'String', 'Unavailable');
    end
end
s=get(handles.oddsPopup, 'Value');
global todds;
if s~=9
    switch z
        case 'Bet (2)'
            set(handles.turnText, 'String', todds(s));
        case 'Raise(2)'
            set(handles.turnText, 'String', todds(s));
        case 'Bet (3)'
            set(handles.turnText, 'String', todds(s));
        case 'Raise(3)'
            set(handles.turnText, 'String', todds(s));
        case 'Bet (4)'
            set(handles.turnText, 'String', todds(s));
        case 'Raise(4)'
            set(handles.turnText, 'String', todds(s));
        case 'New Hand'
            set(handles.turnText, 'String', todds(s));
        otherwise
            set(handles.turnText, 'String', 'Unavailable');
    end
elseif s==9
    switch z
        case 'Bet (2)'
            set(handles.turnText, 'String', turnwinOddsp);
        case 'Raise(2)'
            set(handles.turnText, 'String', turnwinOddsp);
        case 'Bet (3)'
            set(handles.turnText, 'String', turnwinOddsp);
        case 'Raise(3)'
            set(handles.turnText, 'String', turnwinOddsp);
        case 'Bet (4)'
            set(handles.turnText, 'String', turnwinOddsp);
        case 'Raise(4)'
            set(handles.turnText, 'String', turnwinOddsp);
        case 'New Hand'
            set(handles.turnText, 'String', turnwinOddsp);
        otherwise
            set(handles.turnText, 'String', 'Unavailable');
    end
end

% --- Executes during object creation, after setting all properties.
function oddsPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oddsPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in actionsList.
function actionsList_Callback(hObject, eventdata, handles)
% hObject    handle to actionsList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns actionsList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from actionsList


% --- Executes during object creation, after setting all properties.
function actionsList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to actionsList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
