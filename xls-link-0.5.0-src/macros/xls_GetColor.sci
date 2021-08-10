// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function varargout = xls_GetColor(dataRange)

    iLhs=argn(1);
    if exists("dataRange") then
        ret = xls_SelectRange(dataRange);
        if ret == %f then
            error(999, msprintf(_("%s: Unable to select range ''%s''"), "xls_SetData", dataRange));
        end
    end

    colorBG = xls_getProperty("Range", "Interior", "Color");
    varargout($+1) = ToRGB(colorBG);

    if iLhs > 1 then
        colorFG = xls_getProperty("Range", "Font", "Color");
        varargout($+1) = ToRGB(colorFG);
    end
endfunction
// =============================================================================
function ret = ToRGB(rgb)

    ret = [0,0,0];

    //blue << 16 | green << 8 | red
    ret(1) = modulo(rgb, 2**8);
    rgb = (rgb - ret(1)) / 2**8;
    ret(2) = modulo(rgb, 2**8);
    rgb = (rgb - ret(2)) / 2**8;
    ret(3) = modulo(rgb, 2**8);
endfunction
