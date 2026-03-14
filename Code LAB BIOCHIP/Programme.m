
clc;

% Parameters
% cond = fluid conductivity [uS/cm]
% W = electrode width   [um]
% G = electrode gap     [um]
% L = electrode length  [um]
% N = total number of fingers

cond=700;
W=5;
G=5;
L=1500;
N=10;

[R,CDL] = R_coplanar_infinitelayer(cond,W,G,L,N);

R;
CDL;

x=logspace(1,10,100);
Z = R + 1./(x*CDL);
loglog(x,Z);
grid on;