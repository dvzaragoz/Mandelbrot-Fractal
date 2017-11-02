
numcomps=4;
deal=Hand(7+2*numcomps);
mid=deal(1:5);


%% Display Mid

% disp('Middle')
% for iv=1:5
%     disp(deal(iv).str)
% end
% 
% disp('--------------------------------')

%% Your hand

% disp('Your hand')
% 
% for iv=6:7
%     disp(deal(iv).str)
% end
% 
% disp('--------------------------------')

yours=[mid deal(6:7)];
[yourval yourval2 yourstring]=Handval(yours);
% disp(yourstring)

%% Computer 1s hand

% disp('Computer 1s hand')
% for iv=8:9
%     disp(deal(iv).str)
% end
comps1=[mid deal(8:9)];
[compval compval2 compstring]=Handval(comps1);
% disp(compstring)

%% Computer 2s hand
% 
% disp('Computer 2s hand')
% for iv=10:11
%     disp(deal(iv).str)
% end
comps2=[mid deal(10:11)];
[comp2val comp2val2 comp2string]=Handval(comps2);
% disp(comp2string)

%% Computer 3s hand
% 
% disp('Computer 3s hand')
% for iv=12:13
%     disp(deal(iv).str)
% end
comps3=[mid deal(12:13)];
[comp3val comp3val2 comp3string]=Handval(comps3);
% disp(comp3string)

%% Computer 4s hand
% 
% disp('Computer 4s hand')
% for iv=14:15
%     disp(deal(iv).str)
% end
comps4=[mid deal(14:15)];
[comp4val comp4val2 comp4string]=Handval(comps4);
% disp(comp4string)

%% Display winner
% disp('--------------------------------')

vals=[yourval compval comp2val comp3val comp4val];
vals2=[yourval2 compval2 comp2val2 comp3val2 comp4val2];
valsort=sort(vals);

v=[yourval compval comp2val comp3val comp4val];
v2=[yourval2(1) compval2(1) comp2val2(1) comp3val2(1) comp4val2(1)];
v3=[yourval2(2) compval2(2) comp2val2(2) comp3val2(2) comp4val2(2)];
v4=[yourval2(3) compval2(3) comp2val2(3) comp3val2(3) comp4val2(3)];
v5=[yourval2(4) compval2(4) comp2val2(4) comp3val2(4) comp4val2(4)];
v6=[yourval2(5) compval2(5) comp2val2(5) comp3val2(5) comp4val2(5)];
vsort=sort(v);
r=[max(v2) max(v3) max(v4) max(v5) max(v6)];

yourvalue=0;
compvalue=0;
comp2value=0;
comp3value=0;
comp4value=0;

if yourval==max(v)
    yourvalue=1000000;
end
if compval==max(v)
    compvalue=1000000;
end
if comp2val==max(v)
    comp2value=1000000;
end
if comp3val==max(v)
    comp3val=1000000;
end
if comp4val==max(v)
    comp4val=1000000;
end

x=100000;
for iv=1:5
    if yourval2(iv)==r(iv)
        yourvalue=yourvalue+x;
    end
    x=x/10;
end
x=100000;

for iv=1:5
    if compval2(iv)==r(iv)
        compvalue=compvalue+x;
    end
    x=x/10;
end
x=100000;

for iv=1:5
    if comp2val2(iv)==r(iv)
        comp2value=comp2value+x;
    end
    x=x/10;
end
x=100000;
for iv=1:5
    if comp3val2(iv)==r(iv)
        comp3value=comp3value+x;
    end
    x=x/10;
end
x=100000;
for iv=1:5
    if comp4val2(iv)==r(iv)
        comp4value=comp4value+x;
    end
    x=x/10;
end

z=[yourvalue compvalue comp2value comp3value comp4value];
z2=sort(z);

if z2(length(z2)-1)==max(z)
    if yourvalue==max(z)
        winner='You tied';
    end
    if compvalue==max(z)
        winner='Computer 1 tied';
    end
    if comp2value==max(z)
        winner='Computer 2 tied';
    end
    if comp3value==max(z)
        winner='Computer 3 tied';
    end
    if comp4value==max(z)
        winner='Computer 4 tied';
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


