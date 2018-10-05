r=9:99;
r1=9:50;
r2=9:60;
plot(r1,T1(9:50,1),'g',r2,T2(9:60,1),'b',r,T3(9:99,1),'r',r,T4(9:99,1),'y')
axis([9 99 0 80])
title('运算时间随N变化图')
xlabel('N')
ylabel('时间/秒')
legend('Gauss消去法','平方根法','带状Gauss消去法','matlab程序包')