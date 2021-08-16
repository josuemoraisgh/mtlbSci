#include <wchar.h>
#include "execmtlb.hxx"
extern "C"
{
#include "execmtlb.h"
#include "addfunction.h"
}

#define MODULE_NAME L"execmtlb"

int execmtlb(wchar_t* _pwstFuncName)
{
    if(wcscmp(_pwstFuncName, L"execmtlb") == 0){ addCStackFunction(L"execmtlb", &sci_execmtlb, MODULE_NAME); }

    return 1;
}
