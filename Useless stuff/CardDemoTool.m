function varargout = CardDemoTool(varargin)
% CARDDEMOTOOL M-file for CardDemoTool.fig
%      CARDDEMOTOOL, by itself, creates a new CARDDEMOTOOL or raises the existing
%      singleton*.
%
%      H = CARDDEMOTOOL returns the handle to a new CARDDEMOTOOL or the handle to
%      the existing singleton*.
%
%      CARDDEMOTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CARDDEMOTOOL.M with the given input arguments.
%
%      CARDDEMOTOOL('Property','Value',...) creates a new CARDDEMOTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CardDemoTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CardDemoTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CardDemoTool

% Last Modified by GUIDE v2.5 02-Mar-2011 23:21:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CardDemoTool_OpeningFcn, ...
                   'gui_OutputFcn',  @CardDemoTool_OutputFcn, ...
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


% --- Executes just before CardDemoTool is made visible.
function CardDemoTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CardDemoTool (see VARARGIN)

% Choose default command line output for CardDemoTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CardDemoTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

ACard7D=imread('s7.jpg');
ACardQC=imread('s7.jpg');

% display cards
hleft=image(ACard7D,'Parent',handles.leftAxes);
axis(handles.leftAxes,'off');
hright=image(ACardQC,'Parent',handles.rightAxes);
axis(handles.rightAxes,'off');

% set button image
set(handles.pushButton,'CData',fogimage);
set(handles.pushButton,'UserData',samimage);

% store cards and handle to other image in UserData
set(hright,'UserData',{ACard7D,ACardQC,hleft})
set(hleft, 'UserData',{ACard7D,ACardQC,hright})

% setup ButtonDownFcn callbacks for each image
set(hleft,'ButtonDownFcn',...
    {@imageButtonDown,hleft}); % set image's ButtonDownFcn
set(hright,'ButtonDownFcn',...
    {@imageButtonDown,hright}); % set image's ButtonDownFcn
     
%% Button Functions
function imageButtonDown(this,eventdata,varargin)

% unpack user data
data=get(this,'UserData');
hother=data{3};               % handle to other image
CardImage={data{1},data{2}};  % images of 7D and QC

set(this,'CData',CardImage{2});
set(hother,'Cdata',CardImage{1});


% --- Outputs from this function are returned to the command line.
function varargout = CardDemoTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushButton.
function pushButton_Callback(hObject, eventdata, handles)
% hObject    handle to pushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% switch image from UserData to CData

image1=get(handles.pushButton,'CData');
image2=get(handles.pushButton,'UserData');
set(handles.pushButton,'CData',image2);
set(handles.pushButton,'UserData',image1);

