// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// 
// <-- INTERACTIVE TEST -->
// ====================================================================


r = xls_NewExcel();
assert_checktrue(r);

r = xls_AddWorkbook();
assert_checktrue(r);

r = xls_SetWorksheet(1);
assert_checktrue(r);

r = xls_SetVisible(%t);
assert_checktrue(r);

// edit in current Worksheet & validate
// r =  xls_Undo(%t);
// your modification must be removed
// assert_checktrue(r);

r = xls_SetVisible(%f);

r = xls_Quit();
assert_checktrue(r);
