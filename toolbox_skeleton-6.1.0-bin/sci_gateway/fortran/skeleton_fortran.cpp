#include <wchar.h>
#include "skeleton_fortran.hxx"
extern "C"
{
#include "skeleton_fortran.h"
#include "addfunction.h"
}

#define MODULE_NAME L"skeleton_fortran"

int skeleton_fortran(wchar_t* _pwstFuncName)
{
    if(wcscmp(_pwstFuncName, L"fortran_sum") == 0){ addCStackFunction(L"fortran_sum", &sci_fsum, MODULE_NAME); }

    return 1;
}
