function y = moc_filtfilt(b, a, x)
   [nargout,nargin]=argn(0);
  if (nargin ~= 3)
    error("y=filtfilt(b,a,x)");
  end
  rot = (size(x,1)==1); 
  if (rot)	// a row vector
    x = x(:);			// make it a column vector
  end
  
  lx = size(x,1);
  a = a(:).';
  b = b(:).';
  lb = length(b);
  la = length(a);
  n = max(lb, la);
  lrefl = 3 * (n - 1);
  if la < n, a(n) = 0; end
  if lb < n, b(n) = 0; end

  // Compute a the initial state taking inspiration from
  // Likhterov & Kopeika, 2003. "Hardware-efficient technique for
  //     minimizing startup transients in Direct Form II digital filters"
  kdc = sum(b) / sum(a);
  if (abs(kdc) < inf) // neither NaN nor +/- Inf
    si = moc_fliplr(cumsum(moc_fliplr(b - kdc * a)));
  else
    si = mtlb_zeros(size(a)); // fall back to zero initialization
  end
  si(1) = [];

  for (c = 1:columns(x))	// filter all columns, one by one
    v = [2*x(1,c)-x((lrefl+1):-1:2,c); x(:,c);
             2*x($,c)-x(($-1):-1:$-lrefl,c)]; // a column vector

    // Do forward and reverse filtering
    v = filter(b,a,v,si*v(1));		       // forward filter
    v = moc_flipud(filter(b,a,moc_flipud(v),si*v($))); // reverse filter
    y(:,c) = v((lrefl+1):(lx+lrefl));
  end

  if (rot)			// x was a row vector
    y = moc_rot90(y);		// rotate it back
  end

endfunction