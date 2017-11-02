s7=imread('s7.jpg');
image(s7);
%  try combinations of:
axis xy

for k=1:3
   s7(:,:,k)=flipud(s7(:,:,k));
end

[ny nx n]=size(s7);
cardImRatio=ny/nx;
cardWidth=2;
cardHeight=cardWidth*cardImRatio;

clf
xmin=0; 
xmax=10;
ymin=0; 
ymax=6;
axis([xmin xmax ymin ymax]);
axis equal

hCard7D_image=image('CData',s7);
x7D=1;
y7D=1;
set(hCard7D_image,'XData',[x7D x7D+cardWidth]);
set(hCard7D_image,'YData',[y7D y7D+cardHeight]);

Nx=100;
x=linspace(-1,1,Nx);
y=linspace(-1,1,Nx);
[X,Y]=meshgrid(x,y);
R=sqrt(X.*X+Y.*Y);
Z=sin(5*pi*R)./R;
surf(X,Y,Z);
colormap('default')