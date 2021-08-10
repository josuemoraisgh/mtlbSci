//--------------------------------------------------------------------------
// Allan CORNET
// DIGITEO 2008 - 2010
// Scilab Enterprises - 2017
//--------------------------------------------------------------------------
#ifndef __GATEWAY_XLS_LINK_H__
#define __GATEWAY_XLS_LINK_H__

#include "version.h"
#if SCI_VERSION_MAJOR >= 6
#define GATEWAY_PARAMETERS char* fname, void *pvApiCtx
#define GATEWAY_ARGUMENTS fname, pvApiCtx
#else
#define GATEWAY_PARAMETERS char* fname, unsigned long fname_len
#define GATEWAY_ARGUMENTS fname, fname_len
#endif

int sci_XLS_NewExcel(GATEWAY_PARAMETERS);
int sci_XLS_RecoverExcel(GATEWAY_PARAMETERS);
int sci_XLS_IsExcelRunning(GATEWAY_PARAMETERS);
int sci_XLS_SetPic(GATEWAY_PARAMETERS);
int sci_XLS_Quit(GATEWAY_PARAMETERS);
int sci_XLS_OffsetRange(GATEWAY_PARAMETERS);
int sci_XLS_convertSaveFormat(GATEWAY_PARAMETERS);
int sci_XLS_ExtendRange(GATEWAY_PARAMETERS);
int sci_XLS_CallMacro(GATEWAY_PARAMETERS);
int sci_XLS_GetRange(GATEWAY_PARAMETERS);

int sci_XLS_getProperty(GATEWAY_PARAMETERS);
int sci_XLS_setProperty(GATEWAY_PARAMETERS);
int sci_XLS_callMethod(GATEWAY_PARAMETERS);

#endif /* __GATEWAY_XLS_LINK_H__ */
