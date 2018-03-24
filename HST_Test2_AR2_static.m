function [residual, g1, g2] = HST_Test2_AR2_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 16, 1);

%
% Model equations
%

lhs =params(2)*y(1)+params(3)*y(2)+params(4)*y(3);
rhs =params(5)*y(4)+y(5);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =params(6)*y(4)+y(3)*params(7);
residual(2)= lhs-rhs;
lhs =y(6);
rhs =params(8)*y(6)+y(1)*params(9);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =y(6)*params(10)+y(1)*params(11);
residual(4)= lhs-rhs;
lhs =y(9);
rhs =params(17)*params(57)+params(18)*y(9)+params(19)*y(10)+params(20)*y(11)+params(21)*y(12)+params(39)*x(1)+params(40)*x(2);
residual(5)= lhs-rhs;
lhs =y(10);
rhs =params(57)*params(22)+y(9)*params(23)+y(10)*params(24)+y(11)*params(25)+y(12)*params(26)+x(1)*params(41)+x(2)*params(42);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =params(57)*params(27)+y(9)*params(28)+y(10)*params(29)+y(11)*params(30)+y(12)*params(31)+x(1)*params(43)+x(2)*params(44);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =params(57)*params(32)+y(9)*params(33)+y(10)*params(34)+y(11)*params(35)+y(12)*params(36)+x(1)*params(45)+x(2)*params(46);
residual(8)= lhs-rhs;
lhs =y(8);
rhs =params(47)*params(57)+y(9)*params(48)+y(10)*params(49)+y(11)*params(50)+y(12)*params(51);
residual(9)= lhs-rhs;
lhs =y(5);
rhs =params(57)*params(52)+y(9)*params(53)+y(10)*params(54)+y(11)*params(55)+y(12)*params(56);
residual(10)= lhs-rhs;
lhs =(-params(2))*y(13)+params(9)*y(14)+params(11)*y(16);
rhs =0;
residual(11)= lhs-rhs;
lhs =y(2)+params(3)*y(13);
rhs =0;
residual(12)= lhs-rhs;
lhs =(-y(14))+params(8)*params(1)*y(14)+params(10)*params(1)*y(16);
rhs =0;
residual(13)= lhs-rhs;
lhs =y(13)*(-params(4))+params(7)*y(15);
rhs =0;
residual(14)= lhs-rhs;
lhs =(-y(15))+params(6)*params(1)*y(15)+params(5)*params(1)*y(13);
rhs =0;
residual(15)= lhs-rhs;
lhs =y(8)+(-y(7))-y(16);
rhs =0;
residual(16)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(16, 16);

%
% Jacobian matrix
%

  g1(1, 1)=  g1(1, 1)+params(2);
  g1(1, 2)=  g1(1, 2)+params(3);
  g1(1, 3)=  g1(1, 3)+params(4);
  g1(1, 4)=  g1(1, 4)+(-params(5));
  g1(1, 5)=  g1(1, 5)+(-1);
  g1(2, 3)=  g1(2, 3)+(-params(7));
  g1(2, 4)=  g1(2, 4)+1;
  g1(2, 4)=  g1(2, 4)+(-params(6));
  g1(3, 1)=  g1(3, 1)+(-params(9));
  g1(3, 6)=  g1(3, 6)+1;
  g1(3, 6)=  g1(3, 6)+(-params(8));
  g1(4, 1)=  g1(4, 1)+(-params(11));
  g1(4, 6)=  g1(4, 6)+(-params(10));
  g1(4, 7)=  g1(4, 7)+1;
  g1(5, 9)=  g1(5, 9)+1;
  g1(5, 9)=  g1(5, 9)+(-params(18));
  g1(5, 10)=  g1(5, 10)+(-params(19));
  g1(5, 11)=  g1(5, 11)+(-params(20));
  g1(5, 12)=  g1(5, 12)+(-params(21));
  g1(6, 9)=  g1(6, 9)+(-params(23));
  g1(6, 10)=  g1(6, 10)+(-params(24));
  g1(6, 11)=  g1(6, 11)+(-params(25));
  g1(6, 12)=  g1(6, 12)+(-params(26));
  g1(6, 10)=  g1(6, 10)+1;
  g1(7, 9)=  g1(7, 9)+(-params(28));
  g1(7, 10)=  g1(7, 10)+(-params(29));
  g1(7, 11)=  g1(7, 11)+(-params(30));
  g1(7, 12)=  g1(7, 12)+(-params(31));
  g1(7, 11)=  g1(7, 11)+1;
  g1(8, 9)=  g1(8, 9)+(-params(33));
  g1(8, 10)=  g1(8, 10)+(-params(34));
  g1(8, 11)=  g1(8, 11)+(-params(35));
  g1(8, 12)=  g1(8, 12)+(-params(36));
  g1(8, 12)=  g1(8, 12)+1;
  g1(9, 9)=  g1(9, 9)+(-params(48));
  g1(9, 10)=  g1(9, 10)+(-params(49));
  g1(9, 11)=  g1(9, 11)+(-params(50));
  g1(9, 12)=  g1(9, 12)+(-params(51));
  g1(9, 8)=  g1(9, 8)+1;
  g1(10, 5)=  g1(10, 5)+1;
  g1(10, 9)=  g1(10, 9)+(-params(53));
  g1(10, 10)=  g1(10, 10)+(-params(54));
  g1(10, 11)=  g1(10, 11)+(-params(55));
  g1(10, 12)=  g1(10, 12)+(-params(56));
  g1(11, 13)=  g1(11, 13)+(-params(2));
  g1(11, 14)=  g1(11, 14)+params(9);
  g1(11, 16)=  g1(11, 16)+params(11);
  g1(12, 2)=  g1(12, 2)+1;
  g1(12, 13)=  g1(12, 13)+params(3);
  g1(13, 14)=  g1(13, 14)+(-1);
  g1(13, 14)=  g1(13, 14)+params(8)*params(1);
  g1(13, 16)=  g1(13, 16)+params(10)*params(1);
  g1(14, 13)=  g1(14, 13)+(-params(4));
  g1(14, 15)=  g1(14, 15)+params(7);
  g1(15, 15)=  g1(15, 15)+(-1);
  g1(15, 15)=  g1(15, 15)+params(6)*params(1);
  g1(15, 13)=  g1(15, 13)+params(5)*params(1);
  g1(16, 7)=  g1(16, 7)+(-1);
  g1(16, 8)=  g1(16, 8)+1;
  g1(16, 16)=  g1(16, 16)+(-1);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
