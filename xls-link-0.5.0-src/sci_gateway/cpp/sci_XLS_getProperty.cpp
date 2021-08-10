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
#include "setOutputArgument.hxx"

#ifdef __cplusplus
extern "C"
{
#endif

#include "gateway_xls_link.h"

#include <api_scilab.h>
#include <localization.h>
#include <Scierror.h>

#include <stdlib.h>

int sci_XLS_getProperty(GATEWAY_PARAMETERS)
{
    SciErr sciErr;

    int* piProperty = NULL;
    wchar_t** pwstProperty = NULL;

    int iRhs = nbInputArgument(pvApiCtx);

    CheckInputArgumentAtLeast(pvApiCtx, 2);
    CheckOutputArgument(pvApiCtx, 0, 1);

    pwstProperty = (wchar_t**)malloc(sizeof(wchar_t*) * iRhs);

    for(int i = 0 ; i < iRhs ; i++)
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

    ExcelLink *currentObjExcelLink = getObjExcelLink();
    VARIANT vResult = currentObjExcelLink->getProperty(pwstProperty[0], pwstProperty[1]);
    for(int i = 2 ; i < iRhs ; i++)
    {
        vResult = currentObjExcelLink->getProperty(vResult, pwstProperty[i]);
        if(vResult.vt == VT_ERROR)
        {
            break;
        }
    }

    //clean
    freeAllocatedMatrixOfWideString(1, iRhs, pwstProperty);

    setOutputArgument(pvApiCtx, 1, vResult, pvApiCtx);
    AssignOutputVariable(pvApiCtx, 1) = iRhs + 1;
    ReturnArguments(pvApiCtx);

    return 0;
}

#ifdef __cplusplus
}
#endif
