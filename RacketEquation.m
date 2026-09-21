function dX = RacketEquation(~,X,Ix,Iy,Iz)
wx = X(1);
wy = X(2);
wz = X(3);
q = X(4:7);
dwx = (Iy-Iz)*wy*wz/Ix;
dwy = (Iz-Ix)*wz*wx/Iy;
dwz = (Ix-Iy)*wy*wx/Iz;
omega = [0, -wx, -wy, -wz;
         wx, 0, wz, -wy;
         wy, -wz, 0, wx;
         wz, wy, -wx, 0];
dq = 0.5*omega*q;
dX = [dwx; dwy; dwz; dq];
end

