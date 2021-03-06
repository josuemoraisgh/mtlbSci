function [R, lags] = moc_xcorr (X, Y, maxlag, scale)
// Compute correlation R_xy of X and Y for various lags k:  
// Calling Sequence
//  [R, lag] = moc_xcorr (X [, Y] [, maxlag] [, scale])
// Description
// 
// Compute correlation R_xy of X and Y for various lags k:  
//
//    R_xy(k) = sum_{i=1}^{N-k}{x_i y_{i-k}}/(N-k),  for k >= 0
//    R_xy(k) = R_yx(-k),  for k <= 0
//
// Returns R(k+maxlag+1)=Rxy(k) for lag k=[-maxlag:maxlag].
// Scale is one of:
//    'biased'   for correlation=raw/N, 
//    'unbiased' for correlation=raw/(N-|lag|), 
//    'coeff'    for correlation=raw/(rms(x).rms(y)),
//    'none'     for correlation=raw
//
// If Y is omitted, compute autocorrelation.  
// If maxlag is omitted, use N-1 where N=max(length(X),length(Y)).
// If scale is omitted, use 'none'.
//
// If X is a matrix, computes the cross correlation of each column
// against every other column for every lag.  The resulting matrix has
// 2*maxlag+1 rows and P^2 columns where P is columns(X). That is,
//    R(k+maxlag+1,P*(i-1)+j) == Rij(k) for lag k=[-maxlag:maxlag],
// so
//    R(:,P*(i-1)+j) == moc_xcorr(X(:,i),X(:,j))
// and
//    reshape(R(k,:),P,P) is the cross-correlation matrix for X(k,:).
//
// xcorr computes the cross correlation using an FFT, so the cost is
// dependent on the length N of the vectors and independent of the
// number of lags k that you need.  If you only need lags 0:k-1 for 
// vectors x and y, then the direct sum may be faster:
//
// Ref: Stearns, SD and David, RA (1988). Signal Processing Algorithms.
//      New Jersey: Prentice-Hall.
//
// unbiased:
//  ( hankel(x(1:k),[x(k:N); zeros(k-1,1)]) * y ) ./ [N:-1:N-k+1](:)
// biased:
//  ( hankel(x(1:k),[x(k:N); zeros(k-1,1)]) * y ) ./ N
//
// If length(x) == length(y) + k, then you can use the simpler
//    ( hankel(x(1:k),x(k:N-k)) * y ) ./ N
//
//Authors
// Copyright (C) 1999-2001 Paul Kienzle
// H. Nahrstaedt - 2010

// 2008-11-12  Peter Lanspeary, <pvl@mecheng.adelaide.edu.au>
//       1) fix incorrectly shifted return value (when X and Y vectors have
//          unequal length) - bug reported by <stephane.brunner@gmail.com>.
//       2) scale='coeff' should give R=raw/(rms(x).rms(y)); fixed.
//       3) restore use of autocorrelation code when isempty(Y).
//       4) imaginary part of cross correlation had wrong sign; fixed.
//       5) use R.' rather than R' to correct the shape of the result
// 2004-05 asbjorn dot sabo at broadpark dot no
//     - Changed definition of cross correlation from 
//       sum{x(i)y(y+k)} to sum(x(i)y(i-k)}  (Note sign change.)
//       Results are now returned in reverse order of before.
//       The function is now compatible with Matlab (and with f.i.
//       "Digital Signal Processing" by Proakis and Manolakis).
// 2000-03 pkienzle@kienzle.powernet.co.uk
//     - use fft instead of brute force to compute correlations
//     - allow row or column vectors as input, returning same
//     - compute cross-correlations on columns of matrix X
//     - compute complex correlations consitently with matlab
// 2000-04 pkienzle@kienzle.powernet.co.uk
//     - fix test for real return value
// 2001-02-24 Paul Kienzle
//     - remove all but one loop
// 2001-10-30 Paul Kienzle <pkienzle@users.sf.net>
//     - fix arg parsing for 3 args
// 2001-12-05 Paul Kienzle <pkienzle@users.sf.net>
//     - return lags as vector rather than range
// Copyright (C) 1999-2001 Paul Kienzle
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; If not, see <http://www.gnu.org/licenses/>.

   [nargout,nargin]=argn(0);
  if (nargin < 1 | nargin > 4)
    usage ("[c, lags] = moc_xcorr(x [, y] [, h] [, scale])");
  end

  // assign arguments from list
  if nargin==1
    Y=[]; maxlag=[]; scale=[];
  elseif nargin==2
    maxlag=[]; scale=[];
    if type(Y)==10, scale=Y; Y=[];
    elseif sum(length(Y))==1, maxlag=Y; Y=[];
    end
  elseif nargin==3
    scale=[];
    if type(maxlag)==10, scale=maxlag; maxlag=[]; end
    if sum(length(Y)), maxlag=Y; Y=[]; end
  end

  // assign defaults to arguments which were not passed in
  if min(size(X))==1 
    // if isempty(Y), Y=X; endif  // this line disables code for autocorr'n
    N = max(length(X),length(Y));
  else
    N = size(X,1);
  end
  if isempty(maxlag), maxlag=N-1; end
  if isempty(scale), scale='none'; end

  // check argument values
  if sum(length(X))==1 | type(X)==10 | isempty(X)
    error("xcorr: X must be a vector or matrix"); 
  end
  if sum(length(Y))==1 | type(Y)==10 | (~isempty(Y) & ~min(size(Y))==1)
    error("xcorr: Y must be a vector");
  end
  if min(size(X))~=1 & ~isempty(Y)
    error("xcorr: X must be a vector if Y is specified");
  end
  if ~sum(length(maxlag))==1 & ~isempty(maxlag) 
    error("xcorr: maxlag must be a scalar"); 
  end
  if maxlag>N-1, 
    error("xcorr: maxlag must be less than length(X)"); 
  end
  if min(size(X))==1 & min(size(Y))==1 & length(X) ~= length(Y) & ~(scale == 'none')
    error("xcorr: scale must be ''none'' if length(X) ~= length(Y)")
  end
    
  P = size(X,2);
  M = 2^nextpow2(N + maxlag);
  if min(size(X))~=1 
    // For matrix X, compute cross-correlation of all columns
    R = zeros(2*maxlag+1,P^2);

    // Precompute the padded and transformed `X' vectors
    pre = moc_fft (moc_postpad (moc_prepad (X, N+maxlag), M) ); 
    post = conj (moc_fft (moc_postpad (X, M)));

    // For diagonal (i==j)
    ccor = moc_ifft (post .* pre);
    R(:, 1:P+1:P^2) = ccor (1:2*maxlag+1,:);

    // For remaining i,j generate xcorr(i,j) and by symmetry xcorr(j,i).
    for i=1:P-1
      j = i+1:P;
      ccor = moc_ifft( pre(:,i*ones(length(j),1)) .* post(:,j) );
      R(:,(i-1)*P+j) = ccor(1:2*maxlag+1,:);
      R(:,(j-1)*P+i) = conj( moc_flipud( ccor(1:2*maxlag+1,:) ) );
    end
  elseif isempty(Y)
    // compute autocorrelation of a single vector
    post = moc_fft( moc_postpad(X(:),M) );
    ccor = moc_ifft( post .* conj(post) );
    R = [ conj(ccor(maxlag+1:-1:2)) ; ccor(1:maxlag+1) ];
  else 
    // compute cross-correlation of X and Y
    //  If one of X & Y is a row vector, the other can be a column vector.
    pre  = moc_fft( moc_postpad( moc_prepad( X(:), length(X)+maxlag ), M) );
    post = moc_fft( moc_postpad( Y(:), M ) );
    ccor = moc_ifft( pre .* conj(post) );
    R = ccor(1:2*maxlag+1);
  end

  // if inputs are real, outputs should be real, so ignore the
  // insignificant complex portion left over from the FFT
  if isreal(X) & (isempty(Y) | isreal(Y))
    R=real(R); 
  end

  // correct for bias
  if (scale == 'biased')
    R = R ./ N;
  elseif (scale == 'unbiased')
    R = R ./ ( [ N-maxlag:N-1, N, N-1:-1:N-maxlag ]' * ones(1,size(R,2)) );
  elseif (scale == 'coeff')
    // R = R ./ R(maxlag+1) works only for autocorrelation
    // For cross correlation coeff, divide by rms(X)*rms(Y).
    if min(size(X))~=1
      // for matrix (more than 1 column) X
      rms = sqrt( moc_sumsq(X));
      R = R ./ ( ones(size(R,1),1) * matrix(rms.'*rms,1,[]) );
    elseif isempty(Y)
      //  for autocorrelation, R(zero-lag) is the mean square.
      R = R / R(maxlag+1);
    else
      //  for vectors X and Y
      R = R / sqrt( moc_sumsq(X)*moc_sumsq(Y) );
    end
  elseif ~(scale == 'none')
    error("xcorr: scale must be ''biased'', ''unbiased'', ''coeff'' or ''none''");
  end
    
  // correct the shape so that it is the same as the first input vector
  if min(size(X))==1 & P > 1
    R = R.'; 
  end
  
  // return the lag indices if desired
  if nargout == 2
    lags = [-maxlag:maxlag];
  end

endfunction



//------------ Use brute force to compute the correlation -------
//if !isvector(X) 
//  // For matrix X, compute cross-correlation of all columns
//  R = zeros(2*maxlag+1,P^2);
//  for i=1:P
//    for j=i:P
//      idx = (i-1)*P+j;
//      R(maxlag+1,idx) = X(i)*X(j)';
//      for k = 1:maxlag
//  	    R(maxlag+1-k,idx) = X(k+1:N,i) * X(1:N-k,j)';
//  	    R(maxlag+1+k,idx) = X(k:N-k,i) * X(k+1:N,j)';
//      endfor
//	if (i!=j), R(:,(j-1)*P+i) = conj(moc_flipud(R(:,idx))); endif
//    endfor
//  endfor
//elseif isempty(Y)
//  // reshape X so that dot product comes out right
//  X = reshape(X, 1, N);
//    
//  // compute autocorrelation for 0:maxlag
//  R = zeros (2*maxlag + 1, 1);
//  for k=0:maxlag
//  	R(maxlag+1+k) = X(1:N-k) * X(k+1:N)';
//  endfor
//
//  // use symmetry for -maxlag:-1
//  R(1:maxlag) = conj(R(2*maxlag+1:-1:maxlag+2));
//else
//  // reshape and pad so X and Y are the same length
//  X = reshape(moc_postpad(X,N), 1, N);
//  Y = reshape(moc_postpad(Y,N), 1, N)';
//  
//  // compute cross-correlation
//  R = zeros (2*maxlag + 1, 1);
//  R(maxlag+1) = X*Y;
//  for k=1:maxlag
//  	R(maxlag+1-k) = X(k+1:N) * Y(1:N-k);
//  	R(maxlag+1+k) = X(k:N-k) * Y(k+1:N);
//  endfor
//endif
//--------------------------------------------------------------
