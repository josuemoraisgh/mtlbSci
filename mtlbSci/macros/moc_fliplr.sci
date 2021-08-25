function y = moc_fliplr(x)
//Return a copy of X with the order of the columns reversed.
//Calling Sequence
//y = moc_fliplr(x)
//Description
//     Return a copy of X with the order of the columns reversed.  In
//     other words, X is flipped left-to-right about a vertical axis.  For
//     Note that 'fliplr' only works with 2-D arrays.
// Examples
//  moc_fliplr ([1, 2; 3, 4])

if ndims(x)~=2, 
disp('X must be a 2-D matrix!')
end

y = x(:,$:-1:1);
endfunction

// %!assert((fliplr ([1, 2; 3, 4]) == [2, 1; 4, 3]
// %! && fliplr ([1, 2; 3, 4; 5, 6]) == [2, 1; 4, 3; 6, 5]
// %! && fliplr ([1, 2, 3; 4, 5, 6]) == [3, 2, 1; 6, 5, 4]));
// 
// %!error fliplr();
// 
// %!error fliplr (1, 2);
