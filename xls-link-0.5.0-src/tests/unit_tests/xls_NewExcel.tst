// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================


ierr = execstr('xls_NewExcel(1)','errcatch');
assert_checkfalse(ierr == 0);

r = xls_NewExcel();
assert_checktrue(r);

r = xls_Quit();
assert_checktrue(r);
