clear all
clear
clc

mypi = raspi();

s_zemin = servo (mypi, 13 , 'MaxPulseDuration', 0.0024, 'MinPulseDuration', 0.0006);
s_sag = servo (mypi, 6, 'MaxPulseDuration', 0.0024, 'MinPulseDuration', 0.0006);
s_sol = servo (mypi, 5, 'MaxPulseDuration', 0.0024, 'MinPulseDuration', 0.0006);

for i=150 : -1 : 90 
    
writePosition(s_zemin, i);
pause(0.1);  

end

for i=90 : 1 : 150 
    
writePosition(s_zemin, i);
pause(0.1);  

end

% for k=150 : -1 : 120 
%     
% writePosition(s_sol, k);
% pause(0.1);
% 
% end
% 
% for j=10 : 1 : 90 
%     
% writePosition(s_sag, j);
% pause(0.1); 
% 
% end


% for i=150 : 100 
%     
% writePosition(s_zemin, i);
% pause(0.1);  
% 
% end
% 
% for j=90 : 65 
%     
% writePosition(s_sag, j);
% pause(0.1); 
% 
% end
% 
% for k=100 : 150 
%     
% writePosition(s_sol, k);
% pause(0.1);
% 
% end



% for i=100 : 75 
%     
% writePosition(s_zemin, i);
% pause(0.1);  
% 
% end
% 
% for j=65 : 25 
%     
% writePosition(s_sag, j);
% pause(0.1); 
% 
% end
% 
% for k=150 : 100 
%     
% writePosition(s_sol, k);
% pause(0.1);
% 
% end



% for i=75 : 100 
%     
% writePosition(s_zemin, i);
% pause(0.1);  
% 
% end
% 
% for j=25 : 125 
%     
% writePosition(s_sag, j);
% pause(0.1); 
% 
% end
% 
% for k=100 : 75 
%     
% writePosition(s_sol, k);
% pause(0.1);
% 
% end
