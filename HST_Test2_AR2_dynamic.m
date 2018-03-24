function [residual, g1, g2, g3] = HST_Test2_AR2_dynamic(y, x, params, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(16, 1);
lhs =params(2)*y(7)+params(3)*y(8)+params(4)*y(9);
rhs =params(5)*y(10)+y(11);
residual(1)= lhs-rhs;
lhs =y(10);
rhs =params(6)*y(1)+y(9)*params(7);
residual(2)= lhs-rhs;
lhs =y(12);
rhs =params(8)*y(2)+y(7)*params(9);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =y(2)*params(10)+y(7)*params(11);
residual(4)= lhs-rhs;
lhs =y(15);
rhs =params(17)*params(57)+params(18)*y(3)+params(19)*y(4)+params(20)*y(5)+params(21)*y(6)+params(39)*x(it_, 1)+params(40)*x(it_, 2);
residual(5)= lhs-rhs;
lhs =y(16);
rhs =params(57)*params(22)+y(3)*params(23)+y(4)*params(24)+y(5)*params(25)+y(6)*params(26)+x(it_, 1)*params(41)+x(it_, 2)*params(42);
residual(6)= lhs-rhs;
lhs =y(17);
rhs =params(57)*params(27)+y(3)*params(28)+y(4)*params(29)+y(5)*params(30)+y(6)*params(31)+x(it_, 1)*params(43)+x(it_, 2)*params(44);
residual(7)= lhs-rhs;
lhs =y(18);
rhs =params(57)*params(32)+y(3)*params(33)+y(4)*params(34)+y(5)*params(35)+y(6)*params(36)+x(it_, 1)*params(45)+x(it_, 2)*params(46);
residual(8)= lhs-rhs;
lhs =y(14);
rhs =params(47)*params(57)+y(15)*params(48)+y(16)*params(49)+y(17)*params(50)+y(18)*params(51);
residual(9)= lhs-rhs;
lhs =y(11);
rhs =params(57)*params(52)+y(15)*params(53)+y(16)*params(54)+y(17)*params(55)+y(18)*params(56);
residual(10)= lhs-rhs;
lhs =(-params(2))*y(19)+params(9)*y(20)+params(11)*y(22);
rhs =0;
residual(11)= lhs-rhs;
lhs =y(8)+params(3)*y(19);
rhs =0;
residual(12)= lhs-rhs;
lhs =(-y(20))+params(8)*params(1)*y(24)+params(10)*params(1)*y(26);
rhs =0;
residual(13)= lhs-rhs;
lhs =y(19)*(-params(4))+params(7)*y(21);
rhs =0;
residual(14)= lhs-rhs;
lhs =(-y(21))+params(6)*params(1)*y(25)+params(5)*params(1)*y(23);
rhs =0;
residual(15)= lhs-rhs;
lhs =y(14)+(-y(13))-y(22);
rhs =0;
residual(16)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(16, 28);

%
% Jacobian matrix
%

  g1(1, 7)=  g1(1, 7)+params(2);
  g1(1, 8)=  g1(1, 8)+params(3);
  g1(1, 9)=  g1(1, 9)+params(4);
  g1(1, 10)=  g1(1, 10)+(-params(5));
  g1(1, 11)=  g1(1, 11)+(-1);
  g1(2, 9)=  g1(2, 9)+(-params(7));
  g1(2, 10)=  g1(2, 10)+1;
  g1(2, 1)=  g1(2, 1)+(-params(6));
  g1(3, 7)=  g1(3, 7)+(-params(9));
  g1(3, 12)=  g1(3, 12)+1;
  g1(3, 2)=  g1(3, 2)+(-params(8));
  g1(4, 7)=  g1(4, 7)+(-params(11));
  g1(4, 2)=  g1(4, 2)+(-params(10));
  g1(4, 13)=  g1(4, 13)+1;
  g1(5, 15)=  g1(5, 15)+1;
  g1(5, 3)=  g1(5, 3)+(-params(18));
  g1(5, 4)=  g1(5, 4)+(-params(19));
  g1(5, 5)=  g1(5, 5)+(-params(20));
  g1(5, 6)=  g1(5, 6)+(-params(21));
  g1(5, 27)=  g1(5, 27)+(-params(39));
  g1(5, 28)=  g1(5, 28)+(-params(40));
  g1(6, 3)=  g1(6, 3)+(-params(23));
  g1(6, 4)=  g1(6, 4)+(-params(24));
  g1(6, 5)=  g1(6, 5)+(-params(25));
  g1(6, 6)=  g1(6, 6)+(-params(26));
  g1(6, 27)=  g1(6, 27)+(-params(41));
  g1(6, 28)=  g1(6, 28)+(-params(42));
  g1(6, 16)=  g1(6, 16)+1;
  g1(7, 3)=  g1(7, 3)+(-params(28));
  g1(7, 4)=  g1(7, 4)+(-params(29));
  g1(7, 5)=  g1(7, 5)+(-params(30));
  g1(7, 6)=  g1(7, 6)+(-params(31));
  g1(7, 27)=  g1(7, 27)+(-params(43));
  g1(7, 28)=  g1(7, 28)+(-params(44));
  g1(7, 17)=  g1(7, 17)+1;
  g1(8, 3)=  g1(8, 3)+(-params(33));
  g1(8, 4)=  g1(8, 4)+(-params(34));
  g1(8, 5)=  g1(8, 5)+(-params(35));
  g1(8, 6)=  g1(8, 6)+(-params(36));
  g1(8, 27)=  g1(8, 27)+(-params(45));
  g1(8, 28)=  g1(8, 28)+(-params(46));
  g1(8, 18)=  g1(8, 18)+1;
  g1(9, 15)=  g1(9, 15)+(-params(48));
  g1(9, 16)=  g1(9, 16)+(-params(49));
  g1(9, 17)=  g1(9, 17)+(-params(50));
  g1(9, 18)=  g1(9, 18)+(-params(51));
  g1(9, 14)=  g1(9, 14)+1;
  g1(10, 11)=  g1(10, 11)+1;
  g1(10, 15)=  g1(10, 15)+(-params(53));
  g1(10, 16)=  g1(10, 16)+(-params(54));
  g1(10, 17)=  g1(10, 17)+(-params(55));
  g1(10, 18)=  g1(10, 18)+(-params(56));
  g1(11, 19)=  g1(11, 19)+(-params(2));
  g1(11, 20)=  g1(11, 20)+params(9);
  g1(11, 22)=  g1(11, 22)+params(11);
  g1(12, 8)=  g1(12, 8)+1;
  g1(12, 19)=  g1(12, 19)+params(3);
  g1(13, 20)=  g1(13, 20)+(-1);
  g1(13, 24)=  g1(13, 24)+params(8)*params(1);
  g1(13, 26)=  g1(13, 26)+params(10)*params(1);
  g1(14, 19)=  g1(14, 19)+(-params(4));
  g1(14, 21)=  g1(14, 21)+params(7);
  g1(15, 21)=  g1(15, 21)+(-1);
  g1(15, 25)=  g1(15, 25)+params(6)*params(1);
  g1(15, 23)=  g1(15, 23)+params(5)*params(1);
  g1(16, 13)=  g1(16, 13)+(-1);
  g1(16, 14)=  g1(16, 14)+1;
  g1(16, 22)=  g1(16, 22)+(-1);
end
if nargout >= 3,
  g2 = sparse([],[],[], 16, 784, 3920);

%
% Hessian matrix
%

end;
