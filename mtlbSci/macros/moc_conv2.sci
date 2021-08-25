function c = moc_conv2( a, b, shape )
// performs 2D convolution of matrices a and b
// Calling Sequence
// c = moc_conv2( a, b )
// c = moc_conv2( a, b, shape )
//Parameters
//   c :  2D convolution of matrices a and b
//
//                     - if [ma,na] = size(a) and [mb,nb] = size(b), then
//                       size(c) = [ma+mb-1, na+nb-1]
// shape: 
//           'full'     : (defalut) returns full 2D convolution
//           'same'     : returns central part that is same size as a
//           'valid'     : returns only those parts of the convolution that are     computed without the zero-padded edges
//
//   Description
//   conv2 is most efficient when size(a) > size(b)
//   Examples
//   A = rand(3,3); 
//   B = rand(4,4); 
//   C = moc_conv2(A,B) 
//   Cs = moc_conv2(A,B,'same')
//   
//   s = [1 2 1; 0 0 0; -1 -2 -1]; 
//   A = zeros(10,10);
//   A(3:7,3:7) = ones(5,5);
//   H = moc_conv2(A,s);
//   mesh(H)
//   
//   
//
   [nargout,nargin]=argn(0);
    // check arguements
    if ( nargin ~= 2 & nargin ~= 3 )
        error( "moc_conv2 requires 2 or 3 arguements" );
    end

    //default value for shape
    if nargin==2 then
	shape="full";
    end;
    
    // get array sizes
    [ma, na] = size(a);
    [mb, nb] = size(b);
    
    
    // do full convolution
    c = zeros( ma+mb-1, na+nb-1 );
    for i = 1:mb
        for j = 1:nb
            r1 = i;
            r2 = r1 + ma - 1;
            c1 = j;
            c2 = c1 + na - 1;
            c(r1:r2,c1:c2) = c(r1:r2,c1:c2) + b(i,j) * a;
        end
    end
    
    if ( nargin == 2 | (shape == 'full') )
        // nothing to do, full convolution done
    elseif ( (shape == 'same') )
        // extract region of size(a) from c
        r1 = floor(mb/2) + 1;
        r2 = r1 + ma - 1;
        c1 = floor(nb/2) + 1;
        c2 = c1 + na - 1;
        c = c(r1:r2, c1:c2);
    elseif ( (shape == 'valid')  )
        // extract valid region from c
        c = c(mb:ma, nb:na);
    else
        error( "nan_conv2 third arguement must be ''full'', ''same'', or ''valid''" );
    end

endfunction
