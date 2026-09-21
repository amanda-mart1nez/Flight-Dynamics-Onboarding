thrustMag = 2000;
m = 40;
tBurn = 5;
outerDia = 0.1;
dragCo = 0.75;
v0 = 5;
rho = 1.225;
g = 9.81;
S = pi*(outerDia/2)^2;
theta0 = 45*pi/180;
X0 = [0; 0; v0*cos(theta0); v0*sin(theta0)];
stop = odeset('Events', @(t,X) groundEvent(t,X));
tspan = [0 60];
[t, X] = ode45(@(t,X) RocketEquation(t,X,thrustMag,tBurn,m,rho,dragCo,S,g), tspan, X0, stop);
function [value, isterminal, direction] = groundEvent(t,X)
value = X(2); % Check if the vertical position is zero
if t < 0.01
    value = 1;
end
isterminal = 1; % Stop the integration if the event is detected
direction = -1; % Detect when the event is decreasing
end
x = X(:,1); y = X(:,2); vx = X(:,3); vy = X(:,4);
V = sqrt(vx.^2+vy.^2);
apogee = max(y);
rot = atan2(vy,vx);
pos = [x,y];
RocketAnimation(pos,rot);
figure(1)
plot(x,y); xlabel('Downrange [m]'); ylabel('Altitude [m]'); title('Trajectory')
figure(3)
plot(t,V); xlabel('Time [s]'); ylabel('Velocity [m/s]'); title('Velocity')
