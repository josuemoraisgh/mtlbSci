// ====================================================================
// Copyright DIGITEO 2010
// Allan CORNET
// ====================================================================
demopath = get_absolute_file_path("xls_link.dem.gateway.sce");

subdemolist = ["demo xls_link set/get datas"       ,"xls_link_setget_datas.dem.sce";
               "demo xls_link Set Picture"         ,"xls_link_xls_SetPic.dem.sce";
               "List opened Excel files"           ,"xls_link_list_opened_files.dem.sce";
];

subdemolist(:,2) = demopath + subdemolist(:,2);
// ====================================================================
