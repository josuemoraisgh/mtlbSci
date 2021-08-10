// Copyright (C) 2010 - 2011 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function b = helptbx_updtifneeded ( content , filename )
  // Update a file if this is needed.
  //
  // Calling Sequence
  //   b = helptbx_updtifneeded ( content , filename )
  //
  // Parameters
  //   content : a 1-by-1 matrix of strings, the new content
  //   filename : a 1-by-1 matrix of strings, the file to be checked.
  //   b : a 1-by-1 matrix of booleans
  //
  // Description
  //   Returns true if the <literal>filename</literal> is up-to-date, that is,
  //   if the file was not changed.
  //   Returns false if the file was changed.
  //
  //   The file is to be updated according to the rules of the
  //   <literal>helptbx_iscontentupdte</literal> function.
  //   Generates an error if the file was to be changed, but that was not possible.
  //
  // Examples
  //   // Create a sample file.
  //   content = "Coucou!";
  //   filename = fullfile(TMPDIR,"test.txt");
  //   // Update the file.
  //   b = helptbx_updtifneeded ( content , filename ) // Expected=%f
  //   // See the content of the file.
  //   content2 = mgetl ( filename )
  //   and(content==content2) // Expected=%t
  //   // No update is necessary now.
  //   b = helptbx_updtifneeded ( content , filename ) // Expected=%t
  //   // Change the content
  //   content = "Hello!";
  //   b = helptbx_updtifneeded ( content , filename ) // Expected=%f
  //   // See the content of the file.
  //   content2 = mgetl ( filename )
  //   and(content==content2) // Expected=%t
  //   // No update is necessary now.
  //   b = helptbx_updtifneeded ( content , filename ) // Expected=%t
  //   // Delete the file
  //   mdelete(filename);
  //
  // Authors
  //   Copyright (C) 2010 - 2011 - DIGITEO - Michael Baudin
  //

  [lhs, rhs] = argn()
  apifun_checkrhs ( "helptbx_updtifneeded" , rhs , 2:2 )
  apifun_checklhs ( "helptbx_updtifneeded" , lhs , 0:1 )
  //

  b = helptbx_iscontentupdte ( content , filename )
  if ( ~b ) then
    r = mputl ( content , filename )
    if ( ~r ) then
      error(sprintf(gettext("%s: Unable to write xml file: %s\n"),"fileUpdateIfNeeded",filename));
    end
  end
endfunction

