// Copyright (C) 2010 - 2011 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function path = helptbx_getpath (  )
    // Returns the path to the current module.
    //
    // Calling Sequence
    //   path = helptbx_getpath (  )
    //
    // Parameters
    //   path : a 1-by-1 matrix of strings, the path to the current module.
    //
    // Examples
    //   path = helptbx_getpath (  )
    //
    // Authors
    //   Copyright (C) 2010 - 2011 - DIGITEO - Michael Baudin

    [lhs, rhs] = argn()
    apifun_checkrhs ( "helptbx_getpath" , rhs , 0 )
    apifun_checklhs ( "helptbx_getpath" , lhs , 1 )

    path = get_function_path("helptbx_getpath")
    path = fullpath(fullfile(fileparts(path),".."))
endfunction

