function [rodds] = RiverOdds(handeval)

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

handnums = [];


for iv=1:length(handeval)
    handnums = [handnums, handeval(iv).val];
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
    rodds(1)=100;
else
    rodds(1)=39.1;
end

%% Two Pair

if twopair==true
    rodds(2)=100;
elseif pair==true
    rodds(2)=26.1;
else
    rodds(2)=0;
end

%% Three of a Kind

if triple==true
    rodds(3)=100;
elseif length(pairs)==3
    rodds(3)=13;
elseif length(pairs)==2
    rodds(3)=8.7;
elseif length(pairs)==1
    rodds(3)=4.3;
else
    rodds(3)=0;
end

%% Straight

% check for straight
handnums=sort(handnums);
handnums=unique(handnums);

if length(handnums)==6
    %check for 4 consecutive
    if handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
        fourconsecutive=true;
        if handnums(4)==14
            fourwithace=true;
        end
    elseif handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5)
        fourconsecutive=true;
        if handnums(5)==14
            fourwithace=true;
        end
    elseif handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5) && handnums(5)+1==handnums(6)
        fourconsecutive=true;
        if handnums(6)==14
            fourwithace=true;
        end
    elseif handnums(1)==2 && handnums(2)==3 && handnums(6)==14 && handnums(3)==4 %check
        fourconsecutive=true;
        fourwithace=true;
    end
    
    %check for 4 within five with a jump (Card gap 3 Cards)
    if handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
        four1jump=true;
    elseif handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5)
        four1jump=true;
    elseif handnums(3)+2==handnums(4) && handnums(4)+1==handnums(5) && handnums(5)+1==handnums(6)
        four1jump=true;
    elseif handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(6)==14 && handnums(1)==2 %check
        four1jump=true;
    end
    
    if handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
        four1jump=true;
    elseif handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+2==handnums(5)
        four1jump=true;
    elseif handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5) && handnums(5)+2==handnums(6)
        four1jump=true;
    elseif handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(6)==14 && handnums(1)==2 %check
        four1jump=true;
    end
    
    
    %check for 4 within five with 2 jumps
    
    if handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
        four2jumps=true;
    elseif handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+2==handnums(5)
        four2jumps=true;
    elseif handnums(3)+2==handnums(4) && handnums(4)+1==handnums(5) && handnums(5)+2==handnums(6)
        four2jumps=true;
    elseif handnums(1)+2==handnums(2) && handnums(2)+2==handnums(3) && handnums(6)==14 && handnums(1)==2 %check these
        four2jumps=true;
    end
    
elseif length(handnums)==4
    handnums=unique(handnums);
    if length(handnums)==4 && handnums(1)==2 && handnums(2)==3 && handnums(4)==14 && handnums(3)==4 %check
        fourconsecutive=true;
        fourwithace=true;
    end
    
    %check for 4 within five with a jump (Card gap 3 Cards)
    if length(handnums)==4 && handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
        four1jump=true;
    elseif length(handnums)==4 && handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(4)==14 && handnums(1)==2 %check
        four1jump=true;
    end
    
    if length(handnums)==4 && handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4) && length(handnums)==4
        four1jump=true;
    elseif length(handnums)==4 && handnums(1)+1==handnums(2) && handnums(2)+2==handnums(3) && handnums(4)==14 && handnums(1)==2 %check
        four1jump=true;
    end
    
    
    %check for 4 within five with 2 jumps
    
    if length(handnums)==4 && handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
        four2jumps=true;
    end
elseif length(handnums)==5
    handnums=unique(handnums);
    if handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
        fourconsecutive=true;
        if handnums(4)==14
            fourwithace=true;
        end
    elseif handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5)
        fourconsecutive=true;
        if handnums(5)==14
            fourwithace=true;
        end
    end
    
    %check for 4 within five with a jump (Card gap 3 Cards)
    if handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4)
        four1jump=true;
    elseif handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+1==handnums(5)
        four1jump=true;
        
        if handnums(1)+1==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
            four1jump=true;
        elseif handnums(2)+1==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+2==handnums(5)
            four1jump=true;
        end
        
        
        %check for 4 within five with 2 jumps
        
        if handnums(1)+2==handnums(2) && handnums(2)+1==handnums(3) && handnums(3)+2==handnums(4)
            four2jumps=true;
        elseif handnums(2)+2==handnums(3) && handnums(3)+1==handnums(4) && handnums(4)+2==handnums(5)
            four2jumps=true;
        end
    end
end
if straight==true
    rodds(4)=100;
elseif fourconsecutive==true
    rodds(4)=17.4;
elseif fourwithace==true || four1jump==true || four2jumps==true
    rodds(4)=8.7;
else
    rodds(4)=0;
end

%% Flush

handsuitvals=[];

for iv=1:length(handeval)
    handsuitvals=[handsuitvals handeval(iv).suitnum];
end

[arb, modenum]=mode(handsuitvals);

if modenum==5
    flush=true;
elseif modenum==4
    foursuited=true;
end

if flush==true
    rodds(5)=100;
elseif foursuited==true
    rodds(5)=19.6;
else
    rodds(5)=0;
end

%% Full House

if fullhouse==true
    rodds(6)=100;
elseif triple==true && isempty(pairs)==true
    rodds(6)=19.6;
elseif length(pairs)==3
    rodds(6)=13;
elseif length(pairs)==2
    rodds(6)=8.7;
else
    rodds(6)=0;
end

%% 4 of a Kind

if four==true
    rodds(7)=100;
elseif length(triples)==2
    rodds(7)=4.3;
elseif length(triples)==1
    rodds(7)=2.2;
else
    rodds(7)=0;
end

%% Straight Flush

% this dont work

if straight==true && flush==true
    rodds(8)=100;
else
    rodds(8)=rodds(5)*rodds(4)/100;
end



