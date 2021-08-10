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

#include <api_scilab.h>
#include <localization.h>
#include <Scierror.h>

#include <stdlib.h>

int sci_XLS_GetRange(GATEWAY_PARAMETERS)
{
    int iRowStart = 0;
    int iColStart = 0;
    int iRowSize = 0;
    int iColSize = 0;

    int iLhs = nbOutputArgument(pvApiCtx);
    int iRhs = nbInputArgument(pvApiCtx);

    CheckInputArgument(pvApiCtx, 0,4);
    if(iLhs != 1 && iLhs != 4)
    {
        Scierror(999, _("%s: Wrong number of output arguments: %d or %d expected.\n"), fname, 1, 4);
        return 1;
    }

    ExcelLink *currentObjExcelLink = getObjExcelLink();

    if(iRhs == 0 || iRhs == 2)
    {
        //get range information from current one
        if(currentObjExcelLink->GetRange(&iColStart, &iRowStart, &iColSize, &iRowSize) == false)
        {
            Scierror(999, _("%s: Unable to get current range information.\n"), fname);
            return 1;
        }

        if(iRhs == 2)
        {
            if(iColSize != 1 || iRowSize != 1)
            {
                Scierror(999, _("%s: Unable to compute range\nCurrent range must be a cell"), fname);
                return 1;
            }

            int piValues[2];
            for(int i = 0 ; i < 2 ; i++)
            {
                double dbl = 0;
                int* piAddr = NULL;
                getVarAddressFromPosition(pvApiCtx, i + 1, &piAddr);
                getScalarDouble(pvApiCtx, piAddr, &dbl);
                piValues[i] = (int)dbl;
            }

            iRowSize = piValues[0];
            iColSize = piValues[1];
        }
    }
    else if(iRhs == 1 || iRhs == 3)
    {
        //get range information from input string argument like "A1:F5"
        int iOldRowStart = 0;
        int iOldColStart = 0;
        int iOldRowSize = 0;
        int iOldColSize = 0;
        int* piAddrRangeIn = NULL;
        wchar_t* pwstRangeIn = NULL;

        getVarAddressFromPosition(pvApiCtx, 1, &piAddrRangeIn);
        if(isStringType(pvApiCtx, piAddrRangeIn) == 0 || isScalar(pvApiCtx, piAddrRangeIn) == 0)
        {
            Scierror(999, _("%s: Wrong type of input argument #%d: String expected.\n"), fname, 1);
            return 1;
        }

        getAllocatedSingleWideString(pvApiCtx, piAddrRangeIn, &pwstRangeIn);

        //save current range
        if(currentObjExcelLink->GetRange(&iOldColStart, &iOldRowStart, &iOldColSize, &iOldRowSize) == false)
        {
            Scierror(999, _("%s: Unable to get current range information.\n"), fname);
            free(pwstRangeIn);
            return 1;
        }

        //set new range
        VARIANT vRange;
        vRange.vt = VT_BSTR;
        vRange.bstrVal = SysAllocString(pwstRangeIn);
        VARIANT vResult = currentObjExcelLink->callMethod(L"Worksheet", L"Range", &vRange, 1);
        VariantClear(&vRange);

        if(vResult.vt == VT_ERROR)
        {
            Scierror(999, _("%s: Enable to set new range '%ls'.\n"), fname, pwstRangeIn);
            free(pwstRangeIn);
            return 1;
        }

        free(pwstRangeIn);

        //get range information from current one
        if(currentObjExcelLink->GetRange(&iColStart, &iRowStart, &iColSize, &iRowSize) == false)
        {
            Scierror(999, _("%s: Unable to get current range information.\n"), fname);
            return 1;
        }

        if(iRhs == 3)
        {
            if(iColSize != 1 || iRowSize != 1)
            {
                Scierror(999, _("%s: Unable to compute range\nCurrent range must be a cell"), fname);
                return 1;
            }

            int piValues[2];
            for(int i = 0 ; i < 2 ; i++)
            {
                double dbl = 0;
                int* piAddr = NULL;
                getVarAddressFromPosition(pvApiCtx, i + 2, &piAddr);
                getScalarDouble(pvApiCtx, piAddr, &dbl);
                piValues[i] = (int)dbl;
            }

            iRowSize = piValues[0];
            iColSize = piValues[1];
        }

        //restore old range
        wchar_t* pwstOldRange = currentObjExcelLink->GetRangeString(iOldColStart, iOldRowStart, iOldColSize, iOldRowSize);

        VARIANT vOldRange;
        vOldRange.vt = VT_BSTR;
        vOldRange.bstrVal = SysAllocString(pwstOldRange);
        free(pwstOldRange);
        vResult = currentObjExcelLink->callMethod(L"Worksheet", L"Range", &vOldRange, 1);
        if(vResult.vt == VT_ERROR)
        {
            Scierror(999, _("%s: Enable to reset range'.\n"), fname);
            return 1;
        }
    }
    else //iRhs == 4
    {
        //get information from input arguments like ( x, y, w, h )
        int piValues[4];
        for(int i = 0 ; i < 4 ; i++)
        {
            double dbl = 0;
            int* piAddr = NULL;
            getVarAddressFromPosition(pvApiCtx, i + 1, &piAddr);
            getScalarDouble(pvApiCtx, piAddr, &dbl);
            piValues[i] = (int)dbl;
        }

        iRowStart = piValues[0];
        iColStart = piValues[1];
        iRowSize = piValues[2];
        iColSize = piValues[3];
    }

    if(iLhs == 4)
    {
        createScalarDouble(pvApiCtx, iRhs + 1, iColStart);
        createScalarDouble(pvApiCtx, iRhs + 2, iRowStart);
        createScalarDouble(pvApiCtx, iRhs + 3, iColSize);
        createScalarDouble(pvApiCtx, iRhs + 4, iRowSize);

        AssignOutputVariable(pvApiCtx, 1) = iRhs + 1;
        AssignOutputVariable(pvApiCtx, 2) = iRhs + 2;
        AssignOutputVariable(pvApiCtx, 3) = iRhs + 3;
        AssignOutputVariable(pvApiCtx, 4) = iRhs + 4;
    }
    else
    {

        wchar_t* pwstRange = currentObjExcelLink->GetRangeString(iColStart, iRowStart, iColSize, iRowSize);
        createSingleWideString(pvApiCtx, iRhs + 1, pwstRange);
        free(pwstRange);
        AssignOutputVariable(pvApiCtx, 1) = iRhs + 1;
    }

    ReturnArguments(pvApiCtx);
    return 0;
}

#ifdef __cplusplus
}
#endif
