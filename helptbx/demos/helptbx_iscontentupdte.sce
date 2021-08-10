//
// This help file was automatically generated from helptbx_iscontentupdte.sci using help_from_sci().
// PLEASE DO NOT EDIT
//
mode(1)
//
// Demo of helptbx_iscontentupdte.sci
//

// Create a sample file.
content = "Coucou!";
filename = fullfile(TMPDIR,"test.txt");
// See if the content is to be updated.
b = helptbx_iscontentupdte ( content , filename )
expected = %f
// Fill the file
mputl ( content , filename );
// See if the file is to be updated.
b = helptbx_iscontentupdte ( content , filename )
expected = %t
// Change the content
content = "Hello!"
b = helptbx_iscontentupdte ( content , filename )
expected = %f
// Delete the file
mdelete(filename);
halt()   // Press return to continue

//========= E N D === O F === D E M O =========//
//
// Load this script into the editor
//
filename = "helptbx_iscontentupdte.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) );
