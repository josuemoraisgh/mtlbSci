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

r = xls_AddWorkbook();
assert_checktrue(r);

ierr = execstr('sheetname = xls_GetWorksheetName(''A'')','errcatch');
assert_checkfalse(ierr == 0);

// Create up to 3 worksheets
worksheet_count = xls_getProperty("workbook", "worksheets", "count");
for i=1:max(3-worksheet_count, 0)
    xls_AddWorksheet();
end

for i=1:3
  r = xls_SetWorksheet(i);
  assert_checktrue(r);

  r = xls_SetWorksheetName('scilab '+string(i));
  assert_checktrue(r);
end

for i=1:3
  r = xls_SetWorksheet(i);
  name = xls_GetWorksheetName();
  assert_checkequal(name, 'scilab '+string(i));
end

r = xls_SetVisible(%f);
assert_checktrue(r);

r = xls_SetSave(%t);
assert_checktrue(r);

r = xls_Close();
assert_checktrue(r);

r = xls_Quit();
assert_checktrue(r);
