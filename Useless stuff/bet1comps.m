function bet1comps(handles, r)

global betval;
global raise;
global bets;
seconds=.5;
%% computer 1 bet

% r 8 and 9

global foldcomp1;
foldcomp1=false;
c1cards=[r(8) r(9)];
x=randi(10);

c1=get(handles.c1bankText, 'String');
c1=str2double(c1);
if c1<betval-bets(2)
    c1=c1+1000;
    c1=num2str(c1);
    set(handles.c1bankText, 'String', c1);
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['Computer 1 has been given 1000 dollars'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
    
end

if c1cards(1).val==c1cards(2).val
    if x<=2
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(2)=1;
        betval=betval+50;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 raised ', num2str(betval-bets(2)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
elseif c1cards(1).suitnum==c1cards(2).suitnum
    if x<=5
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(2)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 raised ', num2str(betval-bets(2)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
elseif c1cards(1).val==14 || c1cards(2).val==14
    if x<=8
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(2)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 raised ', num2str(betval-bets(2)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
else
    if x<=8
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    elseif x==9
        %raise
        raise(2)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 1 raised ', num2str(betval-bets(2)) , '.'];
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

pause(seconds);

%% computer 2 bet

% r 10 and 11

global foldcomp2;
foldcomp2=false;
c1cards=[r(10) r(11)];
x=randi(10);

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

if c1cards(1).val==c1cards(2).val
    if x<=2
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(3)=1;
        betval=betval+50;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 raised ', num2str(betval-bets(3)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
elseif c1cards(1).suitnum==c1cards(2).suitnum
    if x<=5
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(3)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 raised ', num2str(betval-bets(3)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
elseif c1cards(1).val==14 || c1cards(2).val==14
    if x<=8
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(3)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 raised ', num2str(betval-bets(3)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
else
    if x<=8
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    elseif x==9
        %raise
        raise(3)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 raised ', num2str(betval-bets(3)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %fold
        foldcomp2=true;
        set(handles.c2Text, 'String', 'Fold');
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
pause(seconds);

%% computer 3 bet

% r 12 and 13

global foldcomp3;
foldcomp3=false;
c1cards=[r(12) r(13)];
x=randi(10);

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
end

if c1cards(1).val==c1cards(2).val
    if x<=2
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(4)=1;
        betval=betval+50;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 raised ', num2str(betval-bets(4)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
elseif c1cards(1).suitnum==c1cards(2).suitnum
    if x<=5
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(4)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 raised ', num2str(betval-bets(4)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
elseif c1cards(1).val==14 || c1cards(2).val==14
    if x<=8
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(4)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 raised ', num2str(betval-bets(4)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
else
    if x<=8
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    elseif x==9
        %raise
        raise(4)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 raised ', num2str(betval-bets(4)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %fold
        foldcomp3=true;
        set(handles.c3Text, 'String', 'Fold');
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

pause(seconds);

%% computer 4 bet

% r 14 and 15


global foldcomp4;
foldcomp4=false;
c1cards=[r(14) r(15)];
x=randi(10);

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
    end

if c1cards(1).val==c1cards(2).val
    if x<=2
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(5)=1;
        betval=betval+50;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 raised ', num2str(betval-bets(5)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
elseif c1cards(1).suitnum==c1cards(2).suitnum
    if x<=5
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(5)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 raised ', num2str(betval-bets(5)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
elseif c1cards(1).val==14 || c1cards(2).val==14
    if x<=8
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %raise
        raise(5)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 raised ', num2str(betval-bets(5)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
else
    if x<=8
        %call
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 called.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    elseif x==9
        %raise
        raise(5)=1;
        betval=betval+20;
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 raised ', num2str(betval-bets(5)) , '.'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    else
        %fold
        foldcomp4=true;
        set(handles.c4Text, 'String', 'Fold');
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

%% Check for raises

pause(seconds);

if bets(1:5)==betval
    t=get(handles.actionText, 'String');
    set(handles.betButton, 'String', 'Bet (2)');
    car11=imread(r(1).pic);
    car12=imread(r(2).pic);
    car13=imread(r(3).pic);
    card=image(car11, 'Parent', handles.c11);
    axis(handles.c11, 'off');
    card=image(car12, 'Parent', handles.c12);
    axis(handles.c12, 'off');
    card=image(car13, 'Parent', handles.c13);
    axis(handles.c13, 'off');
else
    set(handles.betButton, 'String', 'Raise(1)');
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['You must bet at least ' num2str(betval-bets(1)) ' to call.'];
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
