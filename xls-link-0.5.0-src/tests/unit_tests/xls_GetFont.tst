// ====================================================================
// Allan CORNET
// DIGITEO 2010
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

r = xls_SetFont("ARIAL",%t,%f,20);
assert_checktrue(r);

r = xls_GetFont();
assert_checkequal(r, "ARIAL");;

r = xls_GetFont("name");
assert_checkequal(r, "ARIAL");;

r = xls_GetFont("bold");
assert_checktrue(r);

r = xls_GetFont("underline");
assert_checkfalse(r);

r = xls_GetFont("size");
assert_checkequal(r, 20);

r = xls_SelectRange("A1:B12");
assert_checktrue(r);
ierr = execstr("r = xls_GetFont(""name"");", "errcatch");
assert_checkequal(ierr, 0);

// disable "Save" msg box ==> not saved !!!
r = xls_SetSave(%t);

assert_checktrue(xls_Close());
assert_checktrue(xls_Quit());

