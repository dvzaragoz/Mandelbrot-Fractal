function bet1(handles, r)

global betval;
global raise;
global bets;
bets=[0 0 0 0 0];
raise=[0 0 0 0 0];

pbet=get(handles.betText, 'String');
pbet=str2num(pbet);
p1=get(handles.pbankText, 'String');
p1=str2double(p1);
limit=2000;

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
    bet1comps(handles, r);
else
    list=get(handles.actionsList, 'string');
    temp = char(list);
    antestring='You bet more than you have or over the limit. Place a new bet.';
    list=strvcat(antestring, temp);
    set(handles.actionsList, 'string', cellstr(list));
end
