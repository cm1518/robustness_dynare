
 var c1 g1 i1 k1 d1 h1 s1 b1 z2 z3 z4 z5 M_d1 M_h1 M_k1 M_s1 ; 
 
 
varexo w1 w2 ; 
 
 
parameters beta Phi_c_11  Phi_g_11  Phi_i_11 Gamma_11 Delta_k_11 Theta_k_11 Delta_h_11 Theta_h_11 Lambda_11 Pi_11 A22_11 A22_12 A22_13 A22_14 A22_15 A22_21 A22_22 A22_23 A22_24 A22_25 A22_31 A22_32 A22_33 A22_34 A22_35 A22_41 A22_42 A22_43 A22_44 A22_45 A22_51 A22_52 A22_53 A22_54 A22_55 C2_11 C2_12 C2_21 C2_22 C2_31 C2_32 C2_41 C2_42 C2_51 C2_52 U_b_11 U_b_12 U_b_13 U_b_14 U_b_15 U_d_11 U_d_12 U_d_13 U_d_14 U_d_15 z1 ; 
 
beta=0.952381 ;
Phi_c_11 =1 ;
 Phi_g_11 =0 ;
 Phi_i_11 =1 ;
Gamma_11 =0.1 ;
Delta_k_11 =0.95 ;
Theta_k_11 =1 ;
Delta_h_11 =0 ;
Theta_h_11 =1 ;
Lambda_11 =0 ;
Pi_11 =1 ;
A22_11 =1 ;
A22_12 =0 ;
A22_13 =0 ;
A22_14 =0 ;
A22_15 =0 ;
A22_21 =0 ;
A22_22 =0.1 ;
A22_23 =0.2 ;
A22_24 =0 ;
A22_25 =0 ;
A22_31 =0 ;
A22_32 =1 ;
A22_33 =0 ;
A22_34 =0 ;
A22_35 =0 ;
A22_41 =0 ;
A22_42 =0 ;
A22_43 =0 ;
A22_44 =0.1 ;
A22_45 =0.2 ;
A22_51 =0 ;
A22_52 =0 ;
A22_53 =0 ;
A22_54 =1 ;
A22_55 =0 ;
C2_11 =0 ;
C2_12 =0 ;
C2_21 =1 ;
C2_22 =0 ;
C2_31 =0 ;
C2_32 =0 ;
C2_41 =0 ;
C2_42 =1 ;
C2_51 =0 ;
C2_52 =0 ;
U_b_11 =30 ;
U_b_12 =0 ;
U_b_13 =0 ;
U_b_14 =0 ;
U_b_15 =0 ;
U_d_11 =5 ;
U_d_12 =1 ;
U_d_13 =0 ;
U_d_14 =1 ;
U_d_15 =0 ;
z1=1; 
  
 model(linear); 
Phi_c_11*c1 + Phi_g_11*g1 + Phi_i_11*i1 = Gamma_11*k1 + d1; 
k1=Delta_k_11*k1(-1) + Theta_k_11*i1  ; 
h1=Delta_h_11*h1(-1) + Theta_h_11*c1  ; 
s1=Lambda_11*h1(-1) + Pi_11*c1  ; 
z2=A22_21*z1(-1) + A22_22*z2(-1) + A22_23*z3(-1) + A22_24*z4(-1) + A22_25*z5(-1) + C2_21*w1 + C2_22*w2  ; 
z3=A22_31*z1(-1) + A22_32*z2(-1) + A22_33*z3(-1) + A22_34*z4(-1) + A22_35*z5(-1) + C2_31*w1 + C2_32*w2  ; 
z4=A22_41*z1(-1) + A22_42*z2(-1) + A22_43*z3(-1) + A22_44*z4(-1) + A22_45*z5(-1) + C2_41*w1 + C2_42*w2  ; 
z5=A22_51*z1(-1) + A22_52*z2(-1) + A22_53*z3(-1) + A22_54*z4(-1) + A22_55*z5(-1) + C2_51*w1 + C2_52*w2  ; 
b1=U_b_11*z1 + U_b_12*z2 + U_b_13*z3 + U_b_14*z4 + U_b_15*z5; 
d1=U_d_11*z1 + U_d_12*z2 + U_d_13*z3 + U_d_14*z4 + U_d_15*z5; 
-Phi_c_11*M_d1 + Theta_h_11*M_h1 + Pi_11*M_s1  =0; 
g1 + Phi_g_11*M_d1=0; 
-M_h1 + beta*Delta_h_11*M_h1(+1) + beta*Lambda_11*M_s1(+1)  =0; 
-Phi_i_11*M_d1 + Theta_k_11*M_k1  =0; 
-M_k1 + beta*Delta_k_11*M_k1(+1) + beta*Gamma_11*M_d1(+1)  =0; 
-s1 +b1 -M_s1 =0; 
end; 
 
shocks; 
var w1; 
stderr 1; 
var w2; 
stderr 1; 
end; 
 

steady; 
 
stoch_simul(irf=10, periods=500); 
