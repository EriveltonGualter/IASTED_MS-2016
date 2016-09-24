% Padrões ótimos em malha aberta
        load wheelie_nominal;
            figure(1)
            line = 1.0; 
            
        subplot(5,1,1)
            plot(opt.ti, opt.phi,'k','linewidth',line),grid,
            legend('\phi')
            ylabel({'angular','position','(rad)'})
            hold on, grid on
        subplot(5,1,2)         
            plot(opt.ti, opt.phid,'k','linewidth',line),grid,
            legend('dot\phi')   
            ylabel({'angular','velocity','(rad/s)'})          
            hold on, grid on
        subplot(5,1,3)                
            plot(opt.ti, opt.theta,'k','linewidth',line),grid,
            legend('\theta')  
            ylabel({'wheel','position','(rad)'})              
            hold on, grid on
        subplot(5,1,4)                
            plot(opt.ti, opt.thetad,'k','linewidth',line),grid,
            legend('dot\theta')  
            ylabel({'wheel','velocity','(rad/s)'})                         
            hold on, grid on
        subplot(5,1,5)
            t = zeros(length(opt.ti), 1);
            t = opt.ti(1:length(opt.ti)-1, 1);
            plot( t, opt.tau,'k','linewidth',line),grid,
            legend('\tau')
            ylabel('\tau (N.m)')   
            xlabel('Time (s)')       
            hold on, grid on