function [deal, tie, yourstring, compstring, comp2string, comp3string, comp4string, values, rivoddsyou, rivoddscomp1, rivoddscomp2, rivoddscomp3, rivoddscomp4] = Winner

numcomps=4;
deal=Hand(7+2*numcomps);
mid=deal(1:5);


%% Display Mid
% 
% disp('Middle')
% for iv=1:5
%     disp(deal(iv).str)
% end

% disp('--------------------------------')

%% Your hand
% 
% disp('Your hand')
% 
% for iv=6:7
%     disp(deal(iv).str)
% end
% 
% disp('--------------------------------')

yours=[mid deal(6:7)];
yoursriver=[deal(1:4) deal(6:7)];
yoursturn=[deal(1:3) deal(6:7)];
[yourval yourval2 yourstring]=Handval(yours);
% disp(yourstring)

%% Computer 1s hand
% 
% disp('Computer 1s hand')
% for iv=8:9
%     disp(deal(iv).str)
% end
comps1=[mid deal(8:9)];
comps1river=[deal(1:4) deal(8:9)];
comps1turn=[deal(1:3) deal(8:9)];
[compval compval2 compstring]=Handval(comps1);
% disp(compstring)

%% Computer 2s hand
% % 
% disp('Computer 2s hand')
% for iv=10:11
%     disp(deal(iv).str)
% end
comps2=[mid deal(10:11)];
comps2river=[deal(1:4) deal(10:11)];
comps2turn=[deal(1:3) deal(8:9)];
[comp2val comp2val2 comp2string]=Handval(comps2);
% disp(comp2string)

%% Computer 3s hand
% % 
% disp('Computer 3s hand')
% for iv=12:13
%     disp(deal(iv).str)
% end
comps3=[mid deal(12:13)];
comps3river=[deal(1:4) deal(12:13)];
comps3turn=[deal(1:3) deal(8:9)];
[comp3val comp3val2 comp3string]=Handval(comps3);
% disp(comp3string)

%% Computer 4s hand
% 
% disp('Computer 4s hand')
% for iv=14:15
%     disp(deal(iv).str)
% end
comps4=[mid deal(14:15)];
comps4river=[deal(1:4) deal(14:15)];
comps4turn=[deal(1:3) deal(8:9)];

[comp4val comp4val2 comp4string]=Handval(comps4);
% disp(comp4string)

%% Display winner
% disp('--------------------------------')

vals=[yourval compval comp2val comp3val comp4val];
vals2=[yourval2 compval2 comp2val2 comp3val2 comp4val2];
valsort=sort(vals);

v=[yourval compval comp2val comp3val comp4val];
v6=[yourval2(5) compval2(5) comp2val2(5) comp3val2(5) comp4val2(5)];
vsort=sort(v);

v2=0;
v3=0;
v4=0;
v5=0;
v6=0;

yourvalue=0;
compvalue=0;
comp2value=0;
comp3value=0;
comp4value=0;

%%
if yourval==max(v)
    yourvalue=1000000;
    v2=[v2 yourval2(1)];
end
if compval==max(v)
    compvalue=1000000;
    v2=[v2 compval2(1)];
end
if comp2val==max(v)
    comp2value=1000000;
    v2=[v2 comp2val2(1)];
end
if comp3val==max(v)
    comp3value=1000000;
    v2=[v2 comp3val2(1)];
end
if comp4val==max(v)
    comp4value=1000000;
    v2=[v2 comp4val2(1)];
end

%%
x=100000;
if yourval2(1)==max(v2)
    v3=[v3, yourval2(2)];
    yourvalue=yourvalue+x;
end
if compval2(1)==max(v2)
    v3=[v3, compval2(2)];
    compvalue=compvalue+x;
end
if comp2val2(1)==max(v2)
    v3=[v3, comp2val2(2)];
    comp2value=comp2value+x;
end
if comp3val2(1)==max(v2)
    v3=[v3, comp3val2(2)];
    comp3value=comp3value+x;
end


x=x/10;
if yourval2(2)==max(v3)
    v4=[v4, yourval2(3)];
    yourvalue=yourvalue+x;
end
if compval2(2)==max(v3)
    v4=[v4, compval2(3)];
    compvalue=compvalue+x;
end
if comp2val2(2)==max(v3)
    v4=[v4, comp2val2(3)];
    comp2value=comp2value+x;
end
if comp3val2(2)==max(v3)
    v4=[v4, comp3val2(3)];
    comp3value=comp3value+x;
end


x=x/10;
if yourval2(3)==max(v4)
    v5=[v5, yourval2(4)];
    yourvalue=yourvalue+x;
end
if compval2(3)==max(v4)
    v5=[v5, compval2(4)];
    compvalue=compvalue+x;
end
if comp2val2(3)==max(v4)
    v5=[v5, comp2val2(4)];
    comp2value=comp2value+x;
end
if comp3val2(3)==max(v4)
    v5=[v5, comp3val2(4)];
    comp3value=comp3value+x;
end

x=x/10;
if yourval2(4)==max(v5)
    v6=[v6, yourval2(5)];
    yourvalue=yourvalue+x;
end
if compval2(4)==max(v5)
    v6=[v6, compval2(5)];
    compvalue=compvalue+x;
end
if comp2val2(4)==max(v5)
    v6=[v6, comp2val2(5)];
    comp2value=comp2value+x;
end
if comp3val2(4)==max(v5)
    v6=[v6, comp3val2(5)];
    comp3value=comp3value+x;
end

z=[yourvalue compvalue comp2value comp3value comp4value];
global values;
values=z;
z2=sort(z);
tie=[0 0 0 0 0];

if z2(length(z2)-1)==max(z)
    if yourvalue==max(z)
        %winner='You tied';
        winner='Tie';
        tie(1)=1;
    end
    if compvalue==max(z)
        %winner='Computer 1 tied';
        winner='Tie';
        tie(2)=2;
    end
    if comp2value==max(z)
        %winner='Computer 2 tied';
        winner='Tie';
        tie(3)=3;
    end
    if comp3value==max(z)
        %winner='Computer 3 tied';
        winner='Tie';
        tie(4)=4;
    end
    if comp4value==max(z)
        %winner='Computer 4 tied';
        winner='Tie';
        tie(5)=5;
    end
else
    if yourvalue==max(z)
        winner='You win';
    end
    if compvalue==max(z)
        winner='Computer 1 Wins';
    end
    if comp2value==max(z)
        winner='Computer 2 Wins';
    end
    if comp3value==max(z)
        winner='Computer 3 Wins';
    end
    if comp4value==max(z)
        winner='Computer 4 Wins';
    end
end

global todds;
global toddscomp1;
global toddscomp2;
global toddscomp3;
global toddscomp4;
rivoddsyou = RiverOdds(yoursriver);
rivoddscomp1= RiverOdds(comps1river);
rivoddscomp2= RiverOdds(comps2river);
rivoddscomp3= RiverOdds(comps3river);
rivoddscomp4= RiverOdds(comps4river);
todds=TurnOdds(yoursturn);
toddscomp1=TurnOdds(comps1turn);
toddscomp2=TurnOdds(comps2turn);
toddscomp3=TurnOdds(comps3turn);
toddscomp4=TurnOdds(comps4turn);
clc
