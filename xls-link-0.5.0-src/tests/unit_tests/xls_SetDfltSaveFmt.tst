// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================


r = xls_NewExcel();
assert_checktrue(r);;

r = xls_AddWorkbook();
assert_checktrue(r);

r = xls_SetWorksheet(1);
assert_checktrue(r);

ierr = execstr('xls_fmt = xls_GetDfltSaveFmt();','errcatch');
assert_checkequal(ierr, 0);

ierr = execstr('r = xls_SetDfltSaveFmt(xls_fmt);','errcatch');
assert_checkequal(ierr, 0);
assert_checktrue(r);

ierr = execstr('r = xls_SetDfltSaveFmt(''toto'');','errcatch');
assert_checkfalse(ierr == 0);

r = xls_Quit();
assert_checktrue(r);;
