function fold(handles)

global values;
global userfold;
global yourstring;

values(1)=0;
yourstring='You fold.';
userfold=true;
set(handles.betText, 'String', 'You Folded.');
list=get(handles.actionsList, 'string');
temp = char(list);
antestring='You folded. Please click the bet button for the game to continue.';
list=strvcat(antestring, temp);
set(handles.actionsList, 'string', cellstr(list))
