/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/
#include "AutomationHelper.hxx"
#include "ExcelLink.hxx"
#include "setOutputArgument.hxx"

#include <api_scilab.h>

typedef enum {
ExcelErrDiv0  = -2146826281,
ExcelErrNA    = -2146826246,
ExcelErrName  = -2146826259,
ExcelErrNull  = -2146826288,
ExcelErrNum   = -2146826252,
ExcelErrRef   = -2146826265,
ExcelErrValue = -2146826273
} ExcelErrEnum;


static double returnNaN(void)
{
    static int first = 1;
    static double nan = 1.0;

    if ( first )
    {
        nan = (nan - (double) first)/(nan - (double) first);
        first = 0;
    }
    return (nan);
}

static double returnINF(bool bPositive)
{
    double v = 0;
    double p = 10;
    if (!bPositive) p = -10;
    return (double) p / (double)v;
}

#ifdef __cplusplus
extern "C"
#endif
int setOutputArgument(void* _pvCtx, int _iLhs, VARIANT _v, void *pvApiCtx)
{
    int iLhs = Rhs + _iLhs;
    if (_v.vt == (VT_ARRAY | VT_VARIANT))
    {//ARRAY TYPE
        int m = 0;
        int n = 0;

        SAFEARRAY* pSafeArray  = _v.parray;
        if ( GetDimensions(pSafeArray, &m, &n) )
        {
            int previousType = -1;
            int k = 0;
            for (int i = 1 ; i <= m; i++)
            {
                for (int j = 1; j <= n; j++)
                {
                    HRESULT hRes;
                    VARIANT CurrentChamp;
                    long lDimension[DIM_MAX];

                    lDimension[0] = i;
                    lDimension[1] = j;

                    hRes = SafeArrayGetElement(pSafeArray, lDimension, &CurrentChamp);
                    if FAILED(hRes) break;

                    if (k == 0)
                    {
                        previousType = CurrentChamp.vt;
                        k++;
                    }
                    else
                    {
                        if (CurrentChamp.vt == VT_ERROR || previousType != CurrentChamp.vt)
                        {
                            previousType = VT_BSTR;
                            break;
                        }

                        previousType = CurrentChamp.vt;
                    }
                }
            }

            switch(previousType)
            {
                /* string: 0 , double : 1 */
            case VT_I2:
            case VT_I4:
            case VT_R4:
            case VT_R8:
            case VT_CY:
            case VT_I1:
            case VT_UI1:
            case VT_UI2:
            case VT_UI4:
            case VT_I8:
            case VT_UI8:
            case VT_INT:
            case VT_UINT:
                {
                    int k = 0;
                    double* pDbl = NULL;
                    VariantChangeType(&_v, &_v, VARIANT_NOUSEROVERRIDE, VT_R8);
                    allocMatrixOfDouble(_pvCtx, iLhs, m, n, &pDbl);

                    VARIANT CurrentChamp;
                    long lDimension[DIM_MAX];

                    for (int i = 0 ; i < n; i++)
                    {
                        for (int j = 0; j < m; j++)
                        {
                            lDimension[0] = j + 1;
                            lDimension[1] = i + 1;
                            SafeArrayGetElement(pSafeArray, lDimension, &CurrentChamp);
                            if (CurrentChamp.vt != VT_R8)
                            {
                                VariantChangeType(&CurrentChamp, &CurrentChamp, VARIANT_NOUSEROVERRIDE,VT_R8);
                            }

                            pDbl[k++] = CurrentChamp.dblVal;
                        }
                    }
                }
                break;
            case VT_BOOL:
                {
                    int k = 0;
                    int* piBool = NULL;
                    VariantChangeType(&_v, &_v, VARIANT_NOUSEROVERRIDE, VT_BOOL);
                    allocMatrixOfBoolean(_pvCtx, iLhs, m, n, &piBool);

                    VARIANT CurrentChamp;
                    long lDimension[DIM_MAX];

                    for (int i = 0 ; i < n; i++)
                    {
                        for (int j = 0; j < m; j++)
                        {
                            lDimension[0] = j + 1;
                            lDimension[1] = i + 1;
                            SafeArrayGetElement(pSafeArray, lDimension, &CurrentChamp);
                            if (CurrentChamp.vt != VT_BOOL)
                            {
                                VariantChangeType(&CurrentChamp, &CurrentChamp, VARIANT_NOUSEROVERRIDE, VT_BOOL);
                            }

                            piBool[k++] = (CurrentChamp.bVal == 0 ? 0 : 1);
                        }
                    }
                }
                break;
            case VT_EMPTY:
                createEmptyMatrix(_pvCtx, iLhs);
                break;
            default:
                {
                    int k = 0;
                    wchar_t** pwst = (wchar_t**)malloc(sizeof(wchar_t*) * m * n);

                    VARIANT CurrentChamp;
                    long lDimension[DIM_MAX];
                    for (int i = 0 ; i < n; i++)
                    {
                        for (int j = 0; j < m; j++)
                        {
                            lDimension[0] = j + 1;
                            lDimension[1] = i + 1;
                            SafeArrayGetElement(pSafeArray, lDimension, &CurrentChamp);

                            if (CurrentChamp.vt == VT_ERROR)
                            {
                                switch(CurrentChamp.scode)
                                {
                                case ExcelErrDiv0 :
                                    pwst[k++] = _wcsdup(L"Inf");
                                    break;
                                case ExcelErrNA :
                                    pwst[k++] = _wcsdup(L"NaN");
                                    break;
                                case ExcelErrNum :
                                    pwst[k++] = _wcsdup(L"NaN");
                                    break;
                                default :
                                    pwst[k++] = _wcsdup(L"#ERROR");
                                    break;
                                }
                            }
                            else
                            {
                                if (CurrentChamp.vt != VT_BSTR)
                                {
                                    VariantChangeType(&CurrentChamp, &CurrentChamp, VARIANT_NOUSEROVERRIDE, VT_BSTR);
                                }

                                pwst[k++] = _wcsdup(CurrentChamp.bstrVal);
                            }
                        }
                    }

                    createMatrixOfWideString(_pvCtx, iLhs, m, n, pwst);

                    for (int i = 0 ; i < m*n; i++)
                    {
                        free(pwst[i]);
                    }
                    free(pwst);
                }
                break;
            }
        }
    }
    else
    {//SINGLE TYPE
        switch(_v.vt)
        {
            /* string: 0 , double : 1 */
        case VT_I2:
        case VT_I4:
        case VT_R4:
        case VT_R8:
        case VT_CY:
        case VT_I1:
        case VT_UI1:
        case VT_UI2:
        case VT_UI4:
        case VT_I8:
        case VT_UI8:
        case VT_INT:
        case VT_UINT:
            VariantChangeType(&_v, &_v, VARIANT_NOUSEROVERRIDE, VT_R8);
            createScalarDouble(_pvCtx, iLhs, _v.dblVal);
            break;
        case VT_BOOL:
            VariantChangeType(&_v, &_v, VARIANT_NOUSEROVERRIDE, VT_BOOL);
            createScalarBoolean(_pvCtx, iLhs, _v.boolVal == 0 ? 0 : 1);
            break;
        case VT_EMPTY:
            createEmptyMatrix(_pvCtx, iLhs);
            break;
        case VT_DISPATCH :
            //if data must be store, it is already done before
            createScalarDouble(_pvCtx, iLhs, 0);
            break;
        case VT_ERROR :
            switch(_v.scode)
            {
            case ExcelErrDiv0 :
                createScalarDouble(_pvCtx, iLhs, returnINF(true));
                break;
            case ExcelErrNA :
                createScalarDouble(_pvCtx, iLhs, returnNaN());
                break;
            case ExcelErrNum :
                createScalarDouble(_pvCtx, iLhs, returnNaN());
                break;
            default :
                //if data must be store, it is already done before
                createScalarBoolean(_pvCtx, iLhs, 0);
                break;
            }
            break;
        default:
            if (VariantChangeType(&_v, &_v, VARIANT_NOUSEROVERRIDE, VT_BSTR) == S_OK)
            {
                createSingleWideString(_pvCtx, iLhs, _v.bstrVal);
            }
            else
            {
                createSingleWideString(_pvCtx, iLhs, L"#ERROR");
            }
            break;
        }
    }
    return 0;
}
/*--------------------------------------------------------------------------*/
