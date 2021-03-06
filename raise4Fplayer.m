function raise4Fplayer(hObject, handles, r)

global betval;
global bets;
global raise;
global userfold;

if userfold==false
    called=false;
    p1=get(handles.pbankText, 'String');
    p1=str2double(p1);
    if betval-bets(1)>p1 && called==false
        p1=p1+1000;
        p1=num2str(p1);
        set(handles.pbankText, 'String', p1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Player has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
    
    pbet=get(handles.betText, 'String');
    pbet=str2num(pbet);
    p1=get(handles.pbankText, 'String');
    p1=str2double(p1);
    limit=200;
    %add pause
    
    
    %% Player
    
    badbet=false;
    
    x=0;
    for iv=1:5
        if betval==bets(iv)
            x=x+1;
        end
        if x==5
            called=true;
        end
    end
    
    if pbet<=p1 && pbet<=limit
        %if bets(1:5)~=betval
        if called==false
            if raise(1)==2
                %player can only call or fold
                if pbet~=(betval-bets(1))
                    %player bet too much and cannot do this
                    %or player bet too little and this is invalid bet
                    badbet=true;
                else
                    %called or checked
                end
            else
                %player can call fold or raise
                if pbet==(betval-bets(1)) %betval-bets(1) is the remaining amount you need to call
                    %called or checked
                elseif pbet>(betval-bets(1))
                    %raise
                    raise(1)=raise(1)+1;
                    betval=betval+pbet;
                else
                    badbet=true;
                end
            end
        end
    else
        badbet=true;
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
    
    if badbet==false
        bets(1)=betval;
        p1=p1-pbet;
        p1=num2str(p1);
        set(handles.pbankText, 'String', p1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+pbet;
        set(handles.potText, 'String', num2str(pot));
        %move to next function that declares the computers decisions
        raise4Fcomps(hObject, handles, r);
    else
        %display that this bet is invalid and redo this function after button
        %pushed(so just change action text that isnt done yet)
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Invalid bet.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
        set(handles.betButton, 'String', 'Raise(4)');
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
    raise4Fcomps(hObject, handles, r);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring='You folded. Please click the bet button for the game to continue.';
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list))
end

