function winOdds = winningOdds(rivoddsyou, rivoddscomp1, rivoddscomp2, rivoddscomp3, rivoddscomp4)

%% chance to win with each hand

rivoddsyou=rivoddsyou./100;
rivoddscomp1=rivoddscomp1./100;
rivoddscomp2=rivoddscomp2./100;
rivoddscomp3=rivoddscomp3./100;
rivoddscomp4=rivoddscomp4./100;

num7=rivoddsyou(7)*(1-rivoddscomp1(7))*(1-rivoddscomp2(7))*(1-rivoddscomp3(7))*(1-rivoddscomp4(7));
num6=rivoddsyou(6)*(1-rivoddscomp1(7))*(1-rivoddscomp1(6))*(1-rivoddscomp2(7))*(1-rivoddscomp2(6))*(1-rivoddscomp3(7))*(1-rivoddscomp3(6))*(1-rivoddscomp4(7))*(1-rivoddscomp4(6));
num5=rivoddsyou(5)*(1-rivoddscomp1(7))*(1-rivoddscomp1(6))*(1-rivoddscomp2(7))*(1-rivoddscomp2(6))*(1-rivoddscomp2(5))*(1-rivoddscomp3(7))*(1-rivoddscomp3(6))*(1-rivoddscomp3(5))*(1-rivoddscomp4(7))*(1-rivoddscomp4(6))*(1-rivoddscomp4(5));
num4=rivoddsyou(4)*(1-rivoddscomp1(7))*(1-rivoddscomp1(6))*(1-rivoddscomp1(5))*(1-rivoddscomp1(4))*(1-rivoddscomp2(7))*(1-rivoddscomp2(6))*(1-rivoddscomp2(5))*(1-rivoddscomp2(4))*(1-rivoddscomp3(7))*(1-rivoddscomp3(6))*(1-rivoddscomp3(5))*(1-rivoddscomp3(4))*(1-rivoddscomp4(7))*(1-rivoddscomp4(6))*(1-rivoddscomp4(5))*(1-rivoddscomp4(4));
num3=rivoddsyou(3)*(1-rivoddscomp1(7))*(1-rivoddscomp1(6))*(1-rivoddscomp1(5))*(1-rivoddscomp1(4))*(1-rivoddscomp1(3))*(1-rivoddscomp2(7))*(1-rivoddscomp2(6))*(1-rivoddscomp2(5))*(1-rivoddscomp2(4))*(1-rivoddscomp2(3))*(1-rivoddscomp3(7))*(1-rivoddscomp3(6))*(1-rivoddscomp3(5))*(1-rivoddscomp3(4))*(1-rivoddscomp3(3))*(1-rivoddscomp4(7))*(1-rivoddscomp4(6))*(1-rivoddscomp4(5))*(1-rivoddscomp4(4))*(1-rivoddscomp4(3));
num2=rivoddsyou(2)*(1-rivoddscomp1(7))*(1-rivoddscomp1(6))*(1-rivoddscomp1(5))*(1-rivoddscomp1(4))*(1-rivoddscomp1(3))*(1-rivoddscomp1(2))*(1-rivoddscomp2(7))*(1-rivoddscomp2(6))*(1-rivoddscomp2(5))*(1-rivoddscomp2(4))*(1-rivoddscomp2(3))*(1-rivoddscomp2(2))*(1-rivoddscomp3(7))*(1-rivoddscomp3(6))*(1-rivoddscomp3(5))*(1-rivoddscomp3(4))*(1-rivoddscomp3(3))*(1-rivoddscomp3(2))*(1-rivoddscomp4(7))*(1-rivoddscomp4(6))*(1-rivoddscomp4(5))*(1-rivoddscomp4(4))*(1-rivoddscomp4(3))*(1-rivoddscomp4(2));
num1=rivoddsyou(1)*(1-rivoddscomp1(7))*(1-rivoddscomp1(6))*(1-rivoddscomp1(5))*(1-rivoddscomp1(4))*(1-rivoddscomp1(3))*(1-rivoddscomp1(2))*(1-rivoddscomp1(1))*(1-rivoddscomp2(7))*(1-rivoddscomp2(6))*(1-rivoddscomp2(5))*(1-rivoddscomp2(4))*(1-rivoddscomp2(3))*(1-rivoddscomp2(2))*(1-rivoddscomp2(1))*(1-rivoddscomp3(7))*(1-rivoddscomp3(6))*(1-rivoddscomp3(5))*(1-rivoddscomp3(4))*(1-rivoddscomp3(3))*(1-rivoddscomp3(2))*(1-rivoddscomp3(1))*(1-rivoddscomp4(7))*(1-rivoddscomp4(6))*(1-rivoddscomp4(5))*(1-rivoddscomp4(4))*(1-rivoddscomp4(3))*(1-rivoddscomp4(2))*(1-rivoddscomp4(1));

%% combining them

winOdds=(num7+num6+num5+num4+num3+num2+num1)*100;