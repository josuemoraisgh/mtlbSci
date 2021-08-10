macros_rltoollib  = get_absolute_file_path("buildmacros.sce");
macros_rltoollib  = getshortpathname(macros_rltoollib);

genlib("rltoollib", macros_rltoollib, %f, %t);
