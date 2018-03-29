function output = differential_flatness(u,P)
%     pn       = u(1);  % inertial North position
%     pe       = u(2);  % inertial East position
%     h        = -u(3); % altitude
% %     u        = u(4);  % inertial velocity along body x-axis
% %     v        = u(5);  % inertial velocity along body y-axis
% %     w        = u(6);  % inertial velocity along body z-axis
% %     phi      = u(7);  % roll angle
% %     theta    = u(8);  % pitch angle
%     psi      = u(9);  % yaw angle
% %     p        = u(10); % body frame roll rate
% %     q        = u(11); % body frame pitch rate
% %     r        = u(12); % body frame yaw rate
%     t        = u(13);
t = u;

    alpha = 5;
    beta = 2.5;
    eta = 5;
    omega = 1;
    pn = alpha*cos(omega/2*t);
    pe = beta*sin(omega*t);
    h = eta;
    psi = 0;
    
    pndot = -alpha*omega/2*sin(omega/2*t);
    pedot = beta*omega*cos(omega*t);
    hdot = 0;
    pnddot = -alpha*omega^2/4*cos(omega/2*t);
    peddot = -beta*omega^2*sin(omega*t);
    hddot = 0;
    psidot = 0;
    
    output(1) = pn;
    output(2) = pe;
    output(3) = h;
    output(4) = pndot;
    output(5) = pedot;
    output(6) = hdot;
    output(7) = psi;
    output(8) = pnddot;
    output(9) = peddot;
    output(10) = hddot -P.gravity;
    output(11) = psidot;

end