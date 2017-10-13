function DF=DF(phi,u,lambda)

	F =-phi * (1 - (phi^2)) + lambda * u * (((1 - (phi^2))^2)); 

	DF=F;
    
end