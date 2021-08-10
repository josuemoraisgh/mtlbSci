// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================

function check_SetData(_range, data, expected_data)
    res = xls_SetData(_range, data);
    assert_checktrue(res);
    returned_data = xls_GetData(_range);
    assert_checkequal(returned_data, expected_data);
endfunction


r = xls_NewExcel();
assert_checktrue(r);

r = xls_AddWorkbook();
assert_checktrue(r);

r = xls_SetWorksheet(1);
assert_checktrue(r);

check_SetData("A1", %pi, %pi);

check_SetData("E1:E3", %pi, [%pi; %pi; %pi]);

check_SetData("A1:B3", %pi, [%pi %pi; %pi %pi; %pi %pi]);

check_SetData("A5:B7", [1 2; 3 4; 5 6], [1 2; 3 4; 5 6]);

check_SetData("A5:B6", ["Allan" "CORNET"; "Digiteo" "Copyright 2008"], ..
    ["Allan" "CORNET"; "Digiteo" "Copyright 2008"]);

check_SetData("A11:F11", ["Scilab", "Enterprises", "is", "the", "new", "maintainer"], ..
    ["Scilab", "Enterprises", "is", "the", "new", "maintainer"]);

r = xls_SetSave(%t);
assert_checktrue(r);

r = xls_SaveAs(fullfile(TMPDIR, "test_xls_SetData.xls"));
assert_checktrue(r);

r = xls_Close();
assert_checktrue(r);

r = xls_Quit();
assert_checktrue(r);
