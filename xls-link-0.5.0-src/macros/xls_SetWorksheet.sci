// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_SetWorksheet(worksheet)
    ret = xls_callMethod("Workbook", "Worksheets", list(worksheet));
    if ret == %f then
        error(999, msprintf(_("%s: Unable to set current worksheet"), "xls_SetWorksheet"));
    end

    ret2 = xls_callMethod("Worksheet", "Activate");
    if ret2 == %f then
        error(999, msprintf(_("%s: Unable to active current worksheet"), "xls_SetWorksheet"));
    end

    //try to set range("A1")
    xls_SelectRange("A1");
endfunction
// =============================================================================
