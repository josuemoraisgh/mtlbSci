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

#include <BOOL.h>
#include <localization.h>
#include <Scierror.h>
#include <api_scilab.h>

int sci_XLS_IsExcelRunning(GATEWAY_PARAMETERS)
{
    CheckInputArgument(pvApiCtx, 0, 0);
    CheckOutputArgument(pvApiCtx, 0, 1);

    if(getObjExcelLink()->IsExcelRunning() == false)
    {
        destroyObjExcelLink();
        createScalarBoolean(pvApiCtx, 1, 0);
    }
    else
    {
        createScalarBoolean(pvApiCtx, 1, 1);
    }

    AssignOutputVariable(pvApiCtx, 1) = 1;
    ReturnArguments(pvApiCtx);
	return 0;
}

#ifdef __cplusplus
}
#endif