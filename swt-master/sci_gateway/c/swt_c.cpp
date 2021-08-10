#include <wchar.h>
#include "swt_c.hxx"
extern "C"
{
#include "swt_c.h"
#include "addfunction.h"
}

#define MODULE_NAME L"swt_c"

int swt_c(wchar_t* _pwstFuncName)
{
    if(wcscmp(_pwstFuncName, L"wrev") == 0){ addCStackFunction(L"wrev", &int_wrev, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wrev2") == 0){ addCStackFunction(L"wrev2", &int_wrev2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"qmf") == 0){ addCStackFunction(L"qmf", &int_qmf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"iconv") == 0){ addCStackFunction(L"iconv", &int_iconv, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dyaddown") == 0){ addCStackFunction(L"dyaddown", &int_dyaddown, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dyadup") == 0){ addCStackFunction(L"dyadup", &int_dyadup, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wkeep") == 0){ addCStackFunction(L"wkeep", &int_wkeep, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wextend") == 0){ addCStackFunction(L"wextend", &int_wextend, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wcodemat") == 0){ addCStackFunction(L"wcodemat", &int_wcodemat, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wrot3") == 0){ addCStackFunction(L"wrot3", &int_mat3Dtran, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wrev3") == 0){ addCStackFunction(L"wrev3", &int_wrev3, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"orthfilt") == 0){ addCStackFunction(L"orthfilt", &int_orthfilt, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dbwavf") == 0){ addCStackFunction(L"dbwavf", &int_dbwavf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"coifwavf") == 0){ addCStackFunction(L"coifwavf", &int_coifwavf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"symwavf") == 0){ addCStackFunction(L"symwavf", &int_symwavf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"legdwavf") == 0){ addCStackFunction(L"legdwavf", &int_legdwavf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"biorwavf") == 0){ addCStackFunction(L"biorwavf", &int_biorwavf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"rbiorwavf") == 0){ addCStackFunction(L"rbiorwavf", &int_rbiorwavf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"biorfilt") == 0){ addCStackFunction(L"biorfilt", &int_biorfilt, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wfilters") == 0){ addCStackFunction(L"wfilters", &int_wfilters, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wmaxlev") == 0){ addCStackFunction(L"wmaxlev", &int_wmaxlev, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dwtmode") == 0){ addCStackFunction(L"dwtmode", &int_dwtmode, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dwt") == 0){ addCStackFunction(L"dwt", &int_dwt, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"idwt") == 0){ addCStackFunction(L"idwt", &int_idwt, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wavedec") == 0){ addCStackFunction(L"wavedec", &int_wavedec, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"waverec") == 0){ addCStackFunction(L"waverec", &int_waverec, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wrcoef") == 0){ addCStackFunction(L"wrcoef", &int_wrcoef, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"appcoef") == 0){ addCStackFunction(L"appcoef", &int_appcoef, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"detcoef") == 0){ addCStackFunction(L"detcoef", &int_detcoef, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wenergy") == 0){ addCStackFunction(L"wenergy", &int_wenergy, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"upcoef") == 0){ addCStackFunction(L"upcoef", &int_upcoef, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"upwlev") == 0){ addCStackFunction(L"upwlev", &int_upwlev, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dwt2") == 0){ addCStackFunction(L"dwt2", &int_dwt2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"idwt2") == 0){ addCStackFunction(L"idwt2", &int_idwt2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wavedec2") == 0){ addCStackFunction(L"wavedec2", &int_wavedec2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"waverec2") == 0){ addCStackFunction(L"waverec2", &int_waverec2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wenergy2") == 0){ addCStackFunction(L"wenergy2", &int_wenergy2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"appcoef2") == 0){ addCStackFunction(L"appcoef2", &int_appcoef2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"detcoef2") == 0){ addCStackFunction(L"detcoef2", &int_detcoef2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wrcoef2") == 0){ addCStackFunction(L"wrcoef2", &int_wrcoef2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"upwlev2") == 0){ addCStackFunction(L"upwlev2", &int_upwlev2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"upcoef2") == 0){ addCStackFunction(L"upcoef2", &int_upcoef2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"swt") == 0){ addCStackFunction(L"swt", &int_swt, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"iswt") == 0){ addCStackFunction(L"iswt", &int_iswt, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"swt2") == 0){ addCStackFunction(L"swt2", &int_swt2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"iswt2") == 0){ addCStackFunction(L"iswt2", &int_iswt2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"sinus") == 0){ addCStackFunction(L"sinus", &int_sinus, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"poisson") == 0){ addCStackFunction(L"poisson", &int_poisson, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"mexihat") == 0){ addCStackFunction(L"mexihat", &int_mexihat, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"morlet") == 0){ addCStackFunction(L"morlet", &int_morlet, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"DOGauss") == 0){ addCStackFunction(L"DOGauss", &int_DOGauss, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"cmorwavf") == 0){ addCStackFunction(L"cmorwavf", &int_cmorlet, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"shanwavf") == 0){ addCStackFunction(L"shanwavf", &int_shanwavf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"fbspwavf") == 0){ addCStackFunction(L"fbspwavf", &int_fbspwavf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"cauwavf") == 0){ addCStackFunction(L"cauwavf", &int_cauchy, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"gauswavf") == 0){ addCStackFunction(L"gauswavf", &int_Gauswavf, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"cgauwavf") == 0){ addCStackFunction(L"cgauwavf", &int_cgauss, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wavefun") == 0){ addCStackFunction(L"wavefun", &int_wavefun, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wavefun2") == 0){ addCStackFunction(L"wavefun2", &int_wavefun2, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"cwt") == 0){ addCStackFunction(L"cwt", &int_cwt, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dwt3") == 0){ addCStackFunction(L"dwt3", &int_dwt3, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"idwt3") == 0){ addCStackFunction(L"idwt3", &int_idwt3, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"FSfarras") == 0){ addCStackFunction(L"FSfarras", &int_FSfarras, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dualfilt1") == 0){ addCStackFunction(L"dualfilt1", &int_dualfilt1, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dualtree") == 0){ addCStackFunction(L"dualtree", &int_dualtree, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"idualtree") == 0){ addCStackFunction(L"idualtree", &int_idualtree, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"dualtree2D") == 0){ addCStackFunction(L"dualtree2D", &int_dualtree2D, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"idualtree2D") == 0){ addCStackFunction(L"idualtree2D", &int_idualtree2D, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"cplxdual2D") == 0){ addCStackFunction(L"cplxdual2D", &int_cplxdual2D, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"icplxdual2D") == 0){ addCStackFunction(L"icplxdual2D", &int_icplxdual2D, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"wnorm") == 0){ addCStackFunction(L"wnorm", &int_wnorm, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"waveletfamilies") == 0){ addCStackFunction(L"waveletfamilies", &int_waveletfamilies, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"meyeraux") == 0){ addCStackFunction(L"meyeraux", &int_meyeraux, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"meyer2") == 0){ addCStackFunction(L"meyer2", &int_meyer, MODULE_NAME); }

    return 1;
}
