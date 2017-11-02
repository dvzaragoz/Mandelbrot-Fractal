


a=CardDeck;
hand=[];
handsuitvals=[];
pair=false;
triple=false;
four=false;
five=false;
flush=false;
straight=false;
fullhouse=false;
twopair=false;

for N=1:7
    x=randi([1 length(a)]);
    hand=[hand, a(x)];
    a(x)=[];
end

%% Display Hand
for iv=1:length(hand)
    disp(hand(iv).str)
end
disp('--------------------------------')


%% Check for duplicates

duplicates=1;

handvals=[];

for iv=1:length(hand)
    handvals=[handvals hand(iv).val];
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
while x~=length(hand)
    for iv=x:length(hand)-1
        if handvals(iv)==handvals(iv+1)
            duplicates=duplicates+1;
            if duplicates==2
                pairs=[pairs handvals(iv)];
            elseif duplicates==3
                triples=[triples handvals(iv)];
            elseif duplicates==4
                fours=[fours handvals(iv)];
            elseif duplicates==5
                fives=[fives handvals(iv)];
            end
        end
    end
    x=x+1;
    duplicates=0;
end
pairs=unique(pairs);
triples=unique(triples);
fours=unique(fours);
fives=unique(fives);

disp(pairs)
disp(triples)
disp(fours)
disp(fives)

if length(triples)==1 && length(pairs)==2 
    fullhouse=true;
end
if length(pairs)==2 && length(triples)==0
    twopair=true;
end

    

%% Check for Flush
for i=1:length(hand)
    handsuitvals=[handsuitvals hand(i).suitnum];
end
[arb, modenum]=mode(handsuitvals);
if modenum==5
    flush=true;
    %variable for hand value flush
end


%% Check for straight

handvals=sort(handvals);
if handvals(1)+1==handvals(2) && handvals(2)+1==handvals(3) && handvals(3)+1==handvals(4) && handvals(4)+1==handvals(5)
    straight=true;
elseif handvals(3)+1==handvals(4) && handvals(4)+1==handvals(5) && handvals(5)+1==handvals(6) && handvals(6)+1==handvals(7)
    straight=true;
end

%% Display your hand

handval=0;

if five==1
    handval=9;
elseif  flush==1 &&  straight==1
    handval=8;
elseif four==1
    handval=7;
elseif fullhouse==1
    handval=6;
elseif flush==1
    handval=5;
elseif straight==1
    handval=4;
elseif triple==1
    handval=3;
elseif twopair==1
    handval=2;
elseif pair==1
    handval=1;
end

valstrings={'Pair', 'Two Pair', 'Three of a Kind', 'Straight', 'Flush', 'Fullhouse', 'Four of a Kind', 'Royal Flush', 'Five of a Kind'};

if handval>0
    disp(valstrings(handval))
elseif handval==0
    disp('nothing')
end
disp('-------------')
