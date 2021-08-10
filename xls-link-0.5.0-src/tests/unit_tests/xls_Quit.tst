// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================


ierr = execstr('xls_Quit(1)','errcatch');
assert_checkfalse(ierr == 0);

r = xls_NewExcel();
assert_checktrue(r);

r = xls_AddWorkbook();
assert_checktrue(r);

xls_SetWorksheet(1);
r = xls_Close();
assert_checktrue(r);

r = xls_Quit();
assert_checktrue(r);

r = xls_Quit();
assert_checkfalse(ierr == 0);
