#ifndef __EXECMTLB_GW_HXX__
#define __EXECMTLB_GW_HXX__

#ifdef _MSC_VER
#ifdef EXECMTLB_GW_EXPORTS
#define EXECMTLB_GW_IMPEXP __declspec(dllexport)
#else
#define EXECMTLB_GW_IMPEXP __declspec(dllimport)
#endif
#else
#define EXECMTLB_GW_IMPEXP
#endif

extern "C" EXECMTLB_GW_IMPEXP int execmtlb(wchar_t* _pwstFuncName);



#endif /* __EXECMTLB_GW_HXX__ */
