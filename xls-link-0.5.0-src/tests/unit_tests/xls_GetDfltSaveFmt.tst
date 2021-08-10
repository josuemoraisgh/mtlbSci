// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================


r = xls_NewExcel();
assert_checktrue(r);;

ierr = execstr('xls_fmt = xls_GetDfltSaveFmt();','errcatch');
assert_checkequal(ierr, 0);

if strtod(xls_GetExcelVersion()) >= 12 then
  assert_checkequal(xls_fmt, 'xlOpenXMLWorkbook');
end

r = xls_Quit();
assert_checktrue(r);
