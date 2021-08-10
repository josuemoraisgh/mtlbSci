// ====================================================================
// Antoine ELIAS
// Scilab Enterprises 2013
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================

r = xls_NewExcel();
assert_checktrue(r);

test_path = fullfile(xls_getRootPath(), "tests", "unit_tests");
r = xls_Open(fullfile(test_path, "xls_CallMacro.xls"));

assert_checktrue(r);
r = xls_SetWorksheet(1);
assert_checktrue(r);
r = xls_SetData("A1", "");
assert_checktrue(r);

r = xls_CallMacro("Sheet1.TestMacro1");
assert_checktrue(r);
data = xls_GetData("A1");
assert_checkequal(data, "TestMacro1");

r = xls_CallMacro("Sheet1.TestMacro2", "TestMacro2");
assert_checktrue(r);
data = xls_GetData("A1");
assert_checkequal(data, "TestMacro2");

r = xls_CallMacro("Sheet1.TestMacro2", 1);
assert_checktrue(r);
data = xls_GetData("A1");
assert_checkequal(data, 1);

r = xls_CallMacro("Sheet1.TestMacro2", %t);
assert_checktrue(r);
data = xls_GetData("A1");
assert_checkequal(data, %t);

r = xls_CallMacro("Sheet1.TestMacro3", "A1", "TestMacro3");
assert_checktrue(r);
data = xls_GetData("A1");
assert_checkequal(data, "TestMacro3");

r = xls_CallMacro("Sheet1.TestMacro3", "A1", 1000);
assert_checktrue(r);
data = xls_GetData("A1");
assert_checkequal(data, 1000);

r = xls_CallMacro("Sheet1.TestMacro3", "A1", %t);
assert_checktrue(r);
data = xls_GetData("A1");
assert_checkequal(data, %t);

r = xls_SetSave(%t);
assert_checktrue(r);
r = xls_Close();
assert_checktrue(r);
r = xls_Quit();
assert_checktrue(r);

