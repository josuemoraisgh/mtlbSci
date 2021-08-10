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

r = xls_SetWorksheet(1);
assert_checktrue(r);
  
for i=1:5
  r = xls_ShowGrid(%t);
  assert_checktrue(r);

	sleep(200);
	
  r = xls_ShowGrid(%f);
  assert_checktrue(r);
  
  sleep(200);
end

r = xls_SetVisible(%f);
assert_checktrue(r);

r = xls_SetSave(%t);
assert_checktrue(r);
r = xls_Close();
assert_checktrue(r);

r = xls_Quit();
assert_checktrue(r);
