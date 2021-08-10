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
#include "getInputArgument.hxx"

#ifdef __cplusplus
extern "C"
{
#endif

#include "gateway_xls_link.h"

#include <api_scilab.h>
#include <localization.h>
#include <Scierror.h>

#include <stdlib.h>

int sci_XLS_CallMacro(GATEWAY_PARAMETERS)
{
    VARIANT* pvArgs = NULL;

    CheckInputArgumentAtLeast(pvApiCtx, 1);
    CheckOutputArgument(pvApiCtx, 0, 1);

    int iRhs = nbInputArgument(pvApiCtx);

    pvArgs = (VARIANT*)malloc(sizeof(VARIANT) * iRhs);

    for(int i = 0 ; i < iRhs ; i++)
    {
        int* piAddrArg = NULL;
        getVarAddressFromPosition(pvApiCtx, i + 1, &piAddrArg);
        pvArgs[i] = getVariant(piAddrArg, pvApiCtx);
    }

    ExcelLink *currentObjExcelLink = getObjExcelLink();

    VARIANT vResult = currentObjExcelLink->callMethod(L"Application", L"Run", pvArgs, iRhs);

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
