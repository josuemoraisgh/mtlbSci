// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================


ierr = execstr('xls_IsExcelRunning(1)','errcatch');
assert_checkfalse(ierr == 0);

assert_checkfalse(xls_IsExcelRunning());

r = xls_NewExcel();
assert_checktrue(r);
assert_checktrue(xls_IsExcelRunning());

r = xls_Quit();
assert_checktrue(r);
assert_checkfalse(xls_IsExcelRunning());
