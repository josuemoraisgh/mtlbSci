// Copyright (C) 2010 - 2011 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// Updates the .xml files by deleting existing files and
// creating them again from the .sci with help_from_sci.

function b = helptbx_iscontentupdte ( content , filename )
  // Check if a content matches a file.
  //
  // Calling Sequence
  //   b = helptbx_iscontentupdte ( content , filename )
  //
  // Parameters
  //   content : a 1-by-1 matrix of strings, the new content
  //   filename : a 1-by-1 matrix of strings, the file to be checked
  //   b : a 1-by-1 matrix of booleans
  //
  // Description
  //   Returns true if the <literal>filename</literal> is up-to-date, that is,
  //   if the file does not require to be changed.
  //   The file is to be updated if one of the following conditions is satisfied.
  // <itemizedlist>
  //   <listitem>
  //     The file does not exist.
  //   </listitem>
  //   <listitem>
  //     The file exists, but its content is not equal to <literal>content</literal>.
  //     The content comparison ignores the leading and trailing blanks.
  //   </listitem>
  // </itemizedlist>
  //
  // Examples
  //   // Create a sample file.
  //   content = "Coucou!";
  //   filename = fullfile(TMPDIR,"test.txt");
  //   // See if the content is to be updated.
  //   b = helptbx_iscontentupdte ( content , filename )
  //   expected = %f
  //   // Fill the file
  //   mputl ( content , filename );
  //   // See if the file is to be updated.
  //   b = helptbx_iscontentupdte ( content , filename )
  //   expected = %t
  //   // Change the content
  //   content = "Hello!"
  //   b = helptbx_iscontentupdte ( content , filename )
  //   expected = %f
  //   // Delete the file
  //   mdelete(filename);
  //
  // Authors
  //   Copyright (C) 2010 - 2011 - DIGITEO - Michael Baudin
  //

  [lhs, rhs] = argn()
  apifun_checkrhs ( "helptbx_iscontentupdte" , rhs , 2:2 )
  apifun_checklhs ( "helptbx_iscontentupdte" , lhs , 0:1 )
  //

  b = %t
  if ( fileinfo(filename) == [] ) then
    b = %f
  else
    txt = mgetl(filename)
    if ( or ( stripblanks(content) <> stripblanks(txt) ) ) then
      b = %f
    end
  end
endfunction

