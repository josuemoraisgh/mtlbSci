function varargout = meyer(LB,UB,N,OPT)

[nargout,nargin]=argn(0);

select nargin
  case 3
    OPT = 'two';
  case 4
    if ~((OPT=='two') | (OPT=='phi') | (OPT=='psi'))
        OPT = 'two';
    end
end
tmp = log(N)/log(2);
if tmp ~= fix(tmp)
    error('N must be a power of two !');
end
tmp = UB-LB;
if tmp<0
    error('The interval [LB,UB] is not valid !');
end


lint = (UB-LB)/2/%pi; 
x    = (-N:2:N-2)/(2*lint);
xa   = abs(x);

if (OPT=='phi') | (OPT=='two')

    int1 = find((xa < 2*%pi/3));
    int2 = find((xa >= 2*%pi/3) & (xa < 4*%pi/3));

    phihat = zeros(1,N);
    phihat(int1) = ones(int1);
    phihat(int2) = cos(%pi/2*meyeraux(3/2/%pi*xa(int2)-1));

    [phi,t] = instdfft(phihat,LB,UB);
end

if (OPT=='psi') | (OPT=='two')

    int1 = find((xa >= 2*%pi/3) & (xa < 4*%pi/3)); 
    int2 = find((xa >= 4*%pi/3) & (xa < 8*%pi/3));

    psihat = zeros(1,N);
    psihat(int1) = exp(%i*x(int1)/2).*sin(%pi/2*meyeraux(3/2/%pi*xa(int1)-1));
    psihat(int2) = exp(%i*x(int2)/2).*cos(%pi/2*meyeraux(3/4/%pi*xa(int2)-1));

    [psi,t] = instdfft(psihat,LB,UB);
end
varargout=list();
select OPT
    case 'psi' then
          varargout(1) = psi;varargout(2) = t;
    case 'phi' then
           varargout(1) = phi;varargout(2) = t;
    else  
           varargout(1) = phi;varargout(2) = psi;varargout(3) = t;
end
endfunction

function [x,t] = instdfft(xhat,lowb,uppb)


n = length(xhat);


delta = (uppb-lowb)/n;

omega = (-n:2:n-2)/(2*n*delta);

xhat = fftshift(xhat.*exp(2*%pi*%i*omega*lowb)/delta);

x = mtlb_ifft(xhat);

sim = find(imag(x) < sqrt(%eps));
if ~isempty(sim), x(sim) = real(x(sim)); end

t = lowb + (0:n-1)*delta;

endfunction