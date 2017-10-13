function Tau=Tau(Theta,epsilon,k,tau0)

	DTau=tau0 * (((1 + epsilon *cos(k * Theta))^2));

	Tau=DTau;
    
end