% syms k1 k2 k3
% A = [-k1 0 0;
%     0 -k2 0;
%     0 0 -k3];
% eig(A)

% f = @(t,x)[x(2)^3;x(1)-x(2)];
%   
% [t1,x1] = ode45(f,[0:.1: 6],[0 -1]);
% figure(1)
% plot (x1(:,1),x1(:,2))
% figure(2)
% plot (t1,x1(:,1))
% figure(3)
% plot (t1,x1(:,2))

figure(1);hold on
figure(2);hold on
figure(3);hold on
for mu = -5:1:5
% mu = 3;
% f = @(t,x)[x(2);-x(1)-x(1)^2*x(2)-x(2)^3 + mu*x(2)];
f = @(t,x)[x(2);-x(1)-(x(1)^2+x(2)^2 - mu)*x(2)];
 
[t1,x1] = ode45(f,[0:.1: 2000],[1 1]);
figure(1)
plot (x1(:,1),x1(:,2))
figure(2)
plot (t1,x1(:,1))
figure(3)
plot (t1,x1(:,2))
end
syms x1 x2
A = jacobian([x2;-x1-x1^2*x2-x2^3 + mu*x2],[x1,x2])
x1 = 0;
x2 = 0;
% mu = 3
A_eq = [             0,                    1;
              - 2*x1*x2 - 1, - x1^2 - 3*x2^2 + mu]
tr = trace(A_eq)
deter = det(A_eq)
eigen = eig(A_eq)
disc = tr^2-4*deter
