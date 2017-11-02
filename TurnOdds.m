function [todds]=TurnOdds(hand)

%% Prep to check odds (need handvals for some things)
pair=false;
triple=false;
four=false;
five=false;
flush=false;
straight=false;
fullhouse=false;
twopair=false;
fourconsecutive=false;
four1jump=false;
four2jumps=false;
fourwithace=false;
foursuited=false;
threesuited=false;
five2jumps=false;
fivewithacelow=false;
five3jumps=false;
fivewithacehigh=false;
five4jumps=false;
fourwithacehigh=false;
fourwithacelow=false;
fourconsecutive=false;
four1jump=false;
four2jump=false;
four3jumps=false;
threeconsecutive=false;
threewithacelow=false;
threewithacehigh=false;
threewithtwolow=false;
threewithkinghigh=false;
three2jump=false;

handnums = [];

for iv=1:length(hand)
    handnums = [handnums, hand(iv).val];
end

[V N X] = unique(handnums);
r=histc(X, 1:length(N));

pairs=[];
triples=[];
fours=[];

for iv=1:length(r)
    if r(iv)==2
        pairs=[pairs V(iv)];
    elseif r(iv)==3
        triples=[triples V(iv)];
    elseif r(iv)==4
        fours=[fours V(iv)];
    end
end

if length(triples)==1 && length(pairs)==1
    fullhouse=true;
end
if length(pairs)==2
    twopair=true;
end

if length(triples)==1
    triple=true;
end

[dups, nums]=mode(handnums);

if nums==1
elseif nums==2
    pair=true;
elseif nums==4
    four=true;
elseif nums==5
    five=true;
end

%% Pair
if pair==true
    todds(1)=100;
else
    todds(1)=54.1;
end

%% Two Pair

if twopair==true
    todds(2)=100;
elseif pair==true
    todds(2)=41.49;
else
    todds(2)=.49; % check this
end

%% Three of a Kind

if triple==true
    todds(3)=100;
elseif length(pairs)==2 
    todds(3)=16.47;
elseif length(pairs)==1
    todds(3)=8.91; % check this
else
    todds(3)=2.45; % check this
end

%% Straight
toddsstraight=zeros(1,17);
if pair==false && triple==false
% check for straight
handnums=sort(handnums);

% check 5 with 2 jumps
%      aces
if handnums(1)==2 && handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(5)==14
    five2jumps=true;
    fivewithacelow=true;
    toddsstraight(1)=1.48;
elseif handnums(1)==3 && handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4) && handnums(5)==14
    five2jumps=true;
    toddsstraight(1)=1.48;
    
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+1==handnums(5)
    five2jumps=true;
    if handnums(5)==14
        fivewithacehigh=true;
        toddsstraight(1)=1.48;
    else toddsstraight(1)=2.22;
    end
    
elseif handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+2==handnums(5)
    five2jumps=true;
    if handnums(5)==14
        fivewithacehigh=true;
        toddsstraight(1)=1.48;
    else toddsstraight(1)=2.22;
    end
    
    
    
end
% check 5 with three jumps
%      aces
if   handnums(1)==3 && handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4) && handnums(5)==14
    five3jumps=true;
    fivewithacelow=true;
    toddsstraight(2)=1.48;
elseif   handnums(1)==2 && handnums(1)+3==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(5)==14
    five3jumps=true;
    toddsstraight(2)=2.22;
elseif   handnums(1)==2 && handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+3==handnums(4) && handnums(5)==14
    five3jumps=true;
    fivewithacelow=true;
    toddsstraight(2)=1.48;
elseif   handnums(1)==4 && handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(5)==14
    five3jumps=true;
    toddsstraight(2)=2.22;
elseif   handnums(1)==3 && handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(5)==14
    five3jumps=true;
    toddsstraight(2)=2.22;
elseif   handnums(1)==3 && handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4) && handnums(5)==14
    five3jumps=true;
    toddsstraight(2)=2.22;
elseif   handnums(1)==2 && handnums(1)+2==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+1==handnums(4) && handnums(5)==14
    five3jumps=true;
    fivewithacelow=true;
    toddsstraight(2)=1.48;
elseif   handnums(1)==4 && handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4) && handnums(5)==14
    five3jumps=true;
elseif   handnums(1)==2 && handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+3==handnums(4) && handnums(5)==14
    five3jumps=true;
    fivewithacelow=true;
    toddsstraight(2)=1.48;
elseif   handnums(1)==2 && handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4) && handnums(5)==14
    five3jumps=true;
    fivewithacelow=true;
    toddsstraight(2)=1.48;
    
elseif handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+2==handnums(5)
    five3jumps=true;
    toddsstraight(2)=2.22;
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+2==handnums(5)
    five3jumps=true;
    if handnums(5)==14
        fivewithacehigh=true;
        toddsstraight(2)=1.48;
    else toddsstraight(2)=2.22;
    end
elseif handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+1==handnums(5)
    five3jumps=true;
    if handnums(5)==14
        fivewithacehigh=true;
        toddsstraight(2)=1.48;
    else toddsstraight(2)=2.22;
    end
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+3==handnums(4) && handnums(4)+1==handnums(5)
    five3jumps=true;
    toddsstraight(2)=2.22;
elseif handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+3==handnums(5)
    five3jumps=true;
    toddsstraight(2)=16.47;
elseif handnums(1)+3==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5)
    five3jumps=true;
    toddsstraight(2)=16.47;
elseif handnums(1)+3==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+1==handnums(5)
    five3jumps=true;
    toddsstraight(2)=17.21;
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+3==handnums(5)
    five3jumps=true;
    toddsstraight(2)=2.22;
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+1==handnums(5)
    five3jumps=true;
    if handnums(5)==14
        fivewithacehigh=true;
        toddsstraight(2)=1.48;
    else toddsstraight(2)=2.22;
    end
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+2==handnums(5)
    five3jumps=true;
    toddsstraight(2)=2.22;
end
% check 5 with four jumps
%      aces
if handnums(1)==2 && handnums(5)==14 && handnums(1)+3==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+1==handnums(4)
    five4jumps=true;
    toddsstraight(3)=1.48;
elseif handnums(1)==4 && handnums(5)==14 && handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+1==handnums(4)
    five4jumps=true;
    toddsstraight(3)=1.48;
elseif handnums(1)==3 && handnums(5)==14 && handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4)
    five4jumps=true;
    toddsstraight(3)=2.22;
elseif handnums(1)==4 && handnums(5)==14 && handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4)
    five4jumps=true;
    toddsstraight(3)=2.22;
elseif handnums(1)==2 && handnums(5)==14 && handnums(1)+3==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+3==handnums(4)
    five4jumps=true;
    toddsstraight(3)=1.48;
elseif handnums(1)==3 && handnums(5)==14 && handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+3==handnums(4)
    five4jumps=true;
    toddsstraight(3)=2.22;
    
elseif handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+3==handnums(4) && handnums(4)+1==handnums(5)
    five4jumps=true;
    toddsstraight(3)=1.48;
elseif handnums(1)+3==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+3==handnums(4) && handnums(4)+1==handnums(5)
    five4jumps=true;
    toddsstraight(3)=1.48;
elseif handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+3==handnums(5)
    five4jumps=true;
    toddsstraight(3)=2.22;
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+2==handnums(5)
    five4jumps=true;
    toddsstraight(3)=2.22;
elseif handnums(1)+3==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+2==handnums(5)
    five4jumps=true;
    toddsstraight(3)=1.48;
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+3==handnums(5)
    five4jumps=true;
    toddsstraight(3)=2.22;
end

%check for 4 consecutive
%     aces
if handnums(5)==14 && handnums(1)==2 && handnums(2)==handnums(1)+1 && handnums(2)+1==handnums(3)
    fourconsecutive=true;
    fourwithacelow=true;
    toddsstraight(4)=16.47;
    
elseif handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
    fourconsecutive=true;
    toddsstraight(4)=31.45;
elseif handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5)
    fourconsecutive=true;
    if handnums(5)==14
        fourwithacehigh=true;
        toddsstraight(4)=16.47;
    else toddsstraight(4)=31.45;
    end
end
%check for 4 within five with a jump
% aces
if handnums(5)==14 && handnums(1)==3 && handnums(2)==handnums(1)+1 && handnums(2)+1==handnums(3)
    four1jump=true;
    toddsstraight(5)=16.47;
elseif handnums(5)==14 && handnums(1)==2 && handnums(2)==handnums(1)+2 && handnums(2)+1==handnums(3)
    four1jump=true;
    toddsstraight(5)=16.47;
elseif handnums(5)==14 && handnums(1)==2 && handnums(2)==handnums(1)+1 && handnums(2)+2==handnums(3)
    four1jump=true;
    fourwithacelow=true;16.47;
    
elseif handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
    four1jump=true;
    toddsstraight(5)=17.21;
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4)
    four1jump=true;
    toddsstraight(5)=16.47;
elseif handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
    four1jump=true;
    toddsstraight(5)=17.21;
elseif handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5)
    four1jump=true;
    if handnums(5)==14
        fourwithacehigh=true;
        toddsstraight(5)=16.47;
    else toddsstraight(5)=17.21;
    end
elseif handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+1==handnums(5)
    four1jump=true;
    todda=16.47;
elseif handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+2==handnums(5)
    four1jump=true;
    toddsstraight(5)=17.21;
    
    
end
%check for 4 within five with 2 jumps
% aces
if handnums(5)==14 && handnums(1)==4 && handnums(2)==handnums(1)+1 && handnums(2)+1==handnums(3)
    four2jumps=true;
    toddsstraight(6)=1.48;
elseif handnums(5)==14 && handnums(1)==2 && handnums(2)==handnums(1)+3 && handnums(2)+1==handnums(3)
    four2jumps=true;
    toddsstraight(6)=1.48;
elseif handnums(5)==14 && handnums(1)==2 && handnums(2)==handnums(1)+1 && handnums(2)+3==handnums(3)
    four2jumps=true;
    fourwithacelow=true;
    toddsstraight(6)=.74;
elseif handnums(5)==14 && handnums(1)==3 && handnums(2)==handnums(1)+2 && handnums(2)+1==handnums(3)
    four2jumps=true;
    toddsstraight(6)=1.48;
elseif handnums(5)==14 && handnums(1)==3 && handnums(2)==handnums(1)+1 && handnums(2)+2==handnums(3)
    four2jumps=true;
    fourwithacelow=true;
    toddsstraight(6)=.74;
elseif handnums(5)==14 && handnums(1)==2 && handnums(2)==handnums(1)+2 && handnums(2)+2==handnums(3)
    four2jumps=true;
    toddsstraight(6)=1.48;
    
elseif handnums(1)+3==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
    four2jumps=true;
    toddsstraight(6)=2.22;
elseif handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+1==handnums(4)
    four2jumps=true;
    toddsstraight(6)=.74;
elseif handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+3==handnums(4)
    four2jumps=true;
    toddsstraight(6)=2.22;
elseif handnums(2)+3==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5)
    four2jumps=true;
    if handnums(5)==14
        fourwithacehigh=true;
        toddsstraight(6)=.74;
    else toddsstraight(6)=2.22;
    end
elseif handnums(2)+1==handnums(3) && handnums(3)+3==handnums(4) && handnums(4)+1==handnums(5)
    four2jumps=true;
    toddsstraight(6)=1.48;
elseif handnums(2)+1==handnums(3) && handnums(3)+3==handnums(4) && handnums(4)+1==handnums(5)
    four2jumps=true;
    toddsstraight(6)=1.48;
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4)
    four2jumps=true;
    toddsstraight(6)=2.22;
elseif handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
    four2jumps=true;
    toddsstraight(6)=1.48;
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4)
    four2jumps=true;
    toddsstraight(6)=1.48;
elseif handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+1==handnums(5)
    four2jumps=true;
    if handnums(5)==14
        fourwithacehigh=true;
        toddsstraight(6)=.74;
    else toddsstraight(6)=1.48;
    end
elseif handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+2==handnums(5)
    four2jumps=true;
    if handnums(5)==14
        fourwithacehigh=true;
        toddsstraight(6)=1.48;
    else toddsstraight(6)=2.22;
    end
elseif handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+2==handnums(5)
    four2jumps=true;
    toddsstraight(6)=1.48;
    
end
% check for 4 within 5 with 3 jumps
% aces
if handnums(5)==14 && handnums(2)==3 && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4)
    four3jumps=true;
    toddsstraight(7)=1.48;
    
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4)
    four3jumps=true;
    toddsstraight(7)=1.48;
elseif handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4) && handnums(4)+2==handnums(5)
    four3jumps=true;
    toddsstraight(7)=1.48;
    
    
end
% check for 3 consecutive
%  aces
if handnums(5)==14 && handnums(1)==2 && handnums(2)+1==handnums(3)
    threeconsecutive=true;
    threewithacelow=true;
    toddsstraight(8)=.74;
elseif handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3)
    threeconsecutive=true;
    if handnums(1)==2
        threewithtwolow=true;
        toddsstraight(8)=1.48;
    end
elseif handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
    threeconsecutive=true;
    toddsstraight(8)=2.22;
elseif handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5)
    threeconsecutive=true;
    if handnums(5)==14
        threewithacehigh=true;
        toddsstraight(8)=.74;
    elseif handnums(5)==13
        threewithkinghigh=true;
        toddsstraight(8)=1.48;
    else toddsstraight(8)=2.22;
    end
    
    
end
% check for 3 in five with 2 jumps
%  aces
if handnums(5)==14 && handnums(1)==4 && handnums(1)+1==handnums(2)
    three2jump=true;
    toddsstraight(9)=.74;
elseif handnums(5)==14 && handnums(1)==3 && handnums(1)+2==handnums(2)
    three2jump=true;
    toddsstraight(9)=.74;
    
elseif handnums(1)+3==handnums(2) && handnums(2)+1==handnums(3)
    three2jump=true;
    toddsstraight(9)=.74;
elseif handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3)
    three2jump=true;
    toddsstraight(9)=.74;
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3)
    three2jump=true;
    toddsstraight(9)=.74;
elseif handnums(2)+3==handnums(3) && handnums(3)+1==handnums(4)
    three2jump=true;
    toddsstraight(9)=.74;
elseif handnums(2)+1==handnums(3) && handnums(3)+3==handnums(4)
    three2jump=true;
    toddsstraight(9)=.74;
elseif handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4)
    three2jump=true;
    toddsstraight(9)=.74;
elseif handnums(3)+3==handnums(4) && handnums(4)+1==handnums(5)
    three2jump=true;
    toddsstraight(9)=.74;
elseif handnums(3)+1==handnums(4) && handnums(4)+3==handnums(5)
    three2jump=true;
    toddsstraight(9)=.74;
elseif handnums(3)+2==handnums(4) && handnums(4)+2==handnums(5)
    three2jump=true;
    toddsstraight(9)=.74;
    
end

% check for 3 in five with one jump
if handnums(5)==14 && handnums(1)==2 && handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3)
    toddsstraight(10)=.74;
elseif handnums(5)==14 && handnums(1)==1 && handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3)
    toddsstraight(10)=.74;
    
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3)
    toddsstraight(10)=1.48;
elseif handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3)
    toddsstraight(10)=1.48;
elseif handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
    toddsstraight(10)=1.48;
elseif handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4)
    toddsstraight(10)=1.48;
elseif handnums(3)+1==handnums(4) && handnums(4)+2==handnums(5)
    if handnums(5)==14
        toddsstraight(10)=.74;
    else toddsstraight(10)=1.48;
    end
elseif handnums(3)+2==handnums(4) && handnums(4)+1==handnums(5)
    if handnums(5)==14
        toddsstraight(10)=.74;
    else toddsstraight(10)=1.48;
    end
   
else todds(4)=0;
    
end


if straight==true
    todds(4)=100;
end
elseif (triple==true || twopair~=true) && pair~=true 
    handnums=sort(handnums);
    handnums=unique(handnums);
    
    % check for 3 consecutive
%  aces
if handnums(3)==14 && handnums(1)==2 && handnums(2)+1==handnums(3)
    threeconsecutive=true;
    threewithacelow=true;
    toddsstraight(11)=.74;
elseif handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3)
    threeconsecutive=true;
    if handnums(1)==2
        threewithtwolow=true;
        toddsstraight(11)=1.48;
    end

    
    
end
% check for 3 in five with 2 jumps
%  aces
if handnums(3)==14 && handnums(1)==4 && handnums(1)+1==handnums(2)
    three2jump=true;
    toddsstraight(12)=.74;
elseif handnums(3)==14 && handnums(1)==3 && handnums(1)+2==handnums(2)
    three2jump=true;
    toddsstraight(12)=.74;
    
elseif handnums(1)+3==handnums(2) && handnums(2)+1==handnums(3)
    three2jump=true;
    toddsstraight(12)=.74;
elseif handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3)
    three2jump=true;
    toddsstraight(12)=.74;
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3)
    three2jump=true;
    toddsstraight(12)=.74;
    
end

% check for 3 in five with one jump
if handnums(3)==14 && handnums(1)==2 && handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3)
    toddsstraight(13)=.74;
elseif handnums(3)==14 && handnums(1)==1 && handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3)
    toddsstraight(13)=.74;
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3)
    toddsstraight(13)=1.48;
elseif handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3)
    toddsstraight(13)=1.48;
else toddsstraight(13)=0;
    
end
    
elseif pair==true && triple~=true && twopair~=true
    handnums=sort(handnums);
    handnums=unique(handnums);
    
    %check for 4 consecutive
%     aces
if handnums(3)==14 && handnums(1)==2 && handnums(2)==handnums(1)+1 && handnums(2)+1==handnums(3)
    fourconsecutive=true;
    fourwithacelow=true;
    toddsstraight(14)=16.47;
    
elseif handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
    fourconsecutive=true;
    toddsstraight(14)=31.45;
end
%check for 4 within five with a jump
% aces
if handnums(4)==14 && handnums(1)==3 && handnums(2)==handnums(1)+1 && handnums(2)+1==handnums(3)
    four1jump=true;
    toddsstraight(15)=16.47;
elseif handnums(4)==14 && handnums(1)==2 && handnums(2)==handnums(1)+2 && handnums(2)+1==handnums(3)
    four1jump=true;
    toddsstraight(15)=16.47;
elseif handnums(4)==14 && handnums(1)==2 && handnums(2)==handnums(1)+1 && handnums(2)+2==handnums(3)
    four1jump=true;
    fourwithacelow=true;16.47;
    
elseif handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
    four1jump=true;
    toddsstraight(15)=17.21;
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4)
    four1jump=true;
    toddsstraight(15)=16.47;
elseif handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
    four1jump=true;
    toddsstraight(15)=17.21;
end
%check for 4 within five with 2 jumps
% aces
if handnums(4)==14 && handnums(1)==4 && handnums(2)==handnums(1)+1 && handnums(2)+1==handnums(3)
    four2jumps=true;
    toddsstraight(16)=1.48;
elseif handnums(4)==14 && handnums(1)==2 && handnums(2)==handnums(1)+3 && handnums(2)+1==handnums(3)
    four2jumps=true;
    toddsstraight(16)=1.48;
elseif handnums(4)==14 && handnums(1)==2 && handnums(2)==handnums(1)+1 && handnums(2)+3==handnums(3)
    four2jumps=true;
    fourwithacelow=true;
    toddsstraight(16)=.74;
elseif handnums(4)==14 && handnums(1)==3 && handnums(2)==handnums(1)+2 && handnums(2)+1==handnums(3)
    four2jumps=true;
    toddsstraight(16)=1.48;
elseif handnums(4)==14 && handnums(1)==3 && handnums(2)==handnums(1)+1 && handnums(2)+2==handnums(3)
    four2jumps=true;
    fourwithacelow=true;
    toddsstraight(16)=.74;
elseif handnums(4)==14 && handnums(1)==2 && handnums(2)==handnums(1)+2 && handnums(2)+2==handnums(3)
    four2jumps=true;
    toddsstraight(16)=1.48;
    
elseif handnums(1)+3==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
    four2jumps=true;
    toddsstraight(16)=2.22;
elseif handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+1==handnums(4)
    four2jumps=true;
    toddsstraight(16)=.74;
elseif handnums(1)+1==handnums(2) && handnums(2)+3==handnums(3) && handnums(3)+3==handnums(4)
    four2jumps=true;
    toddsstraight(16)=2.22;
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4)
    four2jumps=true;
    toddsstraight(16)=2.22;
elseif handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
    four2jumps=true;
    toddsstraight(16)=1.48;
elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4)
    four2jumps=true;
    toddsstraight(16)=1.48;   
end
% check for 4 within 5 with 3 jumps
% aces
if handnums(4)==14 && handnums(1)==3 && handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3)
    four3jumps=true;
    toddsstraight(17)=1.48;
    
elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(3)+2==handnums(4)
    four3jumps=true;
    toddsstraight(17)=1.48; 
end
   
end

todds(4)=max(toddsstraight);
%% Flush

handsuitvals=[];

for iv=1:length(hand)
    handsuitvals=[handsuitvals hand(iv).suitnum];
end

[arb, modenum]=mode(handsuitvals);

if modenum==5
    flush=true;
elseif modenum==4
    foursuited=true;
elseif modenum==3
    threesuited=true;
end

if flush==true
    todds(5)=100;
elseif foursuited==true
    todds(5)=35;
elseif threesuited==true
    todds(5)=4.16;
else
    todds(5)=0;
end

%% Full House

if fullhouse==true
    todds(6)=100;
elseif triple==true && isempty(pairs)==true
    todds(6)=30.66; % check this
elseif length(pairs)==2
    todds(6)=16.47; % do this
elseif length(pairs)==1
    todds(6)=2.35; % check this
else
    todds(6)=0;
end

%% 4 of a Kind

if four==true
    todds(7)=100;
elseif length(triples)==1% do this
    todds(7)=4.3;
elseif length(triples)==1 && length(pairs)==1% do this
    todds(7)=4.39;
elseif length(pairs)==1
    todds(7)=.095;
elseif length(pairs)==2% do this
    todds(7)=.189;
else
    todds(7)=0;
end

%% Straight Flush

if straight==true && flush==true
    todds(8)=100;
else todds(8)=todds(4)*todds(5)/100;
end