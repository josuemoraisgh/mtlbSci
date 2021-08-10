/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/
#include "getInputArgument.hxx"
#include <api_scilab.h>
#include <stdlib.h>

typedef enum { 
ExcelErrDiv0  = -2146826281,
ExcelErrNA    = -2146826246,
ExcelErrName  = -2146826259,
ExcelErrNull  = -2146826288,
ExcelErrNum   = -2146826252,
ExcelErrRef   = -2146826265,
ExcelErrValue = -2146826273
} ExcelErrEnum;

static VARIANT DoubleToVariant(double* _pDbl, int _iRows, int _iCols)
{
    VARIANT vResult;

    if(_iRows == 1 && _iCols == 1)
    {
        vResult.vt = VT_R8;
        vResult.dblVal = _pDbl[0];
    }
    else
    {
        SAFEARRAYBOUND sab[2];
        sab[0].lLbound = 1; sab[0].cElements = _iRows;
        sab[1].lLbound = 1; sab[1].cElements = _iCols;

        vResult.vt = VT_ARRAY | VT_VARIANT;
        vResult.parray = SafeArrayCreate(VT_VARIANT, 2, sab);

        for(int j = 0 ; j < _iCols ; j++) 
        {
            for(int i = 0 ; i < _iRows ; i++) 
            {
                // Create entry value for (i,j)
                double pdValue = _pDbl[i + j * _iRows];

                VARIANT tmp;

                if (_isnan(pdValue))
                {
                    tmp.vt = VT_ERROR;
                    tmp.scode = ExcelErrNA;
                }
                else if (!_finite(pdValue))
                {
                    tmp.vt = VT_ERROR;
                    tmp.scode = ExcelErrDiv0;
                }
                else
                {
                    tmp.vt = VT_R8;
                    tmp.dblVal = (DOUBLE)pdValue;
                }

                // Add to safearray...
                long indices[] = {i + 1, j + 1}; //1-indexed
                SafeArrayPutElement(vResult.parray, indices, (void *)&tmp);
            }
        }
    }

    return vResult;
}
/*--------------------------------------------------------------------------*/
static VARIANT StringToVariant(wchar_t** _pStr, int _iRows, int _iCols)
{
    VARIANT vResult;
    if(_iRows == 1 && _iCols == 1)
    {
        //special
        vResult.vt = VT_BSTR;
        vResult.bstrVal = SysAllocString(_pStr[0]);
    }
    else
    {
        SAFEARRAYBOUND sab[2];
        sab[0].lLbound = 1; sab[0].cElements = _iRows;
        sab[1].lLbound = 1; sab[1].cElements = _iCols;
        vResult.vt = VT_ARRAY | VT_VARIANT;
        vResult.parray = SafeArrayCreate(VT_VARIANT, 2, sab);

        for(int j = 0 ; j < _iCols ; j++) 
        {
            for(int i = 0 ; i < _iRows ; i++) 
            {
                // Create entry value for (i,j)
                wchar_t *Str = _pStr[i + j* _iRows];
                if (Str == NULL)
                {
                    vResult.vt = 0;
                    return vResult;
                }
                else
                {
                    VARIANT tmp;
                    tmp.vt = VT_BSTR;
                    tmp.bstrVal = SysAllocString(Str);

                    // Add to safearray...
                    long indices[] = {i + 1, j + 1};
                    SafeArrayPutElement(vResult.parray, indices, (void *)&tmp);
                }
            }
        }
    }

    return vResult;
}
/*--------------------------------------------------------------------------*/
static VARIANT BoolToVariant(int* _pBool, int _iRows, int _iCols)
{
    VARIANT vResult;
    if(_iRows == 1 && _iCols == 1)
    {
        //special
        vResult.vt = VT_BOOL;
        vResult.boolVal = (_pBool[0] ? VARIANT_TRUE : VARIANT_FALSE);
        return vResult;
    }
    else
    {
        SAFEARRAYBOUND sab[2];

        sab[0].lLbound = 1; sab[0].cElements = _iRows;
        sab[1].lLbound = 1; sab[1].cElements = _iCols;
        vResult.vt = VT_ARRAY | VT_VARIANT;
        vResult.parray = SafeArrayCreate(VT_VARIANT, 2, sab);

        for(int j = 0 ; j < _iCols ; j++) 
        {
            for(int i = 0 ; i < _iRows ; i++) 
            {
                // Create entry value for (i,j)

                VARIANT tmp;
                tmp.vt = VT_BOOL;
                tmp.boolVal = (_pBool[i + j * _iRows] ? VARIANT_TRUE : VARIANT_FALSE);

                // Add to safearray...
                long indices[] = {i + 1, j + 1};
                SafeArrayPutElement(vResult.parray, indices, (void *)&tmp);
            }
        }
    }
    return vResult;
}
/*--------------------------------------------------------------------------*/
#ifdef __cplusplus
extern "C" 
#endif
VARIANT getVariant(int* _piAddrValue, void *pvApiCtx)
{
    VARIANT vEmpty;
    int iDataType = 0;

    vEmpty.vt = VT_EMPTY;
    VariantClear(&vEmpty);

    getVarType(pvApiCtx, _piAddrValue, &iDataType);

    switch(iDataType)
    {
    case sci_matrix :
        {
            int iRows = 0;
            int iCols = 0;
            double* pdbl = NULL;
            getMatrixOfDouble(pvApiCtx, _piAddrValue, &iRows, &iCols, &pdbl);
            return DoubleToVariant(pdbl, iRows, iCols);
        }
        break;
    case sci_boolean :
        {
            int iRows = 0;
            int iCols = 0;
            int* pi = NULL;
            getMatrixOfBoolean(pvApiCtx, _piAddrValue, &iRows, &iCols, &pi);
            return BoolToVariant(pi, iRows, iCols);
        }
        break;
    case sci_strings :
        {
            int iRows = 0;
            int iCols = 0;
            wchar_t** pwst = NULL;
            VARIANT vResult;
            getAllocatedMatrixOfWideString(pvApiCtx, _piAddrValue, &iRows, &iCols, &pwst);
            vResult = StringToVariant(pwst, iRows, iCols);
            freeAllocatedMatrixOfWideString(iRows, iCols, pwst);
            return vResult;
        }
        break;
    }

    return vEmpty;
}
