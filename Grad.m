function Grad=Grad(Mat,X,Y,Mesh_X,Mesh_Y,MeshX,MeshY)

    Gradiant.X=(1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-Mat(X-Mesh_X,Y+Mesh_Y)+4*Mat(X+Mesh_X,Y)-Mat(X-Mesh_X,Y)+Mat(X+Mesh_X,Y-Mesh_Y)-Mat(X-Mesh_X,Y-Mesh_Y));
    Gradiant.Y=(1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-Mat(X+Mesh_X,Y-Mesh_Y)+4*Mat(X,Y+Mesh_Y)-Mat(X,Y-Mesh_Y)+Mat(X-Mesh_X,Y+Mesh_Y)-Mat(X-Mesh_X,Y-Mesh_Y));

	Grad.X=Gradiant.X/MeshX;
    Grad.Y=Gradiant.Y/MeshY;

end