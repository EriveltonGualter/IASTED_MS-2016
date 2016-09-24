function [sys,x0,str,ts,simStateCompliance] = modelo_naolinear(t,x,u,flag,pars)
switch flag
    case 0 
        Phi_i = pars.phi0;   % ângulo inicial
        xi = [Phi_i 0 0 0]'; % estado inicial        
        [sys,x0,str,ts,simStateCompliance] = mdlInitializeSizes(xi);
    case 1
        sys = mdlDerivatives(t,x,u,pars);
    case {2,9}
        sys = [];
    case 3
        sys = mdlOutputs(t,x); 
    otherwise
        DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
end

function [sys,x0,str,ts,simStateCompliance] = mdlInitializeSizes(xi)
sizes = simsizes;
sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);
str = [];
x0  = xi;
ts  = [0 0];   % sample time: [periodo, offset]
simStateCompliance = 'DefaultSimState';

function sys = mdlDerivatives(t,x,u,pars)

     Jc = pars.Jc;         % Momento Inércia cadeira (Kg.m2)    
      g = pars.g;          % Aceleração gravitacional 
     Mr = pars.Mr;         % Massa de uma roda (kg)
     Mc = pars.Mc;         % Massa (kg)
     JR = pars.Jr;         % Momento de Inercia da roda traseira (Kg.m2)
      R = pars.R;          % Raio da roda traseira(m)- diametro 22"
      l = pars.L;          % Distancia até o centro de gravidade (m)
      H = pars.H;  
  Phi_i = pars.phi0;
     Px = pars.Px;   
     Py = pars.Py;
tau_lim = pars.tau_lim;
        
      M =[ JR+(Mr+Mc)*(R^2)   Mc*R*l*cos(x(1))
           Mc*R*l*cos(x(1))   Jc+Mc*l^2        ];

      K = [ -Mc*R*l*(x(2))^2*sin(x(1)) 
            -Mc*g*l*sin(x(1))          ];

      A = inv(M)*( [1;-1]*u(1) - K );         % u1 = Tau

    sys =  [ x(2)   
             A(2)
             x(4)
             A(1) ]   +   [0; 1; 0; 0]*u(2);  % u2 = distúrbio           

function sys = mdlOutputs(t,x)
    sys = x;

