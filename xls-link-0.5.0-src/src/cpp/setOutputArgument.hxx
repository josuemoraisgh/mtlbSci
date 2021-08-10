/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/
#ifndef __SETOUTPUTARGUMENT_H__
#define __SETOUTPUTARGUMENT_H__

#include "xls_link.h"
#include <BOOL.h>
#include <ole2.h>

#ifdef __cplusplus
extern "C"
#endif
XLS_LINK_API int setOutputArgument(void* _pvCtx, int _iLhs, VARIANT _v, void *pvApiCtx);

#endif /* __SETOUTPUTARGUMENT_H__ */
/*--------------------------------------------------------------------------*/
