clear;clc;
load bal.txt
vari=bal(:,1);
freq=50;                   %根据采样频率设定freq的大小
%x=get(h,'xdata');
%y=get(h,'ydata');
%imin=find(min(y)==y);
%imax=find(max(y)==y);
%text(x(imin),y(imin),['min=',num2str(y(imin))],'fontsize',15)
%text(x(imax),y(imax),['max=',num2str(y(imax))],'fontsize',15)


%截取的数据量转换为时间大小
vari=vari(1:7000);
vari1=vari(1:1);
n=length(vari);
time=(0:n-1)/freq;
vari2=mean(vari1);
vari3=2.5*10*(vari/1000+1)-2.5*10*(vari2/1000+1);
figure;



%{
for i = 1:n
    if vari3(i,1)>3.55
        vari3(i,1) = rand(1)*0.05+3.52;
    end
end
for i = 6450:6570
    if vari3(i,1)>2.64
        vari3(i,1) = rand(1)*0.05+2.59;
    end
end
for i = 8046:8119
    if vari3(i,1)<1.345
        vari3(i,1) = rand(1)*0.05+1.32;
    end
end
for i = 9935:10190
    if vari3(i,1)<1.396
        vari3(i,1) = rand(1)*0.05+1.37;
    end
end
%}


time=time-16;%传感器改时间
h=plot(time,vari3,'b');%%%%%%%%%
hold on;
grid on;
set(gca,'FontName','Times New Roman','FontSize',21);
set(gcf,'color','w');
xlabel('Time(s)','fontsize',21);
ylabel('Displacement(mm)','fontsize',21);



%clear;clc;
load bv3.txt;
Hour=bv3(:,3);
Minute=bv3(:,4);
Second=bv3(:,5);
dx=bv3(:,6);
dy=bv3(:,7);
%accz=acc5(:,9);


interval=datenum(0,0,0,Hour,Minute,Second);
t00 = Minute*60+Second-1029.48+4.9+2.92-304.94+315.36;%这一句在合成时须作人工调整；
interval = t00;

figure;%合成时去掉
dx1=dx(1:30);
dx2=mean(dx1);
dx3=dx-dx2;
dx4=-dx3;
interval=interval-16;%手机改时间用
plot(interval,-dx3/1.01,'r');%%%%%%%%%
x=interval;
%axis([0,160,-1,10]);%坐标轴显示范围，这个先注释，改完时间后再去掉注释
%datetick('x','HH:MM:SS');
set(gca,'FontName','Times New Roman','FontSize',10);
set(gcf,'color','w');
xlabel('Time','fontsize',10);
ylabel('Displacement(mm)','fontsize',10);
grid on;
legend('Sensor','D-Viewer');

%axis([8,195,-1,4]);




