function bet4comps(hObject, handles, r)

global betval;
global raise;
global bets;
global yourstring;
global compstring;
global comp2string;
global comp3string;
global comp4string;
global winner;
global tie;
seconds=.5;
%% computer 1 bet

% r 8 and 9

global foldcomp1;
c1cards=[r(8) r(9)];
x=randi(100);
given=false;

c1=get(handles.c1bankText, 'String');
c1=str2double(c1);
if c1<betval-bets(2) %if computer does not have enough money to call, it gives him 1000
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.c1bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 1 has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
    
end

switch char(compstring)
    case 'Royal Flush'
        %raise
        raise(2)=1;
        if x<=20
            betval=betval+20;
        else
            betval=betval+50;
        end
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    case 'Four of a Kind'
        if x<=20
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(2)=1;
            if x<=40
                betval=betval+50;
            else
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        end
    case 'Fullhouse'
        if x<=40
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(2)=1;
            if x<=45
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Flush'
        if x<=30
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(2)=1;
            if x<=40
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Straight'
        if x<=30
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(2)=1;
            if x<=35
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Three of a Kind'
        if x<=40
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(2)=1;
            if x<=43
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Two Pair'
        if x<=75
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(2)=1;
            if x<=98
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'One Pair'
        if x<=74
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(2)=1;
            if x<=94
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    otherwise
        if x<=54
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(2)=1;
            if x<=94
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
end


%amount you bet more than last bet
cbet=betval-bets(2);
%set your bet equal to that amount


bets(2)=betval;
%subtract that bet from your bank
if foldcomp1==false
    c1=get(handles.c1bankText, 'String');
    c1=str2double(c1);
    c1=c1-cbet;
    c1=num2str(c1);
    set(handles.c1bankText, 'String', c1);
    %set the pot
    pot=get(handles.potText, 'String');
    pot=str2num(pot);
    pot=pot+cbet;
    set(handles.potText, 'String', num2str(pot));
end

if foldcomp1==true && given==true
    c1=get(handles.c1bankText, 'String');
    c1=str2double(c1);
    c1=c1-1000;
    c1=num2str(c1);
    set(handles.c1bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 1 has lost the 1000 dollars given because of folding.'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end

%set your bet equal to that amount
if foldcomp1==false
    c1=get(handles.c1bankText, 'String');
    c1=str2double(c1);
    if c1<=0
        c1=c1+1000;
        c1=num2str(c1);
        set(handles.c1bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
        
    end
end
pause(seconds);

%% computer 2 bet

% r 10 and 11

global foldcomp2;
c1cards=[r(10) r(11)];
x=randi(100);
given=false;


c1=get(handles.c2bankText, 'String');
c1=str2double(c1);
if c1<betval-bets(3)
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.c2bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 2 has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end

switch char(comp2string)
    case 'Royal Flush'
        %raise
        raise(3)=1;
        if x<=20
            betval=betval+20;
        else
            betval=betval+50;
        end
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    case 'Four of a Kind'
        if x<=20
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(3)=1;
            if x<=40
                betval=betval+50;
            else
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        end
    case 'Fullhouse'
        if x<=40
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(3)=1;
            if x<=45
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Flush'
        if x<=30
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(3)=1;
            if x<=40
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Straight'
        if x<=30
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(3)=1;
            if x<=35
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Three of a Kind'
        if x<=40
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(3)=1;
            if x<=43
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Two Pair'
        if x<=75
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(3)=1;
            if x<=98
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'One Pair'
        if x<=74
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(3)=1;
            if x<=94
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    otherwise
        if x<=54
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(3)=1;
            if x<=94
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
end


%amount you bet more than last bet
cbet=betval-bets(3);

%set your bet equal to that amount
bets(3)=betval;
%subtract that bet from your bank
if foldcomp2==false
    c1=get(handles.c2bankText, 'String');
    c1=str2double(c1);
    c1=c1-cbet;
    c1=num2str(c1);
    set(handles.c2bankText, 'String', c1);
    %set the pot
    pot=get(handles.potText, 'String');
    pot=str2num(pot);
    pot=pot+cbet;
    set(handles.potText, 'String', num2str(pot));
end

if foldcomp2==true && given==true
    c1=get(handles.c2bankText, 'String');
    c1=str2double(c1);
    c1=c1-1000;
    c1=num2str(c1);
    set(handles.c2bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 2 has lost the 1000 dollars given because of folding.'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end

if foldcomp2==false
    c1=get(handles.c2bankText, 'String');
    c1=str2double(c1);
    if c1<=0
        c1=c1+1000;
        c1=num2str(c1);
        set(handles.c2bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
end
pause(seconds);

%% computer 3 bet

% r 12 and 13

global foldcomp3;
c1cards=[r(12) r(13)];
x=randi(100);
given=false;

c1=get(handles.c3bankText, 'String');
c1=str2double(c1);
if c1<betval-bets(4)
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.c3bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 3 has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
    given=true;
end

switch char(comp3string)
    case 'Royal Flush'
        %raise
        raise(4)=1;
        if x<=20
            betval=betval+20;
        else
            betval=betval+50;
        end
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    case 'Four of a Kind'
        if x<=20
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(4)=1;
            if x<=40
                betval=betval+50;
            else
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        end
    case 'Fullhouse'
        if x<=40
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(4)=1;
            if x<=45
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Flush'
        if x<=30
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(4)=1;
            if x<=40
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Straight'
        if x<=30
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(4)=1;
            if x<=35
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Three of a Kind'
        if x<=40
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(4)=1;
            if x<=43
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Two Pair'
        if x<=75
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(4)=1;
            if x<=98
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'One Pair'
        if x<=74
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(4)=1;
            if x<=94
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    otherwise
        if x<=54
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(4)=1;
            if x<=94
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
end


%amount you bet more than last bet
cbet=betval-bets(4);

%set your bet equal to that amount
bets(4)=betval;
%subtract that bet from your bank
if foldcomp3==false
    c1=get(handles.c3bankText, 'String');
    c1=str2double(c1);
    c1=c1-cbet;
    c1=num2str(c1);
    set(handles.c3bankText, 'String', c1);
    %set the pot
    pot=get(handles.potText, 'String');
    pot=str2num(pot);
    pot=pot+cbet;
    set(handles.potText, 'String', num2str(pot));
end

if foldcomp3==true && given==true
    c1=get(handles.c3bankText, 'String');
    c1=str2double(c1);
    c1=c1-1000;
    c1=num2str(c1);
    set(handles.c3bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 3 has lost the 1000 dollars given because of folding.'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
if foldcomp3==false
    c1=get(handles.c3bankText, 'String');
    c1=str2double(c1);
    if c1<=0
        c1=c1+1000;
        c1=num2str(c1);
        set(handles.c3bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
end

pause(seconds);

%% computer 4 bet

% r 14 and 15


global foldcomp4;
c1cards=[r(14) r(15)];
x=randi(100);
given=false;

c1=get(handles.c4bankText, 'String');
c1=str2double(c1);
if c1<betval-bets(5)
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.c4bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 4 has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
    given=true;
end

switch char(comp4string)
    case 'Royal Flush'
        %raise
        raise(5)=1;
        if x<=20
            betval=betval+20;
        else
            betval=betval+50;
        end
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    case 'Four of a Kind'
        if x<=20
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(5)=1;
            if x<=40
                betval=betval+50;
            else
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        end
    case 'Fullhouse'
        if x<=40
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(5)=1;
            if x<=45
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Flush'
        if x<=30
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(5)=1;
            if x<=40
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Straight'
        if x<=30
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(5)=1;
            if x<=35
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Three of a Kind'
        if x<=40
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %raise
            raise(5)=1;
            if x<=43
                betval=betval+50;
            else
                betval=betval+20;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'Two Pair'
        if x<=75
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(5)=1;
            if x<=98
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    case 'One Pair'
        if x<=74
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(5)=1;
            if x<=94
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    otherwise
        if x<=54
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        elseif x>=85
            %raise
            raise(5)=1;
            if x<=94
                betval=betval+20;
            else
                betval=betval+50;
            end
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            set(handles.c1Text, 'String', 'Fold');
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
end


%amount you bet more than last bet
cbet=betval-bets(5);

%set your bet equal to that amount
bets(5)=betval;
%subtract that bet from your bank
if foldcomp4==false
    c1=get(handles.c4bankText, 'String');
    c1=str2double(c1);
    c1=c1-cbet;
    c1=num2str(c1);
    set(handles.c4bankText, 'String', c1);
    %set the pot
    pot=get(handles.potText, 'String');
    pot=str2num(pot);
    pot=pot+cbet;
    set(handles.potText, 'String', num2str(pot));
end

if foldcomp4==true && given==true
    c1=get(handles.c4bankText, 'String');
    c1=str2double(c1);
    c1=c1-1000;
    c1=num2str(c1);
    set(handles.c4bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 4 has lost the 1000 dollars given because of folding.'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
if foldcomp4==false
    c1=get(handles.c4bankText, 'String');
    c1=str2double(c1);
    if c1<=0
        c1=c1+1000;
        c1=num2str(c1);
        set(handles.c4bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
end

%% Check for raises

pause(seconds);

if bets(1:5)==betval
    winner=Endwinner(handles);
    gameover(hObject, handles, r, yourstring, compstring, comp2string, comp3string, comp4string, winner, tie);
else
    set(handles.betButton, 'String', 'Raise(4)');
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['You must bet at least ' num2str(betval-bets(1)) ' to call.'];
        set(handles.betText, 'String', num2str(betval-bets(1)));
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
