/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008-2010 */
/*--------------------------------------------------------------------------*/
#include <stdlib.h>
#include <string.h>
/*--------------------------------------------------------------------------*/
typedef struct XlFile_struct
{
    long code;
    char xlfileformat_name[256];
    char xlfileformat_description[256];
} XlFileFormatTable;
/*--------------------------------------------------------------------------*/
#define MAX_FORMAT_TABLE 50
/*--------------------------------------------------------------------------*/
static XlFileFormatTable XLFILE_FORMAT_TABLE[MAX_FORMAT_TABLE] =
{
    { 18,     "xlAddIn8",                        "Microsoft Excel 97-2007"},
    { 6,      "xlCSV",                           "CSV" },
    { 22,     "xlCSVMac",                        "Macintosh CSV"},
    { 24,     "xlCSVMSDOS",                      "MSDOS CSV" },
    { 23,     "xlCSVWindows",                    "Windows CSV"  },
    { -4158,  "xlCurrentPlatformText",           "Current Platform Text" },
    { 7,      "xlDBF2",                          "DBF2" },
    { 8,      "xlDBF3",                          "DBF3" },
    { 11,     "xlDBF4",                          "DBF4" },
    { 9,      "xlDIF",                           "DIF" },
    { 50,     "xlExcel12",                       "Excel12" },
    { 16,     "xlExcel2",                        "Excel2" },
    { 27,     "xlExcel2FarEast",                 "Excel2 FarEast" },
    { 29,     "xlExcel3",                        "Excel3" },
    { 33,     "xlExcel4",                        "Excel4" },
    { 35,     "xlExcel4Workbook",                "Excel4 Workbook" },
    { 39,     "xlExcel5",                        "Excel5" },
    { 56,     "xlExcel8",                        "Excel8" },
    { 43,     "xlExcel9795",                     "Excel9795" },
    { 44,     "xlHtml",                          "HTML format" },
    { 26,     "xlIntlAddIn",                     "International Add-In" },
    { 25,     "xlIntlMacro",                     "International Macro" },
    { 55,     "xlOpenXMLAddIn",                  "Open XML Add-In" },
    { 54,     "xlOpenXMLTemplate",               "Open XML Template" },
    { 53,     "xlOpenXMLTemplateMacroEnabled",   "Open XML Template Macro Enabled" },
    { 51,     "xlOpenXMLWorkbook",               "Open XML Workbook" },
    { 52,     "xlOpenXMLWorkbookMacroEnabled",   "Open XML Workbook Macro Enabled" },
    { 2,      "xlSYLK",                          "SYLK" },
    { 17,     "xlTemplate",                      "Template" },
    { 19,     "xlTextMac",                       "Macintosh Text" },
    { 21,     "xlTextMSDOS",                     "MSDOS Text" },
    { 36,     "xlTextPrinter",                   "Printer Text" },
    { 20,     "xlTextWindows",                   "Windows Text" },
    { 42,     "xlUnicodeText",                   "Unicode Text" },
    { 45,     "xlWebArchive",                    "Web Archive" },
    { 14,     "xlWJ2WD1",                        "WJ2WD1"},
    { 40,     "xlWJ3",                           "WJ3" },
    { 41,     "xlWJ3FJ3",                        "WJ3FJ3" },
    { 5,      "xlWK1",                           "WK1"  },
    { 31,     "xlWK1ALL",                        "WK1ALL"  },
    { 30,     "xlWK1FMT",                        "WK1FMT" },
    { 15,     "xlWK3",                           "WK3"  },
    { 32,     "xlWK3FM3",                        "WK3FM3" },
    { 38,     "xlWK4",                           "WK4"  },
    { 4,      "xlWKS",                           "Worksheet"  },
    { 51,     "xlWorkbookDefault",               "Workbook default"  },
    { -4143,  "xlWorkbookNormal",                "Workbook normal"  },
    { 28,     "xlWorks2FarEast",                 "Works2 FarEast"  },
    { 34,     "xlWQ1",                           "WQ1"  },
    { 46,     "xlXMLSpreadsheet",                "XML Spreadsheet" }
};
/*--------------------------------------------------------------------------*/
char *getXlFileFormatName(long XlFileFormatCode)
{
    int i = 0;
    for(i = 0; i < MAX_FORMAT_TABLE; i++)
    {
        if (XLFILE_FORMAT_TABLE[i].code == XlFileFormatCode)
        {
            return XLFILE_FORMAT_TABLE[i].xlfileformat_name;
        }
    }
    return NULL;
}
/*--------------------------------------------------------------------------*/
long getXlFileFormat(char *XlFileFormatName)
{
    int i = 0;
    for(i = 0; i < MAX_FORMAT_TABLE; i++)
    {
        if ( strcmp(XLFILE_FORMAT_TABLE[i].xlfileformat_name,XlFileFormatName) == 0 )
        {
            return XLFILE_FORMAT_TABLE[i].code;
        }
    }
    return 0;
}
/*--------------------------------------------------------------------------*/
