function [handval, secondhandval, handstring] = Handval(yourhand)

handsuitvals=[];
pair=false;
triple=false;
four=false;
five=false;
flush=false;
straight=false;
fullhouse=false;
twopair=false;


%% Check for duplicates

handvals=[];

for iv=1:length(yourhand)
    handvals=[handvals yourhand(iv).val];
end

[dups, nums]=mode(handvals);

if nums==1
    %disp('No pairs')
elseif nums==2
    %disp(['Pairs of ', num2str(dups)])
    pair=true;
elseif nums==3
    %disp(['Three of a kind: ', num2str(dups)])
    triple=true;
elseif nums==4
    %disp(['Four of a kind: ', num2str(dups)])
    four=true;
elseif nums==5
    five=true;
end

x=1;
pairs=[];
triples=[];
fours=[];
fives=[];
handvals=sort(handvals);

[V N X]=unique(handvals);
r=histc(X, 1:length(N));

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

%% Check for Flush
for i=1:length(yourhand)
    handsuitvals=[handsuitvals yourhand(i).suitnum];
end
[arb, modenum]=mode(handsuitvals);
if modenum==5
    flush=true;
    %variable for hand value flush
end


%% Check for straight

handvals=sort(handvals);
if handvals(3)+1==handvals(4) && handvals(4)+1==handvals(5) && handvals(5)+1==handvals(6) && handvals(6)+1==handvals(7)
    straight=true;
    straightslow=handvals(3);
elseif handvals(1)+1==handvals(2) && handvals(2)+1==handvals(3) && handvals(3)+1==handvals(4) && handvals(4)+1==handvals(5)
    straight=true;
    straightslow=handvals(1);
elseif handvals(1)+1==handvals(2) && handvals(2)+1==handvals(3) && handvals(3)+1==handvals(4) && handvals(7)==14
    straight=true;
    straightslow=handvals(1)-1;
end

%% Display your hand

handval=0;
secondhandval=[0 0 0 0 0];

if five==1
    handval=9;
    secondhandval(1)=fives(1);
elseif  flush==1 &&  straight==1
    handval=8;
    secondhandval(1)=straightslow(1);
elseif four==1
    handval=7;
    secondhandval(1)=fours(1);
    secondhandval(2)=handvals(length(handvals));
elseif fullhouse==1
    handval=6;
    secondhandval(1)=triples(length(triples));
    secondhandval(2)=pairs(length(pairs));
elseif flush==1
    handval=5;
    %need secondhandval
elseif straight==1
    handval=4;
    secondhandval(1)=straightslow(1);
elseif triple==1
    handval=3;
    secondhandval(1)=triples(length(triples));
    secondhandval(2)=handvals(length(handvals));
    secondhandval(3)=handvals(length(handvals)-1);
    secondhandval(4)=handvals(length(handvals)-2);
    secondhandval(5)=handvals(length(handvals)-3); % this might be missing a value
elseif twopair==1
    handval=2;
    secondhandval(1)=pairs(length(pairs));
    secondhandval(2)=pairs(length(pairs)-1);
    secondhandval(3)=handvals(length(handvals));
    secondhandval(4)=handvals(length(handvals)-2);
    secondhandval(5)=handvals(length(handvals)-4);
elseif pair==1
    handval=1;
    secondhandval(1)=pairs(length(pairs));
    secondhandval(2)=handvals(length(handvals));
    secondhandval(3)=handvals(length(handvals)-1);
    secondhandval(4)=handvals(length(handvals)-2);
    secondhandval(5)=handvals(length(handvals)-3);
elseif handval==0
    secondhandval(1)=handvals(length(handvals));
    secondhandval(2)=handvals(length(handvals)-1);
    secondhandval(3)=handvals(length(handvals)-2);
    secondhandval(4)=handvals(length(handvals)-3);
    secondhandval(5)=handvals(length(handvals)-4);
end

valstrings={'One Pair', 'Two Pair', 'Three of a Kind', 'Straight', 'Flush', 'Fullhouse', 'Four of a Kind', 'Royal Flush', 'Five of a Kind'};
x=(handvals(length(handvals)));
if x>10
    if x==11
        z='Jack';
    elseif x==12
        z='Queen';
    elseif x==13
        z='King';
    elseif x==14
        z='Ace';
    else
        z=num2str(x);
    end
end

if handval>0
    handstring=valstrings(handval);
elseif handval==0
    handstring=['High Card:' z];
end
