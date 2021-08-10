function dwtplot(x,wname,plotmode,level,app,detail)
//Plots the 
//Calling Sequence
//dwtplot(x,wname,plotmode,level,app,detail)
//Parameters
//x: input vector
//wname: wavelet function name
//cbar: defines plotting of a color bar (%t or %f)
//f: if used, the coeff are plotted in the figure f
//Description
//Plots the absolute coefficients of a discrete Wavelet-Transform (wavedec)
//Examples
//wname = 'db2';
//x=[zeros(1,200),20*ones(1,200)];
//
//[C,L]=wavedec(x,5,wname);
//wavedecplot(C,L);
//
// See also 
// wavedec
//Authors
//Holger Nahrstaedt - 2010-2012


// 
// %--------------------------------------
// % mode 1 : scroll mode        = 'scr'
// % mode 2 : decomposition mode = 'dec'
// % mode 3 : separate mode      = 'sep'
// % mode 4 : superimposed mode  = 'sup'
// % mode 5 : tree mode          = 'tre'
// % mode 6 : cfs mode           = 'cfs'
// %--------------------------------------


[nargout,nargin]=argn(0);
  if (nargin < 2),
    error ( '2 parameters are required !' ); 
  end
  N=length(x);
  maxLevel=wmaxlev(N,wname);

  if (type(wname)~=10) then
      error("wname must be a string");
  end;
  
  if (level>maxLevel) | (app>maxLevel) |(detail>maxLevel) then
     error("max Level error");
  end;
  if (app>level) |(detail>level) then
     error("max Level error");
  end;
  




  select plotmode
      case 'scr'
        [C,L] = wavedec(x,level,wname);
	for i = 1:level
	  A(i,:) = wrcoef('a',C,L,wname,i);
	  D(i,:) = wrcoef('d',C,L,wname,i);
        end

      clf();
      f=gcf();
      subplot(313)
      [C,L]=wavedec(x,level,wname);
      wavedecplot(C,L,%f,f);
      a=gca();a.tight_limits="on";
      subplot(311);
      plot2d(x,style=color("red"));
  
      plot2d(A(app,:),style=color("blue"));
      title("Signal and Approximation at Level"+string(app));
      a=gca();a.tight_limits="on";
      subplot(312)

      plot2d(D(detail,:),style=color("green"));
      title("Detail at level "+string(detail));
      a=gca();a.tight_limits="on";
 case 'dec'
      clf();
      f=gcf();
      subplot(level+2,1,1);
      [C,L] = wavedec(x,level,wname);
      x0=waverec(C,L,wname);
	for i = 1:level
	  A(i,:) = wrcoef('a',C,L,wname,i);
	  D(i,:) = wrcoef('d',C,L,wname,i);
        end
      plot2d(x0,style=color("red"));
      ylabel("s");
      titlestring="Decomposition at level "+string(level)+": s = a"+string(level)+"+ d"+string(level);
      for i=level:-1:1
	titlestring=titlestring+"+ d"+string(i);
      end;
      title(titlestring);
      a=gca();a.tight_limits="on";
      subplot(level+2,1,2);
      plot2d(A(level,:),style=color("blue"));
      ylabel("a"+string(level));
      a=gca();a.tight_limits="on";
      for i=1:level
      subplot(level+2,1,i+2);
      plot2d(D(level-i+1,:),style=color("green"));
       ylabel("d"+string(level-i+1));
      a=gca();a.tight_limits="on";
      end;

  end;



endfunction
