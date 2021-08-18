 #ifndef __DYNLIB_FILEIO_H__
 #define __DYNLIB_FILEIO_H__
  
 #ifdef _MSC_VER
 #ifdef FILEIO_EXPORTS
 #define FILEIO_IMPEXP __declspec(dllexport)
 #else
 #define FILEIO_IMPEXP __declspec(dllimport)
 #endif
 #else
 #define FILEIO_IMPEXP
 #endif
  
 #endif /* __DYNLIB_FILEIO_H__ */

  
