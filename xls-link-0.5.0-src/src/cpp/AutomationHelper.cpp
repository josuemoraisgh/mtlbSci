/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include "AutomationHelper.hxx"
/*--------------------------------------------------------------------------*/
#define RANGE_SEPARATOR ':'
/*--------------------------------------------------------------------------*/

/*
    From http://support.microsoft.com/kb/216686
*/
/*--------------------------------------------------------------------------*/
HRESULT XLS_LINK_Wrap(int autoType, VARIANT *pvResult, IDispatch *pDisp, LPOLESTR ptName, int cArgs, VARIANT* _pArgs, int _cNamedArgIDs, DISPID *_pNamedArgIDs)
{
    if(!pDisp)
    {
        MessageBox(NULL, "NULL IDispatch passed to XLS_LINK_Wrap()", "Error", 0x10010);
        return -1;
    }


    DISPPARAMS dp = { NULL, NULL, 0, 0 };
    DISPID dispID;
    HRESULT hr;
    char szName[200];

    // Convert down to ANSI
    WideCharToMultiByte(CP_ACP, 0, ptName, -1, szName, 256, NULL, NULL);

    // Get DISPID for passed function name
    hr = pDisp->GetIDsOfNames(IID_NULL, &ptName, 1, LOCALE_USER_DEFAULT, &dispID);
    if(FAILED(hr))
    {
#ifdef _DEBUG
        char buf[200];
        sprintf_s(buf, "IDispatch::GetIDsOfNames(\"%s\") failed w/err 0x%08lx", szName, hr);
        MessageBox(NULL, buf, "XLS_LINK_Wrap()", 0x10010);
#endif
        return hr;
    }

    // Build DISPPARAMS
    dp.cArgs = cArgs;
    VARIANT *pArgs = new VARIANT[cArgs];

    // Reverse order for arguments
    for(int i = 0 ; i < cArgs ; i++)
    {
        pArgs[i] = _pArgs[cArgs - (i + 1)];
    }
    dp.rgvarg = pArgs;

    DISPID *pNamedArgIDs = NULL;
    DISPID dispidNamed = DISPID_PROPERTYPUT;

    if(autoType & DISPATCH_PROPERTYPUT)
    {
        // Handle special-case for property-puts
        dp.cNamedArgs = 1;
        dp.rgdispidNamedArgs = &dispidNamed;
    }
    else if (_cNamedArgIDs > 0)
    {
        // Handle named arguments (in fact argument IDs)
        dp.cNamedArgs = _cNamedArgIDs;
        pNamedArgIDs = new DISPID[_cNamedArgIDs];
        for(int i = 0 ; i < _cNamedArgIDs ; i++)
        {
            pNamedArgIDs[i] = _pNamedArgIDs[_cNamedArgIDs - (i + 1)];
        }
        dp.rgdispidNamedArgs = pNamedArgIDs;
    }

    // Make the call!
    hr = pDisp->Invoke(dispID, IID_NULL, LOCALE_SYSTEM_DEFAULT, (WORD)autoType, &dp, pvResult, NULL, NULL);

    if(FAILED(hr))
    {
#ifdef _DEBUG
        char buf[200];
        sprintf_s(buf, "IDispatch::Invoke(\"%s\"=%08lx) failed w/err 0x%08lx", szName, dispID, hr);
        MessageBox(NULL, buf, "XLS_LINK_Wrap()", 0x10010);
        switch(hr)
        {
        case DISP_E_BADPARAMCOUNT:
            MessageBox(NULL, "DISP_E_BADPARAMCOUNT", "Error:", 0x10010);
            break;
        case DISP_E_BADVARTYPE:
            MessageBox(NULL, "DISP_E_BADVARTYPE", "Error:", 0x10010);
            break;
        case DISP_E_EXCEPTION:
            MessageBox(NULL, "DISP_E_EXCEPTION", "Error:", 0x10010);
            break;
        case DISP_E_MEMBERNOTFOUND:
            MessageBox(NULL, "DISP_E_MEMBERNOTFOUND", "Error:", 0x10010);
            break;
        case DISP_E_NONAMEDARGS:
            MessageBox(NULL, "DISP_E_NONAMEDARGS", "Error:", 0x10010);
            break;
        case DISP_E_OVERFLOW:
            MessageBox(NULL, "DISP_E_OVERFLOW", "Error:", 0x10010);
            break;
        case DISP_E_PARAMNOTFOUND:
            MessageBox(NULL, "DISP_E_PARAMNOTFOUND", "Error:", 0x10010);
            break;
        case DISP_E_TYPEMISMATCH:
            MessageBox(NULL, "DISP_E_TYPEMISMATCH", "Error:", 0x10010);
            break;
        case DISP_E_UNKNOWNINTERFACE:
            MessageBox(NULL, "DISP_E_UNKNOWNINTERFACE", "Error:", 0x10010);
            break;
        case DISP_E_UNKNOWNLCID:
            MessageBox(NULL, "DISP_E_UNKNOWNLCID", "Error:", 0x10010);
            break;
        case DISP_E_PARAMNOTOPTIONAL:
            MessageBox(NULL, "DISP_E_PARAMNOTOPTIONAL", "Error:", 0x10010);
            break;
        }
#endif
        return hr;
    }

    delete [] pArgs;
    delete [] pNamedArgIDs;
    return hr;
}
/*--------------------------------------------------------------------------*/

BOOL GetDimensions(SAFEARRAY* pSafeArray,int *m,int *n)
{
    UINT i = 0;
    UINT DimSafeArray = 0;
    UINT dimensions[DIM_MAX];

    DimSafeArray = SafeArrayGetDim(pSafeArray);

    /* We manage only array with 2 dimensions */

    if (DimSafeArray == DIM_MAX)
    {
        for (i = 0;i < DimSafeArray;i++)
        {
            long lUpperBound = 0;
            long lLowerBound = 0;

            if (FAILED (SafeArrayGetLBound (pSafeArray,i+1,&lLowerBound)))
            {
                // error
                *m = -1;
                *n = -1;
                return FALSE;
            }
            if (FAILED (SafeArrayGetUBound (pSafeArray,i+1,&lUpperBound)))
            {
                // error
                *m = -1;
                *n = -1;
                return FALSE;
            }
            dimensions[i] = lUpperBound - lLowerBound + 1;
        }

        *m = dimensions[0];
        *n = dimensions[1];
        return TRUE;
    }
    return FALSE;
}
/*--------------------------------------------------------------------------*/
