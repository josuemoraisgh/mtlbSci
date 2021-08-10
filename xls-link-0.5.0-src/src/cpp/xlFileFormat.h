/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/

#ifndef __XLFILEFORMAT_H__
#define __XLFILEFORMAT_H__

#include "xls_link.h"

//XLS_LINK_API char *getDescriptionXlFileFormat(long XlFileFormatCode);
XLS_LINK_API char *getXlFileFormatName(long XlFileFormatCode);
XLS_LINK_API long getXlFileFormat(char *XlFileFormatName);

#endif /* __XLFILEFORMAT_H__ */
/*--------------------------------------------------------------------------*/
