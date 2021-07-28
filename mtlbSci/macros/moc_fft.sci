function y=moc_fft(x,n,job)
// matlab compatible fft
// Calling Sequence
//	y=moc_fft(x,n)
// Description
//  This funcion is much (100x) faster then mtlb_fft
//
//  Compute the FFT of A using subroutines from FFTW.  The FFT is
//     calculated along the first non-singleton dimension of the array.
//     Thus if A is a matrix, `fft (A)' computes the FFT for each column
//     of A.
//
//    If called with two arguments, N is expected to be an integer
//    specifying the number of elements of A to use, or an empty matrix
//     to specify that its value should be ignored.  If N is larger than
//     the dimension along which the FFT is calculated, then A is resized
//     and padded with zeros.  Otherwise, if N is smaller than the
//     dimension along which the FFT is calculated, then A is truncated.
//   See also
//     moc_ifft
//   Authors
//      H. Nahrstaedt - Aug 2010-2014


//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 [nargout,nargin]=argn(0);
if (nargin == 0),
 error('At least 1 parameter required');
elseif  (nargin == 1),
  n=[];
end;

[N,M]=size(x);
xflip=0;

if nargin==3
  select job
  case 1 then //row-wise
    if n<>[] then //pad or truncate
      s=size(x,1)
      if s>n then //truncated fft
        x=x(1:n,:)
      elseif s<n then //padd with zeros
        x(n,:)=0
      end
    end
  case 2 then //column-wise
    xflip=1;
    if n<>[] then //pad or truncate
      s=size(x,2)
      if s>n then //truncated fft
        x=x(:,1:n)
      elseif s<n then //padd with zeros
        x(:,n)=0
      end
    end
  end
else
  if n<> [] then
  if min(M,N)==1 then
	s=size(x,'*')
	if s>n then //truncated fft
	  x=x(1:n);
	elseif s<n then //padd with zeros
	  x(n)=0;
	end
  else
	s=size(x,1)
	if s>n then //truncated fft
	  x=x(1:n,:);
	elseif s<n then //padd with zeros
	  x(n,:)=0
	end
  end;
  end
end

[N,M]=size(x);
flip=0;
if (N>M) then
   flip=1;
end;

  if min(M,N)==1 then//fft of a vector
    y=fft(x,-1);
  else
    if (M==N) then
      y=fft(x,-1,N,1);
    elseif (xflip==0)
      if (flip==0)
        y=fft(x,-1,N,1);
      else
        y=fft([x,zeros(N,N-M)],-1,N,1);
        y=y(:,1:min(M,N));
      end //  (flip==0)
     else //xflip==1
      if (flip==1)
	y=fft([x';zeros(M,M-N)],-1,M,1)';
        y=y-2*%i*imag(y);
      else
	y=fft(x',-1,M,1)';
        y=y-2*%i*imag(y);
      end;
    end // (M==N),
  end; //

if n<> [] then
  if s==1  then
      y=y.'
  end
  if n==1 then
    y=x;
  end;
end;

endfunction
