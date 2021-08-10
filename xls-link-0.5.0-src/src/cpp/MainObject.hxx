/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/
#ifndef __MAINOBJECT_HXX__
#define __MAINOBJECT_HXX__

#include "xls_link.h"
#include "ExcelLink.hxx"

#ifdef __cplusplus
extern "C" {
#endif

XLS_LINK_API ExcelLink *getObjExcelLink(void);
XLS_LINK_API bool destroyObjExcelLink(void);

#ifdef __cplusplus
}
#endif

#endif /*  __MAINOBJECT_HXX__ */
/*--------------------------------------------------------------------------*/
