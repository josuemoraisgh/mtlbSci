//
// This help file was automatically generated from helptbx_helpupdate.sci using help_from_sci().
// PLEASE DO NOT EDIT
//
mode(1)
//
// Demo of helptbx_helpupdate.sci
//

// Update the help of this module.
path = helptbx_getpath (  );
helpdir = fullfile(path,"help","en_US");
funmat = [
"helptbx_helpupdate"
"helptbx_iscontentupdte"
"helptbx_updtifneeded"
];
macrosdir = fullfile(path,"macros");
demosdir = fullfile(path,"demos");
modulename = "helptbx";
[nbxmlfiles , isdemgwutd] = helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )
halt()   // Press return to continue

// Do not print messages.
[nbxmlfiles , isdemgwutd] = helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename )
halt()   // Press return to continue

// Do not update demos.
[nbxmlfiles , isdemgwutd] = helptbx_helpupdate ( funmat , helpdir , macrosdir )
halt()   // Press return to continue

//========= E N D === O F === D E M O =========//
//
// Load this script into the editor
//
filename = "helptbx_helpupdate.sce";
dname = get_absolute_file_path(filename);
editor ( fullfile(dname,filename) );
