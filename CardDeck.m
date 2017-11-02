function [deck] = CardDeck

%% Clubs

aceclubs.val=14;
aceclubs.suit='Clubs';
aceclubs.str='Ace of Clubs';
twoclubs.val=2;
twoclubs.suit='Clubs';
twoclubs.str='Two of Clubs';
threeclubs.val=3;
threeclubs.suit='Clubs';
threeclubs.str='Three of Clubs';
fourclubs.val=4;
fourclubs.suit='Clubs';
fourclubs.str='Four of Clubs';
fiveclubs.val=5;
fiveclubs.suit='Clubs';
fiveclubs.str='Five of Clubs';
sixclubs.val=6;
sixclubs.suit='Clubs';
sixclubs.str='Six of Clubs';
sevenclubs.val=7;
sevenclubs.suit='Clubs';
sevenclubs.str='Seven of Clubs';
eightclubs.val=8;
eightclubs.suit='Clubs';
eightclubs.str='Eight of Clubs';
nineclubs.val=9;
nineclubs.suit='Clubs';
nineclubs.str='Nine of Clubs';
tenclubs.val=10;
tenclubs.suit='Clubs';
tenclubs.str='Ten of Clubs';
jackclubs.val=11;
jackclubs.suit='Clubs';
jackclubs.str='Jack of Clubs';
queenclubs.val=12;
queenclubs.suit='Clubs';
queenclubs.str='Queen of Clubs';
kingclubs.val=13;
kingclubs.suit='Clubs';
kingclubs.str='King of Clubs';

aceclubs.pic='Cards/c1.jpg';
twoclubs.pic='Cards/c2.jpg';
threeclubs.pic='Cards/c3.jpg';
fourclubs.pic='Cards/c4.jpg';
fiveclubs.pic='Cards/c5.jpg';
sixclubs.pic='Cards/c6.jpg';
sevenclubs.pic='Cards/c7.jpg';
eightclubs.pic='Cards/c8.jpg';
nineclubs.pic='Cards/c9.jpg';
tenclubs.pic='Cards/c10.jpg';
jackclubs.pic='Cards/cj.jpg';
queenclubs.pic='Cards/cq.jpg';
kingclubs.pic='Cards/ck.jpg';



%% Spades

acespades.val=14;
acespades.suit='Spades';
twospades.val=2;
twospades.suit='Spades';
threespades.val=3;
threespades.suit='Spades';
fourspades.val=4;
fourspades.suit='Spades';
fivespades.val=5;
fivespades.suit='Spades';
sixspades.val=6;
sixspades.suit='Spades';
sevenspades.val=7;
sevenspades.suit='Spades';
eightspades.val=8;
eightspades.suit='Spades';
ninespades.val=9;
ninespades.suit='Spades';
tenspades.val=10;
tenspades.suit='Spades';
jackspades.val=11;
jackspades.suit='Spades';
queenspades.val=12;
queenspades.suit='Spades';
kingspades.val=13;
kingspades.suit='Spades';

acespades.str='Ace of Spades';
twospades.str='Two of Spades';
threespades.str='Three of Spades';
fourspades.str='Four of Spades';
fivespades.str='Five of Spades';
sixspades.str='Six of Spades';
sevenspades.str='Seven of Spades';
eightspades.str='Eight of Spades';
ninespades.str='Nine of Spades';
tenspades.str='Ten of Spades';
jackspades.str='Jack of Spades';
queenspades.str='Queen of Spades';
kingspades.str='King of Spades';

acespades.pic='Cards/s1.jpg';
twospades.pic='Cards/s2.jpg';
threespades.pic='Cards/s3.jpg';
fourspades.pic='Cards/s4.jpg';
fivespades.pic='Cards/s5.jpg';
sixspades.pic='Cards/s6.jpg';
sevenspades.pic='Cards/s7.jpg';
eightspades.pic='Cards/s8.jpg';
ninespades.pic='Cards/s9.jpg';
tenspades.pic='Cards/s10.jpg';
jackspades.pic='Cards/sj.jpg';
queenspades.pic='Cards/sq.jpg';
kingspades.pic='Cards/sk.jpg';

%% Hearts

acehearts.val=14;
acehearts.suit='Hearts';
twohearts.val=2;
twohearts.suit='Hearts';
threehearts.val=3;
threehearts.suit='Hearts';
fourhearts.val=4;
fourhearts.suit='Hearts';
fivehearts.val=5;
fivehearts.suit='Hearts';
sixhearts.val=6;
sixhearts.suit='Hearts';
sevenhearts.val=7;
sevenhearts.suit='Hearts';
eighthearts.val=8;
eighthearts.suit='Hearts';
ninehearts.val=9;
ninehearts.suit='Hearts';
tenhearts.val=10;
tenhearts.suit='Hearts';
jackhearts.val=11;
jackhearts.suit='Hearts';
queenhearts.val=12;
queenhearts.suit='Hearts';
kinghearts.val=13;
kinghearts.suit='Hearts';

acehearts.str='Ace of Hearts';
twohearts.str='Two of Hearts';
threehearts.str='Three of Hearts';
fourhearts.str='Four of Hearts';
fivehearts.str='Five of Hearts';
sixhearts.str='Six of Hearts';
sevenhearts.str='Seven of Hearts';
eighthearts.str='Eight of Hearts';
ninehearts.str='Nine of Hearts';
tenhearts.str='Ten of Hearts';
jackhearts.str='Jack of Hearts';
queenhearts.str='Queen of Hearts';
kinghearts.str='King of Hearts';

acehearts.pic='Cards/h1.jpg';
twohearts.pic='Cards/h2.jpg';
threehearts.pic='Cards/h3.jpg';
fourhearts.pic='Cards/h4.jpg';
fivehearts.pic='Cards/h5.jpg';
sixhearts.pic='Cards/h6.jpg';
sevenhearts.pic='Cards/h7.jpg';
eighthearts.pic='Cards/h8.jpg';
ninehearts.pic='Cards/h9.jpg';
tenhearts.pic='Cards/h10.jpg';
jackhearts.pic='Cards/hj.jpg';
queenhearts.pic='Cards/hq.jpg';
kinghearts.pic='Cards/hk.jpg';

%% Diamonds

acediamonds.val=14;
acediamonds.suit='Diamonds';
twodiamonds.val=2;
twodiamonds.suit='Diamonds';
threediamonds.val=3;
threediamonds.suit='Diamonds';
fourdiamonds.val=4;
fourdiamonds.suit='Diamonds';
fivediamonds.val=5;
fivediamonds.suit='Diamonds';
sixdiamonds.val=6;
sixdiamonds.suit='Diamonds';
sevendiamonds.val=7;
sevendiamonds.suit='Diamonds';
eightdiamonds.val=8;
eightdiamonds.suit='Diamonds';
ninediamonds.val=9;
ninediamonds.suit='Diamonds';
tendiamonds.val=10;
tendiamonds.suit='Diamonds';
jackdiamonds.val=11;
jackdiamonds.suit='Diamonds';
queendiamonds.val=12;
queendiamonds.suit='Diamonds';
kingdiamonds.val=13;
kingdiamonds.suit='Diamonds';

acediamonds.str='Ace of Diamonds';
twodiamonds.str='Two of Diamonds';
threediamonds.str='Three of Diamonds';
fourdiamonds.str='Four of Diamonds';
fivediamonds.str='Five of Diamonds';
sixdiamonds.str='Six of Diamonds';
sevendiamonds.str='Seven of Diamonds';
eightdiamonds.str='Eight of Diamonds';
ninediamonds.str='Nine of Diamonds';
tendiamonds.str='Ten of Diamonds';
jackdiamonds.str='Jack of Diamonds';
queendiamonds.str='Queen of Diamonds';
kingdiamonds.str='King of Diamonds';

acediamonds.pic='Cards/d1.jpg';
twodiamonds.pic='Cards/d2.jpg';
threediamonds.pic='Cards/d3.jpg';
fourdiamonds.pic='Cards/d4.jpg';
fivediamonds.pic='Cards/d5.jpg';
sixdiamonds.pic='Cards/d6.jpg';
sevendiamonds.pic='Cards/d7.jpg';
eightdiamonds.pic='Cards/d8.jpg';
ninediamonds.pic='Cards/d9.jpg';
tendiamonds.pic='Cards/d10.jpg';
jackdiamonds.pic='Cards/dj.jpg';
queendiamonds.pic='Cards/dq.jpg';
kingdiamonds.pic='Cards/dk.jpg';

%% Deck 

deck=[aceclubs, twoclubs, threeclubs, fourclubs, fiveclubs, sixclubs, sevenclubs, eightclubs, nineclubs, tenclubs, jackclubs, queenclubs, kingclubs, ...
    acespades, twospades, threespades, fourspades, fivespades, sixspades, sevenspades, eightspades, ninespades, tenspades, jackspades, queenspades, kingspades,...
    acehearts, twohearts, threehearts, fourhearts, fivehearts, sixhearts, sevenhearts, eighthearts, ninehearts, tenhearts, jackhearts, queenhearts, kinghearts,...
    acediamonds, twodiamonds, threediamonds, fourdiamonds, fivediamonds, sixdiamonds, sevendiamonds, eightdiamonds, ninediamonds, tendiamonds, jackdiamonds, queendiamonds, kingdiamonds];


%% Set suit number
for i=1:length(deck)
    x=double(deck(i).suit);
    if x(1)==double('C')
        deck(i).suitnum=1;
    elseif x(1)==double('S')
        deck(i).suitnum=2;
    elseif x(1)==double('H')
        deck(i).suitnum=3;
    elseif x(1)==double('D')
        deck(i).suitnum=4;
    end
end

    
