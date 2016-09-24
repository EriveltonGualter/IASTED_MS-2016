%% parâmetros gerais
        clear, clc, 
        figure(1), clf
        figure(2), clf
        figure(3), clf
        T = 1e-2;                       % passo de integração  
        
%% ganhos nominais do controlador     
        load wheelie_controle1   
        G = [solution.k1  solution.k2  0  solution.k4];        

%% referência e distúrbio
        theta_r = 1.0;                  % velocidade desejada após 5s   
        ti = 10;                        % segundos
        duracao = 0.1;                  % segundos       
        amplitude = 10;                 % N.m
            
%% variação da massa   
        load parametros_nominal         % M = 75kg, H = 1.75m
            sim('iasted_s1.slx',15)
            figure(1)
            line = 1.5;    
            iasted_plots1
%         load parametros_M60             % M = 60kg, H = 1.75m
%             sim('iasted_s1.slx',15)
%             figure(1)
%             line = 1.0;                
%             iasted_plots1
%         load parametros_M90             % M = 90kg, H = 1.75m
%             sim('iasted_s1.slx',15)
%             figure(1)
%             line = 1.0;                
%             iasted_plots1            
        
% %% variação da altura   
%         load parametros_nominal         % M = 75kg, H = 1.75m
%             sim('iasted_s1.slx',15)
%             figure(2)
%             line = 1.5;    
%             iasted_plots1
%         load parametros_H16             % M = 75kg, H = 1.60m
%             sim('iasted_s1.slx',15)
%             figure(2)
%             line = 1.0;                
%             iasted_plots1
%         load parametros_H19             % M = 75kg, H = 1.90m
%             sim('iasted_s1.slx',15)
%             figure(2)
%             line = 1.0;                
%             iasted_plots1                 
%             
% %% variação do ajuste horizontal   
%         load parametros_nominal         % Px = 0
%             sim('iasted_s1.slx',15)
%             figure(3)
%             line = 1.5;    
%             iasted_plots1
%         load parametros_Px005           % Px = +5cm
%             sim('iasted_s1.slx',15)
%             figure(3)
%             line = 1.0;                
%             iasted_plots1
%         load parametros_Pxneg005        % Px = -5cm
%             sim('iasted_s1.slx',15)
%             figure(3)
%             line = 1.0;                
%             iasted_plots1   
%         load parametros_Pxneg010        % Px = -10cm
%             sim('iasted_s1.slx',15)
%             figure(3)
%             line = 1.0;                
%             iasted_plots1           