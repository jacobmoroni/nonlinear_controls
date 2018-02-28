% Lorenz System
sigma = 10;
b = 8/3;
r = 28;

% xdot = sigma*(y-x);
% ydot = r*x-y-x*z;
% zdot = x*y-b*z;

f = @(t,x)[sigma*(x(2)-x(1));r*x(1)-x(2)-x(1)*x(3);x(1)*x(2)-b*x(3)];
  
[t1,x1] = ode45(f,[0:.001: 20],[0 2 0]);
[t2,x2] = ode45(f,[0:.001: 20],[0 -2 0]);
[t3,x3] = ode45(f,[0:.001: 20],[0 2.01 0]);

figure(1)
% comet3 (x1(:,1),x1(:,2),x1(:,3))
plot3 (x1(:,1),x1(:,2),x1(:,3))
title('Initial Conditions (0,2,0)')
xlabel('x')
ylabel('y')
zlabel('z')
grid on

figure(2)
plot3 (x2(:,1),x2(:,2),x2(:,3))
grid on
title('Initial Conditions (0,-2,0)')
xlabel('x')
ylabel('y')
zlabel('z')

figure(3)
plot3 (x3(:,1),x3(:,2),x3(:,3))
% comet3 (x3(:,1),x3(:,2),x3(:,3))
grid on
title('Initial Conditions (0,2.01,0)')
xlabel('x')
ylabel('y')
zlabel('z')

%%
%      This shows that the final trajectory is very dependent on initial 
%      conditions, even slight variations have a very large impact on the 
%      trajectory. They seem to more or less orbit one point with
%      offshoots to a second point. The initial coonditions affect which
%      point it will orbit and the frequency of offshoots to the other
%      point