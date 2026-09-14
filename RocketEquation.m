function dX = RocketEquation(t,X,thrustMag,tBurn,m,rho,dragCo,S,g)
vx = X(3);
vy = X(4);
V = sqrt(vx^2+vy^2);
if V > 0
    ux = vx/V; uy = vy/V;
else
    ux = 0; uy = 1;
end
Fd = 0.5*rho*V^2*S*dragCo;
if t <= tBurn
    Ft = thrustMag;
else
    Ft = 0;
end
ax = (Ft*ux-Fd*ux)/m;
ay = (Ft*uy-Fd*uy-m*g)/m;
dX = [vx; vy; ax; ay];
end