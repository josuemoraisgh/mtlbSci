// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================

r = xls_NewExcel();
assert_checktrue(r);

ierr = execstr('res = xls_AddWorksheet(1)','errcatch');
assert_checkfalse(ierr == 0);

r = xls_AddWorkbook();
assert_checktrue(r);

for i=1:10
  r = xls_AddWorksheet(); 
  assert_checkfalse(r == 0);
end

r = xls_DisplayAlerts(%f);
assert_checktrue(r);

r = xls_Close();
assert_checktrue(r);

r = xls_Quit();
assert_checktrue(r);
