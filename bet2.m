function bet2(hOjbect, handles, r)

global betval;
global raise;
global bets;
bets=[0 0 0 0 0];
raise=[0 0 0 0 0];
global userfold;

if userfold==false
    c1=get(handles.pbankText, 'String');
    c1=str2double(c1);
    if c1<betval-bets(1) || c1<=0
        c1=c1+1000;
        c1=num2str(c1);
        set(handles.pbankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Player has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
        
    end
    
    global todds;
    global toddscomp1;
    global toddscomp2;
    global toddscomp3;
    global toddscomp4;
    global turnwinOddsp;
    global roddsyou;
    global roddscomp1;
    global roddscomp2;
    global roddscomp3;
    global roddscomp4;
    global riverwinOddsp;
    global foldcomp1;
    global foldcomp2;
    global foldcomp3;
    global foldcomp4;
    
    if foldcomp1==true
        roddscomp1=[0 0 0 0 0 0 0 0];
        toddscomp1=[0 0 0 0 0 0 0 0];
    end
    if foldcomp2==true
        roddscomp2=[0 0 0 0 0 0 0 0];
        toddscomp2=[0 0 0 0 0 0 0 0];
    end
    if foldcomp3==true
        roddscomp3=[0 0 0 0 0 0 0 0];
        toddscomp3=[0 0 0 0 0 0 0 0];
    end
    if foldcomp4==true
        roddscomp4=[0 0 0 0 0 0 0 0];
        toddscomp4=[0 0 0 0 0 0 0 0];
    end
    
    riverwinOddsp=winningOdds(roddsyou, roddscomp1, roddscomp2, roddscomp3, roddscomp4);
    turnwinOddsp=winningOdds(todds, toddscomp1, toddscomp2, toddscomp3, toddscomp4);
    
    pbet=get(handles.betText, 'String');
    pbet=str2num(pbet);
    p1=get(handles.pbankText, 'String');
    p1=str2double(p1);
    limit=200;
    
    if pbet<=p1 && pbet<=limit
        p1=p1-pbet;
        betval=pbet;
        p1=num2str(p1);
        set(handles.pbankText, 'String', p1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+pbet;
        set(handles.potText, 'String', num2str(pot));
        bets(1)=betval;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['You bet ' num2str(pbet) '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
        bet2comps(hOjbect, handles, r);
    else
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring='You bet more than you have or over the limit. Place a new bet.';
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
        set(handles.betButton, 'String', 'Bet (2)');
    end
    
    p1=get(handles.pbankText, 'String');
    p1=str2double(p1);
    if p1<=0
        p1=p1+1000;
        p1=num2str(p1);
        set(handles.pbankText, 'String', p1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Player has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
    
elseif userfold==true
    bets(1)=betval;
    bet2comps(hOjbect, handles, r);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring='You folded. Please click the bet button for the game to continue.';
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list))
end
