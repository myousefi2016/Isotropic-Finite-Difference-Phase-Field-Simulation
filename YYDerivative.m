function YYDerivative=YYDerivative(Mat,X,Y,Mesh_X,Mesh_Y,MeshY)
    
    Derivative_YY=(1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y)-2*Mat(X+Mesh_X,Y)+Mat(X+Mesh_X,Y-Mesh_Y)+10*Mat(X,Y+Mesh_Y)-2*Mat(X,Y)+Mat(X,Y-Mesh_Y)+Mat(X-Mesh_X,Y+Mesh_Y)-2*Mat(X-Mesh_X,Y)+Mat(X-Mesh_X,Y-Mesh_Y));

	YYDerivative=(Derivative_YY/(pow(MeshY,2)));

end