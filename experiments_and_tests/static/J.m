clear;clc;
load bal.txt
vari=bal(:,1);
freq=50;                   %根据采样频率设定freq的大小
figure;
h=plot(vari); hold on
xlabel('总数据个数');
ylabel('采样值');
title('原始数据图')
%x=get(h,'xdata');
%y=get(h,'ydata');
%imin=find(min(y)==y);
%imax=find(max(y)==y);
%text(x(imin),y(imin),['min=',num2str(y(imin))],'fontsize',15)
%text(x(imax),y(imax),['max=',num2str(y(imax))],'fontsize',15)


%截取的数据量转换为时间大小
vari=vari(1:9000);
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


h=plot(time,vari3,'b');%%%%%%%%%
grid on
set(gca,'FontName','Times New Roman','FontSize',21);
set(gcf,'color','w');
xlabel('Time(s)','fontsize',21);
ylabel('Displacement(mm)','fontsize',21);




interval=datenum(0,0,0,Hour,Minute,Second);
t00 = Minute*60+Second-60-2;
interval = t00;
disp(t00);

%figure;
dx1=dx(1:30);
dx2=mean(dx1);
dx3=(dx-dx2)*(-0.5);
plot(interval,-dx3,'r');%%%%%%%%%
%x=interval;
axis([10,25,-10,10]);
%datetick('x','HH:MM:SS');
set(gca,'FontName','Times New Roman','FontSize',10);
set(gcf,'color','w');
xlabel('Time','fontsize',10);
ylabel('Displacement(mm)','fontsize',10);
grid on;
legend('')

%axis([8,195,-1,4]);




