clear all; clc;
%% параметры тела робота

L = 120;
W = 90;

%% наклон тела робота
%% you can change angles here
omega = (pi/2)+ 0;    %крен
phi = (0) + 0;         %рысанье
psi = (0) + pi/10;         %тангаж

%% параметры ноги робота

l1 = 10.0;
l2 = 60.5;
l3 = 111.126;
l4 = 138.5;

%% начальные углы сочленений ног робота
%% you can change angles here
q1 = -10;
q2 = -15;
q3 = 30;

%% вызов функций построения тела

[Tlf,Trf,Tlb,Trb] = bodyIK(omega,phi,psi,L,W);


x=[Tlf(1,4) Trf(1,4) Trb(1,4) Tlb(1,4) Tlf(1,4) ];
y=[Tlf(2,4) Trf(2,4) Trb(2,4) Tlb(2,4) Tlf(2,4) ];
z=[Tlf(3,4) Trf(3,4) Trb(3,4) Tlb(3,4) Tlf(3,4) ];
plot3(x, y, z,'*-b'); 
grid on; hold on;
xlabel('x');ylabel('y');zlabel('z')
x=[Tlf(1,4) Trf(1,4)];
y=[Tlf(2,4) Trf(2,4)];
z=[Tlf(3,4) Trf(3,4)];
plot3(x, y, z,'*-c'); 
%% прямая задача кинематики для начальной стойки
%% you can change angles here
[x,y,z] = PZK(q1,q2,q3+45,Tlb,0);
plot3(x, y, z,'*-r');
axis equal;
hold("on");
[x,y,z] = PZK(q1,q2,q3,Tlf,0);
plot3(x, y, z,'*-r');
axis equal;
hold("on");
[x,y,z] = PZK(q1,q2,q3,Trf,1);
plot3(x, y, z,'*-r');
axis equal;
hold("on");
[x,y,z] = PZK(q1,q2,q3,Trb,1);
plot3(x, y, z,'*-r');
axis equal;
hold("on");


