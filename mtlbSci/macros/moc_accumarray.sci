function A = moc_accumarray (subs, val, sz)
// Create an array by accumulating the elements of a vector into the positions defined by their subscripts.
// Calling Sequence
//  accumarray (subs, vals, sz)
// Description
// Create an array by accumulating the elements of a vector into the
// positions defined by their subscripts.  The subscripts are defined by
// the rows of the matrix subs and the values by vals.  Each row
// of @var{subs} corresponds to one of the values in vals.
//
// The size of the matrix will be determined by the subscripts themselves.
// However, if sz is defined it determines the matrix size.  The length
// of sz must correspond to the number of columns in subs.
//
//
// Examples
// nan_accumarray ([1,1,1;2,1,2;2,3,2;2,1,2;2,3,2], 101:105)
//    ans(:,:,1) = [101, 0, 0; 0, 0, 0]
//    ans(:,:,2) = [0, 0, 0; 206, 0, 208]
// Authors 
// Copyright (C) 2007, 2008, 2009 David Bateman
// Copyright (C) 2009 VZLU Prague
// H. Nahrstaedt - 2010,2011

//
// This file is part of Octave.
//
// Octave is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or (at
// your option) any later version.
//
// Octave is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Octave; see the file COPYING.  If not, see
// <http://www.gnu.org/licenses/>.

[nargout,nargin]=argn(0);
  if (nargin < 2 )
    error("at least two parameters necassery!");
  end
if nargin<3
	sz=[];
end

    ncol = size (subs,2);
  

    // Linearize subscripts.
    if (ncol > 1)
      if (isempty (sz))
       
          sz = mtlb_max (subs, [], 1);

      elseif (ncol ~= max(size (sz)))
        error ("accumarray: dimensions mismatch")
      end

      // Convert multidimensional subscripts.

      subs = sub2ind (sz, subs); // creates index cache
    elseif (~ isempty (sz) & max(size (sz)) < 2)
      error("accumarray: needs at least 2 dimensions");
    end


    // Some built-in reductions handled efficiently.


      // The general case. Reduce values. 
      n = size (subs,1);
      if  sum(size(val))==2
        val = val(ones (1, n), 1);
      else
        val = val(:);
      end
      
      // Sort indices.
      [subs, idx] = mtlb_sort (subs);
      // Identify runs.
      jdx = find (subs(1:n-1) ~= subs(2:n));
      jdx = [jdx(:); n];
      val_ind=diff ([0; jdx]);val_tmp=val(idx);val=zeros(length(val_ind),1);
for k=1:length(val_ind)
	val(k)=sum(val_tmp(sum(val_ind(1:k-1))+1:sum(val_ind(1:k))));
end
    
      subs = subs(jdx);

      // Construct matrix of fillvals.


        A = mtlb_zeros (sz);


      // Set the reduced values.
for k=1:length(val)
	     A(subs(k)) = val(k);
end
 


endfunction

