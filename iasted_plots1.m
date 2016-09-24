%% iasted_plots1.m
        
        subplot(4,1,1)
%           plot(t,xr(:,1),t,x(:,1),'r','linewidth',line),grid,
%           legend('\phi_r','\phi')
            plot(t,x(:,1),'k','linewidth',line),grid,
            legend('\phi')
            ylabel({'angular','position','(rad)'})
            hold on, grid on
        subplot(4,1,2)
%           plot(t,xr(:,2),t,x(:,2),'r','linewidth',line),grid,
%           legend('dot\phi_r','dot\phi')              
            plot(t,x(:,2),'k','linewidth',line),grid,
            legend('dot\phi')   
            ylabel({'angular','velocity','(rad/s)'})          
            hold on, grid on
        subplot(4,1,3)
%           plot(t,xr(:,4),t,x(:,4),'r','linewidth',line),grid,
%           legend('dot\theta_r','dot\theta')                
            plot(t,x(:,4),'k','linewidth',line),grid,
            legend('dot\theta')  
            ylabel({'wheel','velocity','(rad/s)'})              
            hold on, grid on
        subplot(4,1,4)
            plot(t,u,'k','linewidth',line),grid,
            legend('\tau')
            ylabel('\tau (N.m)')   
            xlabel('Time (s)')       
            hold on, grid on
        
            