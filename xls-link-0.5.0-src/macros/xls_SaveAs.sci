// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_SaveAs(filename, password)
    if ~isdef("password") then
        // blank is same as no password
        password = "";
    end

    ret = xls_callMethod("Workbook", "SaveAs", list(filename, password, password), [0, 2, 3]);

    if ret == %f then
        error(999, msprintf(_("%s: Unable to save current workbook"), "xls_SaveAs"));
    end

    ret = xls_SetSave(%t);
    if ret == %f then
        error(999, msprintf(_("%s: Unable to set ''Saved'' property"), "xls_SaveAs"));
    end
endfunction
// =============================================================================
