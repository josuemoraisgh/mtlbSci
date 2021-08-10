// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_AddWorkbook()
    ret = xls_callMethod("workbooks", "Add");
    if ret == %f then
        error(999, msprintf(_("%s: Unable to create a new workbook"), "xls_AddWorkbook"));
    end

    //get workbooks count and select last one
    count = xls_getProperty("workbooks", "count");
    ret = xls_callMethod("application", "workbooks", list(count));
    if ret == %f then
        error(999, msprintf(_("%s: Unable to active new workbook"), "xls_AddWorkbook"));
    end


    //try to select first worksheet.
    xls_SetWorksheet(1);
endfunction
// =============================================================================
