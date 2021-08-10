#ifndef __SKELETON_CPP_GW_HXX__
#define __SKELETON_CPP_GW_HXX__

#ifdef _MSC_VER
#ifdef SKELETON_CPP_GW_EXPORTS
#define SKELETON_CPP_GW_IMPEXP __declspec(dllexport)
#else
#define SKELETON_CPP_GW_IMPEXP __declspec(dllimport)
#endif
#else
#define SKELETON_CPP_GW_IMPEXP
#endif

extern "C" SKELETON_CPP_GW_IMPEXP int skeleton_cpp(wchar_t* _pwstFuncName);


CPP_GATEWAY_PROTOTYPE(sci_cpperror);
CPP_GATEWAY_PROTOTYPE(sci_cppfoo);
CPP_GATEWAY_PROTOTYPE(sci_cppmultiplybypi);
CPP_GATEWAY_PROTOTYPE(sci_cppsub);
CPP_GATEWAY_PROTOTYPE(sci_cppsum);

#endif /* __SKELETON_CPP_GW_HXX__ */
