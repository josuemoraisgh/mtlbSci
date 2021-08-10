// Copyright (C) 2014 - Holger Nahrstaedt
// Copyright (C) 2011 - INRIA - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function swt_builderC()
    src_dir = get_absolute_file_path("builder_c.sce");

    src_path = "c";
    linknames = ["swtlib"];
    files = [
    "utility.c","bathlets.c","haar.c","daubechies.c","symlets.c","coiflets.c",..
    "bior.c","bior_t.c","vaidyanathan.c","dmey.c","legendre.c","farras.c",..
    "kingsbury.c","beylkin.c","cowt.c","dwt1d.c","dwt2d.c","dwt3d.c","kiss_fft.c","cwt.c","swt.c"
    ];
    ldflags = "";
    if ( getos() == "Windows" ) then
	  cflags = "-DWIN32 -DLIBDISTFUN_C_EXPORTS";
	else
  	include1 = src_dir;
  	cflags = "-I"""+include1+"""";
	end

	libs = [];

    tbx_build_src(linknames, files, src_path, src_dir, libs, ldflags, cflags);

endfunction
swt_builderC();
clear swt_builderC;
