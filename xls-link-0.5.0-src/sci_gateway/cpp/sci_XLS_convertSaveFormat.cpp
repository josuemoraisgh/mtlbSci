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
#include "xlFileFormat.h"

#include <api_scilab.h>
#include <localization.h>
#include <Scierror.h>

#include <stdlib.h>

int sci_XLS_convertSaveFormat(GATEWAY_PARAMETERS)
{
    SciErr sciErr;
    int* piAddr = NULL;

    CheckInputArgument(pvApiCtx, 1, 1);
    CheckOutputArgument(pvApiCtx, 0, 1);

    sciErr = getVarAddressFromPosition(pvApiCtx, 1, &piAddr);
    if(sciErr.iErr)
    {
        printError(&sciErr, 1);
        return 1;
    }

    if(isStringType(pvApiCtx, piAddr))
    {
        char* pst = NULL;
        getAllocatedSingleString(pvApiCtx, piAddr, &pst);
        long lFormat = getXlFileFormat(pst);
        createScalarDouble(pvApiCtx, nbInputArgument(pvApiCtx) + 1, lFormat);
    }
    else if(isDoubleType(pvApiCtx, piAddr))
    {

        double dblVal = 0;
        getScalarDouble(pvApiCtx, piAddr, &dblVal);
        char* pst = getXlFileFormatName((long)dblVal);
        createSingleString(pvApiCtx, nbInputArgument(pvApiCtx) + 1, pst);
    }
    else
    {
        Scierror(999,_("%s: Wrong size for input argument #%d: A string or scalar expected.\n"),fname,1);
        return 1;
    }

    AssignOutputVariable(pvApiCtx, 1) = nbInputArgument(pvApiCtx) + 1;
    ReturnArguments(pvApiCtx);
	return 0;
}

#ifdef __cplusplus
}
#endif


