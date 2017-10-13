function Theta=Theta(Mat,X,Y,Mesh_X,Mesh_Y)
    
    if ((1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-Mat(X-Mesh_X,Y+Mesh_Y)+4*Mat(X+Mesh_X,Y)-Mat(X-Mesh_X,Y)+Mat(X+Mesh_X,Y-Mesh_Y)-Mat(X-Mesh_X,Y-Mesh_Y))~=0 || (1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-Mat(X+Mesh_X,Y-Mesh_Y)+4*Mat(X,Y+Mesh_Y)-Mat(X,Y-Mesh_Y)+Mat(X-Mesh_X,Y+Mesh_Y)-Mat(X-Mesh_X,Y-Mesh_Y))~=0)
        Theta=atan(((1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-Mat(X+Mesh_X,Y-Mesh_Y)+4*Mat(X,Y+Mesh_Y)-Mat(X,Y-Mesh_Y)+Mat(X-Mesh_X,Y+Mesh_Y)-Mat(X-Mesh_X,Y-Mesh_Y)))/((1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-Mat(X-Mesh_X,Y+Mesh_Y)+4*Mat(X+Mesh_X,Y)-Mat(X-Mesh_X,Y)+Mat(X+Mesh_X,Y-Mesh_Y)-Mat(X-Mesh_X,Y-Mesh_Y))));
    elseif ((1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-Mat(X-Mesh_X,Y+Mesh_Y)+4*Mat(X+Mesh_X,Y)-Mat(X-Mesh_X,Y)+Mat(X+Mesh_X,Y-Mesh_Y)-Mat(X-Mesh_X,Y-Mesh_Y))==0 && (1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-Mat(X+Mesh_X,Y-Mesh_Y)+4*Mat(X,Y+Mesh_Y)-Mat(X,Y-Mesh_Y)+Mat(X-Mesh_X,Y+Mesh_Y)-Mat(X-Mesh_X,Y-Mesh_Y))==0)
        Theta=0;
    end
	
end