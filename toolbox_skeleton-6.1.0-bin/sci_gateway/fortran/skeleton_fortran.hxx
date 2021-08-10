#ifndef __SKELETON_FORTRAN_GW_HXX__
#define __SKELETON_FORTRAN_GW_HXX__

#ifdef _MSC_VER
#ifdef SKELETON_FORTRAN_GW_EXPORTS
#define SKELETON_FORTRAN_GW_IMPEXP __declspec(dllexport)
#else
#define SKELETON_FORTRAN_GW_IMPEXP __declspec(dllimport)
#endif
#else
#define SKELETON_FORTRAN_GW_IMPEXP
#endif

extern "C" SKELETON_FORTRAN_GW_IMPEXP int skeleton_fortran(wchar_t* _pwstFuncName);



#endif /* __SKELETON_FORTRAN_GW_HXX__ */
