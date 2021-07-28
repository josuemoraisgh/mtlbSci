function y = moc_flipud(x)
//Return a copy of X with the order of the rows reversed.
//Calling Sequence
//y = moc_fliplr(x)
//Description
//     Return a copy of X with the order of the rows reversed.  In
//     other words, X is flipped upside-down about a horizontal axis.  For
//     Note that 'fliplr' only works with 2-D arrays.
// Examples
//  moc_flipud ([1, 2; 3, 4])

if ndims(x)~=2, 
disp('X must be a 2-D matrix!')
end

y = x($:-1:1,:);
endfunction

// %!assert((flipud ([1, 2; 3, 4]) == [3, 4; 1, 2]
// %! && flipud ([1, 2; 3, 4; 5, 6]) == [5, 6; 3, 4; 1, 2]
// %! && flipud ([1, 2, 3; 4, 5, 6]) == [4, 5, 6; 1, 2, 3]));
// 
// %!error flipud ();
// 
// %!error flipud (1, 2);
