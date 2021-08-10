// =============================================================================
// Copyright (C) DIGITEO - 2010 - Allan CORNET
// =============================================================================
function p = xls_getRootPath()
  p = [];
  if isdef('xls_linklib') then
    [m, mp] = libraryinfo('xls_linklib');
    p = fullpath(mp + '\..');
  end
endfunction
// =============================================================================
