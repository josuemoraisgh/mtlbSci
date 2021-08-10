#ifndef __SKELETON_C_GW_HXX__
#define __SKELETON_C_GW_HXX__

#ifdef _MSC_VER
#ifdef SKELETON_C_GW_EXPORTS
#define SKELETON_C_GW_IMPEXP __declspec(dllexport)
#else
#define SKELETON_C_GW_IMPEXP __declspec(dllimport)
#endif
#else
#define SKELETON_C_GW_IMPEXP
#endif

extern "C" SKELETON_C_GW_IMPEXP int skeleton_c(wchar_t* _pwstFuncName);



#endif /* __SKELETON_C_GW_HXX__ */
