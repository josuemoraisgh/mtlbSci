// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->

test_path = fullfile(xls_getRootPath(), "tests", "unit_tests");

assert_checktrue(xls_NewExcel());

xls_path = fullfile(test_path, "xls_Open.xls");
assert_checktrue(xls_Open(xls_path));

// Check with not found file
assert_checkfalse(execstr('xls_Open(1)', 'errcatch') == 0);

// Password argument
// The following Excel file is protected with the password "123"
protected_xls_path = fullfile(test_path, "xls_Open_password.xlsx");

assert_checkfalse(execstr('xls_Open(protected_xls_path)', 'errcatch') == 0);
assert_checktrue(xls_Open(protected_xls_path, "123"));

// Check also unprotected Excel file can be opened with a password argument
assert_checktrue(xls_Open(xls_path, "123"));

assert_checktrue(xls_Quit());

