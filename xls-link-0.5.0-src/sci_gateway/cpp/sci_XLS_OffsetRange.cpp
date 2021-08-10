/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
 *
 * This file must be used under the terms of the CeCILL.
 * This source file is licensed as described in the file COPYING, which
 * you should have received as part of this distribution.  The terms
 * are also available at
 * http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */

#include "MainObject.hxx"

#ifdef __cplusplus
extern "C"
{
#endif

#include "gateway_xls_link.h"
#include "Excel_utils.h"

#include <api_scilab.h>
#include <localization.h>
#include <Scierror.h>

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int sci_XLS_OffsetRange(GATEWAY_PARAMETERS)
{
    VARIANT vResult;
    int* piAddrRange = NULL;
    wchar_t* pwstRange = NULL;

    int* piAddrOffsetX = NULL;
    int* piAddrOffsetY = NULL;

    double dblOffset = 0;
    int iRowOffset = 0;
    int iColOffset = 0;

    CheckInputArgument(pvApiCtx, 3, 3);
    CheckOutputArgument(pvApiCtx, 0, 1);

    getVarAddressFromPosition(pvApiCtx, 1, &piAddrRange);
    getVarAddressFromPosition(pvApiCtx, 2, &piAddrOffsetX);
    getVarAddressFromPosition(pvApiCtx, 2, &piAddrOffsetY);

    if(isStringType(pvApiCtx, piAddrRange) == 0 || isScalar(pvApiCtx, piAddrRange) == 0)
    {
        Scierror(999, _("%s: Wrong type of input argument #%d: String expected.\n"), fname, 1);
        return 1;
    }

    getAllocatedSingleWideString(pvApiCtx, piAddrRange, &pwstRange);

    if(isDoubleType(pvApiCtx, piAddrOffsetX) == 0 || isVarComplex(pvApiCtx, piAddrOffsetX))
    {
        Scierror(999, _("%s: Wrong type of input argument #%d: A scalar expected.\n"), fname, 2);
        return 1;
    }

    getScalarDouble(pvApiCtx, piAddrOffsetX, &dblOffset);
    iRowOffset = (int)dblOffset;

    if(isDoubleType(pvApiCtx, piAddrOffsetY) == 0 || isVarComplex(pvApiCtx, piAddrOffsetY))
    {
        Scierror(999, _("%s: Wrong type of input argument #%d: A scalar expected.\n"), fname, 3);
        return 1;
    }

    getScalarDouble(pvApiCtx, piAddrOffsetY, &dblOffset);
    iColOffset = (int)dblOffset;

    int iRowStart = 0;
    int iColStart = 0;
    int iRowSize = 0;
    int iColSize = 0;


    ExcelLink *currentObjExcelLink = getObjExcelLink();
    //get current range if exist
    bool bRangeExist = currentObjExcelLink->GetRange(&iColStart, &iRowStart, &iColSize, &iRowSize);

    //set new range

    VARIANT vRange;
    vRange.vt = VT_BSTR;
    vRange.bstrVal = SysAllocString(pwstRange);
    vResult = currentObjExcelLink->callMethod(L"Worksheet", L"Range", &vRange, 1);
    VariantClear(&vRange);

    if(vResult.vt == VT_ERROR)
    {
        Scierror(999, _("%s: Enable to set new range '%ls'.\n"), fname, pwstRange);
        free(pwstRange);
        return 1;
    }

    free(pwstRange);
    //offset new range
    VARIANT vRow;
    vRow.vt = VT_I4;
    vRow.lVal = iRowOffset;

    VARIANT vCol;
    vCol.vt = VT_I4;
    vCol.lVal = iColOffset;

    VARIANT vOffset[2];
    vOffset[0] = vRow;
    vOffset[1] = vCol;

    vResult = currentObjExcelLink->callMethod(L"Range", L"Offset", vOffset, 2);
    if(vResult.vt == VT_ERROR)
    {
        Scierror(999, _("%s: Enable to compute offset.\n"), fname);
        return 1;
    }

    //get current range information
    int iNewRowStart = 0;
    int iNewColStart = 0;
    int iNewRowSize = 0;
    int iNewColSize = 0;
    currentObjExcelLink->GetRange(&iNewColStart, &iNewRowStart, &iNewColSize, &iNewRowSize);

    //set old range if exsit
    if(bRangeExist)
    {
        wchar_t* pwstOldRange = currentObjExcelLink->GetRangeString(iNewColStart, iNewRowStart, iNewColSize, iNewRowSize);

        VARIANT vRange;
        vRange.vt = VT_BSTR;
        vRange.bstrVal = SysAllocString(pwstOldRange);
        free(pwstOldRange);
        VARIANT vResult = currentObjExcelLink->callMethod(L"Worksheet", L"Range", &vRange, 1);
        if(vResult.vt == VT_ERROR)
        {
            Scierror(999, _("%s: Enable to reset range'.\n"), fname);
            return 1;
        }
    }

    //compute offset range

    wchar_t* pwstOffset = currentObjExcelLink->GetRangeString(iNewColStart, iNewRowStart, iNewColSize, iNewRowSize);
    createSingleWideString(pvApiCtx, nbInputArgument(pvApiCtx) + 1, pwstOffset);
    free(pwstOffset);
    AssignOutputVariable(pvApiCtx, 1) = nbInputArgument(pvApiCtx) + 1;
    ReturnArguments(pvApiCtx);
    return 0;
}

#ifdef __cplusplus
}
#endif
