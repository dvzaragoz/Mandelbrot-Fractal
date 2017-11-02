function [hand] = Hand(handsize)

a=CardDeck;

hand=[];

for N=1:handsize
    x=randi([1 length(a)]);
    hand=[hand, a(x)];
    a(x)=[];
end