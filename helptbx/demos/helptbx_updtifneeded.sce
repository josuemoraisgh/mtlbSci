//
// This help file was automatically generated from helptbx_updtifneeded.sci using help_from_sci().
// PLEASE DO NOT EDIT
//
mode(1)
//
// Demo of helptbx_updtifneeded.sci
//

// Create a sample file.
content = "Coucou!";
filename = fullfile(TMPDIR,"test.txt");
// Update the file.
b = helptbx_updtifneeded ( content , filename ) // Expected=%f
// See the content of the file.
content2 = mgetl ( filename )
and(content==content2) // Expected=%t
// No update is necessary now.
b = helptbx_updtifneeded ( content , filename ) // Expected=%t
// Change the content
content = "Hello!";
b = helptbx_updtifneeded ( content , filename ) // Expected=%f
// See the content of the file.
content2 = mgetl ( filename )
and(content==content2) // Expected=%t
// No update is necessary now.
b = helptbx_updtifneeded ( content , filename ) // Expected=%t
// Delete the file
mdelete(filename);
halt()   // Press return to continue

//========= E N D === O F === D E M O =========//
//
// Load this script into the editor
//
filename = "helptbx_updtifneeded.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) );
