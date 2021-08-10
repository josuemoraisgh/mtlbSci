// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_SetColor(varargin)
    iRhs = size(varargin);

    if iRhs > 0 then
        if varargin(1) == -1 then
            ret = xls_setProperty("range", "Interior", "ColorIndex", 0);
            if ret == %f then
                error(999, msprintf(_("%s: Unable to set interior color"), "xls_SetColor"));
            end
        else
            colorBG = FromRGB(varargin(1));
            ret = xls_setProperty("range", "Interior", "Color", colorBG);
            if ret == %f then
                error(999, msprintf(_("%s: Unable to set interior color"), "xls_SetColor"));
            end
        end
    end

    if iRhs > 1 then
        colorFG = FromRGB(varargin(2));
        ret = xls_setProperty("range", "Font", "Color", colorFG);
        if ret == %f then
            error(999, msprintf(_("%s: Unable to set font color"), "xls_SetColor"));
        end
    end
endfunction
// =============================================================================
function ret = FromRGB(rgb)

    if size(rgb, "*") <> 3 then
        ret = 0;
        return;
    end

    //blue << 16 | green << 8 | red
    ret = (rgb(3) * 2**16) + (rgb(2) * 2**8) + rgb(1);
endfunction
