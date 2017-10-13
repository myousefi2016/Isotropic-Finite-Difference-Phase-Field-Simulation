function B=B(Theta,epsilon,k)

	DB=(1 + epsilon *cos(k * Theta)) * (-k * epsilon * sin(k * Theta));

	B=DB;
    
end