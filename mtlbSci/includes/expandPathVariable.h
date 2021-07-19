#ifndef __EXPANDPATHVARIABLE_H__
#define __EXPANDPATHVARIABLE_H__

#include <wchar.h>
#include "dynlib_fileio.h"

#ifdef __cplusplus
extern "C"
{
#endif

FILEIO_IMPEXP char *expandPathVariable(const char* str);

FILEIO_IMPEXP void resetVariableValueDefinedInScilab(void);

#ifdef __cplusplus
}
#endif //_cplusplus

#endif /* __EXPANDPATHVARIABLE_H__ */