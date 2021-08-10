#include <wchar.h>
#include "skeleton_c.hxx"
extern "C"
{
#include "skeleton_c.h"
#include "addfunction.h"
}

#define MODULE_NAME L"skeleton_c"

int skeleton_c(wchar_t* _pwstFuncName)
{
    if(wcscmp(_pwstFuncName, L"c_sum") == 0){ addCStackFunction(L"c_sum", &sci_csum, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"c_sub") == 0){ addCStackFunction(L"c_sub", &sci_csub, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"c_multiplybypi") == 0){ addCStackFunction(L"c_multiplybypi", &sci_multiplybypi, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"foo") == 0){ addCStackFunction(L"foo", &sci_foo, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"c_error") == 0){ addCStackFunction(L"c_error", &sci_cerror, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"c_sum6") == 0){ addCFunction(L"c_sum6", &sci_csum6, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"c_sub6") == 0){ addCFunction(L"c_sub6", &sci_csub6, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"c_multiplybypi6") == 0){ addCFunction(L"c_multiplybypi6", &sci_multiplybypi6, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"foo6") == 0){ addCFunction(L"foo6", &sci_foo6, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"c_error6") == 0){ addCFunction(L"c_error6", &sci_cerror6, MODULE_NAME); }

    return 1;
}
