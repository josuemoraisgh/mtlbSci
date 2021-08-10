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
#include <charEncoding.h>
#include <Scierror.h>

#include <stdlib.h>
#include <stdio.h>

int sci_XLS_ExtendRange(GATEWAY_PARAMETERS)
{
    int* piAddrRow = NULL;
    double dblRow = 0;
    int iRow = 0;

    int* piAddrCol = NULL;
    double dblCol = 0;
    int iCol = 0;

    CheckInputArgument(pvApiCtx, 2, 2);
    CheckOutputArgument(pvApiCtx, 0, 1);

    getVarAddressFromPosition(pvApiCtx, 1, &piAddrRow);
    getVarAddressFromPosition(pvApiCtx, 2, &piAddrCol);

    if(isDoubleType(pvApiCtx, piAddrRow) == 0 || isScalar(pvApiCtx, piAddrRow) == 0)
    {
        Scierror(999, _("%s: Wrong type of input argument #%d: A real scalar expected.\n"), fname, 1);
        return 1;
    }

    getScalarDouble(pvApiCtx, piAddrRow, &dblRow);
    iRow = (int)dblRow;

    if(isDoubleType(pvApiCtx, piAddrCol) == 0 || isScalar(pvApiCtx, piAddrCol) == 0)
    {
        Scierror(999, _("%s: Wrong type of input argument #%d: A real scalar expected.\n"), fname, 2);
        return 1;
    }

    getScalarDouble(pvApiCtx, piAddrCol, &dblCol);
    iCol = (int)dblCol;

    ExcelLink *currentObjExcelLink = getObjExcelLink();

    VARIANT vRowStart = currentObjExcelLink->getProperty(L"Range", L"Row");
    VARIANT vColStart = currentObjExcelLink->getProperty(L"Range", L"Column");

    int iRowStart = vRowStart.lVal;
    int iColStart = vColStart.lVal;
    int iRowEnd = iRowStart + iRow;
    int iColEnd = iColStart + iCol;

    wchar_t* pwstRangeStart = IndToStr(iRowStart, iColStart);
    wchar_t* pwstRangeEnd = IndToStr(iRowEnd, iColEnd);

    int iLen = (int)wcslen(pwstRangeStart) + (int)wcslen(pwstRangeEnd) + 2; //1 for : and 1 for \0
    wchar_t* pwstRange = (wchar_t*)malloc(sizeof(wchar_t) * iLen);

    swprintf_s(pwstRange, iLen, L"%ls:%ls", pwstRangeStart, pwstRangeEnd);
    free(pwstRangeStart);
    free(pwstRangeEnd);

    VARIANT vRange;
    vRange.vt = VT_BSTR;
    vRange.bstrVal = SysAllocString(pwstRange);

    VARIANT vResult = currentObjExcelLink->callMethod(L"Worksheet", L"Range", &vRange, 1);

    if(vResult.vt == VT_ERROR)
    {
        createScalarBoolean(pvApiCtx, nbInputArgument(pvApiCtx) + 1, 0);
    }
    else
    {
        createScalarBoolean(pvApiCtx, nbInputArgument(pvApiCtx) + 1, 1);
    }

    AssignOutputVariable(pvApiCtx, 1) = nbInputArgument(pvApiCtx) + 1;
    ReturnArguments(pvApiCtx);
    return 0;
}

#ifdef __cplusplus
}
#endif

