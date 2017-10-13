function Divergence=Divergence(Mat,X,Y,Mesh_X,Mesh_Y,MeshX,MeshY)

    DivergenceX=(1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y).X-Mat(X-Mesh_X,Y+Mesh_Y).X+4*Mat(X+Mesh_X,Y).X-Mat(X-Mesh_X,Y).X+Mat(X+Mesh_X,Y-Mesh_Y).X-Mat(X-Mesh_X,Y-Mesh_Y).X);
    DivergenceY=(1.0/12.0)*(Mat(X+Mesh_X,Y+Mesh_Y).Y-Mat(X+Mesh_X,Y-Mesh_Y).Y+4*Mat(X,Y+Mesh_Y).Y-Mat(X,Y-Mesh_Y).Y+Mat(X-Mesh_X,Y+Mesh_Y).Y-Mat(X-Mesh_X,Y-Mesh_Y).Y);

	Divergence_1=(DivergenceX/MeshX)+(DivergenceY/MeshY);

Divergence=Divergence_1;

end