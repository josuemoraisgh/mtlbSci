function y = moc_logical (x)
//Convert x to a logical value
// Calling Sequence
// y=moc_logical(x)
//  Parameters
// y:	boolean vector or matrix
// A:vector or matrix
// Description
// Convert x to a boolean values
//
// Authors
// H. Nahrstaedt - 2014
[nargout,nargin]=argn(0);
if (nargin == 1)
  if (moc_islogical (x) | isempty (x))
    y = x;
  elseif (moc_isnumeric (x))
    y = x ~= 0;
  else
    error (sprintf("logical not defined for type %d", type (x)));
  end
else
  error ("y = logical (x)");
end

endfunction
