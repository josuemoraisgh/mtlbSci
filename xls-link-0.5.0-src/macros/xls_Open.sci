// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_Open(filename, password)
    // Password not given ?
    if ~isdef("password") then
        // If so provide a fake one, to avoid password prompt on protected Excel files
        // It does not prevent from opening unprotected Excel files
        password = "";
    end

    ret = xls_callMethod("Workbooks", "Open", list(filename, password, password), [0, 4, 5]);

    if ret == %f then
        error(999, msprintf(_("%s: Unable to open ''%s''"), "xls_Open", filename));
    end
endfunction
// =============================================================================
