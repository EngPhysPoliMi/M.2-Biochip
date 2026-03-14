function [R,CDL] = R_coplanar_infinitelayer(cond,W,G,L,N)

% CONF. MAPPING Igreja, Dias, Sens. Act. A 112 (2004)
% -----------------------------------------------------------
% Parameters
% cond = fluid conductivity [uS/cm]
% W = electrode width   [um]
% G = electrode gap     [um]
% L = electrode length  [um]
% N = total number of fingers
% -----------------------------------------------------------

W1 = W*1e-6;
G1 = G*1e-6;
L1 = L*1e-6;

eta = W1 / (W1+G1);

% Internal terms


kI = sin(pi/2*eta);
kpI = sqrt(1-kI^2);
CCI = ellipke(kI^2)/ellipke(kpI^2);
% ------------------------------------

% External terms --------------------

kE = (2*sqrt(eta))/(1+eta);
kpE = sqrt(1 - kE^2);
CCE = ellipke(kE^2)/ellipke(kpE^2);
% -------------------------------------

CCTOT =  (N-3)*CCI/2 + 2*CCI*CCE/(CCI+CCE);

cond1=cond*1e-4;
rho = 1/cond1;

R = (rho/(L1*CCTOT)) 
CDL = 0.1*1*W1*L1*N/4 
