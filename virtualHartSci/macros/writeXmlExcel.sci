// Allan CORNET - 2010
// write xml excel 2003 file on any platform
// http://msdn2.microsoft.com/en-us/library/aa140066(office.10).aspx
// Thanks to Serge Steer for advices 
//
//==============================================================================
function writeXmlExcel(filename, M, titleDocument, authorDocument)

if type(filename) <> 10 then
    error(999, msprintf(gettext("%s: Wrong type for input argument #%d: A String expected.\n"), "writeXmlExcel", 1));
end

if size(filename, "*")<>1 then
    error(999, msprintf(gettext("%s: Wrong size for input argument #%d: A String expected.\n"), "writeXmlExcel", 1));
end


if ~isdef("titleDocument") then
  titleDocument = _("Sheet1");
else
    if type(titleDocument) <> 10 then
        error(999, msprintf(gettext("%s: Wrong type for input argument #%d: A String expected.\n"), "writeXmlExcel", 3));
    end

    if size(titleDocument,"*")<> 1 then
        error(999, msprintf(gettext("%s: Wrong size for input argument #%d: A String expected.\n"), "writeXmlExcel", 3));
    end
end

if ~isdef("authorDocument") then
  authorDocument = "";
else
    if type(authorDocument) <> 10 then
        error(999, msprintf(gettext("%s: Wrong type for input argument #%d: A String expected.\n"), "writeXmlExcel", 4));
    end

    if size(authorDocument, "*") <> 1 then
        error(999, msprintf(gettext("%s: Wrong size for input argument #%d: A String expected.\n"), "writeXmlExcel", 4));
    end

end

typeM = type(M);
if or(typeM==[1, 4, 8, 10]) | typeof(M)=="xlssheet" then
  if (typeM == 1) & ~isreal(M) then
    error(999, msprintf(gettext("%s: Wrong type for input argument #%d.\n"), "writeXmlExcel", 2));
  else
    xmlDatas = scilabToXml(M, titleDocument, authorDocument);
    mputl(xmlDatas, filename);
  end
else
  error(999, msprintf(gettext("%s: Wrong type for input argument #%d.\n"), "writeXmlExcel", 2));
end

endfunction
//==============================================================================
function xmlDatas = scilabToXml(M, titleDocument, authorDocument)

  headerXml = ["<?xml version=""1.0""?>"; ..
"<?mso-application progid=""Excel.Sheet""?>"; ..
"<Workbook xmlns=""urn:schemas-microsoft-com:office:spreadsheet"""; ..
" xmlns:o=""urn:schemas-microsoft-com:office:office"""; ..
" xmlns:x=""urn:schemas-microsoft-com:office:excel"""; ..
" xmlns:ss=""urn:schemas-microsoft-com:office:spreadsheet"""; ..
" xmlns:html=""http://www.w3.org/TR/REC-html40"">"; ..
" <DocumentProperties xmlns=""urn:schemas-microsoft-com:office:office"">"; ..
" <Author>__AUTHOR__</Author>"; ..
"  <LastAuthor>__AUTHOR__</LastAuthor>"; ..
"  <Version>12.00</Version>"; ..
" </DocumentProperties>"; ..
" <ExcelWorkbook xmlns=""urn:schemas-microsoft-com:office:excel"">"; ..
"  <ProtectStructure>False</ProtectStructure>"; ..
"  <ProtectWindows>False</ProtectWindows>"; ..
" </ExcelWorkbook>"; ..
" <Worksheet ss:Name=""__WORKSHEETNAME__"">"; ..
"  <Table ss:ExpandedColumnCount=""__NB_COLUMNS__"" ss:ExpandedRowCount=""__NB_ROWS__"">"];

  endXml = ["  </Table>"; ..
"  <WorksheetOptions xmlns=""urn:schemas-microsoft-com:office:excel"">"; ..
"   <ProtectObjects>False</ProtectObjects>"; ..
"   <ProtectScenarios>False</ProtectScenarios>"; ..
"  </WorksheetOptions>"; ..
" </Worksheet>"; ..
"</Workbook>"];

  headerXml = strsubst(headerXml, "__WORKSHEETNAME__", titleDocument);
  headerXml = strsubst(headerXml, "_AUTHOR__", authorDocument);
  headerXml = strsubst(headerXml, "__NB_COLUMNS__", string(size(M, "c")));
  headerXml = strsubst(headerXml, "__NB_ROWS__", string(size(M, "r")));

  select type(M),
    case 1 then
      mStr = string(M);
      typ = "Number" + emptystr(M);
      typ(~isfinite(M)) = "String";
    case 4 then
      mStr = string(bool2s(M));
      typ = "Boolean" + emptystr(M);
    case 8 then
      mStr = string(M);
      typ = "Number" + emptystr(M);
    case 17 then
      if typeof(M) == "xlssheet" then
        mStr = string(M.value);
        typ = "Number" + emptystr(M.value);
        k = isnan(M.value);
        mStr(k) = M.text(k);
        typ(k) = "String";
      else
        mStr = string(M);
        typ = "String" + emptystr(M);
      end
    else // type == 10 and others 
      mStr = string(M);
      typ = "String" + emptystr(M);
  end
  data = "<Cell><Data ss:Type="""+typ+""">" + mStr + "</Data></Cell>";
  clear mStr;
  data(1:$,1) = "<Row>" + data(1:$,1);
  data(1:$,$) = data(1:$,$) + "</Row>";


  xmlDatas = [];
  for i = 1:size(data,"r")
    xmlDatas(i) = strcat(data(i,1:$), " ");
  end
  clear data;
  xmlDatas = [headerXml; xmlDatas; endXml];
endfunction
//==============================================================================
function r = isfinite(x)
  r = abs(x) < %inf;
endfunction
//==============================================================================