#ifndef __SWT_C_GW_HXX__
#define __SWT_C_GW_HXX__

#ifdef _MSC_VER
#ifdef SWT_C_GW_EXPORTS
#define SWT_C_GW_IMPEXP __declspec(dllexport)
#else
#define SWT_C_GW_IMPEXP __declspec(dllimport)
#endif
#else
#define SWT_C_GW_IMPEXP
#endif

extern "C" SWT_C_GW_IMPEXP int swt_c(wchar_t* _pwstFuncName);



#endif /* __SWT_C_GW_HXX__ */
