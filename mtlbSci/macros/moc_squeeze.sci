function B = moc_squeeze(A)
//Remove singleton dimensions from X and return the result
//Calling Sequence
//B = moc_squeeze(A)
//Description
//     Remove singleton dimensions from X and return the result.  Note
//     that for compatibility with MATLAB, all objects have a minimum of
//     two dimensions and row vectors are left unchanged.


   //  a squeeze function likes the Matlab 's one ?
   if argn(2) ~= 1 then
      error("squeeze: bad number of input arg")
   end
   B_dims = size(A)
   if length(B_dims) <= 2 then
      B = A
   else  // length(B_dims)>=3  => A is an hypermat
      B_dims(B_dims == 1) = []
      if length(B_dims) >= 2 then
         B = matrix(A.entries, B_dims)
      else
         B = A.entries
      end
   end
endfunction
