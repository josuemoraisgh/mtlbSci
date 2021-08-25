function B=moc_angle(A)
//Compute atan(imag(A),real(A)) in radians
// Calling Sequence
//  B=moc_angle(A)
// Description
// Compute atan(imag(A),real(A)) in radians
//Examples
// moc_angle (3 + 4*%i)
B=atan(imag(A),real(A));
endfunction
