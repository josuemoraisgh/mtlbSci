// ====================================================================
// Copyright DIGITEO 2010
// Allan CORNET
// ====================================================================
// Check if Excel is installed
if xls_GetExcelVersion('number') == [] then
  warning("Excel not detected.");
  return
end

// Call a new instance of Excel
r = xls_NewExcel();
if r <> %t then pause,end

// Create a Workbook
r = xls_AddWorkbook();
if r <> %t then pause,end

// Set Worksheet 1 
r = xls_SetWorksheet(1);
if r <> %t then pause,end

h = scf();
plot3d();
xs2bmp(h, TMPDIR + '/foo.bmp');
close(h);

r = xls_SetVisible(%t);
r = xls_SetPic(TMPDIR + '/foo.bmp', [10 10 200 200]);

input(_("Press a key to continue."));

r = xls_Close();
r = xls_Quit();
// ====================================================================
