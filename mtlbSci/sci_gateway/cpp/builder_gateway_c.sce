// This file is released under the 3-clause BSD license. See COPYING-BSD.

function builder_gateway_c()
    src_c = get_absolute_file_path("builder_gateway_c.sce")
    includes_src_c = ilib_include_flag([fullpath(src_c + "../../includes");"."]);
    tbx_build_gateway('execmtlb',..
                      ['execmtlb','sci_execmtlb'],..
                      ['sci_execmtlb.cpp'],..
                      src_c, ..
                      [],..
                      "",..
                      includes_src_c);
endfunction

builder_gateway_c();
clear builder_gateway_c; // remove builder_gw_c on stack
