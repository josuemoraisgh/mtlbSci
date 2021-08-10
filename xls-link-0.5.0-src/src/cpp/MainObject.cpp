/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/
#include <stdlib.h>
#include "MainObject.hxx"

static ExcelLink *ObjExcelLink = NULL;

#ifdef __cplusplus
extern "C" {
#endif

ExcelLink *getObjExcelLink(void)
{
    if(ObjExcelLink == NULL)
    {
        ObjExcelLink = new ExcelLink();
    }

    return ObjExcelLink;
}

bool destroyObjExcelLink(void)
{
    if (ObjExcelLink)
    {
        delete ObjExcelLink;
        ObjExcelLink = NULL;
        return true;
    }
    return false;
}

#ifdef __cplusplus
}
#endif
