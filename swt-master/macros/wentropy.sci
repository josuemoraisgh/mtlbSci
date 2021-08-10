function E = wentropy(X,T,P)
//   Entropy
//   Calling Sequence
//   E = wentropy(X,T,P)
//   E = wentropy(X,T)
//   Parameters
//   X : vector or matrix input
//   P: Parameter
//   T: Entropy name
//   T="shannon" : P is not used
//   T='log energy': P is not used
//   T='threshold': 0<=P, P is the threshold
//   T='sure': 0<=P, P is the threshold
//   T='norm':1<=P, P is the power
//   Description
//   performs a entropy calculation of type T for  X.
// Examples
//  //Generate random signal. 
//  X = rand(1,200,'norm');
//
//  //Compute Shannon entropy 
//  E = wentropy(X,'shannon')
//
// //Compute log energy entropy
//E = wentropy(X,'log energy')
//
// //Compute threshold (P=0.2) entropy 
// E = wentropy(X,'threshold',0.2)
//
// //Compute Sure entropy with a treshold P=3 
// E = wentropy(X,'sure',3)
//
// //Compute norm entropy  with power = 1.1. 
// E = wentropy(X,'norm',1.1)
// Authors
// H. Nahrstaedt - 2012


      [nargout,nargin]=argn(0);
      if (nargin < 2),
      error ( '2 parameters are required' ); 
      end
      if (nargin < 3),
	  P=0;
      end
 
      select(convstr(T))
	case "shannon" 
	 E= - sum(X.^2 .* log(%eps+X.^2));
	case "log energy"
	 E=  sum( log(%eps+X.^2));
        case "threshold"
	 if (P<0)
	  error("P must be >=0!");
	 end;
	 E=sum(abs(X)>P);
	case "sure"
	 if (P<0)
	  error("P must be >=0!");
	 end;
	 //E=sum(abs(X)>P)-sum(abs(X)>=P)+sum(min(X(abs(X)>=P).^2,P^2));
         E = length(X) - (2*(length(X) - sum(X.^2 > P.^2))) + (P.^2*sum(X.^2 > P.^2)) + sum(X.^2 .*(X.^2 <= P.^2));
        case "norm"
	 if (P<1)
	  error("P must be >=1!");
	 end;
	 E=sum( abs(X).^P );
        case "risk"
	  if (P<0)
	  error("P must be >=0!");
	 end;
	 E=sum(min(X.^2,P^2));
        else
         error(' T must be shannon, log energy, treshold, sure, norm or risk ');
      end;
       
endfunction
