#include "context.hxx"
#include "cpp_gateway_prototype.hxx"
#include "skeleton_cpp.hxx"
extern "C"
{
#include "skeleton_cpp.h"
}

#define MODULE_NAME L"skeleton_cpp"

int skeleton_cpp(wchar_t* _pwstFuncName)
{
    if(wcscmp(_pwstFuncName, L"cpp_find") == 0){ symbol::Context::getInstance()->addFunction(types::Function::createFunction(L"cpp_find", &sci_cpp_find, MODULE_NAME)); }
    if(wcscmp(_pwstFuncName, L"cpp_error") == 0){ symbol::Context::getInstance()->addFunction(types::Function::createFunction(L"cpp_error", &sci_cpperror, MODULE_NAME)); }
    if(wcscmp(_pwstFuncName, L"cpp_foo") == 0){ symbol::Context::getInstance()->addFunction(types::Function::createFunction(L"cpp_foo", &sci_cppfoo, MODULE_NAME)); }
    if(wcscmp(_pwstFuncName, L"cpp_sum") == 0){ symbol::Context::getInstance()->addFunction(types::Function::createFunction(L"cpp_sum", &sci_cppsum, MODULE_NAME)); }
    if(wcscmp(_pwstFuncName, L"cpp_sub") == 0){ symbol::Context::getInstance()->addFunction(types::Function::createFunction(L"cpp_sub", &sci_cppsub, MODULE_NAME)); }
    if(wcscmp(_pwstFuncName, L"cpp_multiplybypi") == 0){ symbol::Context::getInstance()->addFunction(types::Function::createFunction(L"cpp_multiplybypi", &sci_cppmultiplybypi, MODULE_NAME)); }

    return 1;
}
