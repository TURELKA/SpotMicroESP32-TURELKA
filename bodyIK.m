
function [Tlf,Trf,Tlb,Trb] =  bodyIK(omega,phi,psi,L,W)

   Rx = [1     0           0      0; 
         0 cos(omega) -sin(omega) 0;
         0 sin(omega) cos(omega)  0;
         0     0           0      1];

   Ry = [cos(phi) 0 sin(phi)  0; 
            0     1    0      0;
       -sin(phi)  0  cos(phi) 0;
            0     0    0      1];

   Rz = [cos(psi) -sin(psi) 0 0;
         sin(psi)  cos(psi) 0 0;
           0          0     1 0;
           0          0     0 1];

   
   Rxyz=Rx*Ry*Rz;
   
   Trb = Rxyz * [    1      0     0      -L/2; 
                     0      1     0        0;
                     0      0     1      -W/2;
                     0      0     0        1];
                 
   Trf = Rxyz * [    1      0     0       L/2; 
                     0      1     0        0;
                     0      0     1      -W/2;
                     0      0     0        1];
                 
   Tlf = Rxyz * [    1      0     0       L/2; 
                     0      1     0        0;
                     0      0     1       W/2;
                     0      0     0        1];
   
   Tlb = Rxyz * [    1      0     0      -L/2; 
                     0      1     0        0;
                     0      0     1       W/2;
                     0      0     0        1];

end

