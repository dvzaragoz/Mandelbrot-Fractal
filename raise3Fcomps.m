function raise3Fcomps(hObject, handles, r)

global betval;
global bets;
global raise;

seconds=.5;

if bets(1:5)==betval
    allcalled=true;
else
    allcalled=false;
end

%% Computer 1

global foldcomp1;
c1cards=[r(8) r(9)];
x=randi(10);

if allcalled==false && foldcomp1==false
    %dont need an else because going to be at end, it just wont enter this
    %if still need to call bet
    if raise(2)~=2
        if c1cards(1).val==c1cards(2).val
            if x<9
                %call
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 1 called.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %raise
                raise(2)=raise(2)+1;
                betval=betval+50;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        elseif c1cards(1).suitnum==c1cards(2).suitnum
            if x<8
                %call
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 1 called.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %raise
                raise(2)=raise(2)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
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
                raise(2)=raise(2)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
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
                raise(2)=raise(2)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 1 raised the bet to ', num2str(betval-bets(2)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %fold
                foldcomp1=true;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 1 folded.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        end
    else
        if c1cards(1).val==c1cards(2).val || c1cards(1).suitnum==c1cards(2).suitnum ...
                || c1cards(1).val==14 || c1cards(2).val==14 || x>2
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp1=true;
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 1 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    end
    
    if foldcomp1==false
        cbet=betval-bets(2);
        bets(2)=betval;
        c1=get(handles.c1bankText, 'String');
        c1=str2double(c1);
        c1=c1-cbet;
        c1=num2str(c1);
        set(handles.c1bankText, 'String', c1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+cbet;
        set(handles.potText, 'String', num2str(pot));
    end
    if foldcomp1==false
        c1=get(handles.c1bankText, 'String');
        c1=str2double(c1);
        if betval-bets(1)>c1 || c1<=0
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
end


if foldcomp1==true
    bets(2)=betval;
end
%what do we do if he folds

pause(seconds);

%% Computer 2

if bets(1:5)==betval
    allcalled=true;
else
    allcalled=false;
end


global foldcomp2
c1cards=[r(10) r(11)];
x=randi(10);

if allcalled==false && foldcomp2==false
    %dont need an else because going to be at end, it just wont enter this
    %if still need to call bet
    c1=get(handles.c2bankText, 'String');
    c1=str2double(c1);
    if betval-bets(1)>c1
        c1=c1+1000;
        c1=num2str(c1);
        set(handles.c2bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 2 has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
    end
    if raise(3)~=2
        if c1cards(1).val==c1cards(2).val
            if x<9
                %call
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 2 called.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %raise
                raise(3)=raise(3)+1;
                betval=betval+50;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        elseif c1cards(1).suitnum==c1cards(2).suitnum
            if x<8
                %call
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 2 called.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %raise
                raise(3)=raise(3)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
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
                raise(3)=raise(3)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
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
                raise(3)=raise(3)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 2 raised the bet to ', num2str(betval-bets(3)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %fold
                foldcomp2=true;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 2 folded.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        end
    else
        if c1cards(1).val==c1cards(2).val || c1cards(1).suitnum==c1cards(2).suitnum ...
                || c1cards(1).val==14 || c1cards(2).val==14 || x>2
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp2=truel;
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 2 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    end
    if foldcomp2==false
        cbet=betval-bets(3);
        bets(3)=betval;
        c1=get(handles.c2bankText, 'String');
        c1=str2double(c1);
        c1=c1-cbet;
        c1=num2str(c1);
        set(handles.c2bankText, 'String', c1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+cbet;
        set(handles.potText, 'String', num2str(pot));
    end
        if foldcomp2==false
        c1=get(handles.c2bankText, 'String');
        c1=str2double(c1);
        if betval-bets(1)>c1 || c1<=0
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
end

if foldcomp2==true
    bets(3)=betval;
end

pause(seconds);


%% Computer 3

if bets(1:5)==betval
    allcalled=true;
else
    allcalled=false;
end


global foldcomp3
c1cards=[r(12) r(13)];
x=randi(10);

if allcalled==false && foldcomp3==false
    c1=get(handles.c3bankText, 'String');
    c1=str2double(c1);
    if betval-bets(1)>c1
        c1=c1+1000;
        c1=num2str(c1);
        set(handles.c3bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 3 has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
        
    end
    %dont need an else because going to be at end, it just wont enter this
    %if still need to call bet
    if raise(4)~=2
        if c1cards(1).val==c1cards(2).val
            if x<9
                %call
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 3 called.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %raise
                raise(4)=raise(4)+1;
                betval=betval+50;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        elseif c1cards(1).suitnum==c1cards(2).suitnum
            if x<8
                %call
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 3 called.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %raise
                raise(4)=raise(4)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
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
                raise(4)=raise(4)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
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
                raise(4)=raise(4)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 3 raised the bet to ', num2str(betval-bets(4)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %fold
                foldcomp3=true;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 3 folded.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        end
    else
        if c1cards(1).val==c1cards(2).val || c1cards(1).suitnum==c1cards(2).suitnum ...
                || c1cards(1).val==14 || c1cards(2).val==14 || x>2
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp3=truel;
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 3 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    end
    if foldcomp3==false
        cbet=betval-bets(4);
        bets(4)=betval;
        c1=get(handles.c3bankText, 'String');
        c1=str2double(c1);
        c1=c1-cbet;
        c1=num2str(c1);
        set(handles.c3bankText, 'String', c1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+cbet;
        set(handles.potText, 'String', num2str(pot));
    end
    if foldcomp3==false
        c1=get(handles.c3bankText, 'String');
        c1=str2double(c1);
        if betval-bets(1)>c1 || c1<=0
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
end

if foldcomp3==true
    bets(4)=betval;
end

pause(seconds);

%% Computer 4

if bets(1:5)==betval
    allcalled=true;
else
    allcalled=false;
end


global foldcomp4
c1cards=[r(12) r(13)];
x=randi(10);

if allcalled==false && foldcomp4==false
    c1=get(handles.c4bankText, 'String');
    c1=str2double(c1);
    if betval-bets(1)>c1
        c1=c1+1000;
        c1=num2str(c1);
        set(handles.c4bankText, 'String', c1);
        list=get(handles.actionsList, 'string');
        temp = char(list);
        antestring=['Computer 4 has been given 1000 dollars'];
        list=strvcat(antestring, temp);
        set(handles.actionsList, 'string', cellstr(list));
        
    end
    %dont need an else because going to be at end, it just wont enter this
    %if still need to call bet
    if raise(5)~=2
        if c1cards(1).val==c1cards(2).val
            if x<9
                %call
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 4 called.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %raise
                raise(5)=raise(5)+1;
                betval=betval+50;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        elseif c1cards(1).suitnum==c1cards(2).suitnum
            if x<8
                %call
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 4 called.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %raise
                raise(5)=raise(5)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
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
                raise(5)=raise(5)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
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
                raise(5)=raise(5)+1;
                betval=betval+20;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 4 raised the bet to ', num2str(betval-bets(5)) , '.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            else
                %fold
                foldcomp4=true;
                list=get(handles.actionsList, 'string');
                temp = char(list);
                antestring=['Computer 4 folded.'];
                list=strvcat(antestring, temp);
                set(handles.actionsList, 'string', cellstr(list));
            end
        end
    else
        if c1cards(1).val==c1cards(2).val || c1cards(1).suitnum==c1cards(2).suitnum ...
                || c1cards(1).val==14 || c1cards(2).val==14 || x>2
            %call
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 called.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        else
            %fold
            foldcomp4=truel;
            list=get(handles.actionsList, 'string');
            temp = char(list);
            antestring=['Computer 4 folded.'];
            list=strvcat(antestring, temp);
            set(handles.actionsList, 'string', cellstr(list));
        end
    end
    if foldcomp4==false
        cbet=betval-bets(5);
        bets(5)=betval;
        c1=get(handles.c4bankText, 'String');
        c1=str2double(c1);
        c1=c1-cbet;
        c1=num2str(c1);
        set(handles.c4bankText, 'String', c1);
        pot=get(handles.potText, 'String');
        pot=str2num(pot);
        pot=pot+cbet;
        set(handles.potText, 'String', num2str(pot));
    end
        if foldcomp4==false
        c1=get(handles.c4bankText, 'String');
        c1=str2double(c1);
        if betval-bets(1)>c1 || c1<=0
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
end

if foldcomp4==true
    bets(5)=betval;
end

pause(seconds);


if bets(1:5)==betval
    allcalled=true;
else
    allcalled=false;
end

if allcalled==true
    set(handles.betButton, 'String', 'Bet (4)');
    car11=imread(r(5).pic);
    card=image(car11, 'Parent', handles.c15);
    axis(handles.c15, 'off');
    handles.faceup(15)=1;
    guidata(hObject, handles);
else
    %does this just stay blank
    set(handles.betButton, 'String', 'Raise(3)');
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring=['You must bet at least ' num2str(betval-bets(1)) ' to call.'];
        set(handles.betText, 'String', num2str(betval-bets(1)));
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end


