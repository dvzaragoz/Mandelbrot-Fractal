function ante(hObject, handles, r)

global deck;
global yourstring;
global compstring;
global comp2string;
global comp3string;
global comp4string;
global winner;
global tie;
global userfold;
global roddsyou;
global roddscomp1;
global roddscomp2;
global roddscomp3;
global roddscomp4;
global riverwinOddsp;
global betval;
global todds;
global toddscomp1;
global toddscomp2;
global toddscomp3;
global toddscomp4;
global turnwinOddsp;

clc
betval=0;
[deck, tie, yourstring, compstring, comp2string, comp3string, comp4string, winner, roddsyou, roddscomp1, roddscomp2, roddscomp3, roddscomp4] = Winner;
riverwinOddsp=winningOdds(roddsyou, roddscomp1, roddscomp2, roddscomp3, roddscomp4);
turnwinOddsp=winningOdds(todds, toddscomp1, toddscomp2, toddscomp3, toddscomp4);
userfold=false;
%% ante
c1=get(handles.pbankText, 'String');
c1=str2double(c1);
if c1<50
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.pbankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Player has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
ante=50;
p1=get(handles.pbankText, 'String');
p1=str2double(p1);
p1=p1-50;
p1=num2str(p1);
set(handles.pbankText, 'String', p1);
pot=get(handles.potText, 'String');
pot=str2num(pot);
pot=pot+ante;
set(handles.potText, 'String', num2str(pot));

c1=get(handles.c1bankText, 'String');
c1=str2double(c1);
if c1<50
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.c1bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 1 has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
c1=get(handles.c1bankText, 'String');
c1=str2double(c1);
c1=c1-50;
c1=num2str(c1);
set(handles.c1bankText, 'String', c1);
pot=get(handles.potText, 'String');
pot=str2num(pot);
pot=pot+ante;
set(handles.potText, 'String', num2str(pot));

c1=get(handles.c2bankText, 'String');
c1=str2double(c1);
if c1<50
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.c2bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 2 has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
c2=get(handles.c2bankText, 'String');
c2=str2double(c2);
c2=c2-50;
c2=num2str(c2);
set(handles.c2bankText, 'String', c2);
pot=get(handles.potText, 'String');
pot=str2num(pot);
pot=pot+ante;
set(handles.potText, 'String', num2str(pot));

c1=get(handles.c3bankText, 'String');
c1=str2double(c1);
if c1<50
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.c3bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 3 has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
c3=get(handles.c3bankText, 'String');
c3=str2double(c3);
c3=c3-50;
c3=num2str(c3);
set(handles.c3bankText, 'String', c3);
pot=get(handles.potText, 'String');
pot=str2num(pot);
pot=pot+ante;
set(handles.potText, 'String', num2str(pot));

c1=get(handles.c4bankText, 'String');
c1=str2double(c1);
if c1<50
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.c4bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 4 has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
c4=get(handles.c4bankText, 'String');
c4=str2double(c4);
c4=c4-50;
c4=num2str(c4);
set(handles.c4bankText, 'String', c4);
pot=get(handles.potText, 'String');
pot=str2num(pot);
pot=pot+ante;
set(handles.potText, 'String', num2str(pot));

list=get(handles.actionsList, 'string');
temp = char(list);
antestring='All computers anted up.';
list=strvcat(antestring, temp);
set(handles.actionsList, 'string', cellstr(list));

antetext=num2str(ante);
set(handles.betButton, 'String', 'Bet (1)');

global r;
r=deck;
car1=imread(r(6).pic);
car2=imread(r(7).pic);
card=image(car1, 'Parent', handles.c1);
handles.faceup(1)=1;
axis(handles.c1, 'off');
card=image(car2, 'Parent', handles.c2);
axis(handles.c2, 'off');
handles.faceup(2)=1;
guidata(hObject, handles);
clc
