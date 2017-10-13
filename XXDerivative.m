function XXDerivative=XXDerivative(Mat,X,Y,Mesh_X,Mesh_Y,MeshX)
    
    Derivative_XX=(1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-2*Mat(X,Y+Mesh_Y)+Mat(X-Mesh_X,Y+Mesh_Y)+10*Mat(X+Mesh_X,Y)-2*Mat(X,Y)+Mat(X-Mesh_X,Y)+Mat(X+Mesh_X,Y-Mesh_Y)-2*Mat(X,Y-Mesh_Y)+Mat(X-Mesh_X,Y-Mesh_Y));

	XXDerivative=(Derivative_XX/(pow(MeshX,2)));

end