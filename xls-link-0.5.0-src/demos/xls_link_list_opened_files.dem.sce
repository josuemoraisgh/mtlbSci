// ====================================================================
// Copyright ESI Group 2020
// Clément DAVID
// ====================================================================

if xls_IsExcelRunning() == %f then
    xls_NewExcel();
else
    xls_RecoverExcel();
end

function dem()
    c = xls_getProperty("Application", "Workbooks", "Count");
    items = emptystr(c, 1);
    for i=1:c
        xls_callMethod("Application", "Workbooks", list(i));
        xls_callMethod("Workbook", "Activate");
         
        items(i) = xls_getProperty("Workbook", "Name");
    end
    
    n = x_choose(items, "Select an Excel file");
    if n > 0 then
        xls_callMethod("Application", "Workbooks", list(n));
        xls_callMethod("Workbook", "Activate");
        
        c = xls_getProperty("Application", "Worksheets", "Count");
        items = emptystr(c, 1);
        for i=1:c
            xls_callMethod("Application", "Worksheets", list(i));
            xls_callMethod("Worksheet", "Activate");
            
            items(i) = xls_getProperty("Worksheet", "Name");
        end
        
        n = x_choose(items, "Select an Excel worksheet");
        if n > 0 then
            xls_callMethod("Application", "Worksheets", list(n));
            xls_callMethod("Worksheet", "Activate");
        
            xls_SetVisible();
        end
    end
endfunction

dem();
clear("dem");
