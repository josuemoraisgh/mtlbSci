#ifndef __DYNLIB_CORE_H__
#define __DYNLIB_CORE_H__

#ifdef _MSC_VER
#ifdef CORE_EXPORTS
#define CORE_IMPEXP __declspec(dllexport)
#else
#define CORE_IMPEXP __declspec(dllimport)
#endif
#else
#define CORE_IMPEXP
#endif


#endif /* !__DYNLIB_CORE_H__ */