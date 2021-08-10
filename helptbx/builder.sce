// Copyright (C) 2010 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

mode(-1);
lines(0);

function helptbxBuildToolbox()
    // Uncomment to make a Debug version
    //setenv("DEBUG_SCILAB_DYNAMIC_LINK","YES")

    TOOLBOX_NAME = "helptbx";
    TOOLBOX_TITLE = "Helptbx";

    toolbox_dir = get_absolute_file_path("builder.sce");
    tbx_builder_macros(toolbox_dir);
    tbx_builder_help(toolbox_dir);
    tbx_build_loader(TOOLBOX_NAME , toolbox_dir);
    tbx_build_cleaner(TOOLBOX_NAME, toolbox_dir);
endfunction

helptbxBuildToolbox();
clear helptbxBuildToolbox;

