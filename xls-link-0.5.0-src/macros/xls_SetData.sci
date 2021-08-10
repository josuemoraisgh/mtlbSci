// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_SetData(varargin)
    if size(varargin) == 1 then
        data = varargin(1);
    elseif size(varargin) == 2 then
        dataRange = varargin(1);
        data = varargin(2);
        if xls_SelectRange(dataRange) == %f then
            error(999, msprintf(_("%s: Unable to select range ''%s''"), "xls_SetData", dataRange));
        end
    end

    //get range dimension to check with input data
    destRows = xls_getProperty("range", "rows", "count");
    destCols = xls_getProperty("range", "columns", "count");
    srcRows = size(data, "r");
    srcCols = size(data, "c");

    if destRows == 1 & destCols == 1 & srcRows * srcCols <> 1
        //must extend range limit to data size
        ret = xls_ExtendRange(srcRows - 1, srcCols - 1);
        if ret == %f then
            error(999, msprintf(_("%s: Unable to extend range"), "xls_SetData"));
        end
    elseif srcRows == 1 & srcCols == 1 then
        data(1:destRows, 1:destCols) = data;
    elseif srcRows <> destRows | srcCols <> destCols then
        error(999, msprintf(_("%s: Incompatible dimensions"), "xls_SetData"));
    end

    ret = xls_setProperty("Range", "Value", data);
endfunction
// =============================================================================
