function raise1F(handles, r, betval, raise, call)

global betval;
global raise;
global call;

%% Player Bet
pbet=get(handles.betText, 'String');
pbet=str2num(pbet);
p1=get(handles.pbankText, 'String');
p1=str2double(p1);
seconds=1;
limit=200;
raise=0;

bet=betval(5)-betval(4);

% need to make sure player bets call or more
if pbet<=p1 && pbet<=limit && raise(1)~=2
    p1=p1-pbet;
    p1=num2str(p1);
    set(handles.pbankText, 'String', p1);
    pot=get(handles.potText, 'String');
    pot=str2num(pot);
    pot=pot+pbet;
    set(handles.potText, 'String', num2str(pot));
    betval(1)=betval(1)+bet;
else
    set(handles.actionText, 'String', 'You bet more than you have or over the limit. Place a new bet.');
end

betdifference=betval(5)-betval(4);
bet=pbet;

if pbet<=p1 && bet==betdifference
    call=call+1;
    p1=p1-pbet;
    p1=num2str(p1);
    set(handles.pbankText, 'String', p1);
    pot=get(handles.potText, 'String');
    pot=str2num(pot);
    pot=pot+pbet;
    set(handles.potText, 'String', num2str(pot));
    betval(1)=betval(1)+bet;
end

%% Computer 1 bet

if call~=5 && raise(2)~=2
    global foldcomp1;
    c1cards=[r(8) r(9)];
    x=randi(10);
    if c1cards(1).val==c1cards(2).val
        if x<=2
            %call
            call=call+1;
        else
            %raise
            raise(2)=raise(2)+1;
            bet=bet+50;
            call=0;
        end
    elseif c1cards(1).suitnum==c1cards(2).suitnum
        if x<=5
            %call
            call=call+1;
        else
            %raise
            raise(2)=raise(2)+1;
            bet=bet+20;
            call=0;
        end
    elseif c1cards(1).val==14 || c1cards(2).val==14
        if x<=8
            %call
            call=call+1;
        else
            %raise
            raise(2)=raise(2)+1;
            bet=bet+20;
            call=0;
        end
    else
        if x<=8
            %call
            call=call+1;
        elseif x==9
            %raise
            raise(2)=raise(2)+1;
            bet=bet+20;
            call=0;
        else
            %fold
            foldcomp1=true;
            call=call+1;
        end
    end
    pause(seconds);
end

if raise(2)==2
    betdifference=betval(1)-betval(5);
    bet=betdifference;
    call=call+1;
end
if foldcomp1==false % doe this need call thing
        betval(2)=betval(2)+bet;
        cbet=bet;
        c1=get(handles.c1bankText, 'String');
        c1=str2double(c1);
        c1=c1-cbet;
        c1=num2str(c1);
        set(handles.c1bankText, 'String', c1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+cbet;
        set(handles.potText, 'String', num2str(pot));
else
    call=call+1;
end

%% computer 2

if call~=5 && raise(3)~=2
    global foldcomp2;
    c1cards=[r(10) r(11)];
    x=randi(10);
    if c1cards(1).val==c1cards(2).val
        if x<=2
            %call
            call=call+1;
        else
            %raise
            raise(3)=raise(3)+1;
            bet=bet+50;
            call=0;
        end
    elseif c1cards(1).suitnum==c1cards(2).suitnum
        if x<=5
            %call
            call=call+1;
        else
            %raise
            raise(3)=raise(3)+1;
            bet=bet+20;
            call=0;
        end
    elseif c1cards(1).val==14 || c1cards(2).val==14
        if x<=8
            %call
            call=call+1;
        else
            %raise
            raise(3)=raise(3)+1;
            bet=bet+20;
            call=0;
        end
    else
        if x<=8
            %call
            call=call+1;
        elseif x==9
            %raise
            raise(3)=raise(3)+1;
            bet=bet+20;
            call=0;
        else
            %fold
            foldcomp2=true;
            call=call+1;
        end
    end
    pause(seconds);
end

if raise(3)==2 && foldcomp1==false
    betdifference=betval(2)-betval(1);
    bet=betdifference;
    call=call+1;
end
if foldcomp1==true && raise(3)==2
    betdifference=betval(1)-betval(5);
    bet=betdifference;
end
if foldcomp2==false
        betval(3)=betval(3)+bet;
        cbet=bet;
        c1=get(handles.c1bankText, 'String');
        c1=str2double(c1);
        c1=c1-cbet;
        c1=num2str(c1);
        set(handles.c1bankText, 'String', c1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+cbet;
        set(handles.potText, 'String', num2str(pot));
else
    call=call+1;
end
    
%% Computer 3

if call~=5 && raise(4)~=2
    global foldcomp3;
    c1cards=[r(12) r(13)];
    x=randi(10);
    if c1cards(1).val==c1cards(2).val
        if x<=2
            %call
            call=call+1;
        else
            %raise
            raise(4)=raise(4)+1;
            bet=bet+50;
            call=0;
        end
    elseif c1cards(1).suitnum==c1cards(2).suitnum
        if x<=5
            %call
            call=call+1;
        else
            %raise
            raise(4)=raise(4)+1;
            bet=bet+20;
            call=0;
        end
    elseif c1cards(1).val==14 || c1cards(2).val==14
        if x<=8
            %call
            call=call+1;
        else
            %raise
            raise(4)=raise(4)+1;
            bet=bet+20;
            call=0;
        end
    else
        if x<=8
            %call
            call=call+1;
        elseif x==9
            %raise
            raise(4)=raise(4)+1;
            bet=bet+20;
            call=0;
        else
            %fold
            foldcomp3=true;
            call=call+1;
        end
    end
    pause(seconds);
end

if raise(4)==2 && foldcomp2==false
    betdifference=betval(3)-betval(2);
    bet=betdifference;
    call=call+1;
end
if foldcomp2==true && raise(3)==2 && foldcomp1==false
    betdifference=betval(2)-betval(1);
    bet=betdifference;
end
if foldcomp3==false
        betval(4)=betval(4)+bet;
        cbet=bet;
        c1=get(handles.c1bankText, 'String');
        c1=str2double(c1);
        c1=c1-cbet;
        c1=num2str(c1);
        set(handles.c1bankText, 'String', c1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+cbet;
        set(handles.potText, 'String', num2str(pot));
else
    call=call+1;
end
    
%% Computer 4

if call~=5 && raise(5)~=2
    global foldcomp4;
    c1cards=[r(14) r(15)];
    x=randi(10);
    if c1cards(1).val==c1cards(2).val
        if x<=2
            %call
            call=call+1;
        else
            %raise
            raise(5)=raise(5)+1;
            bet=bet+50;
            call=0;
        end
    elseif c1cards(1).suitnum==c1cards(2).suitnum
        if x<=5
            %call
            call=call+1;
        else
            %raise
            raise(5)=raise(5)+1;
            bet=bet+20;
            call=0;
        end
    elseif c1cards(1).val==14 || c1cards(2).val==14
        if x<=8
            %call
            call=call+1;
        else
            %raise
            raise(5)=raise(5)+1;
            bet=bet+20;
            call=0;
        end
    else
        if x<=8
            %call
            call=call+1;
        elseif x==9
            %raise
            raise(5)=raise(5)+1;
            bet=bet+20;
            call=0;
        else
            %fold
            foldcomp4=true;
            call=call+1;
        end
    end
    pause(seconds);
end

if raise(4)==2 && foldcomp3==false
    betdifference=betval(4)-betval(3);
    bet=betdifference;
    call=call+1;
end
if foldcomp3==true && raise(3)==2 && foldcomp2==false
    betdifference=betval(3)-betval(2);
    bet=betdifference;
end
if foldcomp4==false
        betval(5)=betval(5)+bet;
        cbet=bet;
        c1=get(handles.c1bankText, 'String');
        c1=str2double(c1);
        c1=c1-cbet;
        c1=num2str(c1);
        set(handles.c1bankText, 'String', c1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+cbet;
        set(handles.potText, 'String', num2str(pot));
else
    call=call+1;
end
    

if call~=5
else
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
end

