Ix = 0.02;
Iy = 0.003;
Iz = 0.027;
omega0 = [pi; 0.05; 0.05];
q0 = [1; 0; 0; 0];
X0 = [omega0; q0];
tspan = [0 10];
opts = odeset('RelTol', 1e-10, 'AbsTol', 1e-10);
[t, X] = ode45(@(t,X) RacketEquation(t,X,Ix,Iy,Iz), tspan, X0, opts);
omega = X(:,1:3);
q = X(:,4:7);
KE = 0.5*(Ix*omega(:,1).^2 + Iy*omega(:,2).^2 + Iz*omega(:,3).^2);
figure(1)
plot(t, KE)
xlabel('Time [s]'); ylabel('Energy [J]'); title('Rotational Energy')
qNorm = q ./ vecnorm(q, 2, 2);
RotationsVisualizer(qNorm, t, false);


