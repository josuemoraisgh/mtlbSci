// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================

r = xls_NewExcel();
assert_checktrue(r);

r = xls_SetVisible(%t);
assert_checktrue(r);

r = xls_AddWorkbook()
assert_checktrue(r);

r = xls_SetWorksheet(1)
assert_checktrue(r);

r = xls_SetData("A2:B3",1.3)
assert_checktrue(r);

r = xls_SelectRange("A1")
assert_checktrue(r);

r = xls_SetFont("ARIAL",%t,%f,20)
assert_checktrue(r);

r = xls_SetData("A1","My Title from Scilab");
assert_checktrue(r);

r = xls_SetColor([255,0,0],[0,255,0]);
assert_checktrue(r);

r = xls_GetColor();
assert_checkequal(r, [255, 0, 0]);

[r1, r2] = xls_GetColor();
assert_checkequal(r1, [255, 0, 0]);
assert_checkequal(r2, [0, 255, 0]);

r = xls_SetVisible(%f);
assert_checktrue(r);

r = xls_SetSave(%t);
assert_checktrue(r);

r = xls_Close();
assert_checktrue(r);

r = xls_Quit();
assert_checktrue(r);
