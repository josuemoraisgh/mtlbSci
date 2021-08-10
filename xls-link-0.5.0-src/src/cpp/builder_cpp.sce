function builder_cpp()
    src_cpp_path = get_absolute_file_path("builder_cpp.sce");

    lib_name = "xls_link";

    entry_points = ["getObjExcelLink"; ..
                      "destroyObjExcelLink"; ..
                      "setOutputArgument"; ..
                      "getInputArgument"; ..
                      "getVariant"; ..
                      "getXlFileFormatName"; ..
                      "getXlFileFormat"; ..
                      "IndToStr"];

    file_names = ["AutomationHelper.cpp"
                    "ExcelLink.cpp"; ..
                    "MainObject.cpp"; ..
                    "getInputArgument.cpp"; ..
                    "setOutputArgument.cpp"; ..
                    "xlFileFormat.c"; ..
                    "Excel_utils.c"];

    CFLAGS = "-DXLS_LINK_EXPORTS";
    CFLAGS = CFLAGS + " " + ilib_include_flag(src_cpp_path);
    CC = "";
    LIBS = "";
    LDFLAGS = "ole32.lib oleaut32.lib user32.lib";
    FFLAGS = "";

    tbx_build_src(entry_points, ..
        file_names, ..
        "cpp", ..
        src_cpp_path, ..
        LIBS, ..
        LDFLAGS, ..
        CFLAGS, ..
        FFLAGS, ..
        CC, ..
        lib_name);
endfunction

builder_cpp();
clear builder_cpp;
