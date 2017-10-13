Mesh_X = 1;
Mesh_Y = 1;
MeshX = 1;
MeshY = 1;
WidthX = 299;
HeightY = 299;
CenterX = (WidthX - 1) / 2;
CenterY = (HeightY - 1) / 2;
a1 = 1.25 / (sqrt(2.0));
a2 = 0.64;
epsilon = 0.05;
k = 6;
beta0 = 0;
W0 = 1;
D = 2;
d0 = 0.5;
lambda = (W0 * a1) / d0;
tau0 = (((W0^3) * a1 * a2) / (d0 * D)) + (((W0^2) * beta0) / d0);
delta = 0.8;
r0 = 5;
deltaT = 0.1;
phi_OLD = zeros(WidthX,HeightY);
phi_NEW = zeros(WidthX,HeightY);
u_OLD=zeros(WidthX,HeightY);
u_NEW=zeros(WidthX,HeightY);
Theta_1=zeros(WidthX,HeightY);

%Initial Condition
 for X = 1:WidthX
    for Y = 1:HeightY
        
        r=sqrt((X-CenterX)^2+(Y-CenterY)^2);
        
        if r < r0
            phi_OLD(X,Y)=1;
            u_OLD(X,Y)=0;
        elseif r>=r0
            phi_OLD(X,Y)=-1;
            u_OLD(X,Y)=-delta*(1-exp((-r-r0)));
        end
        
    end
 end
%Initial Condition
max_phi=max(phi_OLD(:));
min_u=min(u_OLD(:));
index_phi=100/max_phi;
index_u=100/min_u;
figure(1)
image(phi_OLD*index_phi)
colormap('jet')
figure(2)
image(u_OLD*index_u)
colormap('jet')

for t=1:4000

for X=1:WidthX
 for Y=1:HeightY
     			
     if (X>1 && Y>1)
         if (X<WidthX && Y<HeightY)
		Theta_1(X,Y)=Theta(phi_OLD,X,Y,Mesh_X,Mesh_Y);
         end
     end
        
 end
end

for X=1:WidthX
    for Y=1:HeightY
        
        if (X>1 && Y>1)
            if(X<WidthX && Y<HeightY)
                phi_NEW(X,Y)=phi_OLD(X,Y)+(deltaT/Tau(Theta_1(X,Y),epsilon,k,tau0))*(2*(W0^2)*B(Theta_1(X,Y),epsilon,k)*Inner_Multiply(Grad(phi_OLD,X,Y,Mesh_X,Mesh_Y,MeshX,MeshY),Grad(Theta_1,X,Y,Mesh_X,Mesh_Y,MeshX,MeshY))+(W0^2)*(f_A(Theta_1(X,Y),epsilon,k)^2)*Laplacian(phi_OLD,X,Y,Mesh_X,Mesh_Y,MeshX,MeshY)+(W0^2)*D_B(Theta_1(X,Y),epsilon,k)*Outter_Multiply(Grad(phi_OLD,X,Y,Mesh_X,Mesh_Y,MeshX,MeshY),Grad(Theta_1,X,Y,Mesh_X,Mesh_Y,MeshX,MeshY))-DF(phi_OLD(X,Y),u_OLD(X,Y),lambda));
            end
        end
        
    end
end

for X=1:WidthX
    for Y=1:HeightY
        
        if (X>1 && Y>1)
            if(X<WidthX && Y<HeightY)
                u_NEW(X,Y)=u_OLD(X,Y)+D*deltaT*Laplacian(u_OLD,X,Y,Mesh_X,Mesh_Y,MeshX,MeshY)+(0.5)*(phi_NEW(X,Y)-phi_OLD(X,Y));
            end
        end
        
    end
end

%Boundary Conditions

for X=1:WidthX
    for Y=1:HeightY
        
        if (X==1 && Y~=1 && Y~=HeightY)
            phi_NEW(X,Y)=phi_NEW(X+1,Y);
        elseif (Y==1 && X~=1 && X~=WidthX)
            phi_NEW(X,Y)=phi_NEW(X,Y+1);
        end
        
    end
end

phi_NEW(1,1)= (phi_NEW(2, 1) + phi_NEW(1, 2)) / 2;

for X=1:WidthX
    for Y=1:HeightY
        
        if (X==WidthX && Y~=1 && Y~=HeightY)
            phi_NEW(X,Y)=phi_NEW(1,Y);
        elseif (Y==HeightY && X~=1 && X~=WidthX)
            phi_NEW(X,Y)=phi_NEW(X,1);
        end
        
    end
end

phi_NEW(WidthX, 1) = (phi_NEW(WidthX - 1, 1) + phi_NEW(WidthX, 2)) / 2;
phi_NEW(WidthX, HeightY) = (phi_NEW(WidthX, HeightY - 1) + phi_NEW(WidthX - 1, HeightY)) / 2;
phi_NEW(1, HeightY) = (phi_NEW(1, HeightY - 1) + phi_NEW(2, HeightY)) / 2;

for X=1:WidthX
    for Y=1:HeightY
        
        if (X==1 && Y~=1 && Y~=HeightY)
            u_NEW(X,Y)=u_NEW(X+1,Y);
        elseif (Y==1 && X~=1 && X~=WidthX)
            u_NEW(X,Y)=u_NEW(X,Y+1);
        end
        
    end
end

u_NEW(1,1)= (u_NEW(2, 1) + u_NEW(1, 2)) / 2;

for X=1:WidthX
    for Y=1:HeightY
        
        if (X==WidthX && Y~=1 && Y~=HeightY)
            u_NEW(X,Y)=u_NEW(1,Y);
        elseif (Y==HeightY && X~=1 && X~=WidthX)
            u_NEW(X,Y)=u_NEW(X,1);
        end
        
    end
end

u_NEW(WidthX, 1) = (u_NEW(WidthX - 1, 1) + u_NEW(WidthX, 2)) / 2;
u_NEW(WidthX, HeightY) = (u_NEW(WidthX, HeightY - 1) + u_NEW(WidthX - 1, HeightY)) / 2;
u_NEW(1, HeightY) = (u_NEW(1, HeightY - 1) + u_NEW(2, HeightY)) / 2;

%Boundary Conditions

for X=1:WidthX
    for Y=1:HeightY
        
         phi_OLD(X,Y)=phi_NEW(X,Y);
         u_OLD(X,Y)=u_NEW(X,Y);

    end
end

max_phi=max(phi_OLD(:));
min_u=min(u_OLD(:));
index_phi=100/max_phi;
index_u=100/min_u;
figure(3)
image(phi_OLD*index_phi)
colormap('jet')
figure(4)
image(u_OLD*index_u)
colormap('jet')

end
					
                    

