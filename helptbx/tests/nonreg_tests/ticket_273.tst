// Copyright (C) 2008 - 2010 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
//
// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 273 -->
//
// <-- URL -->
//  http://forge.scilab.org/index.php/p/helptbx/issues/273/
//
// <-- Short Description -->
// The helptbx_helpupdate function fails to generate an error message.


helpdir = fullfile(TMPDIR,"nincredibledirectoryname");

funmat = [
  "csv_getToolboxPath"
  ];

macrosdir = fullfile(TMPDIR,"..","..","macros");

demosdir = fullfile(TMPDIR,"..","..","demos");

modulename = "NINCREDIBLEMODULE";

instr = "helptbx_helpupdate ( funmat , helpdir , macrosdir );";
ierr = execstr(instr,"errcatch");
assert_checktrue(ierr<>0);
errmsg = lasterror();
firstpart = part(errmsg,1:41);
assert_checkequal(firstpart,"helptbx_helpupdate: Wrong help directory:");



