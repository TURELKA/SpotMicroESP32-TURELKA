function [CoordinateX,CoordinateY,CoordinateZ] = PZK(q1,q2,q3,T,LorR) 
%% Параметры Денавита-Хартенберга
Q = [q1 0 q2 q3]*pi/180;
alpha =[90 0 0 0]*pi/180;
a=[0 60.5 0 0];
d=[10 0 111.126 138.5];
%% Проверка левый правый
if LorR == 1 
    a(2)=-a(2);
    Q(1)= -Q(1);

end
%% Нахождение матриц 

A = zeros(4,4,5);
            
for i=1:4
                A(:,:,i)= [cos(Q(i))  -cos(alpha(i))*sin(Q(i))  sin(alpha(i))*sin(Q(i))   d(i)*cos(Q(i));
                           sin(Q(i))   cos(alpha(i))*cos(Q(i))   -sin(alpha(i))*cos(Q(i))  d(i)*sin(Q(i));
                              0             sin(alpha(i))             cos(alpha(i))            a(i);
                              0                0                     0                           1];
end

Rx = [1     0           0      0; 
      0 cos(-pi/2) -sin(-pi/2) 0;
      0 sin(-pi/2) cos(-pi/2)  0;
      0     0           0      1];

Ry =  [cos(pi/2) 0 sin(pi/2)  0; 
          0     1    0      0;
     -sin(pi/2)  0  cos(pi/2) 0;
          0     0    0      1];

A(:,:,1)=T*Rx*Ry*A(:,:,1);
T20 = A(:,:,1) * A(:,:,2);
T30 = A(:,:,1) * A(:,:,2) * A(:,:,3);
T40 = A(:,:,1) * A(:,:,2) * A(:,:,3)* A(:,:,4);

%% ВЫВОД КООРДИНАТ

CoordinateX = [T(1,4) A(1,4,1) T20(1,4) T30(1,4) T40(1,4) ];
CoordinateY = [T(2,4) A(2,4,1) T20(2,4) T30(2,4) T40(2,4) ]; 
CoordinateZ = [T(3,4) A(3,4,1) T20(3,4) T30(3,4) T40(3,4) ]; 

end