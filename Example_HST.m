%% Example file that converts a matrix form of Hansen, Sargent, Tallarini in Hansen
%% Sargent Setup, and Creates a Dynare code that solves the model. 
clear all;
clc;
% Models are written in accordance to the following notation:
% Max RETURN FUNCTION: -1/2*(s(t)-b(t))(s(t)-b(t))+g(t)g(t)

% CONSTRAINTS (Notation is Latex Compatible with HS Manuscript)
% [1] Technology Block
% Phi_c*c(t)+Phi_g*g(t)+Phi_i*i(t)=Gamma*k(t-1)+d(t)   
% k(t)=Delta_k*k(t-1)+Theta_k*i(t)                      
%
% [2] Evolution of Preferences
% h(t)=Delta_h*h(t-1)+Theta_h*c(t)                     
% s(t)=Lambda*h(t-1)+Pi*c(t)                           

% [3] Taste and Technology Shocks
% z(t+1)=A22*Z(t)+C2*w(t+1)
% b(t)=U_b*z(t)
% d(t)=U_d*z(t)

% [4] First Order Conditions
% -Phi_c'*M_d+Theta'*M_h+Pi'*M_s=0                          
% -g(t)+Phi_g'M_d=0                                         
% -M_h+beta*E(Delta_h'M_h(t+1)+Lambda'*M_s(t+1)|J(t))=0     
% -Phi_i'*M_d(t)+Theta_k'*M_k(t)=0                          
% -M_k+beta*E(Delta_k'M_k(t+1)+Gamma'*M_d(t+1)|J(t))=0      
% -s(t)+b(t)+M_s=0                                          

%% Input Model in this Section 
% Deep Parameters
delta=0.05      ;
beta=1/1.05     ;
theta=10     ;

% Matrix Form
Phi_c=1             ; 
Phi_g=0             ;
Phi_i=1             ;
Gamma=0.1           ;
Delta_k=1-delta     ;
Theta_k=1           ;                      
Delta_h=0           ; 
Theta_h=1           ;
Lambda=0            ;
Pi=1                ;                           
A22=[1 0 0 0 0; 0 0.1 0.2 0 0; 0 1 0 0 0; 0 0 0 0.1 0.2; 0 0 0 1 0];
C2=[0 0; 1 0; 0 0; 0 1; 0 0]        ;
U_b=[30 0 0 0 0]                    ;
U_d=[5 1 0 1 0]                     ;

%% User Preferences for Dynare
periods=500 ;        %parameters for simulation 
irfperiods=10;        %parameters for irf's
filename='HST_Test2_AR2.mod'; %pick filename for mod file
% Optional: decide whether or not you want to directly execute the generated dynare
%code (set run=1 to execute)
run=1;
constant=1; %set=1 if first element of z vector is a constant

%% Call the Hansen Sargent converter:
%HS_Robust_dyn;
HSLQ_dyn
% Figure Plot
% figure();
% subplot(1,2,1);
% plot([1:15],[c1_e1']);
