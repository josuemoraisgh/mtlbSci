// This file is released under the 3-clause BSD license. See COPYING-BSD.

function builder_gw_cpp()
    gateway_cpp_path = get_absolute_file_path("builder_gateway_cpp.sce");

    // PutLhsVar managed by user in sci_sum and in sci_sub
    // if you do not this variable, PutLhsVar is added
    // in gateway generated (default mode in scilab 4.x and 5.x)
    WITHOUT_AUTO_PUTLHSVAR = %t;

    lib_name = "gw_xls_link";

    gateway_names = ["xls_IsExcelRunning", "sci_XLS_IsExcelRunning"; ..
                       "xls_NewExcel", "sci_XLS_NewExcel"; ..
                       "xls_Quit", "sci_XLS_Quit"; ..
                       "xls_RecoverExcel", "sci_XLS_RecoverExcel"; ..
                       "xls_SetPic", "sci_XLS_SetPic"; ..
                       "xls_OffsetRange", "sci_XLS_OffsetRange"; ..
                       "xls_getProperty", "sci_XLS_getProperty"; ..
                       "xls_setProperty", "sci_XLS_setProperty"; ..
                       "xls_callMethod", "sci_XLS_callMethod"; ..
                       "xls_convertSaveFormat", "sci_XLS_convertSaveFormat"; ..
                       "xls_ExtendRange", "sci_XLS_ExtendRange"; ..
                       "xls_CallMacro", "sci_XLS_CallMacro"; ..
                       "xls_GetRange", "sci_XLS_GetRange"];

    file_names = [ "sci_XLS_IsExcelRunning.cpp"; ..
                     "sci_XLS_NewExcel.cpp"; ..
                     "sci_XLS_Quit.cpp"; ..
                     "sci_XLS_RecoverExcel.cpp"; ..
                     "sci_XLS_SetPic.cpp"; ..
                     "sci_XLS_OffsetRange.cpp"; ..
                     "sci_XLS_getProperty.cpp"; ..
                     "sci_XLS_setProperty.cpp"; ..
                     "sci_XLS_callMethod.cpp"; ..
                     "sci_XLS_convertSaveFormat.cpp"; ..
                     "sci_XLS_ExtendRange.cpp"; ..
                     "sci_XLS_CallMacro.cpp"; ..
                     "sci_XLS_GetRange.cpp"];

    LIBS = ["..\..\src\cpp\libxls_link"];
    LDFLAGS = "ole32.lib oleaut32.lib";
    include_paths = [gateway_cpp_path; fullfile(gateway_cpp_path, "..\..\src\cpp")];
    CCFLAGS = ilib_include_flag(include_paths);

    tbx_build_gateway(lib_name, ..
        gateway_names, ..
        file_names, ..
        fullfile(gateway_cpp_path), ..
        LIBS, ..
        LDFLAGS, ..
        CCFLAGS);
endfunction

builder_gw_cpp();
clear builder_gw_cpp;
