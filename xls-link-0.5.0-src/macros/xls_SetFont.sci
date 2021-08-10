// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_SetFont(varargin)
    iRhs = size(varargin);

    if iRhs > 0 then //name
        ret = xls_setProperty("Range", "Font", "Name", varargin(1));
        if ret == %f then
            error(999, msprintf(_("%s: Unable to set font name property"), "xls_SetFont"));
        end
    end

    if iRhs > 1 then //bold
        ret = xls_setProperty("Range", "Font", "Bold", varargin(2));
        if ret == %f then
            error(999, msprintf(_("%s: Unable to set font bold property"), "xls_SetFont"));
        end
    end

    if iRhs > 2 then //underline
        bUnderline = varargin(3);
        if bUnderline then
            iUnderline = 2; //true
        else
            iUnderline = -4142; //false
        end
        ret = xls_setProperty("Range", "Font", "Underline", iUnderline);
        if ret == %f then
            error(999, msprintf(_("%s: Unable to set font underline property"), "xls_SetFont"));
        end
    end

    if iRhs > 3 then //size
        ret = xls_setProperty("Range", "Font", "Size", varargin(4));
        if ret == %f then
            error(999, msprintf(_("%s: Unable to set font size property"), "xls_SetFont"));
        end
    end
endfunction
// =============================================================================
