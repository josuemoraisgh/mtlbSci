// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================


r = xls_NewExcel();
assert_checktrue(r);

r = xls_AddWorkbook();
assert_checktrue(r);

r = xls_SetWorksheet(1);
assert_checktrue(r);

r = xls_SelectRange("A1");
assert_checktrue(r);

r = xls_SelectRange("A1:B12");
assert_checktrue(r);

r = xls_SelectRange("A0:A1");
assert_checkfalse(r);

r = xls_SelectRange("A0");
assert_checkfalse(r);

r = xls_Close();
assert_checktrue(r);

r = xls_Quit();
assert_checktrue(r);
