function Laplacian=Laplacian(Mat,X,Y,Mesh_X,Mesh_Y,MeshX,MeshY)
    
    LaplacianX=(1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-2*Mat(X,Y+Mesh_Y)+Mat(X-Mesh_X,Y+Mesh_Y)+10*Mat(X+Mesh_X,Y)-2*Mat(X,Y)+Mat(X-Mesh_X,Y)+Mat(X+Mesh_X,Y-Mesh_Y)-2*Mat(X,Y-Mesh_Y)+Mat(X-Mesh_X,Y-Mesh_Y));
    LaplacianY=(1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-2*Mat(X+Mesh_X,Y)+Mat(X+Mesh_X,Y-Mesh_Y)+10*Mat(X,Y+Mesh_Y)-2*Mat(X,Y)+Mat(X,Y-Mesh_Y)+Mat(X-Mesh_X,Y+Mesh_Y)-2*Mat(X-Mesh_X,Y)+Mat(X-Mesh_X,Y-Mesh_Y));

	Laplacian=(LaplacianX/((MeshX^2)))+(LaplacianY/((MeshY^2)));

end