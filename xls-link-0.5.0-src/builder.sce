// =============================================================================
// Copyright (C) DIGITEO - 2010 - Allan CORNET
// Copyright (C) Scilab Enterprises - 2013 - Antoine ELIAS
// =============================================================================
mode(-1);
lines(0);

function main_builder()
    TOOLBOX_NAME  = "xls_link";
    TOOLBOX_TITLE = "xls link (Automation) for Scilab";
    toolbox_dir   = get_absolute_file_path("builder.sce");

    // Check scilab version
    try
      v = getversion("scilab");
    catch
      error(gettext("Scilab 5.4 or more is required."));
    end
    if (v(1) < 5) | ((v(1) == 5) & (v(2) < 4)) then
      error(gettext('Scilab 5.4 or more is required.'));
    end

    // Check OS is Windows
    if getos() <> "Windows" then
        error("The toolbox xls_link supports only Windows.");
    end

    tbx_builder_src(toolbox_dir);
    tbx_builder_gateway(toolbox_dir);
    tbx_builder_macros(toolbox_dir);
    tbx_builder_help(toolbox_dir);
    tbx_build_loader(TOOLBOX_NAME, toolbox_dir);
    tbx_build_cleaner(TOOLBOX_NAME, toolbox_dir);
 endfunction

 main_builder();
 clear main_builder();