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

#include <localization.h>
#include <Scierror.h>
#include <api_scilab.h>

int sci_XLS_Quit(GATEWAY_PARAMETERS)
{
    bool bResult = false;

    CheckInputArgument(pvApiCtx, 0, 0);
    CheckOutputArgument(pvApiCtx, 0, 1);

    ExcelLink* pObj = getObjExcelLink();
    bResult = pObj->Quit();
    destroyObjExcelLink();

    createScalarBoolean(pvApiCtx, 1, bResult ? 1 : 0);
    AssignOutputVariable(pvApiCtx, 1) = 1;
    ReturnArguments(pvApiCtx);
    return 0;
}

#ifdef __cplusplus
}
#endif
