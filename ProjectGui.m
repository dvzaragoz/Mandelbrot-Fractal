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

% Last Modified by GUIDE v2.5 25-Apr-2011 20:14:05

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

% UIWAIT makes ProjectGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
backgroundImage = imread('MATLABdefault.jpg');
casinoTable=image(backgroundImage,'Parent',handles.bgAxes);
axis(handles.bgAxes,'off');
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
handles.faceup = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

% Update handles structure
guidata(hObject, handles);


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
        ante(hObject, handles, r);
    case 'Bet (1)'
        bet1(hObject, handles, r);
    case 'Raise(1)'
        raise1Fplayer(hObject, handles, r);
    case 'Bet (2)'
        
        bet2(hObject, handles, r);
    case 'Raise(2)'
        raise2Fplayer(hObject, handles, r);
    case 'Bet (3)'
        bet3(hObject, handles, r);
    case 'Raise(3)'
        raise3Fplayer(hObject, handles, r);
    case 'Bet (4)'
        bet4(hObject, handles, r);
    case 'Raise(4)'
        raise4Fplayer(hObject, handles, r);
    case 'New Hand'
        newhand(hObject, handles);
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
if s~=8
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
            set(handles.oddsText, 'String', 'N/A');
    end
elseif s==8
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
            set(handles.oddsText, 'String', 'N/A');
    end
end
s=get(handles.oddsPopup, 'Value');
global todds;
if s~=8
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
            set(handles.turnText, 'String', 'N/A');
    end
elseif s==8
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
            set(handles.turnText, 'String', 'N/A');
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

% --- Executes on button press in aboutButton.
function aboutButton_Callback(hObject, eventdata, handles)
% hObject    handle to aboutButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(sprintf(['ABOUT\n\n', ...
    'The following resources were used in the creation of this project:\n\n',...
    'RULES\n',...
    'http://en.wikipedia.org/wiki/Texas_hold_''em\n',...
    'HANDS & RANKING\n',...
    'http://www.texasholdem-poker.com/handrank\n',...
    'OUT STATISTICS\n',...
    'http://casinogambling.about.com/library/weekly/aa050103.htm\n\n',...
    'APPLICATIONS\n',...
    '-Mathworks MATLAB\n',...
    '-Adobe Photoshop CS5\n\n',...
    'Programmed by Nate Wickham, Alex Yurkowski, and Dylan Zaragoza\n\n',...
    'Date Project Started: \n',...
    'Date Project Ended: \n\n']),'About');

% --- Executes on button press in pokerhandsButton.
function pokerhandsButton_Callback(hObject, eventdata, handles)
% hObject    handle to pokerhandsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(sprintf(['TEXAS HOLD ''EM HAND RANKINGS\n\n', ...
    'The following lists the various poker hands used in Texas Hold ''Em in order of decreasing ranking:\n\n',...
    'Royal Flush - An Ace-High straight of one suit\n',...
    'Straight Flush - A straight of entirely one suit\n',...
    'Four of a Kind - Four cards of the same rank\n',...
    'Full House - Three of a Kind and a Pair\n',...
    'Flush - Five cards of the same suit\n',...
    'Straight - Five cards of sequential rank (Aces can be high or low)\n',...
    'Three of a Kind - Three cards of the same rank\n',...
    'Two Pair - Two sets of two cards of the same rank\n',...
    'Pair - Two cards of the same rank\n',...
    'High Card - If a player has none of the above, their highest ranking card\n\n',...
    'The probability calculator above the menu box supplements the player''s gameplay decisions by displaying', ...
    'the chance of having a specific hand after the turn (T) and the river (R).']),'Texas Hold ''Em Hands & Ranking');

% --- Executes on button press in rulesButton.
function rulesButton_Callback(hObject, eventdata, handles)
% hObject    handle to rulesButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(sprintf(['HOW TO PLAY\n\n', ...
    'Texas Hold ''Em is a variation of standard poker. ',...
    'Each player is dealt 2 face down cards while 5 ''community cards'' are placed in the middle. ',...
    'The community cards are then placed face-up by the dealer in a specific order:\n\n',...
    '-First a series of three cards ("the flop")\n'...
    '-Then a single card ("the turn")\n', ...
    '-Then the last face down card ("the river")\n\n', ...
    'Players have the option to bet, call, raise, or fold after each deal. ', ...
    'Betting may occur prior to the flop, "on the flop", "on the turn", or "on the river".\n\n',...
    'For this particular game, players may raise up to two times prior to the flop or on any deal, ', ...
    'with a 50 dollar ante and a limit on each bet of 200 dollars.\n\n', ...
    'After the river, the player that can form the highest ranking 5 card poker hand ', ...
    'with their 2 cards and the 5 revealed community cards wins the pot. ', ...
    'If there is a draw, the pot is split between tied players.\n\n', ...
    'For a list of poker hands and their respective ranking, click the ''Poker Hands'' button in the menu box.']),'Rules');

% --- Executes on selection change in cardSetting.
function cardSetting_Callback(hObject, eventdata, handles)
% hObject    handle to cardSetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cardSetting contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        cardSetting
cardTemp = get(handles.cardSetting,'Value');
switch cardTemp
    case 1
        if handles.faceup(1) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c1);
        else
        end;
        if handles.faceup(2) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c2);
        else
        end;
        if handles.faceup(3) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c3);
        else
        end;
        if handles.faceup(4) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c4);
        else
        end;
        if handles.faceup(5) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c5);
        else
        end;
        if handles.faceup(6) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c6);
        else
        end;
        if handles.faceup(7) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c7);
        else
        end;
        if handles.faceup(8) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c8);
        else
        end;
        if handles.faceup(9) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c9);
        else
        end;
        if handles.faceup(10) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c10);
        else
        end;
        if handles.faceup(11) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c11);
        else
        end;
        if handles.faceup(12) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c12);
        else
        end;
        if handles.faceup(13) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c13);
        else
        end;
        if handles.faceup(14) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c14);
        else
        end;
        if handles.faceup(15) == 0;
            blank=imread('Cards/blank.jpg');
            card=image(blank, 'Parent',handles.c15);
        else
        end;
    case 2
        if handles.faceup(1) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c1);
        else
        end;
        if handles.faceup(2) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c2);
        else
        end;
        if handles.faceup(3) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c3);
        else
        end;
        if handles.faceup(4) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c4);
        else
        end;
        if handles.faceup(5) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c5);
        else
        end;
        if handles.faceup(6) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c6);
        else
        end;
        if handles.faceup(7) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c7);
        else
        end;
        if handles.faceup(8) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c8);
        else
        end;
        if handles.faceup(9) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c9);
        else
        end;
        if handles.faceup(10) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c10);
        else
        end;
        if handles.faceup(11) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c11);
        else
        end;
        if handles.faceup(12) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c12);
        else
        end;
        if handles.faceup(13) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c13);
        else
        end;
        if handles.faceup(14) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c14);
        else
        end;
        if handles.faceup(15) == 0;
            blank=imread('Cards/ourladyofthelake.jpg');
            card=image(blank, 'Parent',handles.c15);
        else
        end;
    case 3
        if handles.faceup(1) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c1);
        else
        end;
        if handles.faceup(2) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c2);
        else
        end;
        if handles.faceup(3) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c3);
        else
        end;
        if handles.faceup(4) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c4);
        else
        end;
        if handles.faceup(5) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c5);
        else
        end;
        if handles.faceup(6) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c6);
        else
        end;
        if handles.faceup(7) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c7);
        else
        end;
        if handles.faceup(8) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c8);
        else
        end;
        if handles.faceup(9) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c9);
        else
        end;
        if handles.faceup(10) == 0;
            blank=imread('Cards/lonestar.jpg');
            card=image(blank, 'Parent',handles.c10);
        else
        end;
        if handles.faceup(11) == 0;
            blank=imread('Cards/lonestarT.jpg');
            card=image(blank, 'Parent',handles.c11);
        else
        end;
        if handles.faceup(12) == 0;
            blank=imread('Cards/lonestarE.jpg');
            card=image(blank, 'Parent',handles.c12);
        else
        end;
        if handles.faceup(13) == 0;
            blank=imread('Cards/lonestarX.jpg');
            card=image(blank, 'Parent',handles.c13);
        else
        end;
        if handles.faceup(14) == 0;
            blank=imread('Cards/lonestarA.jpg');
            card=image(blank, 'Parent',handles.c14);
        else
        end;
        if handles.faceup(15) == 0;
            blank=imread('Cards/lonestarS.jpg');
            card=image(blank, 'Parent',handles.c15);
        else
        end;
    case 4
        if handles.faceup(1) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c1);
        else
        end;
        if handles.faceup(2) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c2);
        else
        end;
        if handles.faceup(3) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c3);
        else
        end;
        if handles.faceup(4) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c4);
        else
        end;
        if handles.faceup(5) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c5);
        else
        end;
        if handles.faceup(6) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c6);
        else
        end;
        if handles.faceup(7) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c7);
        else
        end;
        if handles.faceup(8) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c8);
        else
        end;
        if handles.faceup(9) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c9);
        else
        end;
        if handles.faceup(10) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c10);
        else
        end;
        if handles.faceup(11) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c11);
        else
        end;
        if handles.faceup(12) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c12);
        else
        end;
        if handles.faceup(13) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c13);
        else
        end;
        if handles.faceup(14) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c14);
        else
        end;
        if handles.faceup(15) == 0;
            blank=imread('Cards/deckofmidas.jpg');
            card=image(blank, 'Parent',handles.c15);
        else
        end;
    case 5
        if handles.faceup(1) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c1);
        else
        end;
        if handles.faceup(2) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c2);
        else
        end;
        if handles.faceup(3) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c3);
        else
        end;
        if handles.faceup(4) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c4);
        else
        end;
        if handles.faceup(5) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c5);
        else
        end;
        if handles.faceup(6) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c6);
        else
        end;
        if handles.faceup(7) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c7);
        else
        end;
        if handles.faceup(8) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c8);
        else
        end;
        if handles.faceup(9) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c9);
        else
        end;
        if handles.faceup(10) == 0;
            blank=imread('Cards/hereditaryluck.jpg');
            card=image(blank, 'Parent',handles.c10);
        else
        end;
        if handles.faceup(11) == 0;
            blank=imread('Cards/hereditaryluckI.jpg');
            card=image(blank, 'Parent',handles.c11);
        else
        end;
        if handles.faceup(12) == 0;
            blank=imread('Cards/hereditaryluckR.jpg');
            card=image(blank, 'Parent',handles.c12);
        else
        end;
        if handles.faceup(13) == 0;
            blank=imread('Cards/hereditaryluckI.jpg');
            card=image(blank, 'Parent',handles.c13);
        else
        end;
        if handles.faceup(14) == 0;
            blank=imread('Cards/hereditaryluckS.jpg');
            card=image(blank, 'Parent',handles.c14);
        else
        end;
        if handles.faceup(15) == 0;
            blank=imread('Cards/hereditaryluckH.jpg');
            card=image(blank, 'Parent',handles.c15);
        else
        end;
end;
axis(handles.c1, 'off');
axis(handles.c2, 'off');
axis(handles.c3, 'off');
axis(handles.c4, 'off');
axis(handles.c5, 'off');
axis(handles.c6, 'off');
axis(handles.c7, 'off');
axis(handles.c8, 'off');
axis(handles.c9, 'off');
axis(handles.c10, 'off');
axis(handles.c11, 'off');
axis(handles.c12, 'off');
axis(handles.c13, 'off');
axis(handles.c14, 'off');
axis(handles.c15, 'off');

% --- Executes during object creation, after setting all properties.
function cardSetting_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cardSetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end;


% --- Executes on selection change in bgSetting.
function bgSetting_Callback(hObject, eventdata, handles)
% hObject    handle to bgSetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns bgSetting contents as cell array
%        contents{get(hObject,'Value')} returns selected item from bgSetting
temp = get(handles.bgSetting,'Value');
switch temp
    case 1
        backgroundImage = imread('MATLABdefault.jpg');
        casinoTable=image(backgroundImage,'Parent',handles.bgAxes);
        axis(handles.bgAxes,'off');
    case 2
        backgroundImage = imread('CasinoTabletop.jpg');
        casinoTable=image(backgroundImage,'Parent',handles.bgAxes);
        axis(handles.bgAxes,'off');
    case 3
        backgroundImage = imread('PicnicTable.jpg');
        casinoTable=image(backgroundImage,'Parent',handles.bgAxes);
        axis(handles.bgAxes,'off');
    case 4
        backgroundImage = imread('TheUsualPlace.jpg');
        casinoTable=image(backgroundImage,'Parent',handles.bgAxes);
        axis(handles.bgAxes,'off');
    otherwise
end;

% --- Executes during object creation, after setting all properties.
function bgSetting_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bgSetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
