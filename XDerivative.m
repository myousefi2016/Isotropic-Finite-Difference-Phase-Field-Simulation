function XDerivative=XDerivative(Mat,X,Y,Mesh_X,Mesh_Y,MeshX)
    
    X_Derivative=(1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-Mat(X-Mesh_X,Y+Mesh_Y)+4*Mat(X+Mesh_X,Y)-Mat(X-Mesh_X,Y)+Mat(X+Mesh_X,Y-Mesh_Y)-Mat(X-Mesh_X,Y-Mesh_Y));

	XDerivative=X_Derivative/MeshX;

end