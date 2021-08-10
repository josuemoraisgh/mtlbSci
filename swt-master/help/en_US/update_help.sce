// Copyright (C) 2010 - 2011 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// Updates the .xml files by deleting existing files and
// creating them again from the .sci with help_from_sci.

// Copyright (C) 2010 - DIGITEO - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// Updates the .xml files by deleting existing files and
// creating them again from the .sci with help_from_sci.


//
cwd = get_absolute_file_path("update_help.sce");
mprintf("Working dir = %s\n",cwd);
//
// Generate the swt help
mprintf("Updating swt/denoising\n");
helpdir = fullfile(cwd,"denoising");
funmat = [
  "wdencmp"
  "wbmpen"
  "ddencmp"
  "wden"
  "wnoise"
  "wnoisest"
  "wthresh"
  "thselect"
  ];
macrosdir = cwd +"../../macros";
//demosdir = cwd +"../../demos";
demosdir = [];
modulename = "swt";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )
//

// Generate the swt help
mprintf("Updating swt/discrete_wavelet_analysis\n");
helpdir = fullfile(cwd,"discrete_wavelet_analysis");
funmat = [
  "dwtplot"
  "wentropy"
  "wavedecplot"
   "ndwt"
   "indwt"
   "ndwt2"
   "indwt2"
  ];
macrosdir = cwd +"../../macros";
//demosdir = cwd +"../../demos";
demosdir = [];
modulename = "swt";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )

// Generate the swt help
mprintf("Updating swt/real_complex_wavelets\n");
helpdir = fullfile(cwd,"real_complex_wavelets");
funmat = [
  "scal2frq"
  "centfrq"
  ];
macrosdir = cwd +"../../macros";
//demosdir = cwd +"../../demos";
demosdir = [];
modulename = "swt";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )

// Generate the swt help
mprintf("Updating swt/continuous_wavelet_analysis\n");
helpdir = fullfile(cwd,"continuous_wavelet_analysis");
funmat = [
  "cwtplot"
  ];
macrosdir = cwd +"../../macros";
//demosdir = cwd +"../../demos";
demosdir = [];
modulename = "swt";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )

//
cwd = get_absolute_file_path("update_help.sce");
mprintf("Working dir = %s\n",cwd);
//


// Generate the swt help
mprintf("Updating swt/real_complex_wavelets\n");
helpdir = fullfile(cwd,"real_complex_wavelets");
funmat = [
   "cgauwavf"
   "gauswavf"
   "poisson"
   "cmorwavf"
   "legdwavf"
   "mexihat"
   "DOGauss"
   "fbspwavf"
   "morlet"
   "shanwavf"
   "cauwavf"
   "sinus"
  ];
macrosdir = cwd +"../../macros/help_from_sci";
//demosdir = cwd +"../../demos";
demosdir = [];
modulename = "swt";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )
//


// Generate the swt help
mprintf("Updating swt/orth_biorth_wavelets\n");
helpdir = fullfile(cwd,"orth_biorth_wavelets");
funmat = [
   "biorfilt"
    "biorwavf"
    "coifwavf"
    "dbwavf"
    "orthfilt"
    "rbiorwavf"
    "qmf"
   "symwavf"
   "wavefun"
    "wavefun2"
    "wfilters"
    "wrev"
  ];
macrosdir = cwd +"../../macros/help_from_sci";
//demosdir = cwd +"../../demos";
demosdir = [];
modulename = "swt";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )

// Generate the swt help
mprintf("Updating swt/discrete_wavelet_analysis\n");
helpdir = fullfile(cwd,"discrete_wavelet_analysis");
funmat = [
   "appcoef2"
   "dualtree2D"
   "dwt"
   "idwt2"
   "iswt"
   "swt2"
   "upwlev2"
   "wenergy2"
   "wmaxlev"
   "wrev3"
   "appcoef"
   "detcoef2"
   "dualtree"
   "dyaddown"
   "iconv"
   "idwt3"
   "swt"
   "upwlev"
   "waveletfamilies"
   "wenergy"
   "wnorm"
   "detcoef"
   "dwt2"
   "dyadup"
   "icplxdual2D"
   "idwt"
   "wavedec2"
   "waverec2"
   "wextend"
   "wrcoef2"
   "wrot3"
   "cplxdual2D"
   "dwt3"
   "idualtree2D"
//   "ind2rgb"
   "upcoef2"
   "wavedec"
   "waverec"
   "wrcoef"
   "dualfilt1"
   "dwtmode"
   "FSfarras"
   "idualtree"
   "iswt2"
   "upcoef"
   "wcodemat"
   "wkeep"
   "wrev2"
  ];
macrosdir = cwd +"../../macros/help_from_sci";
//demosdir = cwd +"../../demos";
demosdir = [];
modulename = "swt";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )
//

// Generate the swt help
mprintf("Updating swt/continuous_wavelet_analysis\n");
helpdir = fullfile(cwd,"continuous_wavelet_analysis");
funmat = [
   "cwt"
  ];
macrosdir = cwd +"../../macros/help_from_sci";
//demosdir = cwd +"../../demos";
demosdir = [];
modulename = "swt";
helptbx_helpupdate ( funmat , helpdir , macrosdir , demosdir , modulename , %t )
