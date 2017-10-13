function DDf_A=DDf_A(Theta,epsilon,k)

	DDA=-(pow(k,2)) * epsilon * cos(k * Theta);

	DDf_A=DDA;
    
end