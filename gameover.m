function gameover(hObject, handles, r, yourstring, compstring, comp2string, comp3string, comp4string, winner, tie)


switch winner
    case 'You win'
        p1=get(handles.pbankText, 'String');
        p1=str2double(p1);
        pot=get(handles.potText, 'String');
        pot=str2double(pot);
        p1=p1+pot;
        set(handles.pbankText, 'String', p1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        z=char(yourstring);
        antestring=[winner ' with ' z];
        list=char(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    case 'Computer 1 Wins'
        c1=get(handles.c1bankText, 'String');
        c1=str2double(c1);
        pot=get(handles.potText, 'String');
        pot=str2double(pot);
        c1=c1+pot;
        set(handles.c1bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        z=char(compstring);
        antestring=[winner ' with ' z];
        list=char(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    case 'Computer 2 Wins'
        c1=get(handles.c2bankText, 'String');
        c1=str2double(c1);
        pot=get(handles.potText, 'String');
        pot=str2double(pot);
        c1=c1+pot;
        set(handles.c2bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        z=char(comp2string);
        antestring=[winner ' with ' z];
        list=char(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    case 'Computer 3 Wins'
        c1=get(handles.c3bankText, 'String');
        c1=str2double(c1);
        pot=get(handles.potText, 'String');
        pot=str2double(pot);
        c1=c1+pot;
        set(handles.c3bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        z=char(comp3string);
        antestring=[winner ' with ' z];
        list=char(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    case 'Computer 4 Wins'
        c1=get(handles.c4bankText, 'String');
        c1=str2double(c1);
        pot=get(handles.potText, 'String');
        pot=str2double(pot);
        c1=c1+pot;
        set(handles.c4bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        z=char(comp4string);
        antestring=[winner ' with ' z];
        list=char(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    case 'Tie'
        string=[];
        pot=get(handles.potText, 'String');
        pot=str2double(pot);
        lentie=length(tie);
        r=mod(pot, lentie);
        pot=pot-r;
        cash=pot/lentie;
        if tie(1)==1
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring='Player Ties';
            list=char(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
            p1=get(handles.pbankText, 'String');
            p1=str2double(p1);
            p1=p1+cash;
            set(handles.pbankText, 'String', p1);
        end
        if tie(2)==2
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring='Computer 1 Ties';
            list=char(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
            p1=get(handles.c1bankText, 'String');
            p1=str2double(p1);
            p1=p1+cash;
            set(handles.c1bankText, 'String', p1);
        end
        if tie(3)==3
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring='Computer 2 Ties';
            list=char(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
            p1=get(handles.c2bankText, 'String');
            p1=str2double(p1);
            p1=p1+cash;
            set(handles.c2bankText, 'String', p1);
        end
        if tie(4)==4
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring='Computer 3 Ties';
            list=char(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
            p1=get(handles.c3bankText, 'String');
            p1=str2double(p1);
            p1=p1+cash;
            set(handles.c3bankText, 'String', p1);
        end
        if tie(5)==5
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring='Computer 4 Ties';
            list=char(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
            p1=get(handles.c4bankText, 'String');
            p1=str2double(p1);
            p1=p1+cash;
            set(handles.c4bankText, 'String', p1);
        end
        set(handles.actionText, 'String', string);
end

global r;
c3=imread(r(8).pic);
c4=imread(r(9).pic);
c5=imread(r(10).pic);
c6=imread(r(11).pic);
c7=imread(r(12).pic);
c8=imread(r(13).pic);
c9=imread(r(14).pic);
c10=imread(r(15).pic);
card=image(c3, 'Parent',handles.c3);
axis(handles.c3, 'off');
card=image(c4, 'Parent',handles.c4);
axis(handles.c4, 'off');
card=image(c5, 'Parent',handles.c5);
axis(handles.c5, 'off');
card=image(c6, 'Parent',handles.c6);
axis(handles.c6, 'off');
card=image(c7, 'Parent',handles.c7);
axis(handles.c7, 'off');
card=image(c8, 'Parent',handles.c8);
axis(handles.c8, 'off');
card=image(c9, 'Parent',handles.c9);
axis(handles.c9, 'off');
card=image(c10, 'Parent',handles.c10);
axis(handles.c10, 'off');

handles.faceup(3)=1;
handles.faceup(4)=1;
handles.faceup(5)=1;
handles.faceup(6)=1;
handles.faceup(7)=1;
handles.faceup(8)=1;
handles.faceup(9)=1;
handles.faceup(10)=1;

guidata(hObject, handles);

global foldcomp1;
if foldcomp1==true
    compstring='Fold';
end
global foldcomp2;
if foldcomp2==true
    comp2string='Fold';
end
global foldcomp3;
if foldcomp3==true
    comp3string='Fold';
end
global foldcomp4;
if foldcomp4==true
    comp4string='Fold';
end

set(handles.pText, 'String', yourstring);
set(handles.c1Text, 'String', compstring);
set(handles.c2Text, 'String', comp2string);
set(handles.c3Text, 'String', comp3string);
set(handles.c4Text, 'String', comp4string);

set(handles.potText, 'String', '0');
set(handles.betButton, 'String', 'New Hand');
clc