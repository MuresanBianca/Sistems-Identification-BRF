clear;
close all;

    %Data extraction
    
load('proj_fit_22.mat');

Y_id_array=reshape(id.Y,id.dims(1)*id.dims(2),1); %column array- identification outputs
surf(id.X{1},id.X{2},id.Y), title('Identification data'), xlabel('X1'),ylabel('X2'),zlabel('Y') 
figure;

Y_val_array=reshape(val.Y,val.dims(1)*val.dims(2),1); %column array- validation outputs
surf(val.X{1},val.X{2},val.Y), title('Validation data'),xlabel('X1'),ylabel('X2'),zlabel('Y') 

    %Phi Matrix and Y estimate
min=100;
for R = 3:20 %R^2 - number of centers 
    O = Phi(id.X,R,length(Y_id_array))\Y_id_array; 
    Y_est_array=Phi(id.X,R,length(Y_id_array))*O;
    if min > mse(Y_est_array,Y_id_array)
       min=mse(Y_est_array,Y_id_array);         
       N=R;
       Teta=O;
       Yest=Y_est_array;
     end
end
N
Yest=reshape(Yest,id.dims(1),id.dims(2));
figure;
surf(id.X{1},id.X{2},Yest),title(['Y estimatefor dentification data with MSE=',num2str(min)])
xlabel('X1'),ylabel('X2'),zlabel('Y') 

min=100;
for R = 3:20 %R^2 number of centers
    O = Phi(id.X,R,length(Y_id_array))\Y_id_array; 
    Y_est_array=Phi(val.X,R,length(Y_val_array))*O;
    if min > mse(Y_est_array,Y_val_array)
       min=mse(Y_est_array,Y_val_array);         
       N=R;
       Teta=O;
       Yest=Y_est_array;
     end
end
N
Yest=reshape(Yest,val.dims(1),val.dims(2));
figure;
surf(val.X{1},val.X{2},Yest),title(['Y estimate for validation data with MSE=',num2str(min)])
xlabel('X1'),ylabel('X2'),zlabel('Y') 

