TOOLBOX_NAME  = "rltool";
TOOLBOX_TITLE = "Rltool";

toolbox_dir = get_absolute_file_path("builder.sce");
tbx_builder_macros(toolbox_dir);
tbx_build_loader(TOOLBOX_NAME, toolbox_dir);
tbx_build_cleaner(TOOLBOX_NAME, toolbox_dir);
