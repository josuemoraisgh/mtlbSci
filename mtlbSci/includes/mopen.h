#ifndef __MOPEN_H__
#define __MOPEN_H__

#include "dynlib_fileio.h"
#include "machine.h"

typedef enum
{
MOPEN_NO_ERROR = 0,
MOPEN_NO_MORE_LOGICAL_UNIT = 1,
MOPEN_CAN_NOT_OPEN_FILE = 2,
MOPEN_NO_MORE_MEMORY = 3,
MOPEN_INVALID_FILENAME = 4,
MOPEN_INVALID_STATUS = 5
} mopenError;
 
FILEIO_IMPEXP int mopen(const char* _pstFilename, const char* _pstMode, int _iSwap, int* _piID);

#endif  /* __MOPEN_H__ */