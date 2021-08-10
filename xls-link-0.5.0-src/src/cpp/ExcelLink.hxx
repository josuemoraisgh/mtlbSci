/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/
#ifndef __EXCELCOMLINK_HXX__
#define __EXCELCOMLINK_HXX__

#include "xls_link.h"
#include <ole2.h>

/* some methods */
/* http://msdn.microsoft.com/en-us/library/aa272184(v=office.11).aspx */

class XLS_LINK_API ExcelLink
{
    public:
        ExcelLink();

        ~ExcelLink();

        bool NewExcel(void);
        bool RecoverExcel(void);
        bool Quit(void);
        bool IsExcelRunning(void);

        bool SetPic(wchar_t* file, double xpos, double ypos, double xsize, double ysize);
        bool SetPic(wchar_t* file);

        bool GetRange(int* _piStartX, int* _piStartY, int* _piWidth, int* _piHeight);
        wchar_t* GetRangeString(int _iStartX, int _iStartY, int _iWidth, int _iHeight);

        VARIANT getProperty(wchar_t* _pwstObject, wchar_t* _pwstProperty);
        VARIANT getProperty(VARIANT _vObject, wchar_t* _pwstProperty);
        bool setProperty(wchar_t* _pwstObject, wchar_t* _pwstProperty, VARIANT _vData, int _iDataSize);
        bool setProperty(VARIANT _vObject, wchar_t* _pwstProperty, VARIANT _vData, int _iDataSize);

        VARIANT callMethod(wchar_t* _pwstObject, wchar_t* _pwstProperty, VARIANT* _pvArgs, int _iNbArgs);
        VARIANT callMethod(VARIANT _vObject, wchar_t* _pwstProperty, VARIANT* _pvArgs, int _iNbArgs);
        VARIANT callMethodNamedArgs(wchar_t* _pwstObject, wchar_t* _pwstProperty, VARIANT* _pvArgs, int _iNbArgs, DISPID *_piNamedArgs, int _iNbNamedArgs);
        VARIANT callMethodNamedArgs(VARIANT _vObject, wchar_t* _pwstProperty, VARIANT* _pvArgs, int _iNbArgs, DISPID *_piNamedArgs, int _iNbNamedArgs);

        VARIANT getObject(wchar_t* _pwstObject);
        void setObject(wchar_t* _pwstObject, VARIANT _vObj);


    private:
        void Release(void);
        double returnNaN(void);
        double returnINF(bool bPositive);
};
#endif /* __EXCELCOMLINK_HXX__ */
/*--------------------------------------------------------------------------*/