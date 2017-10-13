function D_B=D_B(Theta,epsilon,k)

	DDB=(((-k * epsilon * sin(k * Theta))^2)) + (1 + epsilon *cos(k * Theta)) * (-((k^2)) * epsilon * cos(k * Theta));

	D_B=DDB;
    
end