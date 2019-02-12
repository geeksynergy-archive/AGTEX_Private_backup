months=['J';'F';'M';'A';'M';'J';'J';'A';'S';'O';'N';'D']
k1=strread(num2str(1:6),'%s')
k=['.';'.';'.';strread(num2str(1:6),'%s');'.';'.';'.']
N=20;
x=(1:N)';
y=ceil(12*rand(N,1));
plot(x,y);
set(gca,'YLim',[0 13],'YTick',1:12,'XTickLabel',k)
%%
datay=randn(1,15); 
datax=datay; 
bar(datax,datay); 
set(gca,'XTickLabel',{'JFM','FMA','MAM','AMJ','MJJ','JJA','JAS','ASO','SON','OND','NDJ','DJF','JFM','FMA','MAM'}) 
xTick=get(gca,'xtick'); 
xMax=max(xtick); 
xMin=min(xtick); 
newXTick=linspace(xMin,xMax,15); 
set(gca,'xtick',1:15);