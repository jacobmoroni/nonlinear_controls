I_1 = 3;
I_2 = 2;
I_3 = 1;
f = @(t,x)[(I_2-I_3)/I_1*(x(2)*x(3));
           (I_3-I_1)/I_2*(x(1)*x(3));
           (I_1-I_2)/I_3*(x(1)*x(2))];
n = 40;
omegas = randn(3,n);
figure(1);clf
hold on
for i = 1:n
    hg = omegas(:,i).*[I_1; I_2; I_3];
    hg_norm = hg/norm(hg);
    w0(:,i) = (hg_norm./[I_1; I_2; I_3]);
    [t,x] = ode45(f,[0:.01: 40],w0(:,i));
    plot3(x(:,1),x(:,2),x(:,3))
end
view(-17,20)

