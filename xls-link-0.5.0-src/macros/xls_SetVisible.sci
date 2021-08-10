// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_SetVisible(varargin)
    iRhs = size(varargin);

    flag = 1;
    if iRhs == 1 then
        flag = bool2s(varargin(1));
    end

    ret = xls_setProperty("Application", "Visible", flag);
    if ret == %f then
        error(999, msprintf(_("%s: Unable to set ''%s'' property"), "xls_SetVisible", "Visible"));
    end
endfunction
// =============================================================================
