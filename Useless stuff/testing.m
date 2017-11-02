% ImageDemos.m
%    designed for walk through cell-by-cell -CSL
%
%    requires 7D.jpg (seven of diamonds)
%             QC.jpg (queen of clubs)
%% 1) read in array of color card information
clear all
clf
ACard7D=imread('s7.jpg');
ACardQC=imread('s7.jpg');

% basic display 
image(ACard7D);
%  try combinations of:
axis xy
axis equal
axis tight
axis image

%% 1.5) flip for subsequent plotting in xy mode
for k=1:3
   ACard7D(:,:,k)=flipud(ACard7D(:,:,k));
   AcardQC(:,:,k)=flipud(ACardQC(:,:,k));
end

%% 2) get Card image dimensions, image ratio
%  set size of card image to be displayed
[ny nx n]=size(ACard7D);
cardImRatio=ny/nx;
cardWidth=2;  % picked just for demo purposes
cardHeight=cardWidth*cardImRatio;

%% 3) create axis
clf
xmin=0; 
xmax=10;
ymin=0; 
ymax=6;
axis([xmin xmax ymin ymax]);
axis equal

%% 4) place image on axis with lower left hand corner at xQC,yQC
hCardQC_image=image('CData',ACardQC);
xQC=5;
yQC=1;
set(hCardQC_image,'XData',[xQC xQC+cardWidth]);
set(hCardQC_image,'YData',[yQC yQC+cardHeight]);

%% 4.5) place image on axis with lower left hand corner at x7D,y7D
hCard7D_image=image('CData',ACard7D);
x7D=1;
y7D=1;
set(hCard7D_image,'XData',[x7D x7D+cardWidth]);
set(hCard7D_image,'YData',[y7D y7D+cardHeight]);

%% 5) turn off axis
axis off

%% 5.5) move card across screen and back
xcmax=7;
ycmax=0.5;
N=100;
xc=linspace(0,xcmax,N);
yc=linspace(0,ycmax,N);

for ic=1:N
    set(hCard7D_image,'XData',[x7D+xc(ic) x7D+xc(ic)+cardWidth]);
    set(hCard7D_image,'YData',[y7D+yc(ic) y7D+yc(ic)+cardHeight]);  
    axis([xmin xmax ymin ymax]);
    drawnow
end
for ic=N:-1:1
    set(hCard7D_image,'XData',[x7D+xc(ic) x7D+xc(ic)+cardWidth]);
    set(hCard7D_image,'YData',[y7D+yc(ic) y7D+yc(ic)+cardHeight]);  
    axis([xmin xmax ymin ymax]);
    drawnow
end


%% 6) create alpha (transparency) array the same size as 7D
%   with hole in the middle. alpha=1 => opaque
%                            alpha=0 => transparent
cardAlpha=ones(ny,nx);
xcenter=ny/2;
ycenter=nx/2;
rc=50;
for ix=1:nx
    for iy=1:ny
        if sqrt((ix-xcenter)^2+(iy-ycenter)^2)<rc
        cardAlpha(ix,iy)=0;
        end
    end
end

%% 7) show alpha mask on right
CA=cat(3,cardAlpha,cardAlpha,cardAlpha);
hAlphaMask_image=image('CData',CA);
x=8;
y=1;
set(hAlphaMask_image,'XData',[x x+cardWidth]);
set(hAlphaMask_image,'YData',[y y+cardHeight]);

%% 8) delete picture of alpha mask
delete(hAlphaMask_image)

%% 9) apply alpha mask to 7D card
set(hCard7D_image,'AlphaData',cardAlpha);

%% 10) move 7D over QC
xcmax=7;
N=100;
xc=linspace(0,xcmax,N);
for ic=1:N
    set(hCard7D_image,'XData',[x7D+xc(ic) x7D+xc(ic)+cardWidth]);    
    drawnow
end

%% 11) make a surface plot
Nx=100;
x=linspace(-1,1,Nx);
y=linspace(-1,1,Nx);
[X,Y]=meshgrid(x,y);
R=sqrt(X.*X+Y.*Y);
Z=sin(5*pi*R)./R;
surf(X,Y,Z);
colormap('default')

%% 12) experiment with grid lines and shading (rotate3d)
shading flat
shading interp


%% 13) apply texturemap on surface
Nx=100;
x=linspace(-1,1,Nx);
y=linspace(-1,1,Nx);
[X,Y]=meshgrid(x,y);
R=sqrt(X.*X+Y.*Y);
Z=sin(5*pi*R)./R;
surf(X,Y,Z,...
    'FaceColor','texturemap','CData',ACardQC,...
    'EdgeColor','none');

%% flip 7D back
%      This is just to past it on the back of the QC
for k=1:3
   ACard7D(:,:,k)=flipud(ACard7D(:,:,k));
end
%% 14) create coordinates for surface (just corners)
x=[-1 1]; 
y=[-1 1]*cardImRatio; 
z=[0 0];
[X,Y] = meshgrid(x,y);
% --- displays image on surface object 
Z=zeros(2,2);

%% 15) create surface with image of 7D card on it and alpha hole in it
h_img = surf(X,Y,Z,...
    'FaceColor','texturemap','CData',ACard7D,...
    'FaceAlpha','texture','AlphaData',cardAlpha,'AlphaDataMapping','none',...
    'EdgeColor','none');
    axis(1.5*[-1 1 -1 1 -1 1])
%%  16) add QC card on top of it
hold on
    deltaz=1e-2;
    h_img2 = surf(X,Y,Z+deltaz,...
        'FaceColor','texturemap','CData',ACardQC);
    set(h_img2,'EdgeColor','none');
hold off;

%% 17) create hgtransform and add two card images as children
ht = hgtransform;
set(h_img,'Parent',ht)
set(h_img2,'Parent',ht);

%   rotate hgtransform object around y axis
Nth=60;
for ith=1:Nth
    ry_angle = -(ith/Nth)*pi; 
    Ry = makehgtform('yrotate',ry_angle);
    set(ht,'Matrix',Ry)
    drawnow
end

%% 18) Draw card on sphere 
%clf
[X,Y,Z]=sphere(60);
surf(X,Y,Z,'FaceColor','texturemap',...
           'CData',ACardQC,'EdgeColor','none')
axis equal
axis off
rotate3d('on')


%% 19) Draw face on sphere 
%clf
CS=imread('s7.jpg');
for k=1:3
   CS(:,:,k)=flipud(CS(:,:,k));
end
[X,Y,Z]=sphere(60);
surf(X,Y,Z,'FaceColor','texturemap',...
           'CData',CS,'EdgeColor','none')
axis equal
axis off
rotate3d('on')


