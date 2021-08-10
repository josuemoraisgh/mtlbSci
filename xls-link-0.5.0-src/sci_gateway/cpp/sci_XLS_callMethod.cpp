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

static int getCalledMethodArgumentValues(int *piAddrList, int *iNbArgValues, VARIANT **pvArgValues, char *fname, void *pvApiCtx);

#ifdef __cplusplus
extern "C"
{
#endif

#include "gateway_xls_link.h"

#include <api_scilab.h>
#include <localization.h>
#include <Scierror.h>

#include <stdlib.h>
#include <stdio.h>

// Call an Excel method of an object (with arguments or named arguments)
// Input arguments:
// - sequence of strings containing the objects and method names (ex: "Application", "Workbooks", "Add")
// - an optional list containing the called method argument values (ex: list("dummy", 2))
// - an optional constant matrix containing the called method argument IDs (DISPID) (ex: [0, 4] for Workbooks.Open(filename=..., password=...))
// Output arguments:
//  - output of the called method
int sci_XLS_callMethod(GATEWAY_PARAMETERS)
{
    SciErr sciErr;
    int *piAddrVar = NULL;
    int *piAddrLastVar = NULL;
    int iType = 0;

    VARIANT *pvArgValues = NULL;
    int iNbArgValues = 0;
    DISPID *piArgIDs = NULL;
    int iNbArgIDs = 0;

    wchar_t **pwstStrings = NULL;
    int iNbStrings = 0;

    CheckInputArgumentAtLeast(pvApiCtx, 2);
    CheckOutputArgument(pvApiCtx, 0, 1);

    int iNbInput = nbInputArgument(pvApiCtx);

    // Check type of last gateway argument
    sciErr = getVarAddressFromPosition(pvApiCtx, iNbInput, &piAddrLastVar);
    if (sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 1;
    }

    sciErr = getVarType(pvApiCtx, piAddrLastVar, &iType);
    if (sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 1;
    }

    if (iType == sci_list)
    {
        // Last argument of the gateway is a list (containing the called method argument values)
        getCalledMethodArgumentValues(piAddrLastVar, &iNbArgValues, &pvArgValues, fname, pvApiCtx);

        iNbStrings = iNbInput - 1;
    }
    else if (iType == sci_matrix)
    {
        // Last argument of the gateway is a constant matrix (containing the called method argument IDs)
        // => the previous argument must a list (containing the called method argument values)
        sciErr = getVarAddressFromPosition(pvApiCtx, iNbInput - 1, &piAddrVar);
        if (sciErr.iErr)
        {
            printError(&sciErr, 0);
            return 1;
        }

        sciErr = getVarType(pvApiCtx, piAddrVar, &iType);
        if (sciErr.iErr)
        {
            printError(&sciErr, 0);
            return 1;
        }

        if (iType == sci_list)
        {
            int iRows, iCols = 0;
            double *pdIDs = NULL;

            // OK, previous argument is a list, we extract the called method argument values
            getCalledMethodArgumentValues(piAddrVar, &iNbArgValues, &pvArgValues, fname, pvApiCtx);

            // And we extract the called method argument IDs in the last argument of the gateway
            sciErr = getMatrixOfDouble(pvApiCtx, piAddrLastVar, &iRows, &iCols, &pdIDs);
            if(sciErr.iErr)
            {
                printError(&sciErr, 0);
                return 1;
            }

            iNbArgIDs = iRows * iCols;
            piArgIDs = (DISPID *)malloc(iNbArgIDs * sizeof(DISPID));
            for (int i = 0; i < iNbArgIDs; i++)
            {
                piArgIDs[i] = (DISPID)pdIDs[i];
            }

            iNbStrings = iNbInput - 2;
        }
        else
        {
            Scierror(999, _("%s: Wrong type for argument #%d: a constant matrix is expected.\n"), fname, iNbInput - 1);
            return 1;
        }
    }
    else
    {
        iNbStrings = iNbInput;
    }

    // Read the first arguments which must be strings
    // They contain the names of the Excel object hierarchy to traverse, and finally the method to call
    // ex: "Workbook", "Worksheets", "Open"
    pwstStrings = (wchar_t **)malloc(iNbStrings * sizeof(wchar_t *));

    for (int i = 0; i < iNbStrings; i++)
    {
        sciErr = getVarAddressFromPosition(pvApiCtx, i + 1, &piAddrVar);
        if (sciErr.iErr)
        {
            printError(&sciErr, 0);
            return 1;
        }

        if (!isStringType(pvApiCtx, piAddrVar))
        {
            Scierror(999, _("%s: Wrong type for argument #%d: a string is expected.\n"), fname, i + 1);
            return 1;
        }

        if (getAllocatedSingleWideString(pvApiCtx, piAddrVar, &pwstStrings[i]))
        {
            Scierror(999, _("%s: Unable to get string in argument #%d.\n"), fname, i + 1);
            return 1;
        }
    }

    ExcelLink *currentObjExcelLink = getObjExcelLink();

    VARIANT vResult;
    VariantClear(&vResult);

    // Traverse the Excel object hierarchy if needed
    if (iNbStrings > 2)
    {
        VARIANT vObject;
        VariantClear(&vObject);
        vObject.vt = VT_EMPTY;
        vObject = currentObjExcelLink->getProperty(pwstStrings[0], pwstStrings[1]);
        for (int i = 2; i < iNbStrings - 2; i++)
        {
            vObject = currentObjExcelLink->getProperty(vObject, pwstStrings[i]);
        }

        // And call the method
        if (vObject.vt != VT_EMPTY)
        {
            vResult = currentObjExcelLink->callMethodNamedArgs(vObject, pwstStrings[iNbStrings-1], pvArgValues, iNbArgValues, piArgIDs, iNbArgIDs);
        }
    }
    else
    {
        // No object hierarchy to traverse, call the method on the given object
        vResult = currentObjExcelLink->callMethodNamedArgs(pwstStrings[0], pwstStrings[1], pvArgValues, iNbArgValues, piArgIDs, iNbArgIDs);
    }

    if (vResult.vt == VT_ERROR)
    {
        createScalarBoolean(pvApiCtx, iNbInput + 1, 0);
    }
    else
    {
        createScalarBoolean(pvApiCtx, iNbInput + 1, 1);
    }

    AssignOutputVariable(pvApiCtx, 1) = iNbInput + 1;
    ReturnArguments(pvApiCtx);

    freeAllocatedMatrixOfWideString(1, iNbStrings, pwstStrings);
    free(pvArgValues);
    free(piArgIDs);

    return 0;
}

#ifdef __cplusplus
}
#endif

int getCalledMethodArgumentValues(int *piAddrList, int *iNbArgValues, VARIANT **pvArgValues, char *fname, void *pvApiCtx)
{
    SciErr sciErr = getListItemNumber(pvApiCtx, piAddrList, iNbArgValues);
    if (sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 1;
    }

    *pvArgValues = (VARIANT *) malloc((*iNbArgValues) * sizeof(VARIANT));

    for (int i = 0; i < *iNbArgValues; i++)
    {
        int *piAddrItem = NULL;
        sciErr = getListItemAddress(pvApiCtx, piAddrList, i + 1, &piAddrItem);
        if(sciErr.iErr)
        {
            printError(&sciErr, 0);
            return 0;
        }
        (*pvArgValues)[i] = getVariant(piAddrItem, pvApiCtx);
    }

    return 0;
}

