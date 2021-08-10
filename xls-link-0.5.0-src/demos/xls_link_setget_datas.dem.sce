// ====================================================================
// Copyright DIGITEO 2010
// Allan CORNET
// ====================================================================

// Call a new instance of Excel
r = xls_NewExcel();

// Create a Workbook
xls_AddWorkbook();

// Set Worksheet 1 
xls_SetWorksheet(1);

// disable some excel messagebox
xls_DisplayAlerts(%f);

previous_mode = mode();
mode(7);

A = eye(10,10);

// set visible excel windows
xls_SetVisible(%t);

xls_SetData("A1", "eye(10,10)");
xls_SelectRange("A1");
xls_SetFont("ARIAL",%t,%f,20);
xls_SetColor([255,0,0],[0,255,0]);

xls_SetData("A2", A);

xls_SaveAs(TMPDIR + "/demo_xls_setget.xls");
xls_Save();

clear A;
disp('A1 -> ');
disp(xls_GetData("A1"))
disp(xls_CalculateRange("A2",[10,10]) + ' -> ');
disp(xls_GetData(xls_CalculateRange("A2",[10,10])))

// hide excel windows
xls_SetVisible(%f);

// close Workbook
r = xls_Close();

// quit excel
r = xls_Quit();

mode(previous_mode);
clear previous_mode;
// ====================================================================
