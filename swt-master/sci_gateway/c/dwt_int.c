/*
 * -------------------------------------------------------------------------
 * dwt_int.c -- DWT interface function
 * SWT - Scilab wavelet toolbox
 * Copyright (C) 2005-2006  Roger Liu
 * Copyright (C) 20010-2012  Holger Nahrstaedt
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 * -------------------------------------------------------------------------
 */

#include "swt_common.h"
//
// converted to scilab-api

/*-------------------------------------------
 * orthfilt
 *-----------------------------------------*/

int
int_orthfilt 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int l4, m4, n4, l5, m5, n5;
  static int minlhs = 4, maxlhs = 4, minrhs = 1, maxrhs = 1;
  int errCode;
  int readFlag;
  double *input1;
  double *output1;
  double *output2;
  double *output3;
  double *output4;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

//  GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }


  orthfilt_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m2 = 1;
  m3 = 1;
  m4 = 1;
  m5 = 1;
  n2 = n1 * m1;
  n3 = n1 * m1;
  n4 = n1 * m1;
  n5 = n1 * m1;

  //CreateVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }


  //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m3 , n3 , &output2 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }


  //CreateVar (4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m4 , n4 , &output3 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }


  //CreateVar (5, "d", &m5, &n5, &l5);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m5 , n5 , &output4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }


  orth_filt_group (input1, n1 * m1, output3, output1, output4, output2);

  //LhsVar (1) = 2;
  //LhsVar (2) = 3;
  //LhsVar (3) = 4;
  //LhsVar (4) = 5;
  return 0;
}

int
int_biorfilt 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int l4, m4, n4, l5, m5, n5, l6, m6, n6;
  static int minlhs = 4, maxlhs = 4, minrhs = 2, maxrhs = 2;
  int errCode;
  int readFlag;
  double *input1;
  double *input2;
  double *output1;
  double *output2;
  double *output3;
  double *output4;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  biorfilt_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //GetRhsVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  m3 = 1;
  m4 = 1;
  m5 = 1;
  m6 = 1;
  n3 = n1 * m1;
  n4 = n1 * m1;
  n5 = n1 * m1;
  n6 = n1 * m1;

  //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //CreateVar (4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //CreateVar (5, "d", &m5, &n5, &l5);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m5 , n5 , &output3 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //CreateVar (6, "d", &m6, &n6, &l6);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m6 , n6 , &output4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  bior_filt_group (input1, m1 * n1, input2, m2 * n2,
		   output1, m3 * n3, output2, m4 * n4,
       output3, m5 * n5, output4, m6 * n6);
  // LhsVar (1) = 3;
  // LhsVar (2) = 4;
  // LhsVar (3) = 5;
  // LhsVar (4) = 6;

  return 0;
}


/*-------------------------------------------
 * Scale Filter Generation
 *-----------------------------------------*/

int
int_dbwavf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 1;
  swt_wavelet pWaveStruct;
  int errCode, family, member;
  int readFlag;
  char * input_string1 = NULL;
  double *output1;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  dbwavf_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar (1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  dbwavf_content_validate (pvApiCtx, &errCode,input_string1);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  wavelet_parser(input_string1,&family,&member);
  daubechies_synthesis_initialize (member, &pWaveStruct);
  m2 = 1;
  n2 = pWaveStruct.length;
  //CreateVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  verbatim_copy (pWaveStruct.pLowPass, m2*n2, output1, m2*n2);
  filter_clear();
  //LhsVar (1) = 2;
  return 0;
}



int
int_coifwavf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 1;
  swt_wavelet pWaveStruct;
  int errCode, family, member;
  int readFlag;
  char * input_string1 = NULL;
  double *output1;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  coifwavf_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar (1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  coifwavf_content_validate (pvApiCtx, &errCode,input_string1);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  wavelet_parser(input_string1,&family,&member);
  coiflets_synthesis_initialize (member, &pWaveStruct);
  m2 = 1;
  n2 = pWaveStruct.length;
  //CreateVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  verbatim_copy (pWaveStruct.pLowPass, m2*n2, output1, m2*n2);
  filter_clear();
  //LhsVar (1) = 2;
  return 0;
}


int
int_symwavf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 1;
  swt_wavelet pWaveStruct;
  int errCode, family, member;
  int readFlag;
  char * input_string1 = NULL;
  double *output1;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  symwavf_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar (1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  symwavf_content_validate (pvApiCtx, &errCode,input_string1);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  wavelet_parser(input_string1,&family,&member);
  symlets_synthesis_initialize (member, &pWaveStruct);
  m2 = 1;
  n2 = pWaveStruct.length;
  //CreateVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  verbatim_copy (pWaveStruct.pLowPass, m2*n2, output1, m2*n2);
  filter_clear();
  //LhsVar (1) = 2;
  return 0;
}

int
int_legdwavf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 1;
  swt_wavelet pWaveStruct;
  int errCode, family, member;
  int readFlag;
  char * input_string1 = NULL;
  double *output1;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  legdwavf_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar (1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  legdwavf_content_validate (pvApiCtx, &errCode,input_string1);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  wavelet_parser(input_string1,&family,&member);
  legendre_synthesis_initialize (member, &pWaveStruct);
  m2 = 1;
  n2 = pWaveStruct.length;
  //CreateVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  verbatim_copy (pWaveStruct.pLowPass, m2*n2, output1, m2*n2);
  filter_clear();
  //LhsVar (1) = 2;
  return 0;
}

int
int_biorwavf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int minlhs = 2, maxlhs = 2, minrhs = 1, maxrhs = 1;
  swt_wavelet pWaveStruct;
  int errCode, family, member;
  int readFlag;
  char * input_string1 = NULL;
  double *output1;
  double *output2;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  biorwavf_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//  GetRhsVar (1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  biorwavf_content_validate (pvApiCtx, &errCode,input_string1);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  wavelet_parser(input_string1,&family,&member);
  sp_bior_synthesis_initialize (member, &pWaveStruct);
  m2 = 1;
  n2 = pWaveStruct.length;
  m3 = 1;
  n3 = pWaveStruct.length;
  //CreateVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m3 , n3 , &output2 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  verbatim_copy (pWaveStruct.pLowPass, m2*n2, output1, m2*n2);
  filter_clear();

  sp_bior_analysis_initialize (member, &pWaveStruct);
  wrev(pWaveStruct.pLowPass, m3 * n3, output2, m3 * n3);
  filter_clear();

  //LhsVar (1) = 2;
  //LhsVar (2) = 3;
  return 0;
}

int
int_rbiorwavf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int minlhs = 2, maxlhs = 2, minrhs = 1, maxrhs = 1;
  swt_wavelet pWaveStruct;
  int errCode, family, member;
  int readFlag;
  char * input_string1 = NULL;
  double *output1;
  double *output2;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  rbiorwavf_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar (1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  rbiorwavf_content_validate (pvApiCtx, &errCode,input_string1);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  wavelet_parser(input_string1,&family,&member);
  sp_rbior_synthesis_initialize (member, &pWaveStruct);
  m2 = 1;
  n2 = pWaveStruct.length;
  m3 = 1;
  n3 = pWaveStruct.length;
  //CreateVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m3 , n3 , &output2 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  verbatim_copy (pWaveStruct.pLowPass, m2*n2,output1, m2*n2);
  filter_clear();

  sp_rbior_analysis_initialize (member, &pWaveStruct);
  wrev(pWaveStruct.pLowPass, m3 * n3, output2, m3 * n3);
  filter_clear();

  //LhsVar (1) = 2;
  //LhsVar (2) = 3;
  return 0;
}

int
int_wfilters 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int l4, m4, n4, l5, m5, n5;
  static int minlhs = 2, maxlhs = 4, minrhs = 1, maxrhs = 2;
  int errCode, flow, family, member, ii;
  Func ana_fun, syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  char * input_string1 = NULL;
  char * input_string2 = NULL;
  double *output1;
  double *output2;
  double *output3;
  double *output4;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  errCode = SUCCESS;
  if (swt_gwsupport_GetType(pvApiCtx, 1)!=sci_strings)
    errCode = UNKNOWN_INPUT_ERR;
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar (1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  l2 = 0;

  if (Rhs==2)
    {
      if (swt_gwsupport_GetType(pvApiCtx, 2)!=sci_strings)
	errCode = UNKNOWN_INPUT_ERR;
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
    }

  wfilters_form_validate (pvApiCtx, &errCode, &flow, input_string2,Rhs,Lhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }
  wfilters_content_validate (pvApiCtx, &errCode, input_string1);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  switch (flow) {
  case 1:
    {
      //sciprint("enter flow 1!\n");
      wavelet_parser(input_string1,&family,&member);
      wavelet_fun_parser (input_string1, &ii);
      ana_fun = wi[ii].analysis;
      syn_fun = wi[ii].synthesis;
      (*ana_fun)(member, &pWaveStruct);
      m2 = 1;
      m3 = 1;
      m4 = 1;
      m5 = 1;
      n2 = pWaveStruct.length;
      n3 = pWaveStruct.length;
      n4 = pWaveStruct.length;
      n5 = pWaveStruct.length;
      //CreateVar (2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m3 , n3 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m4 , n4 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m5 , n5 , &output4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      verbatim_copy (pWaveStruct.pLowPass, m2*n2, output1, m2*n2);
      verbatim_copy (pWaveStruct.pHiPass, m3*n3, output2, m3*n3);
      (*syn_fun)(member, &pWaveStruct);
      verbatim_copy (pWaveStruct.pLowPass, m4*n4, output3, m4*n4);
      verbatim_copy (pWaveStruct.pHiPass, m5*n5, output4, m5*n5);
      filter_clear();
      // AssignOutputVariable(pvApiCtx,1) = 2;
      // AssignOutputVariable(pvApiCtx,2) = 3;
      // AssignOutputVariable(pvApiCtx,3) = 4;
      // AssignOutputVariable(pvApiCtx,4) = 5;
      break;
    }
  case 2:
    {
      wavelet_parser(input_string1,&family,&member);
      wavelet_fun_parser (input_string1, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      m3 = 1;
      m4 = 1;
      n3 = pWaveStruct.length;
      n4 = pWaveStruct.length;
      //CreateVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      verbatim_copy (pWaveStruct.pLowPass, m3*n3, output1, m3*n3);
      verbatim_copy (pWaveStruct.pHiPass, m4*n4, output2, m4*n4);
      filter_clear();
    //  LhsVar (1) = 3;
    //  LhsVar (2) = 4;
      break;
    }
  case 3:
    {
      wavelet_parser(input_string1,&family,&member);
      wavelet_fun_parser (input_string1, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      m3 = 1;
      m4 = 1;
      n3 = pWaveStruct.length;
      n4 = pWaveStruct.length;
      //CreateVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      verbatim_copy (pWaveStruct.pLowPass, m3*n3, output1, m3*n3);
      verbatim_copy (pWaveStruct.pHiPass, m4*n4, output2, m4*n4);
      filter_clear();
      //LhsVar (1) = 3;
      //LhsVar (2) = 4;
      break;
    }
    case 4:
    {
      wavelet_parser(input_string1,&family,&member);
      wavelet_fun_parser (input_string1, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      m3 = 1;
      m4 = 1;
      n3 = pWaveStruct.length;
      n4 = pWaveStruct.length;
      //CreateVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      verbatim_copy (pWaveStruct.pLowPass, m3*n3, output1, m3*n3);
	  //filter_clear();
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      verbatim_copy (pWaveStruct.pLowPass, m4*n4, output2, m4*n4);
      filter_clear();
      //LhsVar (1) = 3;
      //LhsVar (2) = 4;
      break;
    }
  case 5:
    {
      wavelet_parser(input_string1,&family,&member);
      wavelet_fun_parser (input_string1, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      m3 = 1;
      m4 = 1;
      n3 = pWaveStruct.length;
      n4 = pWaveStruct.length;
      //CreateVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      verbatim_copy (pWaveStruct.pHiPass, m3*n3, output1, m3*n3);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      verbatim_copy (pWaveStruct.pHiPass, m4*n4, output2, m4*n4);
      filter_clear();
      //LhsVar (1) = 3;
      //LhsVar (2) = 4;
      break;
    }
  default:
    break;
  }

  return 0;
}


int
int_wmaxlev 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int minlhs = 1, maxlhs = 1, minrhs = 2, maxrhs = 2;
  int ii, stride, val, stride1, stride2, val1, val2;
  // int filterLen;
  swt_wavelet pWaveStruct;
  int errCode, family, member;
  Func syn_fun;
  int readFlag;
  char * input_string1 = NULL;
  int *input1;
  int *output1;


  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  wmaxlev_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar (1, "i", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 1,  &m1 , &n1 , &input1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //GetRhsVar (2, "c", &m2, &n2, &l2);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,2 , &input_string1 );
  m2=1;n2=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  wfilters_content_validate (pvApiCtx, &errCode, input_string1);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  wavelet_parser(input_string1,&family,&member);
  wavelet_fun_parser (input_string1, &ii);
  syn_fun = wi[ii].synthesis;
  (*syn_fun)(member, &pWaveStruct);
  filter_clear();
  if (sci_matrix_scalar_real(pvApiCtx,1))
    {
      if (input1[0] <= 0)
	{
	  sciprint("Input integer must be positive!\n");
	  return 0;
	}
      wave_len_validate (input1[0], pWaveStruct.length,
			&stride, &val);
      if (val == 0)
	{
	  sciprint
	    ("Unrecognized Input Pattern or parameter not valid for the algorithm! Please refer to help pages!\n");
	  return 0;
	}
      else
	{
	  m3 = 1;
	  n3 = 1;
	  //CreateVar (3, "i", &m3, &n3, &l3);
    readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
      output1[0] = stride;
	 // LhsVar (1) = 3;
	}
    }
  else
    {
	  //sciprint("enter matrix\n");
	  if (input1[0] <= 0)
	    {
		 sciprint("Input integer must be positive!\n");
		 return 0;
	    }
      if (input1[0] <= 0)
	   {
	    sciprint("Input integer must be positive!\n");
	    return 0;
	}
    wave_len_validate ( input1[0], pWaveStruct.length,
			&stride1, &val1);
    if (val1 == 0)
	{
		sciprint
		("The wavelet you select is not appropriate for that row size of the matrix!\n");
		return 0;
	}
    wave_len_validate ( input1[1], pWaveStruct.length,
		&stride2, &val2);

    if (val2 == 0)
	{
		sciprint
		("The wavelet you select is not appropriate for that column size of the matrix!\n");
		return 0;
	}
    if ((val1 == 0) || (val2 == 0))
		return 0;
    m3 = 1;
    n3 = 1;
    //CreateVar (3, "i", &m3, &n3, &l3);
    readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
      output1[0] = (stride1 > stride2) ? stride2 : stride1;
	//if (stride1>=stride2)
	//	istk(l3)[0]=stride2;
	//else
	//	istk(l3)[0]=stride1;
  //  LhsVar (1) = 3;
    }

  return 0;
}


int
int_dwtmode 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int minlhs = 0, maxlhs = 1, minrhs = 0, maxrhs = 2;
  int errCode;
  //int row1, row2;
  // int col;
  //char *Str[] = {"symhh"};
  //char sss[6] = "symhh";
  char **Str;
  int i;
  int readFlag;
  char * input_string1 = NULL;
  char * input_string2 = NULL;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);


  if (Rhs == 0)
    dwt_print();
  else if (Rhs == 1)
    {
      //GetMatrixdims(1,&row,&col);
      if (sci_strings_scalar(pvApiCtx,1))
	{
	//sciprint("before GetVAR\n");
	  //GetRhsVar(1, "c", &m1, &n1, &l1);
    readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
    m1=1;n1=1;
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
	  if (!strcmp(input_string1,"status"))
	    dwt_print();
	  else
	    {
	      dwt_write(input_string1,&errCode);
	      if (errCode != SUCCESS)
		{
		  validate_print (errCode);
		  return 0;
		}
	      sciprint("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
	      sciprint("!!     WARNING: Change DWT Extension Mode   !!\n");
	      sciprint("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
	      dwt_print();
	    }
	}
      else
	{
	  sciprint("Unrecognized Input Pattern or parameter not valid for the algorithm! Please refer to help pages!\n");
	  return 0;
	}
    }
  else if (Rhs == 2)
    {
      //      GetMatrixdims(1, &row1, &col1);
      //GetMatrixdims(2, &row2, &col2);
      /*      if ((swt_gwsupport_GetType(pvApiCtx, 1) == sci_strings) && (swt_gwsupport_GetType(pvApiCtx, 2) == sci_strings) && (is_scalar(row1,col1)) && (is_scalar(row2,col2)))*/
      if (sci_strings_scalar(pvApiCtx, 1) && sci_strings_scalar(pvApiCtx, 2))
	{
	  //GetRhsVar(1, "c", &m1, &n1, &l1);
    readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
    m1=1;n1=1;
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
	  //GetRhsVar(2, "c", &m2, &n2, &l2);
    readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
    m2=1;n2=1;
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
	  if ((strcmp(input_string1,"status")==0) && (strcmp(input_string2,"nodisp")==0))
	    {
	      m3 = 1;
	      n3 = 1;
	      //*Str = sss;

	      Str=NULL;
	      Str = (char **)malloc(1*sizeof(char *));

	      for(i=0; i<(int)1; i++)
		{
		  Str[i] = (char *)malloc(6*sizeof(char));

		}
	      //printf("before dwt_parse\n");
	      dwt_parse(Str);
	      //printf("after dwt_parse\n");
	      //printf("%s\n",Str[0]);
	      //CreateVarFromPtr(3,"S", &m3, &n3, Str);
        readFlag = swt_gwsupport_CreateMatrixOfString (pvApiCtx, fname, 1,  m3 , n3 , Str );
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
	      //printf("after Create\n");
	      //AssignOutputVariable(pvApiCtx,1) = 3;
	      //FreeRhsSVar(Str);
	    }
	  else if (strcmp(input_string2,"nodisp")==0 )
	  {
		  dwt_write(input_string1,&errCode);
	      if (errCode != SUCCESS)
		{
		  validate_print (errCode);
		  return 0;
		}
	  }
	  else
	    {
	      sciprint("Unrecognized Input Pattern or parameter not valid for the algorithm! Please refer to help pages!\n");
	      return 0;
	    }
	}
      else
	{
	  sciprint("Unrecognized Input Pattern or parameter not valid for the algorithm! Please refer to help pages!\n");
	  return 0;
	}
    }
  else
    {
      sciprint("Unrecognized Input Pattern or parameter not valid for the algorithm! Please refer to help pages!\n");
      return 0;
    }
  return 0;
}
