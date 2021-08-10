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

int sci_XLS_setProperty(GATEWAY_PARAMETERS)
{
    SciErr sciErr;

    int* piProperty = NULL;
    wchar_t** pwstProperty = NULL;

    int* piValue = NULL;

    int iRhs = nbInputArgument(pvApiCtx);

    CheckInputArgumentAtLeast(pvApiCtx, 3);
    CheckOutputArgument(pvApiCtx, 0, 1);

    //properties list
    pwstProperty = (wchar_t**)malloc(sizeof(wchar_t*) * (iRhs - 1));

    for(int i = 0 ; i < iRhs - 1 ; i++)
    {
        sciErr = getVarAddressFromPosition(pvApiCtx, i + 1, &piProperty);
        if(sciErr.iErr)
        {
            printError(&sciErr, 0);
            Scierror(999, _("%s: unable to get argument #%d\n"), fname, i + 1);
            return 1;
        }

        if(getAllocatedSingleWideString(pvApiCtx, piProperty, &pwstProperty[i]))
        {
            Scierror(999, _("%s: unable to get argument #%d\n"), fname, i + 1);
            return 1;
        }
    }

    //value addr
    getVarAddressFromPosition(pvApiCtx, iRhs, &piValue);

    VARIANT vData = getVariant(piValue, pvApiCtx);

    ExcelLink *currentObjExcelLink = getObjExcelLink();

    VARIANT vResult;
    VariantClear(&vResult);
    vResult.vt = VT_EMPTY;

    if(iRhs > 3)
    {
        vResult = currentObjExcelLink->getProperty(pwstProperty[0], pwstProperty[1]);
        for(int i = 2 ; i < iRhs - 2 ; i++)
        {
            vResult = currentObjExcelLink->getProperty(vResult, pwstProperty[i]);
        }
    }

    bool bRet = false;
    if(vResult.vt == 0)
    {
        bRet = currentObjExcelLink->setProperty(pwstProperty[0], pwstProperty[1], vData, 1);
    }
    else
    {
        bRet = currentObjExcelLink->setProperty(vResult, pwstProperty[iRhs - 2], vData, 1);
    }


    createScalarBoolean(pvApiCtx, iRhs + 1, bRet ? 1 : 0);
    AssignOutputVariable(pvApiCtx, 1) = iRhs + 1;
    ReturnArguments(pvApiCtx);

    freeAllocatedMatrixOfWideString(1, iRhs - 1, pwstProperty);

    return 0;
}

#ifdef __cplusplus
}
#endif
