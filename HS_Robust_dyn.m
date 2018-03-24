%% The Following Code Set's Up a '.mod' file to be read in Dynare following
%% the framework of Hansen-Sargent LQ Models
% (c) Written by Saki Bigio and Christian Matthes.

%% Main Code
%% I.1 Read Size of Material
[rr_Phi_c cc_Phi_c]         =size(Phi_c)     ; 
[rr_Phi_g cc_Phi_g]         =size(Phi_g)     ;     
[rr_Phi_i cc_Phi_i]         =size(Phi_i)     ;
[rr_Gamma cc_Gamma]         =size(Gamma)     ;
[rr_Delta_k cc_Delta_k]     =size(Delta_k)   ;
[rr_Theta_k cc_Theta_k]     =size(Theta_k)   ;                      
[rr_Delta_h cc_Delta_h]     =size(Delta_h)   ;
[rr_Theta_h cc_Theta_h]     =size(Theta_h)   ;
[rr_Lambda cc_Lambda] =     size(Lambda)     ;
[rr_Pi cc_Pi]               =size(Pi)        ;                           
[rr_A22 cc_A22]             =size(A22)       ;
[rr_C2 cc_C2]               =size(C2)        ;
[rr_U_b cc_U_b]             =size(U_b)       ;
[rr_U_d cc_U_d]             =size(U_d)       ;


%% Check consistency of matrix dimensions
if  cc_Phi_c~=cc_Theta_h || cc_Pi~=cc_Theta_h || cc_Phi_i~=cc_Theta_k || cc_Delta_h~=cc_Lambda || cc_Delta_k~=cc_Gamma || cc_U_b~=cc_U_d || cc_U_b~=cc_A22
    disp('Error -- dimensions of matrices do not match... check number of columns')
end

if  rr_Phi_c~=rr_Phi_g || rr_Phi_c~=rr_Phi_g || rr_Phi_c~=rr_Gamma || rr_Delta_k~=rr_Theta_k || rr_Delta_h~=rr_Theta_h || rr_Lambda~=rr_Pi || rr_A22~=rr_C2
disp('Error -- dimensions of matrices do not match... check number of rows')
end



%% [II] Modfile Write Up Section
fid = fopen(filename,'wt');

%% II.1 Declaration of Variables in Dynare
% Endogenous Variable Declaration
% Consumption Good 
fprintf(fid,'\nvar ');

for i=1:(cc_Phi_c)
    fprintf(fid,'c%g ',i);
end

% Public Good 
for i=1:(cc_Phi_g)
    fprintf(fid,'g%g ',i);
end

% Investment Good 
for i=1:(cc_Phi_i)
    fprintf(fid,'i%g ',i);
end

% Capital Good
for i=1:(cc_Gamma)
    fprintf(fid,'k%g ',i);
end

% Capital Good
for i=1:(rr_Gamma)
    fprintf(fid,'d%g ',i);
end

% Habit Good
for i=1:(cc_Delta_h)
    fprintf(fid,'h%g ',i);
end

% Utility Representation
for i=1:(rr_Lambda)
    fprintf(fid,'s%g ',i);
end

for i=1:(rr_Lambda)
    fprintf(fid,'b%g ',i);
end

% Shock Good
if constant==1
for i=2:(cc_A22)
    fprintf(fid,'z%g ',i);
end

else
for i=1:(cc_A22)
    fprintf(fid,'z%g ',i);
end
end

% Lagrange Multiplier Declaration
% M_d
for i=1:(rr_Phi_c)
    fprintf(fid,'M_d%g ',i);
end

% M_h
for i=1:(rr_Theta_h)
    fprintf(fid,'M_h%g ',i);
end

% M_k
for i=1:(rr_Theta_k)
    fprintf(fid,'M_k%g ',i);
end

% M_s
for i=1:(rr_Pi)
    fprintf(fid,'M_s%g ',i);
end

% M_z
for i=1:(rr_C2)
    fprintf(fid,'M_z%g ',i);
end

% Mean of Shock - Choice of Evil Agent
for i=1:(cc_C2)
    fprintf(fid,'w%g ',i);
end

% Put semi-colon and break the line
fprintf(fid,';\n \n');

% Innovations Declaration
fprintf(fid,'varexo ');
for i=1:(cc_C2)
    fprintf(fid,'e%g ',i);
end
fprintf(fid,';\n \n');

%% II.2 Declaration of Parameters in Dynare
% parameter declaration
fprintf(fid,'parameters ');
fprintf(fid,'beta ')  ;
fprintf(fid,'theta ')  ;

for j=1:rr_Phi_c
    for i=1:cc_Phi_c
        fprintf(fid,'Phi_c_%g%g ',j,i);
    end
end

for j=1:rr_Phi_g
    for i=1:cc_Phi_g
        fprintf(fid,' Phi_g_%g%g ',j,i);
    end
end

for j=1:rr_Phi_i
    for i=1:cc_Phi_i
        fprintf(fid,' Phi_i_%g%g ',j,i);
    end
end

for j=1:rr_Gamma
    for i=1:cc_Gamma
        fprintf(fid,'Gamma_%g%g ',j,i);
    end
end

for j=1:rr_Delta_k
    for i=1:cc_Delta_k
        fprintf(fid,'Delta_k_%g%g ',j,i);
    end
end

for j=1:rr_Theta_k
    for i=1:cc_Theta_k
        fprintf(fid,'Theta_k_%g%g ',j,i);
    end
end

for j=1:rr_Delta_h
    for i=1:cc_Delta_h
        fprintf(fid,'Delta_h_%g%g ',j,i);
    end
end

for j=1:rr_Theta_h
    for i=1:cc_Theta_h
        fprintf(fid,'Theta_h_%g%g ',j,i);
    end
end

for j=1:rr_Lambda
    for i=1:cc_Lambda
        fprintf(fid,'Lambda_%g%g ',j,i);
    end
end

for j=1:rr_Pi
    for i=1:cc_Pi
        fprintf(fid,'Pi_%g%g ',j,i);
    end
end

for j=1:rr_A22
    for i=1:cc_A22
        fprintf(fid,'A22_%g%g ',j,i);
    end
end

for j=1:rr_C2
    for i=1:cc_C2
        fprintf(fid,'C2_%g%g ',j,i);
    end
end

for j=1:rr_U_b
    for i=1:cc_U_b
        fprintf(fid,'U_b_%g%g ',j,i);
    end
end


for j=1:rr_U_d
    for i=1:cc_U_d
        fprintf(fid,'U_d_%g%g ',j,i);
    end
end

if constant==1
    
    fprintf(fid,'z1 ');
end

fprintf(fid,'; \n \n');

%% I.3 Assigment of Values in Dynare
fprintf(fid,'beta=%g ;\n',beta)  ;
fprintf(fid,'theta=%g ;\n',theta)  ;
for j=1:rr_Phi_c
    for i=1:cc_Phi_c
        fprintf(fid,'Phi_c_%g%g =%g ;\n',j,i,Phi_c(j,i));
    end
end

for j=1:rr_Phi_g
    for i=1:cc_Phi_g
        fprintf(fid,'Phi_g_%g%g =%g ;\n',j,i,Phi_g(j,i));
    end
end

for j=1:rr_Phi_i
    for i=1:cc_Phi_i
        fprintf(fid,'Phi_i_%g%g =%g ;\n',j,i,Phi_i(j,i));
    end
end

for j=1:rr_Gamma
    for i=1:cc_Gamma
        fprintf(fid,'Gamma_%g%g =%g ;\n',j,i,Gamma(j,i));
    end
end

for j=1:rr_Delta_k
    for i=1:cc_Delta_k
        fprintf(fid,'Delta_k_%g%g =%g ;\n',j,i,Delta_k(j,i));
    end
end

for j=1:rr_Theta_k
    for i=1:cc_Theta_k
        fprintf(fid,'Theta_k_%g%g =%g ;\n',j,i,Theta_k(j,i));
    end
end

for j=1:rr_Delta_h
    for i=1:cc_Delta_h
        fprintf(fid,'Delta_h_%g%g =%g ;\n',j,i,Delta_h(j,i));
    end
end

for j=1:rr_Theta_h
    for i=1:cc_Theta_h
        fprintf(fid,'Theta_h_%g%g =%g ;\n',j,i,Theta_h(j,i));
    end
end

for j=1:rr_Lambda
    for i=1:cc_Lambda
        fprintf(fid,'Lambda_%g%g =%g ;\n',j,i,Lambda(j,i));
    end
end

for j=1:rr_Pi
    for i=1:cc_Pi
        fprintf(fid,'Pi_%g%g =%g ;\n',j,i,Pi(j,i));
    end
end

for j=1:rr_A22
    for i=1:cc_A22
        fprintf(fid,'A22_%g%g =%g ;\n',j,i,A22(j,i));
    end
end

for j=1:rr_C2
    for i=1:cc_C2
        fprintf(fid,'C2_%g%g =%g ;\n',j,i,C2(j,i));
    end
end

for j=1:rr_U_b
    for i=1:cc_U_b
        fprintf(fid,'U_b_%g%g =%g ;\n',j,i,U_b(j,i));
    end
end


for j=1:rr_U_d
    for i=1:cc_U_d
        fprintf(fid,'U_d_%g%g =%g ;\n',j,i,U_d(j,i));
    end
end


if constant==1
    
    fprintf(fid,'z1=1; \n ');
end
fprintf(fid,' \n ');

%% II.1 Equation Section in Dynare
fprintf(fid,'model(linear); \n');

% [II.2.1] Technology Block
% Phi_c*c(t)+Phi_g*g(t)+Phi_i*i(t)=Gamma*k(t-1)+d(t)   
for i=1:(rr_Phi_c)
    
    for j=1:(cc_Phi_c)
      fprintf(fid,'Phi_c_%g%g*c%g + ',i,j,j);  
    end

    for j=1:(cc_Phi_g)
      fprintf(fid,'Phi_g_%g%g*g%g + ',i,j,j);  
    end
    
    for j=1:(cc_Phi_i)
      fprintf(fid,'Phi_i_%g%g*i%g = ',i,j,j);  
    end

    for j=1:(cc_Gamma)
      fprintf(fid,'Gamma_%g%g*k%g + ',i,j,j);  
    end
    
    fprintf(fid,'d%g',i);  


    fprintf(fid,'; \n');
    
end

% k(t)=Delta_k*k(t-1)+Theta_k*i(t)                      

for i=1:(rr_Delta_k)
    
    fprintf(fid,'k%g=',i);
    
    for j=1:(cc_Delta_k)
      fprintf(fid,'Delta_k_%g%g*k%g(-1) + ',i,j,j);  
    end

    for j=1:(cc_Theta_k-1)
      fprintf(fid,'Theta_k_%g%g*i%g + ',i,j,j);  
    end
    fprintf(fid,'Theta_k_%g%g*i%g  ',i,cc_Theta_k,cc_Theta_k);
    fprintf(fid,'; \n');
    
end

% [II.2.2] Evolution Preferences
% h(t)=Delta_h*h(t-1)+Theta_h*c(t)                     
for i=1:(rr_Delta_h)
    
    fprintf(fid,'h%g=',i);
    
    for j=1:(cc_Delta_h)
      fprintf(fid,'Delta_h_%g%g*h%g(-1) + ',i,j,j);  
    end

    for j=1:(cc_Theta_k-1)
      fprintf(fid,'Theta_h_%g%g*c%g + ',i,j,j);  
    end
    fprintf(fid,'Theta_h_%g%g*c%g  ',i,cc_Theta_k,cc_Theta_k);
    fprintf(fid,'; \n');
    
end

% s(t)=Lambda*h(t-1)+Pi*c(t)                                                
for i=1:(rr_Lambda)
    
    fprintf(fid,'s%g=',i);
    
    for j=1:(cc_Lambda)
      fprintf(fid,'Lambda_%g%g*h%g(-1) + ',i,j,j);  
    end

    for j=1:(cc_Pi-1)
      fprintf(fid,'Pi_%g%g*c%g + ',i,j,j);  
    end
    fprintf(fid,'Pi_%g%g*c%g  ',i,cc_Theta_k,cc_Theta_k);
    fprintf(fid,'; \n');
    
end
% [II.2.3] Taste and Technology Shocks
% z(t+1)=A22*Z(t)+C2*w(t+1)

if constant==1
for i=2:(rr_A22)    
    fprintf(fid,'z%g=',i);
    
     fprintf(fid,'A22_%g%g*z1 + ',i,1);  
    
    for j=2:(cc_A22)
      fprintf(fid,'A22_%g%g*z%g(-1) + ',i,j,j);  
    end

    for j=1:(cc_C2-1)
      fprintf(fid,'C2_%g%g*(w%g + e%g)+',i,j,j,j);  
    end
    fprintf(fid,'C2_%g%g*(w%g + e%g)',i,cc_C2,cc_C2,cc_C2);
    fprintf(fid,'; \n');    
end
    
else

for i=1:(rr_A22)    
    fprintf(fid,'z%g=',i);
    
    for j=1:(cc_A22)
      fprintf(fid,'A22_%g%g*z%g(-1) + ',i,j,j);  
    end

    for j=1:(cc_C2-1)
      fprintf(fid,'C2_%g%g*w%g + ',i,j,j);  
    end
    fprintf(fid,'C2_%g%g*w%g  ',i,cc_C2,cc_C2);
    fprintf(fid,'; \n');    
end
end

% b(t)=U_b*z(t)
for i=1:(rr_U_b)    
    fprintf(fid,'b%g=',i);
    
    for j=1:(cc_U_b-1)
      fprintf(fid,'U_b_%g%g*z%g + ',i,j,j);  
    end
    fprintf(fid,'U_b_%g%g*z%g',i,cc_U_b,cc_U_b); 
    fprintf(fid,'; \n');
end

% d(t)=U_d*z(t)
for i=1:(rr_U_d)    
    fprintf(fid,'d%g=',i);
    
    for j=1:(cc_U_d-1)
      fprintf(fid,'U_d_%g%g*z%g + ',i,j,j);  
    end
    fprintf(fid,'U_d_%g%g*z%g',i,cc_U_d,cc_U_d); 
    fprintf(fid,'; \n');
end

% [II.2.4] Lagrange Multiplier Section
% -Phi_c'*M_d+Theta'*M_h+Pi'*M_s=0                          
for i=1:(cc_Phi_c)
        
    for j=1:(rr_Phi_c)
      fprintf(fid,'-Phi_c_%g%g*M_d%g + ',j,i,j);  
    end

    for j=1:(rr_Theta_h)
      fprintf(fid,'Theta_h_%g%g*M_h%g + ',j,i,j);  
    end
    
    for j=1:(rr_Pi-1)
      fprintf(fid,'Pi_%g%g*M_s%g + ',j,i,j);  
    end
    fprintf(fid,'Pi_%g%g*M_s%g  ',rr_Pi,i,rr_Pi);
    fprintf(fid,'=0; \n');
    
end

% +g(t)+Phi_g'M_d=0                                         
for i=1:(cc_Phi_g)
        
    fprintf(fid,'g%g + ',i);  

    for j=1:(rr_Phi_g-1)
      fprintf(fid,'Phi_g_%g%g*M_d%g+',j,i,j);  
    end    
    fprintf(fid,'Phi_g_%g%g*M_d%g',rr_Phi_g,i,rr_Phi_g);
    fprintf(fid,'=0; \n');
end

% -M_h+beta*E(Delta_h'M_h(t+1)+Lambda'*M_s(t+1)|J(t))=0     
for i=1:(cc_Delta_h)
    
    fprintf(fid,'-M_h%g + ',i);
    
    for j=1:(rr_Delta_h)
      fprintf(fid,'beta*Delta_h_%g%g*M_h%g(+1) + ',j,i,j);  
    end

    for j=1:(rr_Lambda-1)
      fprintf(fid,'beta*Lambda_%g%g*M_s%g(+1) + ',j,i,j);  
    end
    fprintf(fid,'beta*Lambda_%g%g*M_s%g(+1)  ',rr_Lambda,i,rr_Lambda);
    fprintf(fid,'=0; \n');
    
end


% -Phi_i'*M_d(t)+Theta_k'*M_k(t)=0                          
for i=1:(cc_Phi_i)
        
    for j=1:(rr_Phi_i)
      fprintf(fid,'-Phi_i_%g%g*M_d%g + ',j,i,j);  
    end

    for j=1:(rr_Theta_k-1)
      fprintf(fid,'Theta_k_%g%g*M_k%g + ',j,i,j);  
    end
    fprintf(fid,'Theta_k_%g%g*M_k%g  ',rr_Theta_k,i,rr_Theta_k);
    fprintf(fid,'=0; \n');
    
end

% -M_k'Delta_k+beta*E(Delta_k'M_k(t+1)+Gamma'*M_d(t+1)|J(t))=0      
for i=1:(cc_Delta_k)
    
    fprintf(fid,'-M_k%g + ',i);
    
    for j=1:(rr_Delta_k)
      fprintf(fid,'beta*Delta_k_%g%g*M_k%g(+1) + ',j,i,j);  % <---Check this :)
    end

    for j=1:(rr_Gamma-1)
      fprintf(fid,'beta*Gamma_%g%g*M_d%g(+1) + ',j,i,j);  
    end
    fprintf(fid,'beta*Gamma_%g%g*M_d%g(+1)  ',rr_Gamma,i,rr_Gamma);
    fprintf(fid,'=0; \n');
end

% -s(t)+b(t)-M_s=0                 
for i=1:(rr_Pi)        
    fprintf(fid,'-s%g ',i);  
    fprintf(fid,'+b%g ',i);
    fprintf(fid,'-M_s%g ',i);
    fprintf(fid,'=0; \n');
end

%% Robustness Block
% beta*theta*wt+1 + C2'M_Z       = 0
for i=1:(cc_C2)
    fprintf(fid,'beta*theta*w%g +',i);
    for j=1:(rr_C2-1)
        fprintf(fid,'C2_%g%g*M_z%g +',j,i,j);
    end
    fprintf(fid,'C2_%g%g*M_z%g ',rr_C2,i,rr_C2);
    fprintf(fid,'=0; \n');
end

% -beta*U_d'M_d +beta*E(A22'M_z(t+1))- beta*(s(t+1)-b(t+1))*U_b'*M_z(t+1) - M_z= 0
for i=1:(cc_U_d)
    for j=1:(rr_U_d)
        fprintf(fid,'-beta*U_d_%g%g*M_d%g +',j,i,j);        
    end
    
    for j=1:(rr_A22-1)    
            fprintf(fid,'beta*A22_%g%g*M_z%g(+1) +',j,i,j);
    end
        
    fprintf(fid,'beta*A22_%g%g*M_z%g(+1) -',rr_A22,i,rr_A22);

  
    fprintf(fid,'beta*(s1(+1)-b1(+1))*U_d_1%g*M_z%g(+1) ',i,i);
    

    fprintf(fid,'-M_z%g ',i);
    fprintf(fid,'=0; \n');
end

% end of model declaration
fprintf(fid,'end; \n \n');


fprintf(fid,'shocks; \n');
for i=1:cc_C2
    fprintf(fid,'var e%g; \n',i);
    fprintf(fid,'stderr 1; \n');
end
fprintf(fid,'end; \n \n');
fprintf(fid,'\n');
fprintf(fid,'steady; \n \n');
% fprintf(fid,'stoch_simul(solve_algo=3, periods=%g); \n',irfperiods,periods);
fprintf(fid,'stoch_simul(irf=%g, periods=%g); \n',irfperiods,periods);
fclose(fid);

if (run)
  dynare(filename)
end