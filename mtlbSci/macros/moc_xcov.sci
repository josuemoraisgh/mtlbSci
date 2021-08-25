function [retval, lags] = moc_xcov (X, Y, maxlag, scale)
// Compute covariance at various lags[=correlation(x-mean(x),y-mean(y))].
// Calling Sequence
//  [c, lag] = moc_xcov (X [, Y] [, maxlag] [, scale])
// Parameters
// X: input vector
// Y: if specified, compute cross-covariance between X and Y,
// otherwise compute autocovariance of X.
// maxlag: is specified, use lag range [-maxlag:maxlag], 
// otherwise use range [-n+1:n-1].
// Scale:
//    'biased'   for covariance=raw/N, 
//    'unbiased' for covariance=raw/(N-|lag|), 
//    'coeff'    for covariance=raw/(covariance at lag 0),
//    'none'     for covariance=raw
// 'none' is the default.
// lags: vector of lags
// c: covariance for each lag in the range
// Description
// Returns the covariance for each lag in the range, plus an 
// optional vector of lags.
// Authors
// Copyright (C) 1999 Paul Kienzle
// H. Nahrstaedt - 2010


// 2001-10-30 Paul Kienzle <pkienzle@users.sf.net>
//     - fix arg parsing for 3 args
// Copyright (C) 1999 Paul Kienzle
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
    usage ("[c, lags] = moc_xcov(x [, y] [, h] [, scale])");
  end

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
    if sum(length(Y))==1, maxlag=Y; Y=[]; end
  end

  // XXX FIXME XXX --- should let center(Y) deal with []
  // [retval, lags] = moc_xcorr(center(X), center(Y), maxlag, scale);
  if (~isempty(Y))
    [retval, lags] = moc_xcorr(center(X), center(Y), maxlag, scale);
  else
    [retval, lags] = moc_xcorr(center(X), maxlag, scale);
  end
  
endfunction
