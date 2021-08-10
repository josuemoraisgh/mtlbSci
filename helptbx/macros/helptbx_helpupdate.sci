// Copyright (C) 2012 - Michael Baudin
// Copyright (C) 2010 - 2011 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function [nbxmlfiles , isdemgwutd] = helptbx_helpupdate ( varargin )
    // Update the help and the demos from the .sci files.
    //
    // Calling Sequence
    //   helptbx_helpupdate ( funarray , helpdir , macrosdir )
    //   helptbx_helpupdate ( funarray , helpdir , macrosdir , demosdir , modulename )
    //   helptbx_helpupdate ( funarray , helpdir , macrosdir , demosdir , modulename , verbose )
    //
    // Parameters
    //   funarray : a m-by-1 matrix of strings, the list of functions to update
    //   helpdir : a 1-by-1 matrix of strings, the help directory
    //   macrosdir : a 1-by-1 matrix of strings, the macros directory
    //   demosdir : a 1-by-1 matrix of strings (default demosir=[]), the demonstration directory
    //   modulename: a 1-by-1 matrix of strings (default modulename=""), the name of the module to update
    //   verbose: a 1-by-1 matrix of booleans (default verbose = %f), verbose = %t prints messages
    //   nbxmlfiles : a 1-by-1 matrix of floating point integers, the number of xml files updated.
    //   isdemgwutd : a 1-by-1 matrix of booleans, isdemgwutd==[] if demosdir is empty, isdemgwutd is true if demodir is non-empty and the demonstration gateway was not change, isdemgwutd is false if demodir is non-empty and the demonstration gateway was changed.
    //
    //
    // Description
    //   Update the .xml help files and the demos scripts
    //   from the macros corresponding to the function array
    //   of strings funarray.
    //   The existing .xml files in the help dir which
    //   correspond to file in the funarray are overwritten (Caution !).
    //   Generates the .xml and the .sce files from the help_from_sci function.
    //
    //   Generates a demonstration gateway.
    //   If demosdir is an empty matrix, do not generate the demonstrations.
    //   The name of the demonstration gateway is computed from the modulename variable.
    //
    // Examples
    // // Update the help of this module.
    // path = helptbx_getpath (  );
    // helpdir = fullfile(path,"help","en_US");
    // funmat = [
    //   "helptbx_helpupdate"
    //   "helptbx_iscontentupdte"
    //   "helptbx_updtifneeded"
    //   ];
    // macrosdir = fullfile(path,"macros");
    // demosdir = fullfile(path,"demos");
    // modulename = "helptbx";
    // [nbxmlfiles , isdemgwutd] = helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )
    //
    // // Do not print messages.
    // [nbxmlfiles , isdemgwutd] = helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename )
    //
    // // Do not update demos.
    // [nbxmlfiles , isdemgwutd] = helptbx_helpupdate ( funmat , helpdir , macrosdir )
    //
    // Authors
    //   Copyright (C) 2012 - Michael Baudin
    //   Copyright (C) 2010 - 2011 - DIGITEO - Michael Baudin


    function msg = wrongdirectory ( dirtag , dirnm )
        // Workaround for Bug on msprintf and directories
        // starting with "n": http://bugzilla.scilab.org/show_bug.cgi?id=4833
        msg = msprintf(gettext("%s: Wrong "),"helptbx_helpupdate")+ ..
        dirtag+..
        msprintf(gettext(" directory: ")) + ..
        helpdir+ ..
        msprintf(gettext(" does not exist.\n"))
    endfunction

    [lhs, rhs] = argn()
    apifun_checkrhs ( "helptbx_helpupdate" , rhs , [3 5 6] )
    apifun_checklhs ( "helptbx_helpupdate" , lhs , 0:2 )
    //
    //
    funarray = varargin(1)
    helpdir = varargin(2)
    macrosdir = varargin(3)
    demosdir = apifun_argindefault ( varargin , 4 , [] )
    modulename = apifun_argindefault ( varargin , 5 , "" )
    verbose = apifun_argindefault ( varargin , 6 , %f )
    //
    // Check input arguments
    //
    // Check type
    apifun_checktype ( "helptbx_helpupdate" , funarray ,   "funarray" ,  1 , "string" )
    apifun_checktype ( "helptbx_helpupdate" , helpdir ,   "helpdir" ,  2 , "string" )
    apifun_checktype ( "helptbx_helpupdate" , macrosdir ,   "macrosdir" ,  3 , "string" )
    if ( demosdir <> [] ) then
        apifun_checktype ( "helptbx_helpupdate" , demosdir ,   "demosdir" ,  4 , "string" )
    end
    apifun_checktype ( "helptbx_helpupdate" , modulename ,   "modulename" ,  5 , "string" )
    apifun_checktype ( "helptbx_helpupdate" , verbose ,   "verbose" ,  6 , "boolean" )
    //
    // Check size
    apifun_checkveccol ( "helptbx_helpupdate" , funarray ,   "funarray" ,  1 , size(funarray,"*") )
    apifun_checkscalar ( "helptbx_helpupdate" , helpdir ,   "helpdir" ,  2 )
    apifun_checkscalar ( "helptbx_helpupdate" , macrosdir ,   "macrosdir" ,  3 )
    if ( demosdir <> [] ) then
        apifun_checkscalar ( "helptbx_helpupdate" , demosdir ,   "demosdir" ,  4 )
    end
    apifun_checkscalar ( "helptbx_helpupdate" , modulename ,   "modulename" ,  5 )
    apifun_checkscalar ( "helptbx_helpupdate" , verbose ,   "verbose" ,  6 )
    //
    // Check content
    if ( fileinfo ( helpdir ) == [] ) then
        error(wrongdirectory ( "help" , helpdir ));
    end
    if ( fileinfo ( macrosdir ) == [] ) then
        error(wrongdirectory ( "macros" , macrosdir ));
    end
    if ( demosdir <> [] ) then
        if ( fileinfo ( demosdir ) == [] ) then
            error(wrongdirectory ( "demos" , demosdir ));
        end
    end
    //
    // Check that each entry in funarray has a corresponding .sci file
    // Set funarrayFlags(i) to 1 if function #i has
    // a corresponding .sci file
    flist = ls(macrosdir)';
    funarrayFlags = zeros(funarray)
    for f = flist
        issci = regexp(f,"/(.*).sci$/");
        kf = find(funarray==basename(f))
        if ( issci <> [] & kf <> [] ) then
            funarrayFlags(kf) = 1
        end
    end
    for i = 1 : size(funarray,"r")
        if ( funarrayFlags(i) == 0 ) then
            warning(msprintf("%s: Function ""%s"" was not found in directory %s\n", ...
            "helptbx_helpupdate",funarray(i), macrosdir))
        end
    end
    //
    // 2. Generate each .xml and each .sce from the .sci
    flist = ls(macrosdir)';
    nbxmlfiles = 0
    nbfiles = 0
    for f = flist
        issci = regexp(f,"/(.*).sci$/");
        kf = find(funarray==basename(f))
        if ( issci <> [] & kf <> [] ) then
            nbfiles = nbfiles + 1
            scifile = fullfile ( macrosdir , f )
            if ( verbose ) then
                mprintf("Processing %s\n",scifile);
            end
            funname = funarray(kf)
            xmlfile = fullfile ( helpdir , funname + ".xml" )
            // Generate the xml and the demo content
            [helptxt,demotxt]= help_from_sci (scifile)
            // Delete the "info" tag, containing the date (3 lines)
            k = find(stripblanks(helptxt)=="<info>")
            if (k<>[]) then
                helptxt(k:k+2) = []
            end
            // Update the xml file, if necessary
            isuptodate = helptbx_updtifneeded ( helptxt , xmlfile )
            if ( ~isuptodate & verbose ) then
                changetxt = "XML Changed"
                mprintf("  %s %s\n",changetxt,xmlfile);
                nbxmlfiles = nbxmlfiles + 1
            end
            // Create the demo
            if ( demosdir <> [] ) then
                demofile = fullfile ( demosdir , funname + ".sce" )
                // Update the demo script
                header = []
                header($+1) = "//"
                header($+1) = "// This help file was automatically generated from "+funname+".sci using help_from_sci()."
                header($+1) = "// PLEASE DO NOT EDIT"
                header($+1) = "//"
                footer = []
                footer($+1) = msprintf("//\n");
                footer($+1) = msprintf("// Load this script into the editor\n");
                footer($+1) = msprintf("//\n");
                footer($+1) = msprintf("filename = ""%s"";\n",funname + ".sce");
                footer($+1) = msprintf("dname = get_absolute_file_path(filename);\n");
                footer($+1) = msprintf("editor ( fullfile(dname,filename) );\n");
                demotxt = [header;demotxt;footer]
                // Update the demo file, if necessary
                isuptodate = helptbx_updtifneeded ( demotxt , demofile )
                if ( ~isuptodate & verbose ) then
                    changetxt = "SCE Changed"
                    mprintf("  %s %s\n",changetxt,demofile);
                end
            end
        end
    end
    if ( nbfiles == 0 ) then
        error(msprintf(gettext("%s: Wrong macros directory %s: no file in it.\n"),"helptbx_helpupdate",macrosdir));
    end
    //
    // 3. Generates the Demonstration gateway
    // Include all .sce files in the gateway, including
    // handcrafted scripts which might have been written
    // by the user (and not generated by this function).
    // To make so, use the list of .sce files in the demo dir and
    /// not simply the funarray.
    isdemgwutd = []
    if ( demosdir <> [] ) then
        gatetxt = []
        gatetxt ($+1) = "// This help file was automatically generated using helpupdate"
        gatetxt ($+1) = "// PLEASE DO NOT EDIT"
        gatetxt ($+1) = "demopath = get_absolute_file_path(""" + modulename + ".dem.gateway.sce"");"
        gatetxt ($+1) = "subdemolist = ["
        flist = ls(demosdir)';
        flist = gsort(flist,"g","i")
        for f = flist
            issce = regexp(f,"/(.*).sce$/");
            isgateway = regexp(f,"/(.*).gateway.sce$/");
            if ( issce <> [] & isgateway == [] ) then
                flen = length(f)
                funname = part(f,[1:flen-4])
                gatetxt($+1) = """" + funname + """, """ + funname + ".sce""; .."
            end
        end
        //
        gatetxt ($+1) = "];"
        gatetxt ($+1) = "subdemolist(:,2) = demopath + subdemolist(:,2)"
        gatefile = fullfile ( demosdir , modulename+".dem.gateway.sce" )
        // Update the gateway file, if necessary
        isdemgwutd = helptbx_updtifneeded ( gatetxt , gatefile )
        if ( ~isdemgwutd & verbose ) then
            changetxt = "SCE Gateway Changed"
            mprintf("%s %s\n",changetxt,gatefile);
        end
    end
endfunction

