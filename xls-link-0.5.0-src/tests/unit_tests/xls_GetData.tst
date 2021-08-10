// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================


test_path = fullfile(xls_getRootPath(), "tests", "unit_tests");

assert_checkfalse(xls_IsExcelRunning());
r = xls_NewExcel();
assert_checktrue(r);

r = xls_Open(fullfile(test_path, "xls_GetData.xls"));
assert_checktrue(r);

r = xls_SetWorksheet(1);
assert_checktrue(r);

v = xls_GetData('A1');
assert_checkequal(type(v), 1);
assert_checkequal(v, 1);

v = xls_GetData('IntType');
assert_checkequal(type(v), 1);
assert_checkequal(v, 1);

v = xls_GetData('B4');
assert_checkequal(type(v), 1);
assert_checkequal(v, 1.2);

v = xls_GetData('DoubleType');
assert_checkequal(type(v), 1);
assert_checkequal(v, 1.2);

v = xls_GetData('A12');
assert_checkequal(type(v), 10);
assert_checkequal(v, 'Test');

v = xls_GetData('StringType');
assert_checkequal(type(v), 10);
assert_checkequal(v, 'Test');

v = xls_GetData('B13');
assert_checkequal(type(v), 1);
assert_checkequal(v, []);

v = xls_GetData('EmptyType');
assert_checkequal(type(v), 1);
assert_checkequal(v, []);

v = xls_GetData('A14');
assert_checkequal(type(v), 1);
assert_checkequal(v, 0.5625);

v = xls_GetData('TimeType');
assert_checkequal(type(v), 1);
assert_checkequal(v, 0.5625);

v = xls_GetData('A15');
assert_checkequal(type(v), 10);
if getlanguage() == "en_US" then
    assert_checkequal(v, '8/12/1989');
else
    assert_checkequal(v, '12/08/1989');
end

v = xls_GetData('DateType');
assert_checkequal(type(v), 10);
if getlanguage() == "en_US" then
    assert_checkequal(v, '8/12/1989');
else
    assert_checkequal(v, '12/08/1989');
end

v = xls_GetData('A16');
assert_checkequal(type(v), 1);
assert_checkequal(v, -1326.1);

v = xls_GetData('NegType');
assert_checkequal(type(v), 1);
assert_checkequal(v, -1326.1);

v = xls_GetData('A17');
assert_checkequal(type(v), 1);
assert_checkequal(v, 14);

v = xls_GetData('EuroType');
assert_checkequal(type(v), 1);
assert_checkequal(v, 14);

v = xls_GetData('A18');
assert_checkequal(type(v), 10);
if getlanguage() == "en_US" then
    assert_checkequal(v, '3/14/2001');
else
    assert_checkequal(v, '14/03/2001');
end

v = xls_GetData('DateType2');
assert_checkequal(type(v), 10);
if getlanguage() == "en_US" then
    assert_checkequal(v, '3/14/2001');
else
    assert_checkequal(v, '14/03/2001');
end

v = xls_GetData('A19');
assert_checkequal(type(v), 10);
assert_checkequal(v, '30/100');

v = xls_GetData('StringType2');
assert_checkequal(type(v), 10);
assert_checkequal(v, '30/100');

v = xls_GetData('A20');
assert_checkequal(type(v), 1);
assert_checkequal(v, 1.000D+99);

v = xls_GetData('ExpoType');
assert_checkequal(type(v), 1);
assert_checkequal(v, 1.000D+99);

v = xls_GetData('A21');
assert_checkequal(type(v), 1);
assert_checkequal(v,  -1.000D-99);

v = xls_GetData('ExpoType2');
assert_checkequal(type(v), 1);
assert_checkequal(v,  -1.000D-99);

v = xls_GetData('D1:G2');
assert_checkequal(type(v), 1);
assert_checkequal(size(v), [0 0]);
assert_checkequal(v, []);

v = xls_GetData('EmptyMatrixType');
assert_checkequal(type(v), 1);
assert_checkequal(size(v), [0 0]);
assert_checkequal(v, []);

ref_1 = [1 2 3;4 5 6];
v = xls_GetData('A1:C2');
assert_checkequal(type(v), 1);
assert_checkequal(size(v), [2 3]);
assert_checkequal(v, ref_1);

v = xls_GetData('IntMatrixType');
assert_checkequal(type(v), 1);
assert_checkequal(size(v), [2 3]);
assert_checkequal(v, ref_1);

ref_2 = [1.1 1.2 1.3;1.4 1.5 1.6];
v = xls_GetData('A4:C5');
assert_checkequal(type(v), 1);
assert_checkequal(size(v), [2 3]);
assert_checkequal(v, ref_2);

v = xls_GetData('DoubleMatrixType');
assert_checkequal(type(v), 1);
assert_checkequal(size(v), [2 3]);
assert_checkequal(v, ref_2);

ref_3 = [ 'A' 'B' 'C';'D' 'E' 'F';'G' 'H' 'I'];
v = xls_GetData('E7:G9');
assert_checkequal(type(v), 10);
assert_checkequal(size(v), [3 3]);
assert_checkequal(v, ref_3);

v = xls_GetData('StringMatrixType');
assert_checkequal(type(v), 10);
assert_checkequal(size(v), [3 3]);
assert_checkequal(v, ref_3);

ref_4 = [string(ref_1); '' '' '' ;string(ref_2)];
if getlanguage() <> "en_US" then
    ref_4 = strsubst(ref_4,'.',',');
end
v = xls_GetData('A1:C5');
assert_checkequal(type(v), 10);
assert_checkequal(size(v), [5 3]);
assert_checkequal(v, ref_4);

v = xls_GetData('BigDoubleMatrixType');
assert_checkequal(type(v), 10);
assert_checkequal(size(v), [5 3]);
assert_checkequal(v, ref_4);

ref_5 = ['1'    'A' 'B' '2' ''  ; 'Test'    '3' 'Scilab'    '4' 'Datas'];
v = xls_GetData('A11:E12');
assert_checkequal(type(v), 10);
assert_checkequal(size(v), [2 5]);
assert_checkequal(v, ref_5);

v = xls_GetData('BigStringMatrixType');
assert_checkequal(type(v), 10);
assert_checkequal(size(v), [2 5]);
assert_checkequal(v, ref_5);

ref_6 = ['Tests ' 'Automation xls_GetData'];
v = xls_GetData('A23:B23');
assert_checkequal(type(v), 10);
assert_checkequal(size(v), [1 2]);
assert_checkequal(v, ref_6);

v = xls_GetData('AnotherStringMatrixType');
assert_checkequal(type(v), 10);
assert_checkequal(size(v), [1 2]);
assert_checkequal(v, ref_6);

v = xls_GetData('A1:BZ1000');
assert_checkequal(size(v), [1000 78]);

ver_excel_num = strtod(xls_GetExcelVersion());
if ver_excel_num < 12 then
  max_cell_xls = "IV65536";
else
  max_cell_xls = "XFD1048576";
end

ierr = execstr('v = xls_SelectRange(''A1:''+max_cell_xls);','errcatch');
assert_checkequal(ierr, 0);

assert_checktrue(xls_Close());
assert_checktrue(xls_Quit());
