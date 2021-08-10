/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/
#define _WIN32_WINNT 0x0501
#define _WIN32_IE 0x0501
/*--------------------------------------------------------------------------*/


#include "ExcelLink.hxx"
#include "AutomationHelper.hxx"

#include <windows.h>
#include <stdio.h>
#include <float.h>
#include <math.h>

extern "C"
{
#include "Excel_utils.h"
}
/*--------------------------------------------------------------------------*/
#define DISP_FREEARGS 0x01
#define DISP_NOSHOWEXCEPTIONS 0x02
/*--------------------------------------------------------------------------*/
VARIANT xlApp = {0};//excel.exe
VARIANT xlWin = {0}; //current windows
VARIANT xlBooks = {0}; // collection de carnet
VARIANT xlBook = {0}; // 1 carnet
VARIANT xlSheet = {0}; //1 feuille
VARIANT strVariant = {0};
VARIANT cellValue = {0};//valeur
VARIANT cellRange = {0};//selection
VARIANT xlFont = {0}; // police
/*--------------------------------------------------------------------------*/
ExcelLink::ExcelLink()
{
    // Initialize COM for this thread...
    CoInitialize(NULL);
}
/*--------------------------------------------------------------------------*/
ExcelLink::~ExcelLink()
{
    Release();
    // Uninitialize COM for this thread...
    CoUninitialize();
}
/*--------------------------------------------------------------------------*/
void ExcelLink::Release(void)
{
    VariantClear(&xlApp);
    VariantClear(&xlWin);
    VariantClear(&xlBooks);
    VariantClear(&xlBook);
    VariantClear(&xlSheet);
    VariantClear(&cellValue);
    VariantClear(&cellRange);

    // Initialization Variants
    VariantInit(&xlApp);
    xlApp.pdispVal = NULL;

    VariantInit(&xlWin);
    VariantInit(&xlBooks);
    VariantInit(&xlBook);
    VariantInit(&xlSheet);
    VariantInit(&cellValue);
    VariantInit(&cellRange);
}
/*--------------------------------------------------------------------------*/
bool ExcelLink::NewExcel(void)
{
    CLSID clsExcelApp;

    // if Excel is already running, return with current instance
    if (xlApp.pdispVal != NULL)	return true;

    /* Obtain the CLSID that identifies EXCEL.APPLICATION
    * This value is universally unique to Excel versions 5 and up, and
    * is used by OLE to identify which server to start.  We are obtaining
    * the CLSID from the ProgID.
    */
    if(FAILED(CLSIDFromProgID(L"Excel.Application", &clsExcelApp)))
    {
#ifdef _DEBUG
        MessageBox(NULL, "CLSIDFromProgID() failed", "Error", 0x10010);
#endif
        return false;
    }

    // start a new copy of Excel, grab the IDispatch interface
    if (FAILED(CoCreateInstance(clsExcelApp, NULL, CLSCTX_LOCAL_SERVER, IID_IDispatch, (void **)&xlApp.pdispVal)))
    {
#ifdef _DEBUG
        MessageBox(NULL, "Excel not registered properly", "Error", 0x10010);
#endif
        return false;
    }

    // recupere la liste des carnets
    XLS_LINK_Wrap(DISPATCH_PROPERTYGET|DISPATCH_METHOD, &xlBooks, xlApp.pdispVal, L"Workbooks", 0, NULL, 0, NULL);

    return true;
}
/*--------------------------------------------------------------------------*/
bool ExcelLink::RecoverExcel(void)
{
    CLSID clsExcelApp;

    // if Excel is already running, return with current instance
    if ( (xlApp.vt != VT_EMPTY) && (xlApp.pdispVal != NULL) ) return true;

    /* Obtain the CLSID that identifies EXCEL.APPLICATION
    * This value is universally unique to Excel versions 5 and up, and
    * is used by OLE to identify which server to start.  We are obtaining
    * the CLSID from the ProgID.
    */
    if(FAILED(CLSIDFromProgID(L"Excel.Application", &clsExcelApp)))
    {
#ifdef _DEBUG
        MessageBox(NULL, "CLSIDFromProgID() failed", "Error", 0x10010);
#endif
        return false;
    }

    IUnknown *pUnk = NULL;
    HWND hExcelMainWnd = 0;
    hExcelMainWnd = FindWindow("XLMAIN",NULL);
    if(hExcelMainWnd)
    {
        SendMessage(hExcelMainWnd,WM_USER + 18, 0, 0);
        HRESULT hr2 = GetActiveObject(clsExcelApp,NULL,(IUnknown**)&pUnk);
        if (!FAILED(hr2))
        {
            hr2=pUnk->QueryInterface(IID_IDispatch, (void **)&xlApp.pdispVal);
            if (!xlApp.ppdispVal)
            {
#ifdef _DEBUG
                MessageBox(NULL, "Failed to find instance!!", "Error",MB_ICONHAND);
#endif
                return false;
            }
        }
        //Release the no-longer-needed IUnknown...
        if (pUnk) pUnk->Release();
    }
    else
    {
#ifdef _DEBUG
        MessageBox(NULL, "Failed to find instance!!", "Error",MB_ICONHAND);
#endif
        return false;
    }

    // recupere la liste des carnets
    HRESULT hRes;
    hRes = XLS_LINK_Wrap(DISPATCH_PROPERTYGET|DISPATCH_METHOD, &xlBooks, xlApp.pdispVal, L"Workbooks", 0, NULL, 0, NULL);
    if (FAILED(hRes)) return false;

    return true;
}
/*--------------------------------------------------------------------------*/
bool ExcelLink::Quit(void)
{
    HRESULT hRes;
    if(xlApp.pdispVal == NULL)
    {
        return false;
    }

    hRes = XLS_LINK_Wrap(DISPATCH_METHOD, NULL, xlApp.pdispVal, L"Quit", 0, NULL, 0, NULL);
    if (FAILED(hRes)) return false;
    return true;
}
/*--------------------------------------------------------------------------*/
bool ExcelLink::IsExcelRunning()
{
    if (xlApp.pdispVal == NULL) return false;
    if (!FindWindow("XLMAIN",NULL))return false;
    return true;
}
/*--------------------------------------------------------------------------*/
bool ExcelLink::GetRange(int* _piStartX, int* _piStartY, int* _piWidth, int* _piHeight)
{
    bool bRet = false;
    VARIANT vRowStart = getProperty(L"Range", L"Row");
    if(vRowStart.vt != VT_ERROR)
    {
        VARIANT vColStart = getProperty(L"Range", L"Column");
        VARIANT vRows =  getProperty(L"Range", L"Rows");
        VARIANT vRow = getProperty(vRows, L"Count");
        VARIANT vCols = getProperty(L"Range", L"Columns");
        VARIANT vCol = getProperty(vCols, L"Count");

        *_piStartY = vRowStart.lVal;
        *_piStartX = vColStart.lVal;
        *_piHeight = vRow.lVal;
        *_piWidth = vCol.lVal;
        bRet = true;
    }

    return bRet;
}

wchar_t* ExcelLink::GetRangeString(int _iStartX, int _iStartY, int _iWidth, int _iHeight)
{
    wchar_t* pwstRangeStart = IndToStr(_iStartY, _iStartX);
    wchar_t* pwstRangeEnd = IndToStr(_iStartY + _iHeight - 1, _iStartX + _iWidth - 1);

    int iLen = (int)wcslen(pwstRangeStart) + (int)wcslen(pwstRangeEnd) + 2; //1 for : and 1 for \0
    wchar_t* pwstOffset = (wchar_t*)malloc(sizeof(wchar_t) * iLen);

    if(_wcsicmp(pwstRangeStart, pwstRangeEnd) == 0)
    {
        swprintf_s(pwstOffset, iLen, L"%ls", pwstRangeStart);
    }
    else
    {
        swprintf_s(pwstOffset, iLen, L"%ls:%ls", pwstRangeStart, pwstRangeEnd);
    }

    free(pwstRangeStart);
    free(pwstRangeEnd);
    return pwstOffset;
}
/*--------------------------------------------------------------------------*/
bool ExcelLink::SetPic(wchar_t* file, double xpos, double ypos, double xsize, double ysize)
{
    HRESULT hr;
    if (file == NULL) return false;

    IDispatch *pXlShapes = NULL;

    VariantInit(&strVariant);

    hr = XLS_LINK_Wrap(DISPATCH_PROPERTYGET, &strVariant, xlSheet.pdispVal, L"Shapes", 0, NULL, 0, NULL);
    if (!FAILED(hr))
    {
        pXlShapes = strVariant.pdispVal;

        VARIANT fname;
        fname.vt = VT_BSTR;
        fname.bstrVal=SysAllocString(file);
        VARIANT xpropf;
        xpropf.vt=VT_BOOL;
        xpropf.boolVal = VARIANT_FALSE;
        VARIANT xpropt;
        xpropt.vt=VT_BOOL;
        xpropt.boolVal = VARIANT_TRUE;

        VARIANT xtop;
        xtop.vt=VT_R8;
        xtop.dblVal=xpos;
        VARIANT xleft;
        xleft.vt=VT_R8;
        xleft.dblVal=ypos;
        VARIANT xwidth;
        xwidth.vt=VT_R8;
        xwidth.dblVal=xsize;
        VARIANT xheight;
        xheight.vt=VT_R8;
        xheight.dblVal=ysize;

        VARIANT pvArgs[7] = {fname,xpropf,xpropt,xtop,xleft,xwidth,xheight};
        hr = XLS_LINK_Wrap(DISPATCH_METHOD, NULL, pXlShapes, L"AddPicture", 7, pvArgs, 0, NULL);

        SysFreeString(fname.bstrVal);

        pXlShapes->Release();

        VariantClear(&xheight);
        VariantClear(&xwidth);
        VariantClear(&xleft);
        VariantClear(&xtop);
        VariantClear(&xpropt);
        VariantClear(&xpropf);
        VariantClear(&fname);

        if (FAILED(hr)) return false;
    }

    return true;
}
/*--------------------------------------------------------------------------*/
bool ExcelLink::SetPic(wchar_t* file)
{
    return this->SetPic(file, 10.0, 10.0, 200.0, 200.0);
}
/*--------------------------------------------------------------------------*/
VARIANT ExcelLink::getProperty(wchar_t* _pwstObject, wchar_t* _pwstProperty)
{
    VARIANT obj = getObject(_pwstObject);
    return getProperty(obj, _pwstProperty);
}
/*--------------------------------------------------------------------------*/
VARIANT ExcelLink::getProperty(VARIANT _vObject, wchar_t* _pwstProperty)
{
    VARIANT vResult;
    vResult.vt = 0;
    HRESULT hRes = XLS_LINK_Wrap(DISPATCH_PROPERTYGET, &vResult, _vObject.pdispVal, _pwstProperty, 0, NULL, 0, NULL);
    if(FAILED(hRes))
    {
        vResult.vt = VT_ERROR;
        return vResult;
    }

    setObject(_pwstProperty, vResult);
    return vResult;
}
/*--------------------------------------------------------------------------*/
bool ExcelLink::setProperty(VARIANT _vObject, wchar_t* _pwstProperty, VARIANT _vData, int _iDataSize)
{
    VARIANT vResult;
    vResult.vt = 0;
    HRESULT hRes = XLS_LINK_Wrap(DISPATCH_PROPERTYPUT, &vResult, _vObject.pdispVal, _pwstProperty, _iDataSize, &_vData, 0, NULL);
    return !FAILED(hRes);
}
/*--------------------------------------------------------------------------*/
bool ExcelLink::setProperty(wchar_t* _pwstObject, wchar_t* _pwstProperty, VARIANT _vData, int _iDataSize)
{
    VARIANT obj = getObject(_pwstObject);
    return setProperty(obj, _pwstProperty, _vData, _iDataSize);
}
/*--------------------------------------------------------------------------*/
VARIANT ExcelLink::callMethod(VARIANT _vObject, wchar_t* _pwstMethod, VARIANT* _pvArgs, int _iNbArgs)
{
    VARIANT vResult;
    vResult.vt = VT_ILLEGAL;
    HRESULT hRes = XLS_LINK_Wrap(DISPATCH_PROPERTYGET|DISPATCH_METHOD, &vResult, _vObject.pdispVal, _pwstMethod, _iNbArgs, _pvArgs, 0, NULL);
    if(FAILED(hRes))
    {
        vResult.vt = VT_ERROR;
        return vResult;
    }

    setObject(_pwstMethod, vResult);
    return vResult;
}
/*--------------------------------------------------------------------------*/
VARIANT ExcelLink::callMethod(wchar_t* _pwstObject, wchar_t* _pwstMethod, VARIANT* _pvArgs, int _iNbArgs)
{
    VARIANT obj = getObject(_pwstObject);
    VARIANT vResult = callMethod(obj, _pwstMethod, _pvArgs, _iNbArgs);
    setObject(_pwstObject, vResult);
    return vResult;
}
/*--------------------------------------------------------------------------*/
VARIANT ExcelLink::callMethodNamedArgs(VARIANT _vObject, wchar_t* _pwstMethod, VARIANT* _pvArgs, int _iNbArgs, DISPID *_piNamedArgs, int _iNbNamedArgs)
{
    VARIANT vResult;
    vResult.vt = VT_ILLEGAL;
    HRESULT hRes = XLS_LINK_Wrap(DISPATCH_PROPERTYGET|DISPATCH_METHOD, &vResult, _vObject.pdispVal, _pwstMethod, _iNbArgs, _pvArgs, _iNbNamedArgs, _piNamedArgs);
    if(FAILED(hRes))
    {
        vResult.vt = VT_ERROR;
        return vResult;
    }

    setObject(_pwstMethod, vResult);
    return vResult;
}
/*--------------------------------------------------------------------------*/
VARIANT ExcelLink::callMethodNamedArgs(wchar_t* _pwstObject, wchar_t* _pwstMethod, VARIANT* _pvArgs, int _iNbArgs, DISPID *_piNamedArgs, int _iNbNamedArgs)
{
    VARIANT obj = getObject(_pwstObject);
    VARIANT vResult = callMethodNamedArgs(obj, _pwstMethod, _pvArgs, _iNbArgs, _piNamedArgs, _iNbNamedArgs);
    setObject(_pwstObject, vResult);
    return vResult;
}
/*--------------------------------------------------------------------------*/
VARIANT ExcelLink::getObject(wchar_t* _pwstObject)
{
    if(_wcsicmp(_pwstObject, L"ActiveWindow") == 0)
    {
        if(xlWin.vt == VT_EMPTY)
        {//prevent non init of ActiveWindow
            XLS_LINK_Wrap(DISPATCH_PROPERTYGET, &xlWin, xlApp.pdispVal, L"ActiveWindow", 0, NULL, 0, NULL);
        }
        return xlWin;
    }

    if(_wcsicmp(_pwstObject, L"application") == 0)
    {
        return xlApp;
    }

    if(_wcsicmp(_pwstObject, L"workbooks") == 0)
    {
        return xlBooks;
    }

    if(_wcsicmp(_pwstObject, L"workbook") == 0)
    {
        return xlBook;
    }

    if(_wcsicmp(_pwstObject, L"worksheet") == 0)
    {
        return xlSheet;
    }

    if(_wcsicmp(_pwstObject, L"cell") == 0)
    {
        return cellValue;
    }

    if(_wcsicmp(_pwstObject, L"range") == 0)
    {
        return cellRange;
    }

    if(_wcsicmp(_pwstObject, L"font") == 0)
    {
        return xlFont;
    }

    return xlApp;
}

void ExcelLink::setObject(wchar_t* _pwstObject, VARIANT _vObj)
{
    if(_wcsicmp(_pwstObject, L"ActiveWindow") == 0)
    {
        xlWin = _vObj;
    }

    if(_wcsicmp(_pwstObject, L"workbooks") == 0)
    {
        xlBook = _vObj;
    }

    if(_wcsicmp(_pwstObject, L"worksheets") == 0)
    {
        xlSheet = _vObj;
    }

    if(_wcsicmp(_pwstObject, L"cells") == 0)
    {
        cellValue = _vObj;
    }

    if(_wcsicmp(_pwstObject, L"range") == 0)
    {
        if(_vObj.vt == VT_DISPATCH)
        {
            cellRange = _vObj;
        }
    }

    if(_wcsicmp(_pwstObject, L"font") == 0)
    {
        xlFont = _vObj;
    }
}
