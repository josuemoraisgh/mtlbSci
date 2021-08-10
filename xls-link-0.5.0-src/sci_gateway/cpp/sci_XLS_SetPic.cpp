/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/

#include "MainObject.hxx"

#ifdef __cplusplus
extern "C"
{
#endif

#include "gateway_xls_link.h"

#include <sci_types.h>
#include <localization.h>
#include <Scierror.h>
#include <api_scilab.h>

#include <stdlib.h>

int sci_XLS_SetPic(GATEWAY_PARAMETERS)
{
    int* piAddr1 = NULL;
    int* piAddr2 = NULL;
 	double* pdblPos = NULL;
 	wchar_t* pwstFile = NULL;

    bool bResult = false;

    CheckInputArgument(pvApiCtx, 1, 2);
    CheckOutputArgument(pvApiCtx, 0, 1);

    int iRhs = nbInputArgument(pvApiCtx);
    if (iRhs == 2)
    {
        getVarAddressFromPosition(pvApiCtx, 2, &piAddr2);
        if (isDoubleType(pvApiCtx, piAddr2) == FALSE)
        {
            Scierror(999,_("%s: Wrong type for input argument #%d.\n"), fname, 2);
            return 1;
        }

        int iRows = 0;
        int iCols = 0;
        getMatrixOfDouble(pvApiCtx, piAddr2, &iRows, &iCols, &pdblPos);
        if (iRows != 1 || iCols != 4)
        {
            Scierror(999,_("%s: Wrong size for input argument #%d: A column vector expected.\n"), fname, 2);
            return 1;
        }
    }

    getVarAddressFromPosition(pvApiCtx, 1, &piAddr1);
    if(isStringType(pvApiCtx, piAddr1) == FALSE)
    {
        Scierror(999,_("%s: Wrong type for input argument #%d: A string expected.\n"), fname, 1);
        return 1;
    }

    getAllocatedSingleWideString(pvApiCtx, piAddr1, &pwstFile);
    if (pwstFile)
    {
        if (iRhs == 2)
        {
            bResult = getObjExcelLink()->SetPic(pwstFile, pdblPos[0], pdblPos[1], pdblPos[2], pdblPos[3]);
        }
        else
        {
            bResult = getObjExcelLink()->SetPic(pwstFile);
        }

        free(pwstFile);
        pwstFile = NULL;
    }

    createScalarBoolean(pvApiCtx, iRhs + 1, bResult ? 1 : 0);
    AssignOutputVariable(pvApiCtx, 1) = iRhs + 1;
    ReturnArguments(pvApiCtx);
    return 0;
}

#ifdef __cplusplus
}
#endif
