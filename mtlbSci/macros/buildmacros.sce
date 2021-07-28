macros_mtlbscilib  = get_absolute_file_path("buildmacros.sce");
macros_mtlbscilib  = getshortpathname(macros_mtlbscilib);

genlib("mtlbscilib", macros_mtlbscilib, %f, %t);
